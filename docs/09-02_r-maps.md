---
output: html_document
editor_options: 
  chunk_output_type: console
---


# Spatial data and maps {#mod-r-maps}

Spatial data, also known as geospatial data, is a term used to describe any data related to or containing information about a specific location on a surface (often a map). We will consider *distance matrix* calculations for finding the shortest distance/travel time between a set of origins and destinations, *geocoding* which is the process of converting an address to geographic coordinates (latitude, longitude) and *reverse geocoding* which is the opposite process of converting a location as described by geographic coordinates (latitude, longitude) to a human-readable address or place name. Finally, we consider how to display spatial data on a map.


## Learning outcomes {#lo-maps}

By the end of this module, you are expected to be able to:

* Calculate euclidean, manhattan, etc. distances.
* Calculate a distance matrix, i.e. shortest paths between places using the Google and Bing API.
* Geocode an address using the Google and Bing API.
* Add markers and routes (lines) on a map.


<!-- SOLO increasing: identify · memorise · name · do simple procedure · collect data · -->
<!-- enumerate · describe · interpret · formulate · list · paraphrase · combine · do -->
<!-- algorithms · compare · contrast · explain causes · analyse · relate · derive · -->
<!-- evaluate · apply · argue · theorise · generalise · hypothesise · solve · reflect -->


## Services for obtatining spatial data {#sec-map-api-key}

