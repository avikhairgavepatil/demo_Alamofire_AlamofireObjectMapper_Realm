# Alamofire + AlamofireObjectMapper + Realm

This repository contains two demo apps (Swift 3 and Swift 4.2) that show you how
to build an app that communicates with a REST api using Alamofire.


## Swift 4.2

The Swift 4.2 app uses Alamofire and AlamofireObjectMapper to:

* Fetch data from an api, using `Alamofire`
* Map api responses to app-specific models, using `AlamofireObjectMapper`
* Retry failing requests, using Alamofire's `RequestRetrier`
* Decorate all requests, using Alamofire's `RequestAdapter`

It follows the same approach as the Swift 3 app, but with improved code. Look at
the Swift 3 blog post for more details.

Note that this approach was a good one before `Codable` was released. Today, I'd
recommend you to use `Alamofire` and `CodableAlamofire` instead. I will create a
demo app for this approach as well.


## Swift 3

The old, legacy Swift 3 app uses Alamofire, AlamofireObjectMapper and Realm to:

* Fetch data from an api, using `Alamofire`
* Map api responses to app-specific models, using `AlamofireObjectMapper`
* Retry failing requests, using Alamofire's `RequestRetrier`
* Decorate all requests, using Alamofire's `RequestAdapter`
* Store fetched data in a database, using `Realm` (Swift 3 only)
* Build offline support by using the `decorator pattern` to combine logic.

The demo app's code and the various concepts it involves are described in detail
in [this blog post](http://danielsaidi.com/blog/2017/08/23/alamofire-realm#comment-4249670507).


## Talks

You can watch me talk about Alamofire, AlamofireObjectMapper and Realm in an old
talk I gave at [CocoaHeads Sthlm, April 3 2017](https://www.youtube.com/watch?v=LuKehlKoN7o&lc=z22qu35a4xawiriehacdp435fnpjgmq2f54mjmyhi2tw03c010c.1502618893412377).


## Running the demo apps

Before you can run the demo apps, you must run `pod install` in the app folders.
After that, open and run the workspace instead of the project file.


## Source code

The `master` branch contains source code for the demo apps, while the `gh-pages`
branch contains the static api, which is used by the apps.