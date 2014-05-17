About
=====

Overview
--------

This is a small tool that lets you pull Google App Scripts, work on them on your local machine and push them back up into the cloud. 

Why?
----

I want to develop my code TDD-style and the the feedback-cycle when developing on App Scripts is just unbearable to me. Also, I can use all the tools I want to edit and test!

State of the Project
--------------------

This project is still in the early stages so don't expect it to be totally bug-free or perfectly easy to use. Also, I used this project to teach myself some Ruby so don't expect a clean codebase :)


Installation
============

* Clone the source code
* `rake install`

Usage
=====

The tool is called `drive-sync` and allows you to push and pull from/to google app scripts. Google App Scripts files are placed into your current working directory with the ending `.server_js` and all files with that ending will be treated as files that should be synced. 

* `drive-sync pull` pulls a project from the server. If executed for the first time, it will ask for a project id. The project id is the long combination of letters and digits. It might also ask you to authorize the application in the browser and copy-and paste the authorization-code into the command line. 
* `drive-sync push` pushes the current state to the server. **WARNING**: The state on the server will be overwritten with your local state. If you accidently overwrite a server-state, Googles revision history can help you.

