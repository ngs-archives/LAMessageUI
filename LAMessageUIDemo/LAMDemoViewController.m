//
//  LAMDemoViewController.m
//  LAMessageUI
//
//  Created by Atsushi Nagase on 5/17/13.
//
//

#import "LAMDemoViewController.h"
#import "LAMessageUI.h"

@interface LAMDemoViewController ()

@end

@implementation LAMDemoViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor whiteColor];
  UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  [button setTitle:@"Open" forState:UIControlStateNormal];
  [button sizeToFit];
  [button addTarget:self action:@selector(openModal:) forControlEvents:UIControlEventTouchUpInside];
  [self.view addSubview:button];
  button.center = self.view.center;
  button.frame = CGRectIntegral(button.frame);
}

- (void)openModal:(id)sender {
  LAMessageComposeViewController *vc = [[LAMessageComposeViewController alloc] init];
  [self presentViewController:vc animated:YES completion:NULL];
}

@end
