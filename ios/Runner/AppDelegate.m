#include "AppDelegate.h"
#include "GeneratedPluginRegistrant.h"
#include "Runner-Swift.h"

@interface AppDelegate()
@property (nonatomic) Player *player;
@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    FlutterViewController* controller = (FlutterViewController*)self.window.rootViewController;

    FlutterMethodChannel* batteryChannel = [FlutterMethodChannel
                                            methodChannelWithName:@"me.dmaksa.flutter.tutu/player"
                                            binaryMessenger:controller.binaryMessenger];

    [batteryChannel setMethodCallHandler:^(FlutterMethodCall* call, FlutterResult result) {
        if ([call.method isEqualToString: @"presentPlayer"]) {
            [self presentPlayer];
            result(0);
        }
        return result(FlutterMethodNotImplemented);
    }];
  [GeneratedPluginRegistrant registerWithRegistry:self];
  // Override point for customization after application launch.
  return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

- (void)presentPlayer {
    self.player = [[Player alloc] init];
    [self.player playWithPresenterVC:self.window.rootViewController];
}

@end
