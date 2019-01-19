#import "PingPlugin.h"
#import <ping/ping-Swift.h>

@implementation PingPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftPingPlugin registerWithRegistrar:registrar];
}
@end
