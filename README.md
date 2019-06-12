
# T21Logger
> Wrapper for SwiftyBeaver

[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-brightgreen.svg)](https://github.com/Carthage/Carthage)
[![CocoaPods compatible](https://img.shields.io/badge/pod-2.0.0-informational.svg)](http://cocoapods.org/pods/Swinject)
[![Swift compatible](https://img.shields.io/badge/Swift-5.0-orange.svg)]()
[![Platform compatible](https://img.shields.io/badge/platform-iOS-lightgrey.svg)]()
[![License](https://img.shields.io/badge/license-Apache--2.0-blue.svg)]()

The T21Logger class is a simple wrapper class for the SwiftyBeaver public third party logger library.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

## Installation

T21Logger is available through [Carthage](https://github.com/Carthage/Carthage) or [CocoaPods](https://cocoapods.org).

### Carthage

To install T21Logger with Carthage, add the following line to your `Cartfile`.

```
github "worldline-spain/T21LoggerSwift"
```

Then run `carthage update --no-use-binaries` command or just `carthage update`. For details of the installation and usage of Carthage, visit [its project page](https://github.com/Carthage/Carthage).


### CocoaPods

To install T21Logger with CocoaPods, add the following lines to your `Podfile`.

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '10.0' 
use_frameworks!

pod 'T21LoggerSwift'
```

Then run `pod install` command. For details of the installation and usage of CocoaPods, visit [its official website](https://cocoapods.org).

## How to use

### Add a context

The logger wrapper provides an easy way to add a Context related String for the different logs. In the following example we are creating 3 different loggers:

* To log general messages from the APP.
* To log messages from Realm related queries and stuff.
* To log messages from NSURLSessions related requests and so on.

Creating a Logger is just as simple as creating a T21Logger instance.

```swift
let customLogger = T21Logger()
let customLoggerRealm = T21Logger("REALM")
let customLoggerHTTPRequester = T21Logger("NETWORK")

func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    customLogger.verbose("App verbose message")
    customLogger.debug("App verbose message")
    customLoggerRealm.info("Realm error message")
    customLoggerHTTPRequester.warning("Network warning message")
    customLoggerRealm.error("Realm error message")

    return true
}
```

The generated output is the following one:

```
💭18:21:04.541 VERBOSE AppDelegate.application():22 - [APP] App verbose message
✅18:21:04.545 DEBUG AppDelegate.application():23 - [APP] App verbose message
ℹ️18:21:04.545 INFO AppDelegate.application():24 - [REALM] Realm error message
⚠️18:21:04.546 WARNING AppDelegate.application():25 - [NETWORK] Network warning message
🚫18:21:04.546 ERROR AppDelegate.application():26 - [REALM] Realm error message
```

This makes trivial to keep different loggers for your app and your internal libraries. Each one will create its logger, making it easy to see from where the log comes from.

### Create an static class to hold your Logger

The following AppLogger.swift class it's just a set of static methods to avoid having to work with T21Logger instances.

```swift
import Foundation

public class AppLogger {

//MARK: Public methods
public class func verbose(_ message: String?, _ file: String = #file, _ function: String = #function, line: Int = #line) {
    sharedInstance.verbose(message,file,function, line)
}

public class func debug(_ message: String?, _ file: String = #file, _ function: String = #function, line: Int = #line) {
    sharedInstance.debug(message,file,function, line)
}

public class func info(_ message: String?, _ file: String = #file, _ function: String = #function, line: Int = #line) {
    sharedInstance.info(message,file,function, line)
}

public class func warning(_ message: String?, _ file: String = #file, _ function: String = #function, line: Int = #line) {
    sharedInstance.warning(message,file,function, line)
}

public class func error(_ message: String?, _ file: String = #file, _ function: String = #function, line: Int = #line) {
    sharedInstance.error(message,file,function, line)
}

//MARK: Private methods
private static let sharedInstance = T21Logger("APP")
}

```

Here the usage:

```swift
AppLogger.verbose("Verbose message!")
AppLogger.error("Error message!")

```

```
💭18:26:04.545 VERBOSE AppDelegate.application():22 - [APP] Verbose message!
🚫18:26:04.546 ERROR AppDelegate.application():26 - [APP] Error message!

```


### Adding DEBUG behaviour

When using Cocoapods dependency manager the auto generaed project doesn't add **DEBUG** flags for the pod dependencies. As *T21LoggerSwift* works different when compiled with DEBUG options you may add the following post-install script in your Podfile.

```
post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            if config.name == 'Debug'
                #in case of using Objective-C 
                config.build_settings['GCC_PREPROCESSOR_DEFINITIONS'] ||= ['$(inherited)', 'DEBUG=1']
                #in case of using Swift
                config.build_settings['OTHER_SWIFT_FLAGS'] ||= ['$(inherited)','-DDEBUG']
            end
        end
    end
end
```


## Built With

* [SwiftyBeaver](https://github.com/SwiftyBeaver/SwiftyBeaver) - Convenient logging during development & release in Swift.

## Authors

* **Eloi Guzman Ceron** - *Initial work*
* **Patricia De la Rica** - *Carthage integration*
* **Marcos Molero** - *Carthage integration* 

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* To Worldline iOS Dev Team.