Often you need to connect to a service using an API for obtaining spatial data. The most common is Google and Bing (Microsoft) and to use the services you need an API key. Another service is also [Here](https://developer.here.com/).

If you use Google Maps you can obtain an API key [here](https://cloud.google.com/maps-platform/). Modest to light use is free; however, you need a valid credit card. Note you must enable the APIs you intend to use. Google in fact has several services for geo-related solutions. For example, the Maps Static API provides map images, while the Geocoding API provides geocoding and reverse geocoding services. You need to enable the APIs before you use them. You will only need to do that once, and then they will be ready for you to use. Enabling the APIs just means clicking a few radio buttons on the Google Maps Platform web interface.

We will be using the **ggmap** package for Google services. You can add the API key using:


```r
library(ggmap)
register_google(key = "[your key]", write = TRUE)
Sys.getenv("GGMAP_GOOGLE_API_KEY")
```

Note the key is stored in the environment object `GGMAP_GOOGLE_API_KEY`. Moreover, it is saved in the file `.Renviron` so that it is automatically reloaded when you restart R. 

If you use Bing Maps you can obtain an API key [here](https://www.bingmapsportal.com/). No credit card is needed. You can add the API key using:


```r
usethis::edit_r_environ()  # opens the .Renviron file
Sys.setenv(BING_MAPS_API_KEY=[your key]) # so you don't have to restart R
```

Add the line `BING_MAPS_API_KEY=[your key]` and save the file. 

Note your API keys is private and unique to you, so be careful not to share it online!


## Calculating distances

If you need to calculate euclidean, manhattan, etc. distances, you can use the `dist` R function:


```r
coord <- matrix(c(0,0, 0,1, 1,0, 1,1), ncol = 2, byrow = TRUE)
coord
#>      [,1] [,2]
#> [1,]    0    0
#> [2,]    0    1
#> [3,]    1    0
#> [4,]    1    1
dist(coord)
#>      1    2    3
#> 2 1.00          
#> 3 1.00 1.41     
#> 4 1.41 1.00 1.00
as.matrix(dist(coord))
#>      1    2    3    4
#> 1 0.00 1.00 1.00 1.41
#> 2 1.00 0.00 1.41 1.00
#> 3 1.00 1.41 0.00 1.00
#> 4 1.41 1.00 1.00 0.00
```

However, euclidean distances are often a poor approximation of shortest path lengths. 


### Using Google Maps

Remember to have [set your API key](#sec-map-api-key) and activate the *Distance Matrix API* service on the Google Cloud Platform. We consider the following places:


```r
library(ggmap)
library(tidyverse)
dat <- tibble::tribble(
      ~Id,              ~Shop,                                        ~Address,
       1L,    "Bilka Esbjerg",          "Stormgade 157, 6715 Esbjerg, Denmark",
       2L,    "Bilka Herning",              "Golfvej 5, 7400 Herning, Denmark",
       3L,   "Bilka Hillerød",     "Slotsarkaderne 26, 3400 Hillerød, Denmark",
       4L,   "Bilka Hjørring",  "A.F Heidemannsvej 20, 9800 Hjørring, Denmark",
       5L,  "Bilka Holstebro",         "Nyholmvej 20, 7500 Holstebro, Denmark",
      )
dat
#> # A tibble: 5 × 3
#>      Id Shop            Address                                     
#>   <int> <chr>           <chr>                                       
#> 1     1 Bilka Esbjerg   Stormgade 157, 6715 Esbjerg, Denmark        
#> 2     2 Bilka Herning   Golfvej 5, 7400 Herning, Denmark            
#> 3     3 Bilka Hillerød  Slotsarkaderne 26, 3400 Hillerød, Denmark   
#> 4     4 Bilka Hjørring  A.F Heidemannsvej 20, 9800 Hjørring, Denmark
#> 5     5 Bilka Holstebro Nyholmvej 20, 7500 Holstebro, Denmark
```

To calculate a distance matrix we use the `mapdist` function:


```r
mapdist(from = "Stormgade 157, 6715 Esbjerg, Denmark", 
        to = "Golfvej 5, 7400 Herning, Denmark")
#> # A tibble: 1 × 9
#>   from                                 to                  m    km miles seconds minutes hours mode 
#>   <chr>                                <chr>           <int> <dbl> <dbl>   <int>   <dbl> <dbl> <chr>
#> 1 Stormgade 157, 6715 Esbjerg, Denmark Golfvej 5, 740… 87791  87.8  54.6    4352    72.5  1.21 driv…
```

Note Google returns results for the fastest path between the two points. Let us try to define a function which calculate all the distances:


```r
#' Calculate the distance matrix in long format.
#'
#' @param address A vector of addresses.
#' @param mode Driving, bicycling, walking, or transit.
#' @param symmetric Use symmetric distances (half the number of queries).
#' @return A data frame with the results
#' @note The API returns results for the fastest route.  
goo_calc_distances <- function(address, mode = "driving", symmetric = TRUE) {
   datDist <- expand_grid(id_from = 1:length(address), id_to = 1:length(address))
   datDist <- datDist %>% filter(id_from != id_to)
   if (symmetric) datDist <- datDist %>% filter(id_from < id_to)
   datDist <- datDist %>% mutate(from = address[id_from], to = address[id_to])
   res <- mapdist(from = datDist %>% pull(from), to = datDist %>% pull(to), mode = mode)
   return(left_join(datDist, res, by = c("from", "to")))
}
datDistGoo <- goo_calc_distances(dat$Address)
datDistGoo
#> # A tibble: 10 × 11
#>    id_from id_to from                           to         m    km miles seconds minutes hours mode 
#>      <int> <int> <chr>                          <chr>  <int> <dbl> <dbl>   <int>   <dbl> <dbl> <chr>
#>  1       1     2 Stormgade 157, 6715 Esbjerg, … Golf…  87791  87.8  54.6    4352    72.5 1.21  driv…
#>  2       1     3 Stormgade 157, 6715 Esbjerg, … Slot… 321853 322.  200.    11725   195.  3.26  driv…
#>  3       1     4 Stormgade 157, 6715 Esbjerg, … A.F … 322069 322.  200.    11225   187.  3.12  driv…
#>  4       1     5 Stormgade 157, 6715 Esbjerg, … Nyho… 103723 104.   64.5    5293    88.2 1.47  driv…
#>  5       2     3 Golfvej 5, 7400 Herning, Denm… Slot… 366485 366.  228.    17560   293.  4.88  driv…
#>  6       2     4 Golfvej 5, 7400 Herning, Denm… A.F … 374695 375.  233.    13671   228.  3.80  driv…
#>  7       2     5 Golfvej 5, 7400 Herning, Denm… Nyho… 333412 333.  207.    12100   202.  3.36  driv…
#>  8       3     4 Slotsarkaderne 26, 3400 Hille… A.F … 178198 178.  111.     7791   130.  2.16  driv…
#>  9       3     5 Slotsarkaderne 26, 3400 Hille… Nyho…  44030  44.0  27.4    1834    30.6 0.509 driv…
#> 10       4     5 A.F Heidemannsvej 20, 9800 Hj… Nyho… 181228 181.  113.     7790   130.  2.16  driv…
```

Note that only the calculated distances are returned. If you want to have the whole distance matrix we define function:


```r
#' Convert the data frame returned from calling a `___calc_distances` function to a distance matrix.
#'
#' @param dat The data frame returned from calling `___calc_distances`.
#' @param value_col The column containing the distances.
#' @return The distance matrix
as_dist_matrix <- function(dat, value_col) {
   lgt <- max(dat$id_from, dat$id_to)
   distanceMat<-matrix(NA, nrow=lgt, ncol = lgt)
   diag(distanceMat) <- 0
   map(1:nrow(dat), function(r) {
      distanceMat[dat$id_from[r], dat$id_to[r]] <<- dat[[value_col]][r]
   })
   idx <- which(is.na(distanceMat), arr.ind = TRUE)
   map(1:nrow(idx), function(r) {
      distanceMat[idx[r, "row"], idx[r, "col"]] <<- distanceMat[idx[r, "col"], idx[r, "row"]]
   })
   return(distanceMat)
}
as_dist_matrix(datDistGoo, "km")  # distances in km
#>       [,1]  [,2] [,3] [,4] [,5]
#> [1,]   0.0  87.8  322  322  104
#> [2,]  87.8   0.0  366  375  333
#> [3,] 321.9 366.5    0  178   44
#> [4,] 322.1 374.7  178    0  181
#> [5,] 103.7 333.4   44  181    0
as_dist_matrix(datDistGoo, "seconds")  # travel time in seconds 
#>       [,1]  [,2]  [,3]  [,4]  [,5]
#> [1,]     0  4352 11725 11225  5293
#> [2,]  4352     0 17560 13671 12100
#> [3,] 11725 17560     0  7791  1834
#> [4,] 11225 13671  7791     0  7790
#> [5,]  5293 12100  1834  7790     0
```


### Using Bing Maps

Remember to have [set your API key](#mod-map-api-key). We first define a `bing_mapdist` function:


```r
library(jsonlite)
#' Distance between two locations.
#'
#' @param from From address.
#' @param to To address.
#' @param mode Walking, driving or transit.
#' @param optimize Optimize either `distance` or `time`.
#' @return
bing_mapdist <- function(from, to, mode = "driving", optimize = "time") {
   if (is.data.frame(from)) {
     stopifnot(all(c("from", "to") %in% names(from)))
     from_to_df <- from %>% select("from", "to") %>% as_tibble()
   }
   else {
     from_to_df <- tibble(from = from, to = to)
   }
   dat <- map_dfr(1:nrow(from_to_df), function(r) {
      url <- 
         str_c("http://dev.virtualearth.net/REST/V1/Routes/", mode, "?wp.0=", from_to_df$from[r], "&wp.1=", from_to_df$to[r], 
               "&optimize=", optimize, "&ra=excludeItinerary&rpo=None&ig=false&du=km", 
               "&avoid=minimizeTolls&key=", Sys.getenv("BING_MAPS_API_KEY"))
      url <- URLencode(url)
      lst <- fromJSON(url)
      if (lst$statusCode != 200) return(tibble(km = NA, seconds = NA, mode = NA))
      df <- lst$resourceSets$resources[[1]]
      return(tibble(km = df$travelDistance, seconds = df$travelDuration, mode = df$travelMode))
   })
   return(bind_cols(from_to_df, dat))
}
bing_mapdist(from = "Stormgade 157, 6715 Esbjerg, Denmark", 
             to = "A.F Heidemannsvej 20, 9800 Hjørring, Denmark")
#> # A tibble: 1 × 5
#>   from                                 to                                           km seconds mode 
#>   <chr>                                <chr>                                     <dbl>   <int> <chr>
#> 1 Stormgade 157, 6715 Esbjerg, Denmark A.F Heidemannsvej 20, 9800 Hjørring, Den…  322.   10037 Driv…
bing_mapdist(from = "Stormgade 157, 6715 Esbjerg, Denmark", 
             to = "A.F Heidemannsvej 20, 9800 Hjørring, Denmark", 
             optimize = "distance")
#> # A tibble: 1 × 5
#>   from                                 to                                           km seconds mode 
#>   <chr>                                <chr>                                     <dbl>   <int> <chr>
#> 1 Stormgade 157, 6715 Esbjerg, Denmark A.F Heidemannsvej 20, 9800 Hjørring, Den…  257.   14220 Driv…
```

Note we here can get both the shortest and fastest path between two points. Next, we use the `bing_mapdist` function for calculating distances:


```r
#' Calculate the distance matrix in long format.
#'
#' @param address A vector of addresses.
#' @param symmetric Use symmetric distances (only half the number of queries).
#' @param ... Further parameters passed to `bing_mapdist`.
#' @return A data frame with the results
#' @note The API returns results for the fastest route.  
bing_calc_distances <- function(address, symmetric = TRUE, ...) {
   datDist <- expand_grid(id_from = 1:length(address), id_to = 1:length(address))
   datDist <- datDist %>% filter(id_from != id_to)
   if (symmetric) datDist <- datDist %>% filter(id_from < id_to)
   datDist <- datDist %>% mutate(from = address[id_from], to = address[id_to])
   res <- bing_mapdist(datDist %>% select(from, to), ...)
   return(bind_cols(datDist %>%  select(id_from, id_to), res))
}
datDistBing <- bing_calc_distances(dat$Address)
datDistBing
#> # A tibble: 10 × 7
#>    id_from id_to from                                         to                    km seconds mode 
#>      <int> <int> <chr>                                        <chr>              <dbl>   <int> <chr>
#>  1       1     2 Stormgade 157, 6715 Esbjerg, Denmark         Golfvej 5, 7400 H…  87.8    4680 Driv…
#>  2       1     3 Stormgade 157, 6715 Esbjerg, Denmark         Slotsarkaderne 26… 322.    10594 Driv…
#>  3       1     4 Stormgade 157, 6715 Esbjerg, Denmark         A.F Heidemannsvej… 322.    10037 Driv…
#>  4       1     5 Stormgade 157, 6715 Esbjerg, Denmark         Nyholmvej 20, 750… 123.     5876 Driv…
#>  5       2     3 Golfvej 5, 7400 Herning, Denmark             Slotsarkaderne 26… 334.    10740 Driv…
#>  6       2     4 Golfvej 5, 7400 Herning, Denmark             A.F Heidemannsvej… 187.     7960 Driv…
#>  7       2     5 Golfvej 5, 7400 Herning, Denmark             Nyholmvej 20, 750…  44.2    1747 Driv…
#>  8       3     4 Slotsarkaderne 26, 3400 Hillerød, Denmark    A.F Heidemannsvej… 397.    17241 Driv…
#>  9       3     5 Slotsarkaderne 26, 3400 Hillerød, Denmark    Nyholmvej 20, 750… 375.    12166 Driv…
#> 10       4     5 A.F Heidemannsvej 20, 9800 Hjørring, Denmark Nyholmvej 20, 750… 194.     8269 Driv…
```

Note in general results from the API services are based on a set of assumptions and hence the results from different services may not be the same. You may use the different services to check if the distances are correct, by checking the results from different services:


```r
# Difference in minutes
abs(as_dist_matrix(datDistGoo, "seconds") - as_dist_matrix(datDistBing, "seconds"))/60
#>       [,1]   [,2]  [,3]   [,4]   [,5]
#> [1,]  0.00   5.47  18.9  19.80   9.72
#> [2,]  5.47   0.00 113.7  95.18 172.55
#> [3,] 18.85 113.67   0.0 157.50 172.20
#> [4,] 19.80  95.18 157.5   0.00   7.98
#> [5,]  9.72 172.55 172.2   7.98   0.00
# Km from 1 to 3
mapdist(from = "Stormgade 157, 6715 Esbjerg, Denmark", 
        to = "Slotsarkaderne 26, 3400 Hillerød, Denmark")
#> # A tibble: 1 × 9
#>   from                                 to                  m    km miles seconds minutes hours mode 
#>   <chr>                                <chr>           <int> <dbl> <dbl>   <int>   <dbl> <dbl> <chr>
#> 1 Stormgade 157, 6715 Esbjerg, Denmark Slotsarkadern… 321853  322.  200.   11725    195.  3.26 driv…
bing_mapdist(from = "Stormgade 157, 6715 Esbjerg, Denmark", 
        to = "Slotsarkaderne 26, 3400 Hillerød, Denmark")
#> # A tibble: 1 × 5
#>   from                                 to                                           km seconds mode 
#>   <chr>                                <chr>                                     <dbl>   <int> <chr>
#> 1 Stormgade 157, 6715 Esbjerg, Denmark Slotsarkaderne 26, 3400 Hillerød, Denmark  322.   10594 Driv…
```


## Geocoding and reverse geocoding

### Using Google maps

Remember to enable the *Geocoding API*. To get the coordinates of an address we use the `geocode` function:


```r
geocode("Stormgade 157, 6715 Esbjerg, Denmark")
#> # A tibble: 1 × 2
#>     lon   lat
#>   <dbl> <dbl>
#> 1  8.46  55.5
```

We may use `mutate_geocode` to add the coordinates to a dataset:


```r
dat <- dat %>% 
  mutate_geocode(Address)
dat
#> # A tibble: 5 × 5
#>      Id Shop            Address                                        lon   lat
#>   <int> <chr>           <chr>                                        <dbl> <dbl>
#> 1     1 Bilka Esbjerg   Stormgade 157, 6715 Esbjerg, Denmark          8.46  55.5
#> 2     2 Bilka Herning   Golfvej 5, 7400 Herning, Denmark              9.00  56.1
#> 3     3 Bilka Hillerød  Slotsarkaderne 26, 3400 Hillerød, Denmark    12.3   55.9
#> 4     4 Bilka Hjørring  A.F Heidemannsvej 20, 9800 Hjørring, Denmark 10.0   57.4
#> 5     5 Bilka Holstebro Nyholmvej 20, 7500 Holstebro, Denmark         8.62  56.4
```

To reverse geocode use the `revgeocode` function:


```r
revgeocode(c(dat$lon[1], dat$lat[1]))
#> [1] "Stormgade 157, 6715 Esbjerg Kommune, Denmark"
```

To apply it to the dataset use:


```r
dat <- dat %>% 
   mutate(AddressGeoGoo = 
             map_chr(1:n(), function(i) {
               revgeocode(c(lon = lon[i], lat = lat[i]))
             }))
dat
#> # A tibble: 5 × 6
#>      Id Shop            Address                                        lon   lat AddressGeoGoo      
#>   <int> <chr>           <chr>                                        <dbl> <dbl> <chr>              
#> 1     1 Bilka Esbjerg   Stormgade 157, 6715 Esbjerg, Denmark          8.46  55.5 Stormgade 157, 671…
#> 2     2 Bilka Herning   Golfvej 5, 7400 Herning, Denmark              9.00  56.1 Golfvej 5, 7400 He…
#> 3     3 Bilka Hillerød  Slotsarkaderne 26, 3400 Hillerød, Denmark    12.3   55.9 Slotsarkaderne 26,…
#> 4     4 Bilka Hjørring  A.F Heidemannsvej 20, 9800 Hjørring, Denmark 10.0   57.4 A F Heidemanns Vej…
#> 5     5 Bilka Holstebro Nyholmvej 20, 7500 Holstebro, Denmark         8.62  56.4 Nyholmvej 20, 7500…
```


### Use Bing Maps

To get the coordinates of an address we define the `bing_geocode` function:


```r
#' Geocode addresses
#'
#' @param address Address(es) to geocode.
#' @return The coordinates as a data frame.
bing_geocode <- function(address) {
   dat <- map_dfr(address, function(s) {
      url <- str_c("http://dev.virtualearth.net/REST/v1/Locations?q=", 
                   s, "&key=", Sys.getenv("BING_MAPS_API_KEY"))
      url <- URLencode(url)
      lst <- fromJSON(url)
      if (lst$statusCode != 200) return(tibble(lon = NA, lat = NA))
      v <- lst$resourceSets$resources[[1]]$point$coordinates[[1]]
      if (is.null(v)) return(tibble(lon = NA, lat = NA))
      return(tibble(lon = v[2], lat = v[1]))
   })
   return(dat)
}
bing_geocode("A.F. Heidemannsvej 20, 9800 Hjørring, Denmark")
#> # A tibble: 1 × 2
#>     lon   lat
#>   <dbl> <dbl>
#> 1  10.0  57.4
bing_geocode(dat$Address)
#> # A tibble: 5 × 2
#>     lon   lat
#>   <dbl> <dbl>
#> 1  8.46  55.5
#> 2  9.00  56.1
#> 3 12.3   55.9
#> 4 10.0   57.4
#> 5  8.62  56.4
```

We may use `bing_mutate_geocode` to add the coordinates to a dataset:


```r
dat <- dat %>% select(-lat, -lon)
mutate_bing_geocode <- function (data, address, ...) {
    adr <- data[[deparse(substitute(Address))]]
    gcdf <- bing_geocode(adr)
    bind_cols(data, gcdf)
}

dat <- dat %>% 
  mutate_bing_geocode(Address)
dat
#> # A tibble: 5 × 6
#>      Id Shop            Address                                      AddressGeoGoo         lon   lat
#>   <int> <chr>           <chr>                                        <chr>               <dbl> <dbl>
#> 1     1 Bilka Esbjerg   Stormgade 157, 6715 Esbjerg, Denmark         Stormgade 157, 671…  8.46  55.5
#> 2     2 Bilka Herning   Golfvej 5, 7400 Herning, Denmark             Golfvej 5, 7400 He…  9.00  56.1
#> 3     3 Bilka Hillerød  Slotsarkaderne 26, 3400 Hillerød, Denmark    Slotsarkaderne 26,… 12.3   55.9
#> 4     4 Bilka Hjørring  A.F Heidemannsvej 20, 9800 Hjørring, Denmark A F Heidemanns Vej… 10.0   57.4
#> 5     5 Bilka Holstebro Nyholmvej 20, 7500 Holstebro, Denmark        Nyholmvej 20, 7500…  8.62  56.4
```

To reverse geocode use the `bing_revgeocode` function:


```r
#' Reverse geocode coordinates
#'
#' @param coordinates A vector with two elements (lon, lat).
#' @return The address as a data frame.
bing_revgeocode <- function(coordinates) {
   url <- str_c("http://dev.virtualearth.net/REST/v1/Locations/", 
                coordinates[2], ",", coordinates[1],
                "?key=", Sys.getenv("BING_MAPS_API_KEY"))
   url <- URLencode(url)
   lst <- fromJSON(url)
   if (lst$statusCode != 200) return(NA)
   v <- lst$resourceSets$resources[[1]]$address$formattedAddress
   if (is.null(v)) return(NA)
   return(v)
}
bing_revgeocode(c(dat$lon[1], dat$lat[1]))
#> [1] "Stormgade 157, 6715 Esbjerg, Denmark"
```

To apply it to the dataset use:


```r
dat <- dat %>% 
   mutate(AddressGeoBing = 
             map_chr(1:n(), function(i) {
               bing_revgeocode(c(lon = lon[i], lat = lat[i]))
             }))
dat 
#> # A tibble: 5 × 7
#>      Id Shop            Address                             AddressGeoGoo   lon   lat AddressGeoBing
#>   <int> <chr>           <chr>                               <chr>         <dbl> <dbl> <chr>         
#> 1     1 Bilka Esbjerg   Stormgade 157, 6715 Esbjerg, Denma… Stormgade 15…  8.46  55.5 Stormgade 157…
#> 2     2 Bilka Herning   Golfvej 5, 7400 Herning, Denmark    Golfvej 5, 7…  9.00  56.1 Golfvej 5, 74…
#> 3     3 Bilka Hillerød  Slotsarkaderne 26, 3400 Hillerød, … Slotsarkader… 12.3   55.9 Slotsarkadern…
#> 4     4 Bilka Hjørring  A.F Heidemannsvej 20, 9800 Hjørrin… A F Heideman… 10.0   57.4 A.F. Heideman…
#> 5     5 Bilka Holstebro Nyholmvej 20, 7500 Holstebro, Denm… Nyholmvej 20…  8.62  56.4 Nyholmvej 20,…
```


## Adding markers and routes to a map

[Leaflet](http://leafletjs.com) is an open-source JavaScript library for interactive maps. It’s used by websites ranging from The New York Times and The Washington Post to GitHub and Flickr, as well as GIS specialists like OpenStreetMap, Mapbox, and CartoDB. The [leaflet](https://rstudio.github.io/leaflet/) package makes it easy to create Leaflet maps from R.

Note Leaflet is open-source and free so you do not need an API key for making maps. If you would like to use Google maps instead then have a look at the [googleway](http://symbolixau.github.io/googleway/) package instead. 

First let us create a map with two base layers


```r
library(leaflet)
m <- leaflet() %>% 
   # Base maps
   addTiles(group = "Map") %>%
   addProviderTiles('Esri.WorldImagery', group = "Satelite") %>% 
   addProviderTiles("CartoDB.PositronOnlyLabels", group = "Map") %>% 
   # Center and zoom
   setView(10.2, 56.2,  zoom = 7) %>% 
   # Layer control
   addLayersControl(
    baseGroups = c("Map", "Satelite"),
    options = layersControlOptions(collapsed = TRUE)
   ) 
 m
```

```{=html}
<div id="htmlwidget-012685db216323c288ad" style="width:672px;height:480px;" class="leaflet html-widget"></div>
<script type="application/json" data-for="htmlwidget-012685db216323c288ad">{"x":{"options":{"crs":{"crsClass":"L.CRS.EPSG3857","code":null,"proj4def":null,"projectedBounds":null,"options":{}}},"calls":[{"method":"addTiles","args":["https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",null,"Map",{"minZoom":0,"maxZoom":18,"tileSize":256,"subdomains":"abc","errorTileUrl":"","tms":false,"noWrap":false,"zoomOffset":0,"zoomReverse":false,"opacity":1,"zIndex":1,"detectRetina":false,"attribution":"&copy; <a href=\"https://openstreetmap.org\">OpenStreetMap<\/a> contributors, <a href=\"https://creativecommons.org/licenses/by-sa/2.0/\">CC-BY-SA<\/a>"}]},{"method":"addProviderTiles","args":["Esri.WorldImagery",null,"Satelite",{"errorTileUrl":"","noWrap":false,"detectRetina":false}]},{"method":"addProviderTiles","args":["CartoDB.PositronOnlyLabels",null,"Map",{"errorTileUrl":"","noWrap":false,"detectRetina":false}]},{"method":"addLayersControl","args":[["Map","Satelite"],[],{"collapsed":true,"autoZIndex":true,"position":"topright"}]}],"setView":[[56.2,10.2],7,[]]},"evals":[],"jsHooks":[]}</script>
```

Next, let us add the places:


```r
dat <- tibble::tribble(
      ~Id,              ~Shop,                                        ~Address,
       1L,    "Bilka Esbjerg",          "Stormgade 157, 6715 Esbjerg, Denmark",
       2L,    "Bilka Herning",              "Golfvej 5, 7400 Herning, Denmark",
       3L,   "Bilka Hillerød",     "Slotsarkaderne 26, 3400 Hillerød, Denmark",
       4L,   "Bilka Hjørring",  "A.F Heidemannsvej 20, 9800 Hjørring, Denmark",
       5L,  "Bilka Holstebro",         "Nyholmvej 20, 7500 Holstebro, Denmark",
      )
dat <- dat %>% mutate_geocode(Address)
m <- m %>% 
   addMarkers(~lon, ~lat, popup = ~Address, label = ~str_c(Id, "  - ", Shop), data = dat)
m
```

```{=html}
<div id="htmlwidget-6d49d239b19dde8da904" style="width:672px;height:480px;" class="leaflet html-widget"></div>
<script type="application/json" data-for="htmlwidget-6d49d239b19dde8da904">{"x":{"options":{"crs":{"crsClass":"L.CRS.EPSG3857","code":null,"proj4def":null,"projectedBounds":null,"options":{}}},"calls":[{"method":"addTiles","args":["https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",null,"Map",{"minZoom":0,"maxZoom":18,"tileSize":256,"subdomains":"abc","errorTileUrl":"","tms":false,"noWrap":false,"zoomOffset":0,"zoomReverse":false,"opacity":1,"zIndex":1,"detectRetina":false,"attribution":"&copy; <a href=\"https://openstreetmap.org\">OpenStreetMap<\/a> contributors, <a href=\"https://creativecommons.org/licenses/by-sa/2.0/\">CC-BY-SA<\/a>"}]},{"method":"addProviderTiles","args":["Esri.WorldImagery",null,"Satelite",{"errorTileUrl":"","noWrap":false,"detectRetina":false}]},{"method":"addProviderTiles","args":["CartoDB.PositronOnlyLabels",null,"Map",{"errorTileUrl":"","noWrap":false,"detectRetina":false}]},{"method":"addLayersControl","args":[["Map","Satelite"],[],{"collapsed":true,"autoZIndex":true,"position":"topright"}]},{"method":"addMarkers","args":[[55.5107577,56.1357775,55.9290561,57.4440055,56.3779116],[8.4559613,9.0047956,12.2977779,10.0034953,8.6222409],null,null,null,{"interactive":true,"draggable":false,"keyboard":true,"title":"","alt":"","zIndexOffset":0,"opacity":1,"riseOnHover":false,"riseOffset":250},["Stormgade 157, 6715 Esbjerg, Denmark","Golfvej 5, 7400 Herning, Denmark","Slotsarkaderne 26, 3400 Hillerød, Denmark","A.F Heidemannsvej 20, 9800 Hjørring, Denmark","Nyholmvej 20, 7500 Holstebro, Denmark"],null,null,null,["1  - Bilka Esbjerg","2  - Bilka Herning","3  - Bilka Hillerød","4  - Bilka Hjørring","5  - Bilka Holstebro"],{"interactive":false,"permanent":false,"direction":"auto","opacity":1,"offset":[0,0],"textsize":"10px","textOnly":false,"className":"","sticky":true},null]}],"setView":[[56.2,10.2],7,[]],"limits":{"lat":[55.5107577,57.4440055],"lng":[8.4559613,12.2977779]}},"evals":[],"jsHooks":[]}</script>
```

To add a line between a set of points use the `addPolylines` function:


```r
routeIds <- c(2, 5, 1, 2)
route <- dat[routeIds,] 
m %>% addPolylines(lng = ~lon, lat = ~lat, data = route, weight = 2, label = "Route 1")
```

```{=html}
<div id="htmlwidget-a2cdd5fa59723161814f" style="width:672px;height:480px;" class="leaflet html-widget"></div>
<script type="application/json" data-for="htmlwidget-a2cdd5fa59723161814f">{"x":{"options":{"crs":{"crsClass":"L.CRS.EPSG3857","code":null,"proj4def":null,"projectedBounds":null,"options":{}}},"calls":[{"method":"addTiles","args":["https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",null,"Map",{"minZoom":0,"maxZoom":18,"tileSize":256,"subdomains":"abc","errorTileUrl":"","tms":false,"noWrap":false,"zoomOffset":0,"zoomReverse":false,"opacity":1,"zIndex":1,"detectRetina":false,"attribution":"&copy; <a href=\"https://openstreetmap.org\">OpenStreetMap<\/a> contributors, <a href=\"https://creativecommons.org/licenses/by-sa/2.0/\">CC-BY-SA<\/a>"}]},{"method":"addProviderTiles","args":["Esri.WorldImagery",null,"Satelite",{"errorTileUrl":"","noWrap":false,"detectRetina":false}]},{"method":"addProviderTiles","args":["CartoDB.PositronOnlyLabels",null,"Map",{"errorTileUrl":"","noWrap":false,"detectRetina":false}]},{"method":"addLayersControl","args":[["Map","Satelite"],[],{"collapsed":true,"autoZIndex":true,"position":"topright"}]},{"method":"addMarkers","args":[[55.5107577,56.1357775,55.9290561,57.4440055,56.3779116],[8.4559613,9.0047956,12.2977779,10.0034953,8.6222409],null,null,null,{"interactive":true,"draggable":false,"keyboard":true,"title":"","alt":"","zIndexOffset":0,"opacity":1,"riseOnHover":false,"riseOffset":250},["Stormgade 157, 6715 Esbjerg, Denmark","Golfvej 5, 7400 Herning, Denmark","Slotsarkaderne 26, 3400 Hillerød, Denmark","A.F Heidemannsvej 20, 9800 Hjørring, Denmark","Nyholmvej 20, 7500 Holstebro, Denmark"],null,null,null,["1  - Bilka Esbjerg","2  - Bilka Herning","3  - Bilka Hillerød","4  - Bilka Hjørring","5  - Bilka Holstebro"],{"interactive":false,"permanent":false,"direction":"auto","opacity":1,"offset":[0,0],"textsize":"10px","textOnly":false,"className":"","sticky":true},null]},{"method":"addPolylines","args":[[[[{"lng":[9.0047956,8.6222409,8.4559613,9.0047956],"lat":[56.1357775,56.3779116,55.5107577,56.1357775]}]]],null,null,{"interactive":true,"className":"","stroke":true,"color":"#03F","weight":2,"opacity":0.5,"fill":false,"fillColor":"#03F","fillOpacity":0.2,"smoothFactor":1,"noClip":false},null,null,"Route 1",{"interactive":false,"permanent":false,"direction":"auto","opacity":1,"offset":[0,0],"textsize":"10px","textOnly":false,"className":"","sticky":true},null]}],"setView":[[56.2,10.2],7,[]],"limits":{"lat":[55.5107577,57.4440055],"lng":[8.4559613,12.2977779]}},"evals":[],"jsHooks":[]}</script>
```

A more advanced setup is to use the `addFlows` function from the [leaflet.minicharts](https://github.com/rte-antares-rpackage/leaflet.minicharts) package. First let us define some lines:


```r
datLines <- tibble(FromId = c(2, 5, 1, 2, 4, 3), ToId = c(5, 1, 2, 4, 3, 2))
datLines <- left_join(datLines, dat %>% select(-Shop, -Address), by = c("FromId" = "Id")) %>% 
   rename("FromLat" = "lat", "FromLon" = "lon") %>% 
   left_join(dat %>% select(-Shop, -Address), by = c("ToId" = "Id")) %>% 
   rename("ToLat" = "lat", "ToLon" = "lon")
datLines
#> # A tibble: 6 × 6
#>   FromId  ToId FromLon FromLat ToLon ToLat
#>    <dbl> <dbl>   <dbl>   <dbl> <dbl> <dbl>
#> 1      2     5    9.00    56.1  8.62  56.4
#> 2      5     1    8.62    56.4  8.46  55.5
#> 3      1     2    8.46    55.5  9.00  56.1
#> 4      2     4    9.00    56.1 10.0   57.4
#> 5      4     3   10.0     57.4 12.3   55.9
#> 6      3     2   12.3     55.9  9.00  56.1
```

Note we have a from/to pair in each row. We add the lines to the map:


```r
library(leaflet.minicharts)
m %>% addFlows(datLines$FromLon, datLines$FromLat, datLines$ToLon, datLines$ToLat,
               flow = 1, maxFlow = 20, opacity = 0.5, popup = popupArgs(noPopup = TRUE))
```

```{=html}
<div id="htmlwidget-3e32ee888df16ab91348" style="width:672px;height:480px;" class="leaflet html-widget"></div>
<script type="application/json" data-for="htmlwidget-3e32ee888df16ab91348">{"x":{"options":{"crs":{"crsClass":"L.CRS.EPSG3857","code":null,"proj4def":null,"projectedBounds":null,"options":{}}},"calls":[{"method":"addTiles","args":["https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",null,"Map",{"minZoom":0,"maxZoom":18,"tileSize":256,"subdomains":"abc","errorTileUrl":"","tms":false,"noWrap":false,"zoomOffset":0,"zoomReverse":false,"opacity":1,"zIndex":1,"detectRetina":false,"attribution":"&copy; <a href=\"https://openstreetmap.org\">OpenStreetMap<\/a> contributors, <a href=\"https://creativecommons.org/licenses/by-sa/2.0/\">CC-BY-SA<\/a>"}]},{"method":"addProviderTiles","args":["Esri.WorldImagery",null,"Satelite",{"errorTileUrl":"","noWrap":false,"detectRetina":false}]},{"method":"addProviderTiles","args":["CartoDB.PositronOnlyLabels",null,"Map",{"errorTileUrl":"","noWrap":false,"detectRetina":false}]},{"method":"addLayersControl","args":[["Map","Satelite"],[],{"collapsed":true,"autoZIndex":true,"position":"topright"}]},{"method":"addMarkers","args":[[55.5107577,56.1357775,55.9290561,57.4440055,56.3779116],[8.4559613,9.0047956,12.2977779,10.0034953,8.6222409],null,null,null,{"interactive":true,"draggable":false,"keyboard":true,"title":"","alt":"","zIndexOffset":0,"opacity":1,"riseOnHover":false,"riseOffset":250},["Stormgade 157, 6715 Esbjerg, Denmark","Golfvej 5, 7400 Herning, Denmark","Slotsarkaderne 26, 3400 Hillerød, Denmark","A.F Heidemannsvej 20, 9800 Hjørring, Denmark","Nyholmvej 20, 7500 Holstebro, Denmark"],null,null,null,["1  - Bilka Esbjerg","2  - Bilka Herning","3  - Bilka Hillerød","4  - Bilka Hjørring","5  - Bilka Holstebro"],{"interactive":false,"permanent":false,"direction":"auto","opacity":1,"offset":[0,0],"textsize":"10px","textOnly":false,"className":"","sticky":true},null]},{"method":"addFlows","args":[[{"dyn":{},"static":{"color":"blue","value":1,"maxValue":20,"minThickness":1,"maxThickness":20,"opacity":0.5,"layerId":"_flow (10.0034953,57.4440055) -> (12.2977779,55.9290561)","lat0":57.4440055,"lat1":55.9290561,"lng0":10.0034953,"lng1":12.2977779},"timeSteps":1},{"dyn":{},"static":{"color":"blue","value":1,"maxValue":20,"minThickness":1,"maxThickness":20,"opacity":0.5,"layerId":"_flow (12.2977779,55.9290561) -> (9.0047956,56.1357775)","lat0":55.9290561,"lat1":56.1357775,"lng0":12.2977779,"lng1":9.0047956},"timeSteps":1},{"dyn":{},"static":{"color":"blue","value":1,"maxValue":20,"minThickness":1,"maxThickness":20,"opacity":0.5,"layerId":"_flow (8.4559613,55.5107577) -> (9.0047956,56.1357775)","lat0":55.5107577,"lat1":56.1357775,"lng0":8.4559613,"lng1":9.0047956},"timeSteps":1},{"dyn":{},"static":{"color":"blue","value":1,"maxValue":20,"minThickness":1,"maxThickness":20,"opacity":0.5,"layerId":"_flow (8.6222409,56.3779116) -> (8.4559613,55.5107577)","lat0":56.3779116,"lat1":55.5107577,"lng0":8.6222409,"lng1":8.4559613},"timeSteps":1},{"dyn":{},"static":{"color":"blue","value":1,"maxValue":20,"minThickness":1,"maxThickness":20,"opacity":0.5,"layerId":"_flow (9.0047956,56.1357775) -> (10.0034953,57.4440055)","lat0":56.1357775,"lat1":57.4440055,"lng0":9.0047956,"lng1":10.0034953},"timeSteps":1},{"dyn":{},"static":{"color":"blue","value":1,"maxValue":20,"minThickness":1,"maxThickness":20,"opacity":0.5,"layerId":"_flow (9.0047956,56.1357775) -> (8.6222409,56.3779116)","lat0":56.1357775,"lat1":56.3779116,"lng0":9.0047956,"lng1":8.6222409},"timeSteps":1}],["1"],null,{"showTitle":true,"showValues":true,"labels":[],"supValues":null,"supLabels":[],"html":null,"noPopup":true,"digits":null},null]}],"setView":[[56.2,10.2],7,[]],"limits":{"lat":[55.5107577,57.4440055],"lng":[8.4559613,12.2977779]}},"evals":[],"jsHooks":[]}</script>
```

Let us define a function for adding routes:


```r
add_route <- function(dat = NULL, route, solution = 1) {
   route_id = if_else(is.null(dat), 1, max(dat$RouteId) + 1)
   tmp <- tibble(From = route[1:(length(route)-1)], To = route[2:length(route)])
   tmp <- tmp %>% mutate(Sol = solution, RouteId = route_id)
   dat <- bind_rows(dat, tmp)
}

datLines <- add_route(route = c(2, 5, 1, 2)) %>% 
   add_route(route = c(2, 4, 3, 2)) %>% 
   add_route(route = c(2, 3, 1, 2), solution = 2) %>% 
   add_route(route = c(2, 5, 4, 2), solution = 2)
datLines <- left_join(datLines, dat %>% select(-Shop, -Address), by = c("From" = "Id")) %>% 
   rename("FromLat" = "lat", "FromLon" = "lon") %>% 
   left_join(dat %>% select(-Shop, -Address), by = c("To" = "Id")) %>% 
   rename("ToLat" = "lat", "ToLon" = "lon") %>% 
   mutate(group = str_c("Solution ", Sol))
datLines
#> # A tibble: 12 × 9
#>     From    To   Sol RouteId FromLon FromLat ToLon ToLat group     
#>    <dbl> <dbl> <dbl>   <dbl>   <dbl>   <dbl> <dbl> <dbl> <chr>     
#>  1     2     5     1       1    9.00    56.1  8.62  56.4 Solution 1
#>  2     5     1     1       1    8.62    56.4  8.46  55.5 Solution 1
#>  3     1     2     1       1    8.46    55.5  9.00  56.1 Solution 1
#>  4     2     4     1       2    9.00    56.1 10.0   57.4 Solution 1
#>  5     4     3     1       2   10.0     57.4 12.3   55.9 Solution 1
#>  6     3     2     1       2   12.3     55.9  9.00  56.1 Solution 1
#>  7     2     3     2       3    9.00    56.1 12.3   55.9 Solution 2
#>  8     3     1     2       3   12.3     55.9  8.46  55.5 Solution 2
#>  9     1     2     2       3    8.46    55.5  9.00  56.1 Solution 2
#> 10     2     5     2       4    9.00    56.1  8.62  56.4 Solution 2
#> 11     5     4     2       4    8.62    56.4 10.0   57.4 Solution 2
#> 12     4     2     2       4   10.0     57.4  9.00  56.1 Solution 2
```

A map with Solution 1:


```r
col_pal <- rainbow(max(datLines$RouteId))
datP <- datLines %>% filter(Sol == 1)
m %>% addFlows(datP$FromLon, datP$FromLat, datP$ToLon, datP$ToLat,
               flow = datP$RouteId, maxThickness = 2, color = col_pal[datP$RouteId],
               opacity = 0.5, popup = popupArgs(labels = "Route"))
```

```{=html}
<div id="htmlwidget-3cb105e1e3ae6f400b73" style="width:672px;height:480px;" class="leaflet html-widget"></div>
<script type="application/json" data-for="htmlwidget-3cb105e1e3ae6f400b73">{"x":{"options":{"crs":{"crsClass":"L.CRS.EPSG3857","code":null,"proj4def":null,"projectedBounds":null,"options":{}}},"calls":[{"method":"addTiles","args":["https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",null,"Map",{"minZoom":0,"maxZoom":18,"tileSize":256,"subdomains":"abc","errorTileUrl":"","tms":false,"noWrap":false,"zoomOffset":0,"zoomReverse":false,"opacity":1,"zIndex":1,"detectRetina":false,"attribution":"&copy; <a href=\"https://openstreetmap.org\">OpenStreetMap<\/a> contributors, <a href=\"https://creativecommons.org/licenses/by-sa/2.0/\">CC-BY-SA<\/a>"}]},{"method":"addProviderTiles","args":["Esri.WorldImagery",null,"Satelite",{"errorTileUrl":"","noWrap":false,"detectRetina":false}]},{"method":"addProviderTiles","args":["CartoDB.PositronOnlyLabels",null,"Map",{"errorTileUrl":"","noWrap":false,"detectRetina":false}]},{"method":"addLayersControl","args":[["Map","Satelite"],[],{"collapsed":true,"autoZIndex":true,"position":"topright"}]},{"method":"addMarkers","args":[[55.5107577,56.1357775,55.9290561,57.4440055,56.3779116],[8.4559613,9.0047956,12.2977779,10.0034953,8.6222409],null,null,null,{"interactive":true,"draggable":false,"keyboard":true,"title":"","alt":"","zIndexOffset":0,"opacity":1,"riseOnHover":false,"riseOffset":250},["Stormgade 157, 6715 Esbjerg, Denmark","Golfvej 5, 7400 Herning, Denmark","Slotsarkaderne 26, 3400 Hillerød, Denmark","A.F Heidemannsvej 20, 9800 Hjørring, Denmark","Nyholmvej 20, 7500 Holstebro, Denmark"],null,null,null,["1  - Bilka Esbjerg","2  - Bilka Herning","3  - Bilka Hillerød","4  - Bilka Hjørring","5  - Bilka Holstebro"],{"interactive":false,"permanent":false,"direction":"auto","opacity":1,"offset":[0,0],"textsize":"10px","textOnly":false,"className":"","sticky":true},null]},{"method":"addFlows","args":[[{"dyn":{"color":["#80FF00"],"value":[2]},"static":{"maxValue":2,"minThickness":1,"maxThickness":2,"opacity":0.5,"layerId":"_flow (10.0034953,57.4440055) -> (12.2977779,55.9290561)","lat0":57.4440055,"lat1":55.9290561,"lng0":10.0034953,"lng1":12.2977779},"timeSteps":1},{"dyn":{"color":["#80FF00"],"value":[2]},"static":{"maxValue":2,"minThickness":1,"maxThickness":2,"opacity":0.5,"layerId":"_flow (12.2977779,55.9290561) -> (9.0047956,56.1357775)","lat0":55.9290561,"lat1":56.1357775,"lng0":12.2977779,"lng1":9.0047956},"timeSteps":1},{"dyn":{"color":["#FF0000"],"value":[1]},"static":{"maxValue":2,"minThickness":1,"maxThickness":2,"opacity":0.5,"layerId":"_flow (8.4559613,55.5107577) -> (9.0047956,56.1357775)","lat0":55.5107577,"lat1":56.1357775,"lng0":8.4559613,"lng1":9.0047956},"timeSteps":1},{"dyn":{"color":["#FF0000"],"value":[1]},"static":{"maxValue":2,"minThickness":1,"maxThickness":2,"opacity":0.5,"layerId":"_flow (8.6222409,56.3779116) -> (8.4559613,55.5107577)","lat0":56.3779116,"lat1":55.5107577,"lng0":8.6222409,"lng1":8.4559613},"timeSteps":1},{"dyn":{"color":["#80FF00"],"value":[2]},"static":{"maxValue":2,"minThickness":1,"maxThickness":2,"opacity":0.5,"layerId":"_flow (9.0047956,56.1357775) -> (10.0034953,57.4440055)","lat0":56.1357775,"lat1":57.4440055,"lng0":9.0047956,"lng1":10.0034953},"timeSteps":1},{"dyn":{"color":["#FF0000"],"value":[1]},"static":{"maxValue":2,"minThickness":1,"maxThickness":2,"opacity":0.5,"layerId":"_flow (9.0047956,56.1357775) -> (8.6222409,56.3779116)","lat0":56.1357775,"lat1":56.3779116,"lng0":9.0047956,"lng1":8.6222409},"timeSteps":1}],["1"],null,{"showTitle":true,"showValues":true,"labels":["Route"],"supValues":null,"supLabels":[],"html":null,"noPopup":false,"digits":null},null]}],"setView":[[56.2,10.2],7,[]],"limits":{"lat":[55.5107577,57.4440055],"lng":[8.4559613,12.2977779]}},"evals":[],"jsHooks":[]}</script>
```

A map with Solution 2:


```r
col_pal <- rainbow(max(datLines$RouteId))
datP <- datLines %>% filter(Sol == 2)
m %>% addFlows(datP$FromLon, datP$FromLat, datP$ToLon, datP$ToLat,
               flow = datP$RouteId, maxThickness = 2, color = col_pal[datP$RouteId],
               opacity = 0.5, popup = popupArgs(labels = "Route"))
```

```{=html}
<div id="htmlwidget-b995335dd4ca0bba56bc" style="width:672px;height:480px;" class="leaflet html-widget"></div>
<script type="application/json" data-for="htmlwidget-b995335dd4ca0bba56bc">{"x":{"options":{"crs":{"crsClass":"L.CRS.EPSG3857","code":null,"proj4def":null,"projectedBounds":null,"options":{}}},"calls":[{"method":"addTiles","args":["https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",null,"Map",{"minZoom":0,"maxZoom":18,"tileSize":256,"subdomains":"abc","errorTileUrl":"","tms":false,"noWrap":false,"zoomOffset":0,"zoomReverse":false,"opacity":1,"zIndex":1,"detectRetina":false,"attribution":"&copy; <a href=\"https://openstreetmap.org\">OpenStreetMap<\/a> contributors, <a href=\"https://creativecommons.org/licenses/by-sa/2.0/\">CC-BY-SA<\/a>"}]},{"method":"addProviderTiles","args":["Esri.WorldImagery",null,"Satelite",{"errorTileUrl":"","noWrap":false,"detectRetina":false}]},{"method":"addProviderTiles","args":["CartoDB.PositronOnlyLabels",null,"Map",{"errorTileUrl":"","noWrap":false,"detectRetina":false}]},{"method":"addLayersControl","args":[["Map","Satelite"],[],{"collapsed":true,"autoZIndex":true,"position":"topright"}]},{"method":"addMarkers","args":[[55.5107577,56.1357775,55.9290561,57.4440055,56.3779116],[8.4559613,9.0047956,12.2977779,10.0034953,8.6222409],null,null,null,{"interactive":true,"draggable":false,"keyboard":true,"title":"","alt":"","zIndexOffset":0,"opacity":1,"riseOnHover":false,"riseOffset":250},["Stormgade 157, 6715 Esbjerg, Denmark","Golfvej 5, 7400 Herning, Denmark","Slotsarkaderne 26, 3400 Hillerød, Denmark","A.F Heidemannsvej 20, 9800 Hjørring, Denmark","Nyholmvej 20, 7500 Holstebro, Denmark"],null,null,null,["1  - Bilka Esbjerg","2  - Bilka Herning","3  - Bilka Hillerød","4  - Bilka Hjørring","5  - Bilka Holstebro"],{"interactive":false,"permanent":false,"direction":"auto","opacity":1,"offset":[0,0],"textsize":"10px","textOnly":false,"className":"","sticky":true},null]},{"method":"addFlows","args":[[{"dyn":{"color":["#8000FF"],"value":[4]},"static":{"maxValue":4,"minThickness":1,"maxThickness":2,"opacity":0.5,"layerId":"_flow (10.0034953,57.4440055) -> (9.0047956,56.1357775)","lat0":57.4440055,"lat1":56.1357775,"lng0":10.0034953,"lng1":9.0047956},"timeSteps":1},{"dyn":{"color":["#00FFFF"],"value":[3]},"static":{"maxValue":4,"minThickness":1,"maxThickness":2,"opacity":0.5,"layerId":"_flow (12.2977779,55.9290561) -> (8.4559613,55.5107577)","lat0":55.9290561,"lat1":55.5107577,"lng0":12.2977779,"lng1":8.4559613},"timeSteps":1},{"dyn":{"color":["#00FFFF"],"value":[3]},"static":{"maxValue":4,"minThickness":1,"maxThickness":2,"opacity":0.5,"layerId":"_flow (8.4559613,55.5107577) -> (9.0047956,56.1357775)","lat0":55.5107577,"lat1":56.1357775,"lng0":8.4559613,"lng1":9.0047956},"timeSteps":1},{"dyn":{"color":["#8000FF"],"value":[4]},"static":{"maxValue":4,"minThickness":1,"maxThickness":2,"opacity":0.5,"layerId":"_flow (8.6222409,56.3779116) -> (10.0034953,57.4440055)","lat0":56.3779116,"lat1":57.4440055,"lng0":8.6222409,"lng1":10.0034953},"timeSteps":1},{"dyn":{"color":["#00FFFF"],"value":[3]},"static":{"maxValue":4,"minThickness":1,"maxThickness":2,"opacity":0.5,"layerId":"_flow (9.0047956,56.1357775) -> (12.2977779,55.9290561)","lat0":56.1357775,"lat1":55.9290561,"lng0":9.0047956,"lng1":12.2977779},"timeSteps":1},{"dyn":{"color":["#8000FF"],"value":[4]},"static":{"maxValue":4,"minThickness":1,"maxThickness":2,"opacity":0.5,"layerId":"_flow (9.0047956,56.1357775) -> (8.6222409,56.3779116)","lat0":56.1357775,"lat1":56.3779116,"lng0":9.0047956,"lng1":8.6222409},"timeSteps":1}],["1"],null,{"showTitle":true,"showValues":true,"labels":["Route"],"supValues":null,"supLabels":[],"html":null,"noPopup":false,"digits":null},null]}],"setView":[[56.2,10.2],7,[]],"limits":{"lat":[55.5107577,57.4440055],"lng":[8.4559613,12.2977779]}},"evals":[],"jsHooks":[]}</script>
```

An interactive map with both solutions:


```r
mm <- m
res <- map(1:nrow(datLines), function(i) {
   tmp <- tibble(lat = c(datLines$FromLat[i], datLines$ToLat[i]), lon = c(datLines$FromLon[i], datLines$ToLon[i]))
   mm <<- mm %>% addPolylines(lng = ~lon, lat = ~lat, 
                              color = col_pal[datLines$Sol[i]], group = datLines$group[i],
                              data = tmp, weight = 2, label = datLines$group[i])
   return(invisible(NULL))
})
mm <- mm %>% 
  # Layer control
  addLayersControl(
    baseGroups = c("Map", "Satelite"),
    overlayGroups = unique(datLines$group),
    options = layersControlOptions(collapsed = FALSE)
  ) %>% 
  hideGroup(unique(datLines$group)) %>% 
  showGroup("Solution 1")
mm
```

```{=html}
<div id="htmlwidget-0716c536abcf51f312ed" style="width:672px;height:480px;" class="leaflet html-widget"></div>
<script type="application/json" data-for="htmlwidget-0716c536abcf51f312ed">{"x":{"options":{"crs":{"crsClass":"L.CRS.EPSG3857","code":null,"proj4def":null,"projectedBounds":null,"options":{}}},"calls":[{"method":"addTiles","args":["https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",null,"Map",{"minZoom":0,"maxZoom":18,"tileSize":256,"subdomains":"abc","errorTileUrl":"","tms":false,"noWrap":false,"zoomOffset":0,"zoomReverse":false,"opacity":1,"zIndex":1,"detectRetina":false,"attribution":"&copy; <a href=\"https://openstreetmap.org\">OpenStreetMap<\/a> contributors, <a href=\"https://creativecommons.org/licenses/by-sa/2.0/\">CC-BY-SA<\/a>"}]},{"method":"addProviderTiles","args":["Esri.WorldImagery",null,"Satelite",{"errorTileUrl":"","noWrap":false,"detectRetina":false}]},{"method":"addProviderTiles","args":["CartoDB.PositronOnlyLabels",null,"Map",{"errorTileUrl":"","noWrap":false,"detectRetina":false}]},{"method":"addLayersControl","args":[["Map","Satelite"],[],{"collapsed":true,"autoZIndex":true,"position":"topright"}]},{"method":"addMarkers","args":[[55.5107577,56.1357775,55.9290561,57.4440055,56.3779116],[8.4559613,9.0047956,12.2977779,10.0034953,8.6222409],null,null,null,{"interactive":true,"draggable":false,"keyboard":true,"title":"","alt":"","zIndexOffset":0,"opacity":1,"riseOnHover":false,"riseOffset":250},["Stormgade 157, 6715 Esbjerg, Denmark","Golfvej 5, 7400 Herning, Denmark","Slotsarkaderne 26, 3400 Hillerød, Denmark","A.F Heidemannsvej 20, 9800 Hjørring, Denmark","Nyholmvej 20, 7500 Holstebro, Denmark"],null,null,null,["1  - Bilka Esbjerg","2  - Bilka Herning","3  - Bilka Hillerød","4  - Bilka Hjørring","5  - Bilka Holstebro"],{"interactive":false,"permanent":false,"direction":"auto","opacity":1,"offset":[0,0],"textsize":"10px","textOnly":false,"className":"","sticky":true},null]},{"method":"addPolylines","args":[[[[{"lng":[9.0047956,8.6222409],"lat":[56.1357775,56.3779116]}]]],null,"Solution 1",{"interactive":true,"className":"","stroke":true,"color":"#FF0000","weight":2,"opacity":0.5,"fill":false,"fillColor":"#FF0000","fillOpacity":0.2,"smoothFactor":1,"noClip":false},null,null,"Solution 1",{"interactive":false,"permanent":false,"direction":"auto","opacity":1,"offset":[0,0],"textsize":"10px","textOnly":false,"className":"","sticky":true},null]},{"method":"addPolylines","args":[[[[{"lng":[8.6222409,8.4559613],"lat":[56.3779116,55.5107577]}]]],null,"Solution 1",{"interactive":true,"className":"","stroke":true,"color":"#FF0000","weight":2,"opacity":0.5,"fill":false,"fillColor":"#FF0000","fillOpacity":0.2,"smoothFactor":1,"noClip":false},null,null,"Solution 1",{"interactive":false,"permanent":false,"direction":"auto","opacity":1,"offset":[0,0],"textsize":"10px","textOnly":false,"className":"","sticky":true},null]},{"method":"addPolylines","args":[[[[{"lng":[8.4559613,9.0047956],"lat":[55.5107577,56.1357775]}]]],null,"Solution 1",{"interactive":true,"className":"","stroke":true,"color":"#FF0000","weight":2,"opacity":0.5,"fill":false,"fillColor":"#FF0000","fillOpacity":0.2,"smoothFactor":1,"noClip":false},null,null,"Solution 1",{"interactive":false,"permanent":false,"direction":"auto","opacity":1,"offset":[0,0],"textsize":"10px","textOnly":false,"className":"","sticky":true},null]},{"method":"addPolylines","args":[[[[{"lng":[9.0047956,10.0034953],"lat":[56.1357775,57.4440055]}]]],null,"Solution 1",{"interactive":true,"className":"","stroke":true,"color":"#FF0000","weight":2,"opacity":0.5,"fill":false,"fillColor":"#FF0000","fillOpacity":0.2,"smoothFactor":1,"noClip":false},null,null,"Solution 1",{"interactive":false,"permanent":false,"direction":"auto","opacity":1,"offset":[0,0],"textsize":"10px","textOnly":false,"className":"","sticky":true},null]},{"method":"addPolylines","args":[[[[{"lng":[10.0034953,12.2977779],"lat":[57.4440055,55.9290561]}]]],null,"Solution 1",{"interactive":true,"className":"","stroke":true,"color":"#FF0000","weight":2,"opacity":0.5,"fill":false,"fillColor":"#FF0000","fillOpacity":0.2,"smoothFactor":1,"noClip":false},null,null,"Solution 1",{"interactive":false,"permanent":false,"direction":"auto","opacity":1,"offset":[0,0],"textsize":"10px","textOnly":false,"className":"","sticky":true},null]},{"method":"addPolylines","args":[[[[{"lng":[12.2977779,9.0047956],"lat":[55.9290561,56.1357775]}]]],null,"Solution 1",{"interactive":true,"className":"","stroke":true,"color":"#FF0000","weight":2,"opacity":0.5,"fill":false,"fillColor":"#FF0000","fillOpacity":0.2,"smoothFactor":1,"noClip":false},null,null,"Solution 1",{"interactive":false,"permanent":false,"direction":"auto","opacity":1,"offset":[0,0],"textsize":"10px","textOnly":false,"className":"","sticky":true},null]},{"method":"addPolylines","args":[[[[{"lng":[9.0047956,12.2977779],"lat":[56.1357775,55.9290561]}]]],null,"Solution 2",{"interactive":true,"className":"","stroke":true,"color":"#80FF00","weight":2,"opacity":0.5,"fill":false,"fillColor":"#80FF00","fillOpacity":0.2,"smoothFactor":1,"noClip":false},null,null,"Solution 2",{"interactive":false,"permanent":false,"direction":"auto","opacity":1,"offset":[0,0],"textsize":"10px","textOnly":false,"className":"","sticky":true},null]},{"method":"addPolylines","args":[[[[{"lng":[12.2977779,8.4559613],"lat":[55.9290561,55.5107577]}]]],null,"Solution 2",{"interactive":true,"className":"","stroke":true,"color":"#80FF00","weight":2,"opacity":0.5,"fill":false,"fillColor":"#80FF00","fillOpacity":0.2,"smoothFactor":1,"noClip":false},null,null,"Solution 2",{"interactive":false,"permanent":false,"direction":"auto","opacity":1,"offset":[0,0],"textsize":"10px","textOnly":false,"className":"","sticky":true},null]},{"method":"addPolylines","args":[[[[{"lng":[8.4559613,9.0047956],"lat":[55.5107577,56.1357775]}]]],null,"Solution 2",{"interactive":true,"className":"","stroke":true,"color":"#80FF00","weight":2,"opacity":0.5,"fill":false,"fillColor":"#80FF00","fillOpacity":0.2,"smoothFactor":1,"noClip":false},null,null,"Solution 2",{"interactive":false,"permanent":false,"direction":"auto","opacity":1,"offset":[0,0],"textsize":"10px","textOnly":false,"className":"","sticky":true},null]},{"method":"addPolylines","args":[[[[{"lng":[9.0047956,8.6222409],"lat":[56.1357775,56.3779116]}]]],null,"Solution 2",{"interactive":true,"className":"","stroke":true,"color":"#80FF00","weight":2,"opacity":0.5,"fill":false,"fillColor":"#80FF00","fillOpacity":0.2,"smoothFactor":1,"noClip":false},null,null,"Solution 2",{"interactive":false,"permanent":false,"direction":"auto","opacity":1,"offset":[0,0],"textsize":"10px","textOnly":false,"className":"","sticky":true},null]},{"method":"addPolylines","args":[[[[{"lng":[8.6222409,10.0034953],"lat":[56.3779116,57.4440055]}]]],null,"Solution 2",{"interactive":true,"className":"","stroke":true,"color":"#80FF00","weight":2,"opacity":0.5,"fill":false,"fillColor":"#80FF00","fillOpacity":0.2,"smoothFactor":1,"noClip":false},null,null,"Solution 2",{"interactive":false,"permanent":false,"direction":"auto","opacity":1,"offset":[0,0],"textsize":"10px","textOnly":false,"className":"","sticky":true},null]},{"method":"addPolylines","args":[[[[{"lng":[10.0034953,9.0047956],"lat":[57.4440055,56.1357775]}]]],null,"Solution 2",{"interactive":true,"className":"","stroke":true,"color":"#80FF00","weight":2,"opacity":0.5,"fill":false,"fillColor":"#80FF00","fillOpacity":0.2,"smoothFactor":1,"noClip":false},null,null,"Solution 2",{"interactive":false,"permanent":false,"direction":"auto","opacity":1,"offset":[0,0],"textsize":"10px","textOnly":false,"className":"","sticky":true},null]},{"method":"addLayersControl","args":[["Map","Satelite"],["Solution 1","Solution 2"],{"collapsed":false,"autoZIndex":true,"position":"topright"}]},{"method":"hideGroup","args":[["Solution 1","Solution 2"]]},{"method":"showGroup","args":["Solution 1"]}],"setView":[[56.2,10.2],7,[]],"limits":{"lat":[55.5107577,57.4440055],"lng":[8.4559613,12.2977779]}},"evals":[],"jsHooks":[]}</script>
```

Note unfortunately arrows cannot be shown in this case.







