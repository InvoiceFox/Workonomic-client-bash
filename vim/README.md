Vim script
==========

The another best programmer's editor meets workonomic.

State
-----

First version. Just the nat-lang wrk (WoRKNomic Message) command (same as in bash). More will come.


How to install
--------------

Copy workonomic.vim to your ~/.vim/plugin/. . If you don't have plugin directory, create it.
    
You already setup your API token if you ran ./install in parent folder. Bash, Emacs and Vim clients use the same setup files.
If you want to set it manually do:

    cat > ~/.config/workonomic/.apitoken
    <<your-api-token->>
    

Dependencies
------------

You need to have curl installed.
    

How to use
----------

When inside your Vim do :WRK and then issue any of nat-lang commands, like:
- show my projects
- create new project abc
- i started working on abc 20 mins ago
- pause
- continue
- note: I fixed the bug
- stopped at 4pm
- ...

Screenshot
----------

soon

