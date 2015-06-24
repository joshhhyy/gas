# GA Student Blog

###Idea

A blog site for GA students and alumni to: 

Post about their progress and experiences during the course;
Post about their experiences finding and working a job after the course (for the benefit of recent alumni and future students);
Find each others’ social/professional sites (GitHub, LinkedIn, Twitter, Facebook (lol).

###Who is it for?

Phase 1: GA Sydney WDI students (intake WDI-10 onwards);

Phase 2: GA Sydney students (WDI, FEWD, BEWD, UXDI);

Phase 3: GA global students;
What problem does it address?

Problem 1: Everyone’s encouraged to start a blog at the beginning of the course, and most people intend to, but few people actually do, and most people who don’t regret it. This remove a few barriers to students starting their blogs, such as: “what format should my blog take?”, “what site should I use?”. It will also allow users to see what their fellow students (and past alumni) have written about, giving them inspiration and motivation to post. 

Problem 2: Students don’t have a central location to find out their classmates’ professional/social accounts. GitHub, Twitter, LinkedIn and Facebook account details. User profiles will give students access to all their classmates’ social/professional profiles/sites.

Problem 3: Current students don’t necessarily know what to expect from the course or what to expect once they finish the course. The blog will allow students to see what alumni have done since finishing the course, and allow alumni to see what current students are up to.

###Models

Locations:
- eg “Sydney”
- Associations:
- has_many Streams.
 
Streams:
- eg “WDI”

Associations:

- has_many Classes
- belongs_to Location

###Classes
- eg “WDI-10”

Associations:
- has_many Users
- belongs_to Stream

###Users
eg “Josh”

Associations:
- has_one Blog
- has_many Posts through Blog
- belongs_to Class

###Blogs
Associations:
- has_many Posts
- belongs_to User

###Posts
Associations:
- has_many Comments
- belongs_to Blog

###Comments
Associations:
- belongs_to Post

###Features

Post;
Rich text;
(maybe) Syntax-highlighted code snippets;
(maybe) Attachments (images, documents);
Comment;
Tag cloud (Location-, Stream-, Class- and User-level);
Profiles, automatically populated using user’s email + third party APIs. Including links to and integration (eg in-page “last commit”, “last tweet”) of:
GitHub;
Twitter;
LinkedIn;
Slack;
Facebook;
Social sharing:
Slack DM user;
Post to Slack;
Framework

Ruby on Rails
Gems
Backbone (maybe)
HTML, Javascript, CSS
APIs

###APIs

####Slack:
Profile page: name, avatar, link to DM, link to Slack profile);
Post page: share post on Slack;
####GitHub:
Profile page: name, avatar, recent commit(s), link to GitHub profile;
(maybe) ‘Sign In with GitHub”;
####Twitter:
Profile page: name, avatar, recent tweet(s), link to Twitter profile;
####LinkedIn:
Profile page: name, avatar, link to LinkedIn profile;
####General Assembly:
Single sign-on to/from GA/blog;
####Heroku:
 Name, avatar, recent apps, link to Heroku profile;
####Facebook:
Profile page: Name, avatar, recent post(s), share post on Facebook, link to Facebook profile.
####GeoCoder:
Get location to set location.

###Gems

bcrypt: Authentication.
Bootstrap (or maybe Bootstripe): CSS.

Design Principles

GA-style consistent;
Responsive (but not mobile-first);

Project Plan

...do stuff. HEAPS of stuff. And get it done by the time the project's due. 

##Backlog

###Tagcloud (nice to have) <- Chris
- Make it.

~~###Intellinav - Add "Sign up" (new user) <- Alfie~~

~~###Group Index View <- Alfie~~
~~- "Destroy" - admin only~~
~~- "Add a class" - admin only~~

###Search forms <- Alfie
- One form for both fields, select search type (eg "Search for user" and "Search for posts") by drop-down

###Groups model <- Alfie
~~- Add field - avatar (string)~~
~~- Add field - instructor (string)~~
~~- Add field - instructor avatar (string) ??~~

###Group Index View <- Alfie
~~- Add group avatar~~
- Add number of users in group
~~- Add instructor name~~

###Homepage (low priority) <- Chris
- Create footer
- Add GA logo and link in footer
- Add Github repo link in footer
- Add Contact link in footer

###Group Show View <- Josh
~~- Remove "Back" link~~
~~- Remove "New user"~~
~~- "Edit" - admin only~~
- Add group avatar
- Add user taglines
- Add Instructor name
- Add user avatar
~~- Remove user email address~~

~~###User model <- Chris~~
~~Add tagline field (string)~~

###User Show View <- Josh
~~- Add tagline~~
- Last active - should be when user last logged in
~~- Remove "Alumni"~~ 
~~- Move "View Profile" and "View Blog" up next to name~~

###API Bullshit <-Chris
- APIs
..* Slack
..* GitHub (fix up) 
..* Twitter

~~###New User View <- Josh~~
~~- Remove "Last Active"~~
~~- Remove "Alumni"~~
~~- Remove "Admin"~~
~~- Add field required validators~~

###Posts Index View <- Josh
- Truncate post.content (to ~100 characters)
- Add hr tags between posts
~~- Move subtitle to appear on line below title~~

###Post New View <- Chris
~~- Mandatory fields - title, content~~
- Fix RTE style (formatting buttons)
~~- Remove "Back"~~

~~###Post Show View <- Chris~~
~~- Remove back~~
~~- Move 'Edit' up top~~
~~- Add commenter's avatar~~
~~- Add comment date (created_at)~~

###Time and date throughout application <- Allllan
- Strftime
- local (or at least Sydney) time (look at Time.zone.now (but without the 'now' bit))

~~###Post Edit <- Chris~~
~~- Change "Show" to "Cancel"~~

###Auto-login on sign-up <- J-Bon
- When a new user signs up, they should be signed in with those credentials

###Password reset <- Alfie 
- Reset password using email address (need to deploy to Heroku and need plugins to send email from Heroku).

###Notes

Name: 
‘GAS’ (General Assembly Students blog):
“Dude, put that on GAS!”
A: “Oi, what’s your GitHub account, dude?”
B: “Fuck, it’s on GAS, you shitcunt. Look it up”
