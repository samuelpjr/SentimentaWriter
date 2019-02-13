# ifood-mobile-test
Create an app that given an Twitter username it will list user's tweets. When I tap one of the tweets the app will visualy indicate if it's a happy, neutral or sad tweet.

## Business rules
* Happy Tweet: We want a vibrant yellow color on screen with a 😃 emoji
* Neutral Tweet: We want a grey colour on screen with a 😐 emoji
* Sad Tweet: We want a blue color on screen with a 😔 emoji
* For the first release we will only support english language

### Hints
* You may use Twitter's oficial API (https://developer.twitter.com) to fetch user's tweets 
* Google's Natural Language API (https://cloud.google.com/natural-language/) may help you with sentimental analysis.

## Non functional requirements
* As this app will be a worldwide success, it must be prepared to be fault tolerant, responsive and resilient.
* Use whatever language, tools and frameworks you feel comfortable to.
* Briefly elaborate on your solution, architecture details, choice of patterns and frameworks.
* Fork this repository and submit your code.


# Architecture used:
* MVVM

# Cocoapods dependencies:
* TwitterKit - A native SDK to include Twitter content inside mobile apps

# Briefly elaborate of my solution:
I've used MVVM pattern based on three pillars:

* 1 Better separation of concerns:
presents a better separation of concerns by adding view models. The view model translates the data of the model layer into something the view layer can use. The controller is no longer responsible for this task.

* 2 Improved Testability
By migrating data manipulation to the view model, testing becomes much easier. Testing view models is easy.

* 3 Transparent Communication
The view model provides a transparent interface to the view controller, which it uses to populate the view layer and interact with the model layer. This results in a transparent communication between the four layers of your application.