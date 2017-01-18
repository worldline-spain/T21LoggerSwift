#T21LoggerSwift

The T21LoggerSwift class is a simple wrapper class for the SwiftyBeaver public third party logger library.

## Version 1.0.0

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