#import <Cordova/CDVPlugin.h>
#import "namespacing.h"

@interface NS(EchoPlugin) : CDVPlugin

- (void) echo:(CDVInvokedUrlCommand*)command;

@end
