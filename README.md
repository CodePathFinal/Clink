Original App Design Project - README Template
===

# Clink

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema)

## Overview
### Description
This app offers a way for people to create large bulk orders of drinks at bars and have an easy way to present those orders to the bartender. Users 'clink' their accounts together with one user being the host. Once the host collects the order of the group they are with then they present the order to the bartender making it easy to remember/show the bartender. Also, when two users clink their apps together, they share a little pop up with their social media links and profiles on it.

### App Evaluation
[Evaluation of your app across the following attributes]
- **Category:**
- **Mobile:**
- **Story:**
- **Market:**
- **Habit:**
- **Scope:**

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

- [x] User can create an account if they do not have one
- [x] User can log in if they already have an account 
- [ ] User can select if they wish to act as the host of, or join a clink group
- [x] Include a settings screen where the user can enter links of social medias they want to share
- [ ] when a user clinks with another user, regarless of host/join status, a screen will pop up on their respective phones sharing the links of the other persons social medias
- [ ] after dismissing the social media screen the joined user can order a drink
- [ ] host can see drinks on the order



**Optional Nice-to-have Stories**


* when the order is ready the host can click a button to generate a way to share the order with the bar
* after the order submits all users pay for their respective drinks
* after submitting the ordered drink to the group the host can see the running total


### 2. Screen Archetypes

* [Login screen]
   * User creates a login or logs into their account.
   * On this screen the user has the option to log into their profile
   * or create a new profile
* [Home Screen]
   * User has a home screen with a list of menu items
   * The user may select to review social media profiles
   * or user may select the clink option
* [Social Media Linking screen]
   * Allows user to link their social media profile.
   * User will be able to link a Facebook, Instagram or 
   * Twitter profile.
* [Clink screen]
   * User will have option to group an entire party's order
   * as the host. 
   * They will also have another option to select guest.
   * This is option will add their drink order
   * to the person that is the host.

### 3. Navigation

**Tab Navigation** (Tab to Screen)

* [Login/Signup]
* [Home Screen with nav controller]
* [Shareable Social Media Links]

**Flow Navigation** (Screen to Screen)

* [Login/SignUp]
   * [If user does not have an account then create account screen will pop up.]
   * [If user already has an account they will be directed to the home screen]
* [Home screen with navigation controller]
   * [Social media screen that has links to the users social media profiles they wish to share]
   * [Clink Host or clink option]
   * [Clink host will allow you to collect all other's in your party drink order]
   * [Clink will allow you to share your drink order with the host]

## Wireframes
<img src="https://i.imgur.com/tOAYgDv.jpg" width=800><br>


### [BONUS] Digital Wireframes & Mockups
![](https://i.imgur.com/xhPBhH2.png)
https://www.fluidui.com/editor/live/preview/cF9LeHZWcmtWdVdndTJ3Slc5V3Y3REhsaUlvZDlvRlJyMA==

### [BONUS] Interactive Prototype

## Schema 
[This section will be completed in Unit 9]
### Models
[Add table of models]
### Networking
- [Add list of network requests by screen ]
- [Create basic snippets for each Parse network request]
- [OPTIONAL: List endpoints if using existing API such as Yelp]

### GIFS TO SHOW PROGRESS
![](https://github.com/CodePathFinal/Clink/blob/main/Clink/Progress%20Gifs/Milestone1.gif)

### Sprint 2 GIFS
Random Key Generated when user clicks host
<img src="http://g.recordit.co/5JtwCAIDOg.gif"><br>
<img src="http://g.recordit.co/omplg7vWN9.gif"><br>
User can add drinks
<img src="http://g.recordit.co/FlXiPm0jwJ.gif"><br>
<img src="http://g.recordit.co/9SAqoi6jOI.gif"><br>
On refresh it will load the added drinks to the parse server
<img src="http://g.recordit.co/9uzfTMurSN.gif"><br>
<img src="http://g.recordit.co/1gGLtzVPKH.gif"><br>
Join host button will only work with a correct key
<img src="http://g.recordit.co/Feg03UTtyh.gif"><br>

### Sprint 2 Extended to Extra Week
Ran into issues with bugs. The app was crashing when signing up to make a new account.
The bug was fixed by moving "user = PFUser.current()!" inside a function when they click the host button.
We have another bug with the drink order not working correctly with parse.
We may have to find a different way to load the drink order if we can't get it to work.
Last Sprint 3 we will solve or do a work around along with display the orders
and then allowing the user to click on the username to view the other person's social profiles.
