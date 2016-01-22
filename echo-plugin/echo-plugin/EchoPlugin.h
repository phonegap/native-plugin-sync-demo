#import <Cordova/CDVPlugin.h>

@interface EchoPlugin : CDVPlugin

- (void) echo:(CDVInvokedUrlCommand*)command;

@end
