//
//  LAMessageComposeViewController.m
//  LAMessageUI
//
//  Created by Atsushi Nagase on 5/17/13.
//
//

#import "LAMessageComposeViewController.h"
#import "LAMessageComposeRootViewController.h"

@interface LAMessageComposeViewController ()

@property (nonatomic, strong) LAMessageComposeRootViewController *rootViewController;

@end

@implementation LAMessageComposeViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  self.rootViewController = [[LAMessageComposeRootViewController alloc] init];
  [self setViewControllers:@[self.rootViewController]];
}

@end
