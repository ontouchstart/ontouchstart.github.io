### A hypothetical story 

An experienced engineer with solid background in mathematics and physics slept through the first 25 years 
of the 21st Century. He knows everything about Unix up to 1999 but nothing after 
[Y2K](https://en.wikipedia.org/wiki/Year_2000_problem). 

Python 2.0 was released on [October 16, 2000](https://en.wikipedia.org/wiki/History_of_Python), so he wouldn't have
much serious experience with it. 

He bought a latest model of 14-in MacBook Pro M5 from the nearest Apple Store and decided to catch up.
What language do you think he should to learn from scratch? 
[Python](https://www.python.org/doc) or [Rust](https://rust-lang.org/learn)?

He also heard about something called AI and decided to learn AI along the way. 

Should he start with Python or Rust? Or both?

- <https://users.rust-lang.org/t/rust-vs-python-which-language-will-win-in-ai-race/124696>
- <https://users.rust-lang.org/t/why-isn-t-rust-more-common-in-ai/132224>

Or he can dive deep himself to see how people are using Python and Rust in real world.

### The real story

I didn't sleep through the first 25 years of the 21st Century. Instead, I tool a detour in the land of [Web Development](https://en.wikipedia.org/wiki/Web_development) and wrote tons of [JavaScript](https://en.wikipedia.org/wiki/JavaScript).

I miss my [UNIX Philosophy](https://en.wikipedia.org/wiki/Unix_philosophy).


So I am going to pick up both Python and Rust in my own way with my favorite [Makefile](https://en.wikipedia.org/wiki/Make_(software)).

Since [ed](https://en.wikipedia.org/wiki/Ed_(text_editor)) is preinstalled 

```
sam@Sams-MacBook-Pro 06 % which ed 
/bin/ed
sam@Sams-MacBook-Pro 06 % man ed 
ED(1)                                             General Commands Manual                                            ED(1)

NAME
     ed, red – text editor

SYNOPSIS
     ed [-] [-s] [-p string] [file]
     red [-] [-s] [-p string] [file]

DESCRIPTION
     The ed utility is a line-oriented text editor.  It is used to create, display, modify and otherwise manipulate text
     files.  When invoked as red, the editor runs in "restricted" mode, in which the only difference is that the editor
     restricts the use of filenames which start with ‘!’ (interpreted as shell commands by ed) or contain a ‘/’.  Note
     that editing outside of the current directory is only prohibited if the user does not have write access to the
     current directory.  If a user has write access to the current directory, then symbolic links can be created in the
     current directory, in which case red will not stop the user from editing the file that the symbolic link points to.

...
```

I might skip [vi](https://en.wikipedia.org/wiki/Vi_(text_editor)) at some point in the future and think in buffers.

Let the fun begin. 

```sh
sam@Sams-MacBook-Pro 06 % ed
a
# This file is created by ed
.
,l
# This file is created by ed$
w ed.md
29
q
sam@Sams-MacBook-Pro 06 % cat ed.md 
# This file is created by ed
sam@Sams-MacBook-Pro 06 % wc ed.md 
       1       7      29 ed.md
```
{{#include ed.md}}
