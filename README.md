# Alamofire + AlamofireObjectMapper + Realm

This repository contains a demo app that shows you how yo build an app that uses
Alamofire, AlamofireObjectMapper and Realm to:

* Fetch data from an api, using `Alamofire`
* Map api responses to app-specific models, using `AlamofireObjectMapper`
* Retry failing requests, using Alamofire's `RequestRetrier`
* Decorate all requests, using Alamofire's `RequestAdapter`
* Store fetched data in a database, using `Realm`
* Build offline support by using the `decorator pattern` to combine logic.

The demo app's code and the various concepts it involves are described in detail
in [this blog post](http://danielsaidi.com/blog/2017/08/23/alamofire-realm#comment-4249670507).

You can also watch me talk about this approach in a video of a presentation that
I gave at [CocoaHeads Sthlm, April 3 2017](https://www.youtube.com/watch?v=LuKehlKoN7o&lc=z22qu35a4xawiriehacdp435fnpjgmq2f54mjmyhi2tw03c010c.1502618893412377).


## Running the demo app

Before you can run the demo app, you must run `pod install` in the `demo_swift3`
folder. After that, open the workspace instead of the project file.


## Source code

The `master` branch contains source code for a Swift 3-based demo app, while the
`gh-pages` branch contains the static api, which is used by the app.

The app and its dependencies is currently built in Swift 3, but can be ported to
Swift 4.2 with little effort.