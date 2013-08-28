Emacs plugin
============

The best programmer's editor meets workonomic.

State
-----

First version. Just the nat-lang wrknm (worknomic message) command (same as in bash). More will come.


How to install
--------------

As any other elisp script. This is one example.

    mkdir ~/.elisp
    
    cp workonomic.el ~/.elisp/.
    
    cat >> ~/.emacs
    (add-to-list 'load-path "~/.elisp")
    (require 'workonomic)

How to use
----------

When you restart Emacs, you can do M-x wrknm and then issue any of nat.lang. commands, like:
- show my projects
- create new project abc
- i started working on abc 20 mins ago
- pause
- continue
- note: I fixed the bug
- stopped at 4pm
- ...




    
