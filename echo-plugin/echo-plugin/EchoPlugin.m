#import "EchoPlugin.h"

@implementation NS(EchoPlugin)

- (void) echo:(CDVInvokedUrlCommand*)command
{
    NSString* message = [command argumentAtIndex:0];
    message = [message stringByAppendingString:message]; // uh-oh?
    
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString: message];
    
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

@end
