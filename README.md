# Maroon Health Site README

## Introduction
This is the Maroon Health Site, which is a website made for the Maroon Health organization. It has an inventory tracking system for medication, a shift system so volunteers can sign up for events, and mass e-mailing so the members of Maroon Health can send out emails.

## Requirements

This code has been run and tested on:

- Ruby - 3.1.2
- Rails - 6.1.4.1
- Ruby Gems - Listed in `Gemfile`
- PostgreSQL - 13.3
- Docker (Latest Container)


## External Deps

- Docker - Download latest version at https://www.docker.com/products/docker-desktop
- Heroku CLI - Download latest version at https://devcenter.heroku.com/articles/heroku-cli
- Git - Downloat latest version at https://git-scm.com/book/en/v2/Getting-Started-Installing-Git
- GitHub Desktop (Not needed, but HELPFUL) at https://desktop.github.com/

## Installation

Download this code repository by using git:

`git clone https://github.com/CSCE431-Software-Engineering/maroon_health_site.git`
 or 
 `git clone https://github.com/CSCE431-Software-Engineering/maroon_health_site/`

## Tests

An RSpec test suite is available and can be ran using:

`rspec spec/`

You can run all the test cases by running the following. This will run both the unit and integration tests.
`rspec .`

We have set up automatic testing for every commit here in GitHub: https://github.com/CSCE431-Software-Engineering/maroon_health_site/actions

## Execute Code

Run the following code in Powershell if using windows or the terminal using Linux/Mac

`cd maroon_health_site`

`docker run --rm -it --volume "$(pwd):/rails_app" -e DATABASE_USER=test_app -e DATABASE_PASSWORD=test_password -p 3000:3000 [docker image]`


Install the app

`bundle install && rails webpacker:install && rails db:create && db:migrate`


Run the app
`rails server --binding:0.0.0.0`


The application can be seen using a browser and navigating to http://localhost:3000/


## Environmental Variables/Files
We have environment variables setup for Google oAuth Authentication and for database credentials.

## CI/CD
CI/CD has been implemented in the repo here -> https://github.com/CSCE431-Software-Engineering/maroon_health_site/deployments

## Support
We will be developing this app until the end of the Spring 2024 semester. After this point, we will no longer be supporting the project.