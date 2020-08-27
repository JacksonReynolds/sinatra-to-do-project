# Sinatra To-Do List Manager Project

## Overview

This To-Do List manager is a web app run on the Sinatra framework where a user can sign-up with a password protected username and manage their own set of to-do lists. It is a locally hosted app, so the user will need to use shotgun (included in gemfile) or rackup in order to access the app from their browser. In the app, a user can create, edit, read and delete their to-do lists as well as the individual to-do items themselves. 

## Prerequisites

Make sure you have installed bundler. You can check using your terminal to navigate to your root directory and running `gem install bundler`

## Install

Once you have cloned the repository, navigate the terminal into the sinatra-to-do-project directory. Run `bundler install` to download the necessary gems for the application.

After that, try running `rake db:migrate` in your terminal to make sure the database is set up. If nothing happens or the migrations are run, great! You should be good to go.
 
## Running Sinatra To-Do List Manager

Run `shotgun` from your terminal and navigate to `localhost:9393` in your browser of choice. You will need to set up a username and password for yourself in order to be able ot create to-do lists.

## Contributors Guide

Refer to CONTRIBUTING.md in the parent directory for this application for guidelines on contributing.

## Authors

Jackson Reynolds - [GitHub](https://github.com/JacksonReynolds)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details