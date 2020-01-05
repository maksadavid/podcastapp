#include "AppDelegate.h"
#include "GeneratedPluginRegistrant.h"

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
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Alert" message:NULL preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"Alert");
    }]];
    [self.window.rootViewController presentViewController:alert animated:YES completion:nil];
}

@end
