#import "EchoPlugin.h"

@implementation EchoPlugin

- (void) echo:(CDVInvokedUrlCommand*)command
{
    id message = [command.arguments objectAtIndex:0];
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:message];
    
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

@end
