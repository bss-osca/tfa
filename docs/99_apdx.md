---
output: html_document
editor_options: 
  chunk_output_type: console
---




# (APPENDIX) Appendix {-} 

# Working in groups {#groups}

During the course you have been allocated into groups. You are expected to solve the exercises and write the project reports in these groups. Before you start, it is a good idea to agree on a set of group rules. First, agree on a [coding convention](#coding-convention). Most people in the R community use snake case but camel case is also okay. Next, setup rules on when to meet and how you will organize the work. For instance, it is a good idea that all try to solve some of the exercises before you meet and you then discuss the answers, problems etc. Finally, it is a good idea to have a common place for your code. You have different options:

1) Use a cloud storage services such as Dropbox, OneDrive or Google Drive.
2) Use a version control system such as Git together with [GitHub]. GitHub is a code sharing and publishing service and may be seen as a social networking site for programmers. 
3) If you use RStudio Cloud then one person in the group can create a shared workspace with projects: 
   - First create a new workspace named e.g. _Shared_. 
   - Press _Members_ and add the group members as moderators.
   - Now go back to _Projects_ in the _Tools for Analytics_ workspace and move one project to the shared workspace. Rename it to e.g. _Group Project_. 
   Members will now have access to this project where you can share code. NOTE you can not work collectively on a file simultaneously. That is, only one member can change a file at a time! Hence it is a good idea to have your own private project to work on and use this project as a place where you can share code. If you want to download a project to your laptop then press the export button. 

The benefit of a cloud storage service is that it is well known to you and easy to setup. Cons are that you cannot work on the same file simultaneously. The benefit of Git and GitHub is that it manages the evolution of a set of files – called a repository – in a sane, highly structured way. If you have no idea what I'm talking about, think of it as the "Track Changes" features from Microsoft Word on steroids. Here you can work on files simultaneously. Moreover, it can be used from within RStudio. Cons are that it is harder to setup and learn. For a detailed description see [Why Git? Why GitHub?][hg-why].

