Emacs plugin
============

The best programmer's editor meets workonomic.

State
-----

First version. Just the nat-lang wrknm (WoRKNomic Message) command (same as in bash). More will come.


How to install
--------------

As any other elisp script. This is one example:

    mkdir ~/.elisp
    
    cp workonomic.el ~/.elisp/.
    
    cat >> ~/.emacs
    (add-to-list 'load-path "~/.elisp")
    (require 'workonomic)
    
You already setup your API token if you ran ./install in parent folder. Bash and Emacs clients use the same setup files.
If you want to set it manually do:

    cat > ~/.config/workonomic/.apitoken
    <<your-api-token->>
    

Dependencies
------------

You need to also have http-post-simple.el (http://www.emacswiki.org/emacs/http-post-simple.el) installed in Emacs.
    

How to use
----------

When you restart Emacs, you can do M-x wrknm and then issue any of nat-lang commands, like:
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

https://fbcdn-sphotos-a-a.akamaihd.net/hphotos-ak-prn1/1148742_408917209214741_1970027525_n.png

