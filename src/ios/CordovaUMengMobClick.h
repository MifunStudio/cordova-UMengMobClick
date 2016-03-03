#import <UIKit/UIKit.h>
#import <Cordova/CDVPlugin.h>

@interface CordovaUMengMobClick : CDVPlugin

- (void)setLogEnabled:(CDVInvokedUrlCommand*)command;
- (void)startWithAppKey:(CDVInvokedUrlCommand*)command;
- (void)customEvent:(CDVInvokedUrlCommand*)command;

@end
