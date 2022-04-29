# Coder Academy Stadium!
## Ruby Terminal Application

By Masood Alam Syed
Link to the repository: https://github.com/masoodsyedd/terminal-application.git 


## About the Application

This app is created for a Basketball Court Booking System for the Coder Academy Stadium. The aim of this app is to allow booking of courts to be digitalised and easy to book. Once the applciation has started, the user is to enter their name for the booking. After completing this a menu appears where users can make new bookings, view existing bookings, view room types etc. Now from these room types, the user is shown the days the court is available and from these available days the user can then choose which days they would like to book it for. The booking is then formed and shown to the customer, from which the user can press any key to return to the main menu.

I created this app because from personal experience, it can be difficult to book for courts since most of the times the process needs to occur through a phone call. And it is hard to visualise which days the courts will be free. So this is a very easy and effective way of making it easier to book sports courts for you and your friends. The main audience of this application would be any regular person that participates in sports activities. Or has weekly sports events organised between them and their friends.

### Functionality 

At the commencement of this application, the user is greeted and prompted to enter their name. Following this they can select numerous booking options such as making a new booking, viewing an existing booking and so on.  

### Code Structure

 - **main.rb** is the main document in control of the flow of the program
 - **classes/stadium.rb** maintains the court class
 - **classes/court.rb holds** the court super class in addition to its subclasses
 - **classes/booking.rb** is used when the user has selected the court 

### Instructions for Installation and Use 
1. You will need Ruby installed on your computer. [Install Ruby here.](https://www.ruby-lang.org/en/)
2. You will also need the Bundler gem installed. It should come with the main ruby installation, however if you do not have it you can install it with the command of: 

> gem install bundler

3. Clone this repository to your local computer
4. To install the gems required, go to /src folder in the repository and use the command: 

> bundle install 
5. Run the app with: 
> ruby main.rb

## Design and Planning 

When first brainstorming ideas, I immediately wanted to make a booking app. And from there I brainstormed ideas which I found to be the most relatable to me. Some of these ideas included booking for restaurants, seats in a stadium and hotel reservations. However, the most relatable and personable to me was booking courts for sports which can sometimes become a mission! Most courts don't have an online booking system but rather a call and book module, so I decided to focus my efforts on this app!

## Gem

I used the gem TTY-Prompt because this makes it so beneficial to cut out user errors. The user cannot enter wrong information and has a list to choose from, thus eliminating the human error factor! 