I recommend that you use Git and GitHub. However, if you find the learning curve to high just use a cloud storage service. The [Using Git together with GitHub](#using-git) section gives a tutorial on how to setup Git and GitHub. Skip it if you use a cloud storage service.

## Joint R project structure {-}

I suggest to have an R project with subfolders `joint`, `[student1 name]`, `[student2 name]`, ..., `[student5 name]`. Student folders contain files only a single student work on (good when you do some exercises before class). Folder `joint` contains joint work. That could for instance be a joint answer of an exercise (based on the work you did in the student folders) and a sub-folder with the project report.  


## Using Git together with GitHub {- #using-git}

<!-- Source: https://happygitwithr.com/big-picture.html -->

Git is a version control system. Git manages the evolution of a set of files – called a repository – in a sane, highly structured way. If you have no idea what I'm talking about, think of it as the "Track Changes" features from Microsoft Word on steroids. 

GitHub provide a home for your Git-based projects on the internet. If you have no idea what I'm talking about, think of it as DropBox but much, much better. It allows other people to see your stuff, sync up with you, and perhaps even make changes. Even for private solo projects, it's a good idea to push your work to a remote location for peace of mind.

To configure your computer go though the following steps:

### Register a free GitHub account {-}

Sign-up at [GitHub]. Some thoughts about your username:

  * Incorporate your actual name! People like to know who they're dealing with. Also makes your username easier for people to guess or remember.
  * Reuse your username from other contexts, e.g., Twitter or Slack. But, of course, someone with no GitHub activity will probably be squatting on that.
  * Pick a username you will be comfortable revealing to your future boss.
  * Shorter is better than longer.
  * Be as unique as possible in as few characters as possible. In some settings GitHub auto-completes or suggests usernames.
  * Make it timeless. Don't highlight your current university, employer, or place of residence, e.g. JennyFromTheBlock.
  * Avoid the use of upper vs. lower case to separate words. We highly recommend all lowercase. GitHub treats usernames in a case insensitive way, but using all lowercase is kinder to people doing downstream regular expression work with usernames, in various languages. A better strategy for word separation is to use a hyphen `-` or underscore `_`.


### Install Git {-}  

Find installation instructions below for your operating system.

#### Windows  {- #install-git-windows}

[Install Git from the web][git-install]. Windows prefers for Git to be installed below `C:/Program Files` and this appears to be the default. This implies, for example, that the Git executable on my Windows system is found at `C:/Program Files/Git/bin/git.exe`. Unless you have specific reasons to otherwise, follow this convention. If asked about "Adjusting your PATH environment", make sure to select "Git from the command line and also from 3rd-party software".

#### macOS {-}

**Option 1** (*highly recommended*): Install the Xcode command line tools (**not all of Xcode**), which includes Git.

Go to the shell and enter one of these commands to elicit an offer to install developer command line tools:

``` bash
git --version
git config
```

Accept the offer! Click on "Install".

Here's another way to request this installation, more directly:

``` bash
xcode-select --install
```

We just happen to find this Git-based trigger apropos.

Note also that, after upgrading macOS, you might need to re-do the above and/or re-agree to the Xcode license agreement. We have seen this cause the RStudio Git pane to disappear on a system where it was previously working. Use commands like those above to tickle Xcode into prompting you for what it needs, then restart RStudio.

**Option 2** (*recommended*): Install Git from here: <http://git-scm.com/downloads>.

  * This arguably sets you up the best for the future. It will certainly get you the latest version of Git of all approaches described here.
  * The GitHub home for the macOS installer is here: <https://github.com/timcharper/git_osx_installer>.
    - At that link, you can find more info if something goes wrong or you are working on an old version of macOS.

**Option 3** (*recommended*): If you anticipate getting heavily into scientific computing, you're going to be installing and updating lots of software. You should check out [Homebrew](http://brew.sh), "the missing package manager for OS X". Among many other things, it can install Git for you. Once you have Homebrew installed, do this in the shell:

```
brew install git
```


#### Linux {-}

Install Git via your distro's package manager.

Ubuntu or Debian Linux:

```sh
sudo apt-get install git
```

Fedora or RedHat Linux:

```sh
sudo yum install git
```

A comprehensive list for various Linux and Unix package managers: <https://git-scm.com/download/linux>


### Check your installation {-}

Quit and re-launch RStudio if there's __any doubt in your mind__ about whether you opened RStudio before or after installing Git. 

<!-- Open the shell. An easy way to get into a shell from RStudio is *Tools > Terminal* or *Tools > Shell*. First setup your credentials. In the shell write: -->

<!-- ``` bash -->
<!-- git config --global user.name 'Jane Doe' -->
<!-- git config --global user.email 'jane@example.com' -->
<!-- git config --global --list -->
<!-- ``` -->

<!-- substituting your name and **the email associated with your GitHub account**. -->

You can set your Git user name and email from within R using the [usethis package](https://usethis.r-lib.org):


```r
## install if needed (do this exactly once):
## install.packages("usethis")

library(usethis)
use_git_config(user.name = "Jane Doe", user.email = "jane@example.org")
```

What user name should you give to Git? This does not have to be your GitHub user name, although it can be. Another good option is your actual first name and last name. If you commit from different machines, sometimes people work that info into the user name. Your commits will be labelled with this user name, so make it informative to potential collaborators and future you.

What email should you give to Git? This __must__ be the email associated with your GitHub account.

These commands return nothing. You can check that Git understood what you typed by looking at the output of `git config --global --list` from a shell.  An easy way to get into a shell from RStudio is **Tools > Terminal* or *Tools > Shell**. If you have any problems go though Chapters 4-14 on the [Happy Git site][happy-git].

<!-- If you want RStudio to help with your Git and GitHub work, it must be able to find the Git executable. Let's check if RStudio can find the Git executable: -->

<!-- * Quit and re-launch RStudio if there's __any doubt in your mind__ about whether you opened RStudio before or after installing Git.  -->
<!-- * From RStudio, go to *Tools > Global Options > Git/SVN* and make sure that the box *Git executable* points to your Git executable. -->

<!-- On macOS and Linux, the path usually looks something like this: -->

<!-- ``` bash -->
<!-- /usr/bin/git -->
<!-- ``` -->

<!-- If you need to set this on macOS, it can sometimes be hard to navigate to the necessary directory, once you've clicked "Browse" and are working with a Finder-type window. The keyboard shortcut "command + shift + g" will summon "Go To Folder", where you will be able to type or paste any path you want. -->

<!-- On Windows, this path should look something like this: -->

<!-- ``` bash -->
<!-- C:/Program Files/Git/bin/git.exe -->
<!-- ``` -->

<!-- and here is a screenshot on Windows: -->

<!-- ![RStudio screenshot showing path to Git executable](img/windows-rstudio-git-executable-screenshot.png) -->


### Setup projects using Git and GitHub {-}

You have different options depending on how you start you project. I will only highlight the prefererd one.

#### New project, GitHub first {-}

Here we create a project with "GitHub first, then RStudio" sequence:

**Step 1**: Go to [GitHub] and make sure you are logged in. Click green "New repository" button. Or, if you are on your own profile page, click on "Repositories", then click the green "New" button.

- Repository name: `test` (or whatever you wish)  
- Public  
- YES Initialize this repository with a README

Click the big green button "Create repository."

Copy the HTTPS clone URL to your clipboard via the green "Clone or Download" button. 

**Step 2**: In RStudio, start a new Project:

  * **File > New Project > Version Control > Git**. In the "repository URL" paste the URL of your new GitHub repository. It will be something like this `https://github.com/[you-username]/test.git`.
  * Be intentional about where you create this Project.
  * Suggest you "Open in new session".
  * Click "Create Project" to create a new directory, which will be all of these things:
    - a directory or "folder" on your computer
    - a Git repository, linked to a remote GitHub repository
    - an RStudio Project
  * **In the absence of other constraints, I suggest that all of your R projects have exactly this set-up.**

This should download the `README.md` file that we created on GitHub in the previous step. Look in RStudio's file browser pane for the `README.md` file.

There's a big advantage to the "GitHub first, then RStudio" workflow: the remote GitHub repo is added as a remote for your local repo and your local `master` branch is now tracking `master` on GitHub. This is a technical but important point about Git. The practical implication is that you are now set up to push and pull. No need to fanny around setting up Git remotes and tracking branches on the command line.

**Step 3**: Make local changes, save, commit. 

**Do this every time you finish a valuable chunk of work, probably many times a day.**

From RStudio, modify the `README.md` file, e.g., by adding the line "This is a line from RStudio". Save your changes.

Commit these changes to your local repo. How?

  * Click the "Git" tab in upper right pane
  * Check "Staged" box for any files whose existence or modifications you want to commit.
    - To see more detail on what's changed in file since the last commit, click on "Diff" for a Git pop-up
  * If you're not already in the Git pop-up, click "Commit"
  * Type a message in "Commit message", such as "Commit from RStudio".
  * Click "Commit"

**Step 4**: Push your local changes to GitHub

**Do this a few times a day, but possibly less often than you commit.**

You have new work in your local Git repository, but the changes are not online yet.

This will seem counterintuitive, but first let's stop and pull from GitHub.

Why? Establish this habit for the future! If you make changes to the repo in the browser or from another machine or (one day) a collaborator has pushed, you will be happier if you pull those changes in before you attempt to push.
  
Click the blue "Pull" button in the "Git" tab in RStudio. I doubt anything will happen, i.e. you'll get the message "Already up-to-date." This is just to establish a habit.

Click the green "Push" button to send your local changes to GitHub. You should see some message along these lines.

``` bash
[master dc671f0] blah
 3 files changed, 22 insertions(+)
 create mode 100644 .gitignore
 create mode 100644 myrepo.Rproj
```

**Step 5**: Confirm the local change propagated to the GitHub remote

Go back to the browser. I assume we're still viewing your new GitHub repo.

Refresh.

You should see the new "This is a line from RStudio" in the README.

If you click on "commits," you should see one with the message "Commit from RStudio".

**Step 6**: Make a change on GitHub

Click on README.md in the file listing on GitHub.

In the upper right corner, click on the pencil for "Edit this file".

Add a line to this file, such as "Line added from GitHub."

Edit the commit message in "Commit changes" or accept the default.

Click the big green button "Commit changes."

**Step 7**: Pull from GitHub

Back in RStudio locally ...

Inspect your README.md. It should NOT have the line "Line added from GitHub". It should be as you left it. Verify that.

Click the blue Pull button.

Look at README.md again. You should now see the new line there.

**The end**

Now just repeat these operations when you do group work. Do work somewhere. Commit it. Push it or pull it depending on where you did it, but get local and remote "synced up". Repeat.

Note that in general (and especially in future when collaborating with other developers) you will usually need to pull changes from the remote (GitHub) before pushing the local changes you have made. For this reason, it's a good idea to try and get into the habit of pulling before you attempt to push.

If you have to type in your password over and over again, this can be avoided. Have a look at [Chapter 10][hg-credential-helper] of [Happy Git][happy-git].



#### Existing project, GitHub first {-}

See details in [Chapter 16][hg-exist-github-first] of [Happy Git][happy-git].


#### Existing project, GitHub last {-}

See details in [Chapter 17][hg-exist-github-last] of [Happy Git][happy-git].



# Annotate the course notes {#annotate}

I recommend using [hypothes.is] to annotate the online course notes. You can create both private and public annotations. Collaborative annotation helps people connect to each other and what they’re reading, even when they’re keeping their distance. You may also use public notes to help me indicate spell errors, unclear content etc. in the notes. 


# Getting help {#help}

We all get stuck sometimes and need some help. Below are some advises on how to help yourself and ask for help:
 
  * First try to understand the error message and solve the problem. You may try to debug your code by inserting break points in VBA or use `browser()` in your R code. See [Chapter 11][debug-in-r] in @wtf for further details.  
  * [Google is your friend](http://xkcd.com/627/). This is always the first step. Try searches like "vba range", "r dplyr filter", "r tidyverse", "r subset vector", etc.
  * Do you need help for a specific function in R then try `?[function-name]` such as `?geom_line`, `?mutate`, etc. Mostly, focus on the last section with examples. Moreover, some packages may have written vignettes try `browseVignettes(package = "package_name")` to check.
  * Have a look at **Help > Cheatsheets** in RStudio.
  * If you can't find an answer then it is time to ask on-line. I recommend asking a question at [stackoverflow](http://stackoverflow.com). To make your question effective, the idea is to make things as easy as possible for someone to answer. This stack overflow thread [How to make a great R reproducible example?](http://stackoverflow.com/questions/5963269/how-to-make-a-great-r-reproducible-example/5963610#5963610) give you some good hints. The process of providing a good minimal reproducible example (reprex) often causes you to answer your own question! See also [Stack Exchange's 'How to ask'](https://codereview.stackexchange.com/help/how-to-ask) and [How to make a reprex](https://www.tidyverse.org/help/) at tidyverse.
  * If you have a more course related question then ask it at our [course forum][course-help] and we will try to answer your question asap. Students are also welcome in helping each other.
  * You can also try to [annotate the online course notes](https://bss-osca.github.io/tfa/annotate.html) if something is unclear. I will try to answer asap.  
  * You can get help from our TAs at study cafés.
  
Note help using mail correspondence is not supported!


# Coding/naming convention {#coding-convention}

The main reason for using a consistent set of coding conventions is to standardize the structure and coding style of an application so that you and others can easily read and understand the code. Good coding conventions result in precise, readable, and unambiguous source code that is consistent with other language conventions and as intuitive as possible. 

Different ways of naming you variables exists. You are advised to adopt a naming convention; some use [snake case][wiki-snake-case] others use [camel case][wiki-camel-case]. The [Leszynski naming convention](https://en.wikipedia.org/wiki/Leszynski_naming_convention) define variables with a consistent prefix that makes it easy to identify its data type. It is common to use Leszynski convention within the VBA community. The R community use snake case but camel case is also okay. Some common prefixes used for the Leszynski naming convention are:

Type         Prefix     Example
-----      ----------   --------
Boolean      bln        blnFound
Currency	    cur	      curRevenue
Date (Time)	 dtm	      dtmStart
Double	    dbl     	dblTolerance
Integer      int        intQuantity
Long	       lng	      lngDistance
String       str        strFName
Variant      vnt        vntCheckSum
Array        ary        aryNumbers (optional)
User form    frm        frmProcess
Worksheet    wst        wstDistances
Workbook     wbk        wbkData

Many [other prefixes](https://msdn.microsoft.com/en-us/library/aa263493(v=vs.60).aspx) can be used also. 

Choose the naming convention you like best in your study group. But stick only to one of them. A few examples:

```
this_is_snake_case   # note you do not use capital letters here
thisIsCamelCase      # you start each word with a capital letter (except the first)
dblTolerance         # Lezynski convention naming a double (dbl) variable
strFullName              # Lezynski naming a string (str) variable
```

When defining variables and functions, it is in general good practice to use nouns for variables and verbs for functions.


## Commenting your code

It is always good practice to comment your code. Such that others can get a fast overview and understand your code easier. We will use [roxygen documentation](https://roxygen2.r-lib.org/) comments which are widely known. A few examples in VBA are

The top of a module file:

```
''' Module description.
'  Can be more than one line.
' @remarks Put your remarks on the module implementation here
' @author Lars Relund <junk@relund.dk>
' @date 2016-08-26
```

Before each `sub`, `function` etc. write:

```
'' Sub description
' @pre Precondition 
' @post Postcondition
' @param strA	Explanation of input parameter strA
' @param intB Explanation of input parameter intB
' @return Return value (if a function)
' @remarks Further remarks 
Public Function MyFunc(strA As String, intB As Integer) As Integer {
   ...
}
```

Further tags (i.e. keywords starting with @) can be seen [here](https://roxygen2.r-lib.org/articles/rd.html).

In R we use a 'hash' (#') to comment functions:


```r
#' Subtract two vectors
#'
#' @param x First vector.
#' @param y Vector to be subtracted.
#'
#' @return The difference.
#' @export
#'
#' @examples
#' subtract(x = c(5,5), y = c(2,3))
subtract <- function(x, y) {
  return(x-y)
}
```


# VBA specific topics {#apdx-vba}

## Debugging your code {#vba-debug}

You debug you code to find errors and correct bugs in your program. VBA has a built-in debugger that you may use to step though you code and check if the values in memory are correct. You start and use the debugger using the debugger buttons in the VBA editor, e.g. set the cursor in the top of a sub and press the **Step Into** button (<svg viewBox="0 0 448 512" style="height:1em;position:relative;display:inline-block;top:.1em;" xmlns="http://www.w3.org/2000/svg">  <path d="M0 93.7l183.6-25.3v177.4H0V93.7zm0 324.6l183.6 25.3V268.4H0v149.9zm203.8 28L448 480V268.4H203.8v177.9zm0-380.6v180.1H448V32L203.8 65.7z"></path></svg> F8, <svg viewBox="0 0 384 512" style="height:1em;position:relative;display:inline-block;top:.1em;" xmlns="http://www.w3.org/2000/svg">  <path d="M318.7 268.7c-.2-36.7 16.4-64.4 50-84.8-18.8-26.9-47.2-41.7-84.7-44.6-35.5-2.8-74.3 20.7-88.5 20.7-15 0-49.4-19.7-76.4-19.7C63.3 141.2 4 184.8 4 273.5q0 39.3 14.4 81.2c12.8 36.7 59 126.7 107.2 125.2 25.2-.6 43-17.9 75.8-17.9 31.8 0 48.3 17.9 76.4 17.9 48.6-.7 90.4-82.5 102.6-119.3-65.2-30.7-61.7-90-61.7-91.9zm-56.6-164.2c27.3-32.4 24.8-61.9 24-72.5-24.1 1.4-52 16.4-67.9 34.9-17.5 19.8-27.8 44.3-25.6 71.9 26.1 2 49.9-11.4 69.5-34.3z"></path></svg> ⇧⌘I). You can now repeatedly press the button to step though the code. 

In the **Locals** window you can see the values of the variables as you run you code. 
<!-- In the **Immediate** window you can add output using the [`Debug.Print`](https://www.automateexcel.com/vba/debug-print-immediate-window/) and test code.   -->

Finally, if you want to run the program until a specific line or code then insert a break-point by clicking the margin of that line in the VBA editor. Next, run you sub and the debugger will stop at that line. 

For more details you may have a look at Chapter 9 in @vba-book or the videos [Debug toolbar](https://youtu.be/AONXBZdx20Y), [Locals window](https://youtu.be/BC8py7Ce2rg) and [Breakpoints](https://youtu.be/k_1zrFdlZCU).																

## Error handling

See https://excelmacromastery.com/vba-error-handling/


## Course procedures {#vba-course-procedures}

The course have a set of *course procedures* that you may use 'as is' during the course and at the exam without any warranty. I will explicitly state if you are not allowed to use them. An overview is given in Table \@ref(tab:course-proc). All procedures within a topic start with the same suffix so you easy can find them using auto complete in the VBA editor (Ctrl + Space). On a mac you may have to disable the default shortcut (Ctrl + Space) for switching input sources. You can go to the *System Preferences -> Keyboard -> Shortcuts -> Input Sources* and disable it. For instance all procedures related to arrays start with suffix `Ary`. Similar the procedures are stored in module `ModAry`. The modules are stored in the template files for each teaching module (if used) and all course procedures can be found in as [text files](https://github.com/bss-osca/tfa/tree/master/vba/bas). If you want to use a procedure copy/import the whole module containing the procedure to the Excel file.

<table class="table table-striped table-hover table-condensed table-responsive" style="margin-left: auto; margin-right: auto;">
<caption>(\#tab:course-proc)Course procedures. See the modules named ModRng, ModAry, ModWst, ModCol, and ModTm for further info.</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> procedure </th>
   <th style="text-align:left;"> type </th>
   <th style="text-align:left;"> desc </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> AryDim </td>
   <td style="text-align:left;"> function </td>
   <td style="text-align:left;"> Array dimension </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AryEmpty </td>
   <td style="text-align:left;"> function </td>
   <td style="text-align:left;"> Check if an array empty </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AryFromCSV </td>
   <td style="text-align:left;"> sub </td>
   <td style="text-align:left;"> Read a csv file to and array </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AryPaste </td>
   <td style="text-align:left;"> sub </td>
   <td style="text-align:left;"> Paste a 1D or 2D array to a sheet </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AryQuickSort </td>
   <td style="text-align:left;"> sub </td>
   <td style="text-align:left;"> Sort a 2-Dimensional array using a quicksort algorithm </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AryRead </td>
   <td style="text-align:left;"> sub </td>
   <td style="text-align:left;"> Read a range into a 2D array </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AryReadLong </td>
   <td style="text-align:left;"> sub </td>
   <td style="text-align:left;"> Read a range (long format) into an array (up to a 5D array is supported) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AryToSeq </td>
   <td style="text-align:left;"> sub </td>
   <td style="text-align:left;"> Set all array elements to a sequence </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AryToStr </td>
   <td style="text-align:left;"> function </td>
   <td style="text-align:left;"> Convert an array to a string </td>
  </tr>
  <tr>
   <td style="text-align:left;"> AryToVal </td>
   <td style="text-align:left;"> sub </td>
   <td style="text-align:left;"> Set all array elements to a specific value </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Col2Str </td>
   <td style="text-align:left;"> function </td>
   <td style="text-align:left;"> Convert a collection to a string </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ColCopy </td>
   <td style="text-align:left;"> function </td>
   <td style="text-align:left;"> Copy a collection </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RngClear </td>
   <td style="text-align:left;"> sub </td>
   <td style="text-align:left;"> Clear a range </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RngCurRegion </td>
   <td style="text-align:left;"> function </td>
   <td style="text-align:left;"> Return the current region of a range </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RngFormat </td>
   <td style="text-align:left;"> sub </td>
   <td style="text-align:left;"> Format a range </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RngFromCSV </td>
   <td style="text-align:left;"> function </td>
   <td style="text-align:left;"> Read a csv file and output it to cells </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RngGetAddress </td>
   <td style="text-align:left;"> function </td>
   <td style="text-align:left;"> Return the address of a range. </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RngGetColLetter </td>
   <td style="text-align:left;"> function </td>
   <td style="text-align:left;"> Convert column number to letter </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RngGetCols </td>
   <td style="text-align:left;"> function </td>
   <td style="text-align:left;"> Columns in range </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RngGetCurRegionAddress </td>
   <td style="text-align:left;"> function </td>
   <td style="text-align:left;"> Return the address of the current region of a range </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RngGetCurRegionCols </td>
   <td style="text-align:left;"> function </td>
   <td style="text-align:left;"> Columns in current region </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RngGetCurRegionFirstCol </td>
   <td style="text-align:left;"> function </td>
   <td style="text-align:left;"> First column in current region </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RngGetCurRegionFirstRow </td>
   <td style="text-align:left;"> function </td>
   <td style="text-align:left;"> First row in current region </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RngGetCurRegionLastCol </td>
   <td style="text-align:left;"> function </td>
   <td style="text-align:left;"> Last column in current region </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RngGetCurRegionLastRow </td>
   <td style="text-align:left;"> function </td>
   <td style="text-align:left;"> Last row in current region </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RngGetCurRegionLowerLeft </td>
   <td style="text-align:left;"> function </td>
   <td style="text-align:left;"> Return the lower left cell of the current region </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RngGetCurRegionLowerRight </td>
   <td style="text-align:left;"> function </td>
   <td style="text-align:left;"> Return the lower right cell of the current region </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RngGetCurRegionRange </td>
   <td style="text-align:left;"> function </td>
   <td style="text-align:left;"> Return the part of the current region starting with upper right cell in row and col </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RngGetCurRegionRows </td>
   <td style="text-align:left;"> function </td>
   <td style="text-align:left;"> Rows in current region </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RngGetCurRegionUpperLeft </td>
   <td style="text-align:left;"> function </td>
   <td style="text-align:left;"> Return the upper left cell of the current region </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RngGetCurRegionUpperRight </td>
   <td style="text-align:left;"> function </td>
   <td style="text-align:left;"> Return the upper right cell of the current region </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RngGetFirstCol </td>
   <td style="text-align:left;"> function </td>
   <td style="text-align:left;"> First column in range </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RngGetFirstRow </td>
   <td style="text-align:left;"> function </td>
   <td style="text-align:left;"> First row in range </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RngGetLastCol </td>
   <td style="text-align:left;"> function </td>
   <td style="text-align:left;"> Last column in range </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RngGetLastRow </td>
   <td style="text-align:left;"> function </td>
   <td style="text-align:left;"> Last row in range </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RngGetLowerLeft </td>
   <td style="text-align:left;"> function </td>
   <td style="text-align:left;"> Return the lower left cell of the range </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RngGetLowerRight </td>
   <td style="text-align:left;"> function </td>
   <td style="text-align:left;"> Return the lower right cell of the range </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RngGetRange </td>
   <td style="text-align:left;"> function </td>
   <td style="text-align:left;"> Return the part of the range starting with upper right cell in row and col </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RngGetRows </td>
   <td style="text-align:left;"> function </td>
   <td style="text-align:left;"> Rows in range </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RngGetUpperLeft </td>
   <td style="text-align:left;"> function </td>
   <td style="text-align:left;"> Return the upper left cell of the range </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RngGetUpperRight </td>
   <td style="text-align:left;"> function </td>
   <td style="text-align:left;"> Return the upper right cell of the range </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RngJoin </td>
   <td style="text-align:left;"> function </td>
   <td style="text-align:left;"> Join two ranges </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RngPaste </td>
   <td style="text-align:left;"> function </td>
   <td style="text-align:left;"> Paste a range on a sheet. </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RngRemoveInterior </td>
   <td style="text-align:left;"> sub </td>
   <td style="text-align:left;"> Remove fill colors in cell range </td>
  </tr>
  <tr>
   <td style="text-align:left;"> RngToCSV </td>
   <td style="text-align:left;"> sub </td>
   <td style="text-align:left;"> Write a range to a csv file </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TmElapsed </td>
   <td style="text-align:left;"> function </td>
   <td style="text-align:left;"> Time since timer has be started. </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TmEx </td>
   <td style="text-align:left;"> sub </td>
   <td style="text-align:left;"> Example of using the timer procedures </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TmRestoreAfterSpeedOptimize </td>
   <td style="text-align:left;"> sub </td>
   <td style="text-align:left;"> Restore properties for the Application object after have called ApplicationSpeedOptimize </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TmSpeedOptimize </td>
   <td style="text-align:left;"> sub </td>
   <td style="text-align:left;"> Set some properties for the Application object to optimize excecution of vba </td>
  </tr>
  <tr>
   <td style="text-align:left;"> TmStart </td>
   <td style="text-align:left;"> function </td>
   <td style="text-align:left;"> Start timer (unit seconds) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> WstClear </td>
   <td style="text-align:left;"> function </td>
   <td style="text-align:left;"> Clear a worksheet if it exists </td>
  </tr>
  <tr>
   <td style="text-align:left;"> WstCreate </td>
   <td style="text-align:left;"> function </td>
   <td style="text-align:left;"> Create a worksheet </td>
  </tr>
  <tr>
   <td style="text-align:left;"> WstDelete </td>
   <td style="text-align:left;"> function </td>
   <td style="text-align:left;"> Delete a worksheet if it exists </td>
  </tr>
  <tr>
   <td style="text-align:left;"> WstExists </td>
   <td style="text-align:left;"> function </td>
   <td style="text-align:left;"> Check if a worksheet exists </td>
  </tr>
  <tr>
   <td style="text-align:left;"> WstRename </td>
   <td style="text-align:left;"> function </td>
   <td style="text-align:left;"> Rename a worksheet if it exists and no sheet with the new name </td>
  </tr>
</tbody>
</table>








# Learning goals {#lg-course}
							
The purpose of this course is to give students a knowledge about IT tools for Analytics which requires the analyst to be qualified in handling tools beyond e.g. basic Excel. 							
After having participated in the course, the student must, in addition to achieving general academic skills, demonstrate:			
							
Knowledge of	

  1.	how a computer works at a basic level.						
  2.	basic programming such as variables, arrays, loops, functions and procedures. 						
  3.	what an algorithm is. 						
  4.	how to implement an algorithm based on a description. 						
  5.	different programming languages. 						
  6.	how to manage a code in a collaborative working environment.						
							
Skills to 		

  7.	handle data such as import, tidy, transform, visualize and export. 						
  8.	develop well-structured code. 						
  9.	perform testing and debugging. 						
  10.	implement/code selected algorithms. 						
  11.	apply analytical techniques on data.						
  12.	apply relevant methods, algorithms and techniques from this course in order to solve a specific problem.						
							
Competences to		

  13.	independently handle data given a problem. 						
  14.	independently analyze data given a relevant research question.						
  15.	compare different programming languages.						
  16.	compare different algorithms solving a problem and discuss their advantages and disadvantages.
  17.	interpret and discuss results based on a data analysis in relation to the relevant academic literature.						
  18.	communicate results from applied research in a scientific way, e.g. using literate programming.						


<!-- # Schedule {}  -->

<!-- The schedule for the course is given below. -->

<!-- ```{r, echo=FALSE, message=FALSE, cache=FALSE, eval=FALSE} -->
<!-- source("common.R") -->
<!-- library(googlesheets4) -->
<!-- sheets_deauth() -->
<!-- sheet <- read_sheet("https://docs.google.com/spreadsheets/d/1-fSG3KWip0Vm5Uwf9T6vUMuH0ReBhpITHT3rl896vwc/edit?usp=sharing", -->
<!--            sheet = "Schedule") -->
<!-- knitr::kable(sheet) -->
<!-- ``` -->

<!-- <p><iframe width="1300" height="600" frameborder="0" src="https://docs.google.com/spreadsheets/d/e/2PACX-1vRka2NKE77BvtIoJc1GW-Dr_oABzQdQhMC94KpPjW7DpSTnepN9RV3m6w1ILKe3YoQwUj0C6JAe3K1T/pubhtml?gid=1591856300&amp;single=true&amp;widget=true&amp;headers=false"></iframe></p> -->


# Business Analytics {#ba}

Business Analytics (BA) refers to the scientific process of transforming data into insight for making better decisions in business. BA can both be seen as the complete decision making process for solving a business problem or as a set of methodologies that enable the creation of business value. As a process it can be characterized by descriptive, predictive, and prescriptive model building using "big" data sources.

Descriptive Analytics: A set of technologies and processes that use data to understand and analyze business performance. Descriptive analytics are the most commonly used and most well understood type of analytics. Descriptive analytics categorizes, characterizes, consolidates, and classifies data. Examples are standard reporting and dashboards (KPIs, what happened or is happening now?) and ad-hoc reporting (how many/often?). Descriptive analytics often serves as a first step in the successful application of predictive or prescriptive analytics.

Predictive Analytics: The use of data and statistical techniques to make predictions about future outputs/outcomes, identify patterns or opportunities for business performance. Examples of techniques are data mining (what data is correlated with other data?), pattern recognition and alerts (when should I take action to correct/adjust a spare part?), Monte-Carlo simulation (what could happen?), neural networks (which customer group are best?) and forecasting (what if these trends continue?).

Prescriptive Analytics: The use of optimization and other decision modelling techniques using the results of descriptive and predictive analytics to suggest decision options with the goal of improving business performance. Prescriptive analytics attempt to quantify the effect of future decisions in order to advise on possible outcomes before the decisions are actually made. Prescriptive analytics predicts not only what will happen, but also why it will happen and provides recommendations regarding actions that will take advantage of the predictions. Prescriptive analytics are relatively complex to administer, and most companies are not yet using it in their daily course of business. However, when implemented correctly, it can have a huge impact on business performance and how businesses make decisions. Examples on prescriptive analytics are optimization in production planning and scheduling, inventory management, the supply chain and transportation planning. 

Companies who use BA focus on fact-based management to drive decision making and treats data and information as a strategic asset that is shared within the company. This enterprise approach generates a companywide respect for applying descriptive, predictive and prescriptive analytics in areas such as supply chain, marketing and human resources. 

Related areas: In the past Business Intelligence traditionally focuses on querying, reporting, online analytical processing, i.e. descriptive analytics. However, a more modern definition of Business Intelligence is the union of descriptive and predictive analytics. Operations Research or Management Science deals with the application of advanced analytical methods to help make better decisions and can hence be seen as prescriptive analytics. However, traditionally it has been taking a more theoretical approach and focusing on problem-driven research while BA takes a more data-driven approach. Logistics is a cross-functional area focusing on the effective and efficient flows of goods and services, and the related flows of information and cash. Supply Chain Management adds a process-oriented and cross-company perspective. Both can be seen as prescriptive analytics with a more problem-driven research focus. Advanced Analytics is often used as a classification of both predictive and prescriptive analytics. Data science is an interdisciplinary field about scientific methods, processes, and systems to extract knowledge or insights from data in various forms, either structured or unstructured and can be seen as Business analytics applied to a wider range of data. 

Resources
http://analytics-magazine.org/the-analytics-journey/ 
https://en.wikipedia.org/wiki/Business_analytics 
http://connect.informs.org/analytics/home 
https://www.or-exchange.org/questions/5645/informs-analytics-definition 
https://en.wikipedia.org/wiki/Prescriptive_analytics
https://en.wikipedia.org/wiki/Predictive_analytics 

<!-- Business Analytics (BA) refers to the scientific process of transforming data into insight for making better decisions in business. BA can both be seen as the complete decision making process for solving a business problem and the creation of business value by integration of concepts, methods and data. As a process, it can be characterized by descriptive, predictive, and prescriptive model building using "big" data sources. For further details, see http://analytics-magazine.org/the-analytics-journey/. -->

<!-- Operations Research and Management Science deal with the application of advanced analytical methods in order to make better decisions. Hence, they are closely related to prescriptive analytics. Companies that use BA focus on fact-based management to drive decision making and treats data and information as a strategic asset that is shared within the company. To a larger extent than before, data may be available for validation purposes. -->


# Colophon {}

These notes were written in [bookdown](http://bookdown.org/) inside [RStudio](http://www.rstudio.com/ide/). 
<!-- The website [stat545.com](https://stat545.com) is hosted with [Netlify](https://www.netlify.com), and automatically updated after every commit by [Travis-CI](https://travis-ci.org). The complete source is available from [GitHub](https://github.com/rstudio-education/stat545). -->

This version of the book was built with:


```
#> Finding R package dependencies ... [11/31] [12/31] [13/31] [14/31] [15/31] [16/31] [17/31] [18/31] [19/31] [20/31] [21/31] [22/31] [23/31] [24/31] [25/31] [26/31] [27/31] [28/31] [29/31] [30/31] [31/31] Done!
#>  setting  value
#>  version  R version 4.2.1 (2022-06-23)
#>  os       macOS Big Sur ... 10.16
#>  system   x86_64, darwin17.0
#>  ui       X11
#>  language (EN)
#>  collate  en_US.UTF-8
#>  ctype    en_US.UTF-8
#>  tz       Europe/Copenhagen
#>  date     2022-08-08
#>  pandoc   2.18 @ /Applications/RStudio.app/Contents/MacOS/quarto/bin/tools/ (via rmarkdown)
```

Along with these packages:


```{=html}
<div id="htmlwidget-6c2f48bcd15d9fd7867f" style="width:100%;height:auto;" class="datatables html-widget"></div>
<script type="application/json" data-for="htmlwidget-6c2f48bcd15d9fd7867f">{"x":{"filter":"top","vertical":false,"filterHTML":"<tr>\n  <td data-type=\"character\" style=\"vertical-align: top;\">\n    <div class=\"form-group has-feedback\" style=\"margin-bottom: auto;\">\n      <input type=\"search\" placeholder=\"All\" class=\"form-control\" style=\"width: 100%;\"/>\n      <span class=\"glyphicon glyphicon-remove-circle form-control-feedback\"><\/span>\n    <\/div>\n  <\/td>\n  <td data-type=\"character\" style=\"vertical-align: top;\">\n    <div class=\"form-group has-feedback\" style=\"margin-bottom: auto;\">\n      <input type=\"search\" placeholder=\"All\" class=\"form-control\" style=\"width: 100%;\"/>\n      <span class=\"glyphicon glyphicon-remove-circle form-control-feedback\"><\/span>\n    <\/div>\n  <\/td>\n  <td data-type=\"character\" style=\"vertical-align: top;\">\n    <div class=\"form-group has-feedback\" style=\"margin-bottom: auto;\">\n      <input type=\"search\" placeholder=\"All\" class=\"form-control\" style=\"width: 100%;\"/>\n      <span class=\"glyphicon glyphicon-remove-circle form-control-feedback\"><\/span>\n    <\/div>\n  <\/td>\n  <td data-type=\"character\" style=\"vertical-align: top;\">\n    <div class=\"form-group has-feedback\" style=\"margin-bottom: auto;\">\n      <input type=\"search\" placeholder=\"All\" class=\"form-control\" style=\"width: 100%;\"/>\n      <span class=\"glyphicon glyphicon-remove-circle form-control-feedback\"><\/span>\n    <\/div>\n  <\/td>\n<\/tr>","data":[["askpass","assertthat","babynames","backports","base64enc","bit","bit64","bitops","blob","bookdown","brew","brio","broom","bslib","bsplus","cachem","callr","cellranger","checkmate","class","cli","clipr","codetools","colorspace","commonmark","conflicted","cpp11","crayon","credentials","crosstalk","curl","data.table","DBI","dbplyr","desc","devtools","DiagrammeR","dials","DiceDesign","diffobj","digest","downlit","downloader","dplyr","dsbox","dslabs","DT","dtplyr","ellipsis","evaluate","fansi","farver","fastmap","fitdistrplus","fivethirtyeight","fontawesome","forcats","foreach","fs","furrr","future","future.apply","gapminder","gargle","generics","gert","ggmap","ggplot2","gh","gitcreds","globals","glue","googledrive","googlesheets4","gower","GPfit","gradethis","gridExtra","gtable","hardhat","haven","here","highr","hms","htmltools","htmlwidgets","httpuv","httr","icons","ids","igraph","infer","influenceR","ini","ipred","isoband","iterators","jpeg","jquerylib","jsonlite","kableExtra","KernSmooth","knitr","labeling","later","lattice","lava","lazyeval","leaflet","leaflet.minicharts","leaflet.providers","learnr","lhs","lifecycle","listenv","lubridate","magrittr","markdown","MASS","Matrix","memoise","mgcv","mime","miniUI","modeldata","modelr","munsell","nlme","nnet","numDeriv","openssl","openxlsx","palmerpenguins","parallelly","parsnip","patchwork","pillar","pkgbuild","pkgconfig","pkgdown","pkgload","plyr","png","praise","prettyunits","processx","prodlim","profvis","progress","progressr","promises","ps","purrr","R6","ragg","rappdirs","raster","rcmdcheck","RColorBrewer","Rcpp","readr","readxl","recipes","rematch","rematch2","remotes","renv","repr","reprex","RgoogleMaps","rjson","rlang","rmarkdown","robotstxt","roxygen2","rpart","rprojroot","rsample","rstudioapi","rversions","rvest","sass","scales","selectr","sessioninfo","shiny","skimr","slider","sourcetools","sp","spiderbar","SQUAREM","stringi","stringr","survival","svglite","sys","systemfonts","terra","testthat","textshaping","tfa","tibble","tidymodels","tidyr","tidyselect","tidyverse","timeDate","tinytex","tune","tzdb","urlchecker","usethis","utf8","uuid","vctrs","viridis","viridisLite","visNetwork","vroom","waldo","warp","webshot","whisker","withr","workflows","workflowsets","xfun","xml2","xopen","xtable","yaml","yardstick","zip"],[null,"0.2.1",null,"1.4.1",null,"4.0.4","4.0.5",null,null,"0.27",null,null,"1.0.0","0.4.0","0.1.3","1.0.6","3.7.1","1.1.0",null,null,"3.3.0",null,null,"2.0-3",null,"1.1.0",null,"1.5.1",null,null,null,null,"1.1.3","2.2.1",null,"2.4.4","1.0.9",null,null,null,"0.6.29",null,null,"1.0.9",null,null,null,null,"0.3.2","0.15","1.0.3",null,"1.1.0",null,null,null,"0.5.1",null,"1.5.2",null,null,null,null,"1.2.0","0.1.3",null,null,"3.3.6",null,null,null,"1.6.2","2.0.0","1.0.0",null,null,null,null,"0.3.0",null,"2.5.0","1.0.1","0.9","1.1.1","0.5.3","1.5.4","1.6.5","1.4.3","0.2.0",null,"1.3.4",null,null,null,null,null,null,null,"0.1.4","1.8.0","1.3.4",null,"1.39",null,"1.3.0",null,null,null,null,null,null,null,null,"1.0.1",null,"1.8.0","2.0.3",null,null,null,"2.0.1",null,"0.12","0.1.1.1",null,"0.1.8","0.5.0",null,null,null,null,null,null,null,null,null,"1.8.0","1.3.1","2.0.3",null,"1.3.0",null,null,null,"1.1.1","3.7.0",null,"0.3.7",null,null,"1.2.0.1","1.7.1","0.3.4","2.5.1",null,"0.3.3",null,null,"1.1-3","1.0.9","2.1.2","1.4.0",null,null,null,"2.4.2","0.15.5",null,"2.0.1",null,null,"1.0.4","2.14",null,null,null,"2.0.3",null,"0.13",null,"1.0.2","0.4.2","1.2.0",null,"1.2.2","1.7.2",null,null,null,null,null,null,"1.7.8","1.4.0",null,"2.1.0",null,"1.0.4",null,null,null,null,"3.1.8",null,"1.2.0","1.1.2","1.3.2",null,null,null,"0.3.0","1.0.1","2.1.6","1.2.2",null,"0.4.1",null,"0.4.0","2.1.0","1.5.7",null,null,"0.5.3",null,"2.5.0",null,null,"0.31","1.3.3",null,"1.8-4","2.3.5",null,null],["2019-01-13","2019-03-21","2021-04-12","2021-12-13","2015-07-28","2020-08-04","2020-08-30","2021-04-24","2022-04-10","2022-06-14","2022-02-04","2021-11-30","2022-07-01","2022-07-16","2021-10-05","2021-08-19","2022-07-13","2016-07-27","2022-04-21","2022-01-16","2022-04-25","2022-02-22","2020-11-04","2022-02-21","2022-03-09","2021-11-26","2021-11-30","2022-03-26","2021-11-29","2021-11-04","2021-06-23","2021-09-27","2022-06-18","2022-06-27","2022-03-06","2022-07-20","2022-03-05","2022-06-14","2021-02-13","2021-10-05","2021-12-01","2022-07-05","2015-07-09","2022-04-28","2022-07-04","2021-04-30","2022-05-10","2022-01-19","2021-04-29","2022-02-18","2022-03-24","2022-07-06","2021-01-25","2022-03-10","2021-10-07","2022-07-20","2021-01-27","2022-02-02","2021-12-08","2022-05-04","2022-07-22","2022-04-25","2017-10-31","2021-07-02","2022-07-05","2022-08-07","2019-02-05","2022-05-03","2021-04-30","2020-12-04","2022-08-05","2022-02-24","2021-07-08","2021-07-21","2022-02-03","2019-02-08","2022-07-22","2017-09-09","2019-03-25","2022-06-30","2022-04-15","2020-12-13","2021-04-16","2021-09-26","2022-07-18","2021-09-08","2022-01-05","2022-05-04","2022-07-04","2017-05-31","2022-07-19","2022-06-10","2021-09-25","2018-05-20","2022-06-02","2021-07-13","2022-02-05","2021-07-24","2021-04-26","2022-02-22","2021-02-20","2021-05-03","2022-04-26","2020-10-20","2021-08-18","2021-09-22","2021-09-02","2019-03-15","2022-03-23","2021-05-11","2019-11-09","2022-07-22","2022-03-22","2021-09-24","2019-12-05","2021-10-07","2022-03-30","2019-08-07","2022-08-03","2022-03-23","2021-11-26","2022-03-29","2021-09-28","2018-05-18","2022-07-01","2020-05-19","2018-06-12","2022-06-15","2022-01-16","2019-06-06","2022-05-24","2021-12-14","2020-07-23","2022-07-21","2022-06-16","2020-12-17","2022-07-18","2021-12-20","2019-09-22","2022-07-16","2022-06-27","2022-03-24","2013-12-03","2015-08-11","2020-01-24","2022-07-07","2019-11-17","2020-11-02","2019-05-16","2022-06-03","2021-02-11","2022-06-18","2020-04-17","2021-08-19","2022-02-21","2021-01-31","2022-06-27","2021-09-27","2022-04-03","2022-07-08","2022-01-30","2022-03-28","2022-07-07","2016-04-21","2020-05-01","2021-11-30","2022-05-26","2022-01-04","2021-08-05","2020-02-12","2022-01-09","2022-07-12","2022-04-25","2020-09-03","2022-07-18","2022-01-24","2022-04-02","2022-08-08","2020-11-12","2021-05-31","2021-10-16","2022-07-16","2022-04-13","2019-11-20","2021-12-06","2022-07-19","2022-04-15","2021-07-01","2018-04-25","2022-06-05","2021-05-16","2021-01-13","2022-07-11","2019-02-10","2022-03-03","2022-02-03","2020-07-23","2022-02-11","2022-08-07","2022-04-26","2021-10-13",null,"2022-07-22","2022-07-13","2022-02-01","2022-02-21","2022-07-18","2022-07-19","2022-06-15","2022-07-07","2022-03-28","2021-11-30","2022-05-25","2021-07-24","2022-04-19","2022-04-13","2021-10-13","2021-04-13","2021-09-29","2021-11-30","2022-03-16","2020-10-21","2022-04-14","2019-08-28","2022-03-03","2022-07-05","2022-07-12","2022-05-10","2021-11-30","2018-09-17","2019-04-21","2022-02-21","2022-06-06","2021-05-31"],["CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.1)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.1)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.1)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","Github (rstudio-education/dsbox@ff0c198cc005dd0ef7bf60daec142c8c583e756a)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.1)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.1)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","Github (rstudio/gradethis@b42f81d027b8074d8e2924e70ddb7376efc19144)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","Github (mitchelloharawild/icons@6e4dc378ac86c1d4f4ea167f408bed07b3df14fb)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.1)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.1)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","Github (rstudio/learnr@16e856386e78e4a1bcf11627b340e15f323d2e63)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.1)","CRAN (R 4.2.0)","CRAN (R 4.2.1)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.1)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.1)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.1)","CRAN (R 4.2.0)","CRAN (R 4.2.1)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.1)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","https://rspatial.r-universe.dev (R 4.2.1)","CRAN (R 4.2.0)","CRAN (R 4.2.0)",null,"CRAN (R 4.2.1)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)","CRAN (R 4.2.0)"]],"container":"<table class=\"cell-border stripe\">\n  <thead>\n    <tr>\n      <th>package<\/th>\n      <th>loadedversion<\/th>\n      <th>date<\/th>\n      <th>source<\/th>\n    <\/tr>\n  <\/thead>\n<\/table>","options":{"pageLength":234,"autoWidth":true,"bInfo":false,"paging":false,"columnDefs":[],"order":[],"orderClasses":false,"orderCellsTop":true,"lengthMenu":[10,25,50,100,234]}},"evals":[],"jsHooks":[]}</script>
```





[BSS]: https://bss.au.dk/en/

[course-help]: https://github.com/bss-osca/tfa/issues
[cran]: https://cloud.r-project.org
[cheatsheet-readr]: https://rawgit.com/rstudio/cheatsheets/master/data-import.pdf
[course-welcome-to-the-tidyverse]: https://github.com/rstudio-education/welcome-to-the-tidyverse

[DataCamp]: https://www.datacamp.com/
[datacamp-signup]: https://www.datacamp.com/groups/shared_links/cbaee6c73e7d78549a9e32a900793b2d5491ace1824efc1760a6729735948215
[datacamp-r-intro]: https://learn.datacamp.com/courses/free-introduction-to-r
[datacamp-r-rmarkdown]: https://campus.datacamp.com/courses/reporting-with-rmarkdown
[datacamp-r-communicating]: https://learn.datacamp.com/courses/communicating-with-data-in-the-tidyverse
[datacamp-r-communicating-chap3]: https://campus.datacamp.com/courses/communicating-with-data-in-the-tidyverse/introduction-to-rmarkdown
[datacamp-r-communicating-chap4]: https://campus.datacamp.com/courses/communicating-with-data-in-the-tidyverse/customizing-your-rmarkdown-report
[datacamp-r-intermediate]: https://learn.datacamp.com/courses/intermediate-r
[datacamp-r-intermediate-chap1]: https://campus.datacamp.com/courses/intermediate-r/chapter-1-conditionals-and-control-flow
[datacamp-r-intermediate-chap2]: https://campus.datacamp.com/courses/intermediate-r/chapter-2-loops
[datacamp-r-intermediate-chap3]: https://campus.datacamp.com/courses/intermediate-r/chapter-3-functions
[datacamp-r-intermediate-chap4]: https://campus.datacamp.com/courses/intermediate-r/chapter-4-the-apply-family
[datacamp-r-functions]: https://learn.datacamp.com/courses/introduction-to-writing-functions-in-r
[datacamp-r-tidyverse]: https://learn.datacamp.com/courses/introduction-to-the-tidyverse
[datacamp-r-strings]: https://learn.datacamp.com/courses/string-manipulation-with-stringr-in-r
[datacamp-r-dplyr]: https://learn.datacamp.com/courses/data-manipulation-with-dplyr
[datacamp-r-dplyr-bakeoff]: https://learn.datacamp.com/courses/working-with-data-in-the-tidyverse
[datacamp-r-ggplot2-intro]: https://learn.datacamp.com/courses/introduction-to-data-visualization-with-ggplot2
[datacamp-r-ggplot2-intermediate]: https://learn.datacamp.com/courses/intermediate-data-visualization-with-ggplot2
[dplyr-cran]: https://CRAN.R-project.org/package=dplyr
[debug-in-r]: https://rstats.wtf/debugging-r-code.html

[excel-vs-r]: https://www.jessesadler.com/post/excel-vs-r/

[google-form]: https://forms.gle/s39GeDGV9AzAXUo18
[google-grupper]: https://docs.google.com/spreadsheets/d/1DHxthd5AQywAU4Crb3hM9rnog2GqGQYZ2o175SQgn_0/edit?usp=sharing
[GitHub]: https://github.com/
[git-install]: https://git-scm.com/downloads
[github-actions]: https://github.com/features/actions
[github-pages]: https://pages.github.com/

[happy-git]: https://happygitwithr.com
[hg-install-git]: https://happygitwithr.com/install-git.html
[hg-why]: https://happygitwithr.com/big-picture.html#big-picture
[hg-github-reg]: https://happygitwithr.com/github-acct.html#github-acct
[hg-git-install]: https://happygitwithr.com/install-git.html#install-git
[hg-exist-github-first]: https://happygitwithr.com/existing-github-first.html
[hg-exist-github-last]: https://happygitwithr.com/existing-github-last.html
[hg-credential-helper]: https://happygitwithr.com/credential-caching.html
[hypothes.is]: https://web.hypothes.is/

[osca-programme]: https://kandidat.au.dk/en/operationsandsupplychainanalytics/

[Peergrade]: https://peergrade.io
[peergrade-signup]: https://app.peergrade.io/join
[point-and-click]: https://en.wikipedia.org/wiki/Point_and_click
[pkg-bookdown]: https://bookdown.org/yihui/bookdown/
[pkg-openxlsx]: https://ycphs.github.io/openxlsx/index.html
[pkg-ropensci-writexl]: https://docs.ropensci.org/writexl/
[pkg-jsonlite]: https://cran.r-project.org/web/packages/jsonlite/index.html

[R]: https://www.r-project.org
[RStudio]: https://rstudio.com
[rstudio-cloud]: https://rstudio.cloud/spaces/176810/join?access_code=LSGnG2EXTuzSyeYaNXJE77vP33DZUoeMbC0xhfCz
[r-cloud-mod12]: https://rstudio.cloud/spaces/176810/project/2963819
[r-cloud-mod13]: https://rstudio.cloud/spaces/176810/project/3020139
[r-cloud-mod14]: https://rstudio.cloud/spaces/176810/project/3020322
[r-cloud-mod15]: https://rstudio.cloud/spaces/176810/project/3020509
[r-cloud-mod16]: https://rstudio.cloud/spaces/176810/project/3026754
[r-cloud-mod17]: https://rstudio.cloud/spaces/176810/project/3034015
[r-cloud-mod18]: https://rstudio.cloud/spaces/176810/project/3130795
[r-cloud-mod19]: https://rstudio.cloud/spaces/176810/project/3266132
[rstudio-download]: https://rstudio.com/products/rstudio/download/#download
[rstudio-customizing]: https://support.rstudio.com/hc/en-us/articles/200549016-Customizing-RStudio
[rstudio-key-shortcuts]: https://support.rstudio.com/hc/en-us/articles/200711853-Keyboard-Shortcuts
[rstudio-workbench]: https://www.rstudio.com/wp-content/uploads/2014/04/rstudio-workbench.png
[r-markdown]: https://rmarkdown.rstudio.com/
[ropensci-writexl]: https://docs.ropensci.org/writexl/
[r4ds-pipes]: https://r4ds.had.co.nz/pipes.html
[r4ds-factors]: https://r4ds.had.co.nz/factors.html
[r4ds-strings]: https://r4ds.had.co.nz/strings.html
[r4ds-iteration]: https://r4ds.had.co.nz/iteration.html

[stat-545]: https://stat545.com
[stat-545-functions-part1]: https://stat545.com/functions-part1.html
[stat-545-functions-part2]: https://stat545.com/functions-part2.html
[stat-545-functions-part3]: https://stat545.com/functions-part3.html
[slides-welcome]: https://bss-osca.github.io/tfa/slides/00-tfa_welcome.html
[slides-m1-3]: https://bss-osca.github.io/tfa/slides/01-welcome_r_part.html
[slides-m4-5]: https://bss-osca.github.io/tfa/slides/02-programming.html
[slides-m6-8]: https://bss-osca.github.io/tfa/slides/03-transform.html
[slides-m9]: https://bss-osca.github.io/tfa/slides/04-plot.html
[slides-m83]: https://bss-osca.github.io/tfa/slides/05-joins.html

[tidyverse-main-page]: https://www.tidyverse.org
[tidyverse-packages]: https://www.tidyverse.org/packages/
[tidyverse-core]: https://www.tidyverse.org/packages/#core-tidyverse
[tidyverse-ggplot2]: https://ggplot2.tidyverse.org/
[tidyverse-dplyr]: https://dplyr.tidyverse.org/
[tidyverse-tidyr]: https://tidyr.tidyverse.org/
[tidyverse-readr]: https://readr.tidyverse.org/
[tidyverse-purrr]: https://purrr.tidyverse.org/
[tidyverse-tibble]: https://tibble.tidyverse.org/
[tidyverse-stringr]: https://stringr.tidyverse.org/
[tidyverse-forcats]: https://forcats.tidyverse.org/
[tidyverse-readxl]: https://readxl.tidyverse.org
[tidyverse-googlesheets4]: https://googlesheets4.tidyverse.org/index.html
[tutorial-markdown]: https://commonmark.org/help/tutorial/

[Udemy]: https://www.udemy.com/

[vba-yt-course1]: https://www.youtube.com/playlist?list=PLpOAvcoMay5S_hb2D7iKznLqJ8QG_pde0
[vba-course1-hello]: https://youtu.be/f42OniDWaIo

[vba-yt-course2]: https://www.youtube.com/playlist?list=PL3A6U40JUYCi4njVx59-vaUxYkG0yRO4m
[vba-course2-devel-tab]: https://youtu.be/awEOUaw9q58
[vba-course2-devel-editor]: https://youtu.be/awEOUaw9q58
[vba-course2-devel-project]: https://youtu.be/fp6PTbU7bXo
[vba-course2-devel-properties]: https://youtu.be/ks2QYKAd9Xw
[vba-course2-devel-hello]: https://youtu.be/EQ6tDWBc8G4

[video-install]: https://vimeo.com/415501284
[video-rstudio-intro]: https://vimeo.com/416391353
[video-packages]: https://vimeo.com/416743698
[video-projects]: https://vimeo.com/319318233
[video-r-intro-p1]: https://www.youtube.com/watch?v=vGY5i_J2c-c
[video-r-intro-p2]: https://www.youtube.com/watch?v=w8_XdYI3reU
[video-r-intro-p3]: https://www.youtube.com/watch?v=NuY6jY4qE7I
[video-subsetting]: https://www.youtube.com/watch?v=hWbgqzsQJF0&list=PLjTlxb-wKvXPqyY3FZDO8GqIaWuEDy-Od&index=10&t=0s
[video-datatypes]: https://www.youtube.com/watch?v=5AQM-yUX9zg&list=PLjTlxb-wKvXPqyY3FZDO8GqIaWuEDy-Od&index=10
[video-control-structures]: https://www.youtube.com/watch?v=s_h9ruNwI_0
[video-conditional-loops]: https://www.youtube.com/watch?v=2evtsnPaoDg
[video-functions]: https://www.youtube.com/watch?v=ffPeac3BigM
[video-tibble-vs-df]: https://www.youtube.com/watch?v=EBk6PnvE1R4
[video-dplyr]: https://www.youtube.com/watch?v=aywFompr1F4

[wiki-snake-case]: https://en.wikipedia.org/wiki/Snake_case
[wiki-camel-case]: https://en.wikipedia.org/wiki/Camel_case
[wiki-interpreted]: https://en.wikipedia.org/wiki/Interpreted_language
[wiki-literate-programming]: https://en.wikipedia.org/wiki/Literate_programming
[wiki-csv]: https://en.wikipedia.org/wiki/Comma-separated_values
[wiki-json]: https://en.wikipedia.org/wiki/JSON
