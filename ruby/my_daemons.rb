#!/usr/bin/env ruby

require 'rubygems'
require 'daemons'

# Initialise the app
init()

# Become a daemon
Daemons.daemonize

# The Server loop
