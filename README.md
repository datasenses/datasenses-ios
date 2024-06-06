# Datasenses iOS SDK

## Overview

Welcome to the official Datasenses iOS SDK Library

This section shows how to track custom events with the DataSenses SDK in your iOS app. The quick start guide shows how to install the DataSenses SDK, track your first user event, and refer to this information within the DataSenses dashboard.

## Prerequisites

Language: Swift 5.

Install the following: Xcode 14.1 or later

Your project must target these platform versions or later: iOS 13

## Step 1: Install the SDK

### Installation Option 1: Swift Package Manager

The easiest way to get `Datasenses_iOS` into your iOS project is to use Swift Package Manager.

(Coming soon)

### Installation Option 2: CocoaPods

The recommended way to install Datasenses SDK for iOS is using [Cocoapods](http://cocoapods.org/), since it means you can create a build with specific destinations, and because it makes it simple to install and upgrade.

First, add the `Datasenses_iOS` SDK dependency to your `Podfile`, like so:

```ruby
pod 'Datasenses-iOS' , :git => 'git@github.com:datasenses/datasenses-ios.git', :tag => '0.3.0'
```

## Step 2: Initialize Datasenses SDK

### Get api key and configuration file

Goto <https://developer.datasenses.io> to get your `api key`.

Click Download GoogleService-Info.plist to obtain your Firebase Apple platforms config file (GoogleService-Info.plist).

Move your config file into the root of your Xcode project. If prompted, select to add the config file to all targets.

### Config SKAdNetwork postback URL
Config value of `NSAdvertisingAttributionReportEndpoint` to `https://dts.guru/.well-known/skadnetwork/report-attribution/` in `Info.plist` file. 
See [more](https://developer.apple.com/documentation/bundleresources/information_property_list/nsadvertisingattributionreportendpoint)

### Initialize Datasenses SDK in your app

Then in your application delegate's `- application:didFinishLaunchingWithOptions:` method, set up the SDK like so:

```swift
import Datasenses_iOS

func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    Datasenses.initialize(apiKey: {{DEV_KEY}})
    Datasenses.shared().loggingEnabled = true
    Datasenses.shared().updatePostbackConversionValue(1)
    return Datasenses.shared().application(application, didFinishLaunchingWithOptions: launchOptions)
}
```

## Step3: Handle Deeplink

To allow DataSenses to handle deeplink, you can call `handleUrl(url:)`.

```swift
import Datasenses_iOS

func application(_ application: UIApplication,
               open url: URL,
               options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
  /// Handle the URL property accordingly
  Datasenses.shared().handleUrl(url: url)
  return true
}
```

- We supported few custom events. Checkout this [link](/docs/events) for more details.

## Step4: Send Events ###

### 4.1. Send Login Event ####

We use ***login*** event to identify the customer. Naming convention of fields need to be followed by our format.

```javascript
import Datasenses_iOS

Datasenses.shared().track(event: "login",
    properties: [
        "customer_id": "123456", // String - We use customer_id field as customer's id, 
        "email": "your_email@dev.xyz", // String - We use email field as customer's email
        "phone": "84999999999", // String - We use phone field as customer's phone
    ]
)

```

### 4.2. Send Charged Event

We use ***charged*** event to calculate the revenue, ROI, Marketing performance of your project.

***Note:***

1. If you want to monitor revenue of your product. You need to add the items filed with item_id as product's id for us to proceed this event

```javascript
import Datasenses_iOS
Datasenses.shared().track(event: "charged",
    properties: [
        "items": [
            ["category":"Phone","name":"Iphone X","price":119000000,"item_id": "2", "qty": 1],
            ["category":"Phone","name":"Samsung Galaxy","price":119000000,"item_id": "3", "qty": 1],
        ], // Array - We use items field as list of items of the conversion event, must have item_id of each item 
        "charged_id": "123", // String - Use charged_id field as a conversion's id
        "amount": 238000000 // Number - We use amount field as a conversion's value
    ]
)

```

### 4.3. Send Customized Events

You can add any additional events

```javascript

import Datasenses_iOS
Datasenses.shared().track(event: "add_to_cart",
    properties: [
        "category":"Phone", // String
        "name":"Iphone X", // String
        "price":119000000, // Number
        "item_id":"2", // String 
        "qty": 1 // Number
    ]
)
```

Let's get started by sending event data. You can send an event from anywhere in your application. Better understand user behavior by storing details that are specific to the event (properties).

```javascript
import Datasenses_iOS

Datasenses.shared().track(event: "add_to_cart",
                                  properties: ["currency": "VND",
                                               "items":["1234", "5678"]])
```

### 4.4 Manual flush

Datasenses SDK  doesn't send the events you record immediately. Instead, it sends batches to the Datasenses servers every 60 seconds while your application is running, as well as when the application transitions to the background. You can call `flush()` manually if you want to force a flush at a particular moment.

```javascript
Datasenses.shared().flush()
```