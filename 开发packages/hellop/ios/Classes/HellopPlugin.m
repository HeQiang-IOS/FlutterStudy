#import "HellopPlugin.h"
#import <hellop/hellop-Swift.h>

@implementation HellopPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftHellopPlugin registerWithRegistrar:registrar];
}
@end
