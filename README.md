Workonomic-client-bash
======================

A bash client for workonomic (http://workonomic.cc) time-tracker.

State
-----

Work in progress. Send any suggestions or questions to support AT workonomic DOT cc.

wrknm
-----

Workonomic message: commandline utility for tracking time with "natural language" as you can thru XMPP chat bot. 

You don't need gmail/fb account for this client, just a Workonomic API token.

Example:

    wrknm show my projs

    wrknm create project abc

    wrknm started working on abc 20 mins ago

For more examples look at: http://workonomic.cc/help-main-en.html

wrknmx - deprecated
-------------------

The same but uses XMPP and needs your gmail username password setup (.xmppacc, .xmppsetup) so it's much slower, because it has to ceate connection and tear it down each command. It talks directly to google XMPP server (gtalk/hangouts) and they talk to our bot (like any other chat client does), so gmail username/password are here only to connect to gmails XMPP servers and don't ever go to workonomic server.

How to install
--------------

Since these are just simple bash scripts you don't have to really install anything. Just get them to your computer and make them reachable when you want them. One way to do this is:

    cd /tmp

    git clone https://github.com/InvoiceFox/Workonomic-client-bash.git

    mv Workonomic-client-bash /opt/workonomic

    cd /opt/workonomic

    cat > .apitoken
    <<<your-workonomic-api-token>>>

    ./install #this links the wrknm command to /usr/bin so it's globally accessible, nothing special and you can make it accessible in some other way

If you don't have Git installed you can download the zip from github, unzip, move to /opn/workonomic and install.

Where do you get API token
--------------------------

Login to your Workonomic.cc account. Go to "Setting" and enable API access. When you do the API token is shown in bold. Copy it to .apitoken

Warning
-------

Ping's won't work here because you aren't connected to workonomic like with a chat client. We plan for pings to be multiprotocol so they will also work here, thru email or some other live update protocol appropriate for the commandline.


Plans
-----

- Make commands that don't use natural lang, but more strict command specific arguments and return data in selected data format. This will be better for scripting and automation.

- Make the tools that make api-token encrypted with a password you choose. It get's decrypted with a password when you use it but is not accessible when not in use

- We will enable multiple API tokens, with different access schemas. OAuth2 is in plans also.