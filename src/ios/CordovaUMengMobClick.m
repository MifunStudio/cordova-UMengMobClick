#import <Cordova/CDV.h>
#import "CordovaUMengMobClick.h"
#import "MobClick.h"

@implementation CordovaUMengMobClick

- (void)setLogEnabled:(CDVInvokedUrlCommand*)command
{
    NSString *no = @"no";
    NSString *flag = [command.arguments objectAtIndex:0];
    if([no isEqualToString:flag]) {
        [MobClick setLogEnabled:NO];
    } else {
        [MobClick setLogEnabled:YES];
    }
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)startWithAppKey:(CDVInvokedUrlCommand*)command
{
    NSString *appKey = [command.arguments objectAtIndex:0];
    NSString *reportPolicy = [command.arguments objectAtIndex:1];
    NSString *channelId = [command.arguments objectAtIndex:2];
    NSString *interval = @"interval";
    if([interval isEqualToString:reportPolicy]) {
        [MobClick startWithAppkey:appKey reportPolicy:SEND_INTERVAL channelId:channelId];
    } else {
        [MobClick startWithAppkey:appKey reportPolicy:BATCH channelId:channelId];
    }
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)customEvent:(CDVInvokedUrlCommand*)command
{
    [self.commandDelegate runInBackground:^{
        NSString *eventId = [command.arguments objectAtIndex:0];
        [MobClick event:eventId];
        CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }];
}

@end
