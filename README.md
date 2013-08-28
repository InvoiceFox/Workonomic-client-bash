Workonomic-client-bash
======================

A bash client for workonomic (http://workonomic.cc) time-tracker.

State
-----

Work in progress but should be usable. Send any suggestions or questions to support AT workonomic DOT cc.

Command: wrknm
--------------

Workonomic message: command-line utility for tracking time with "natural language". As you can thru XMPP chat bot. 

You don't need gmail/fb account for this client, just your Workonomic API token.

Example:

    wrknm show my projs

    wrknm create project abc

    wrknm started working on abc 20 mins ago
    
    wrknm "note: i've fixed the bug 100"

For more info look at chat examples on: http://workonomic.cc/help-main-en.html

wrknmX - deprecated
-------------------

The same but uses XMPP and needs your gmail username/password setup (.xmppacc, .xmppsetup). It's much slower, because it has to ceate and tear down connection each command is issued. 
It talks directly to Google XMPP server (gtalk/hangouts) and they talk to our bot (like any other chat client does). So gmail username/password are here only to connect you to gmails 
XMPP servers. They never go anywhere near workonomic server.

How to install
--------------

Since these are jus bash scripts you don't have to really install anything. Just get them to your computer and make 
them reachable from where you want them. One way to do this is:

    cd /tmp

    git clone https://github.com/InvoiceFox/Workonomic-client-bash.git

    mv Workonomic-client-bash /opt/workonomic

    cd /opt/workonomic

    #this links the wrknm command to /usr/bin so it's globally accessible, 
    #and creates your ~/.config/workonomic/.apitoken (prepare your API token)

    ./install 

If you don't have Git installed you can download the zip from github, unzip and install the same way.

Where do you get API token
--------------------------

Login to your Workonomic.cc account. Go to "Settings" and enable API access. When you do, the API token is 
shown in bold.

Warning
-------

Ping's won't work here because you aren't connected to workonomic like with a chat client. Pings will become 
multiprotocol so they will eventually work here, thru email or some other live update protocol appropriate for the 
command-line.


Plans
-----

- Make classic commands that don't use natural lang, but more strict command specific arguments and return data 
in selected data format. This will be better for scripting and automation.

- Make the tools that make api-token encrypted with a password you choose. It get's decrypted with a password 
when you use it but is not accessible when not in use

- We will enable multiple API tokens, with different access schemas. OAuth2 is in plans also.
