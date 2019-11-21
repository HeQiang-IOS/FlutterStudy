#import "HelloskPlugin.h"
#import <hellosk/hellosk-Swift.h>

@implementation HelloskPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftHelloskPlugin registerWithRegistrar:registrar];
}
@end
