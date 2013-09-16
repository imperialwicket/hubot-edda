hubot-edda
============

[Hubot](http://hubot.github.com/) script for interacting with [Edda](https://github.com/Netflix/edda)

## Goals
* Allow an easy interface for common data requests from Edda.
* Better mobile support via Campfire/Hipchat/XMPP/etc.
* Store field selectors per request for easier field management.


## Requirements

[Edda](https://github.com/Netflix/edda) needs to be running somewhere, and Hubot needs to be able to access it.


## Installation

Hubot-edda will be in npm soon!


## Configuration options

Hubot-edda uses Redis to store information via robot.brain. On initial launch, hubot will try to load your HUBOT_EDDA_URL from the like-named environment variable. If this is empty, Hubot uses 'http://127.0.0.1'.

You can retrieve and update these values with Hubot via:

    edda url http://edda.example.com:8080
    edda url


