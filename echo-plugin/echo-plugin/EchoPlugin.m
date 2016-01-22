#import "EchoPlugin.h"

@implementation EchoPlugin

- (void) echo:(CDVInvokedUrlCommand*)command
{
    NSString* message = [command argumentAtIndex:0];
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:
                                     [message stringByAppendingString:message]];
    
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

@end
