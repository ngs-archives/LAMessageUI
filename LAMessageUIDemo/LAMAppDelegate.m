//
//  LAMAppDelegate.m
//  LAMessageUIDemo
//
//  Created by Atsushi Nagase on 5/17/13.
//
//

#import "LAMAppDelegate.h"
#import "LAMDemoViewController.h"

@implementation LAMAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
  self.viewController = [[LAMDemoViewController alloc] init];
  self.window.rootViewController = self.viewController;
  [self.window makeKeyAndVisible];
  return YES;
}


@end
