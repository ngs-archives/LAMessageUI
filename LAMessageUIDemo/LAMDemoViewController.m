//
//  LAMDemoViewController.m
//  LAMessageUI
//
//  Created by Atsushi Nagase on 5/17/13.
//
//

#import "LAMDemoViewController.h"
#import <SVProgressHUD/SVProgressHUD.h>

@interface LAMDemoViewController ()

@property (nonatomic, assign) BOOL confirmLocked;
@property (nonatomic, strong) LAMessageComposeViewController *composeViewController;
@property (nonatomic, copy) NSArray *draftRecipients;
@property (nonatomic, copy) NSString *draftBody;

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
  self.composeViewController = [[LAMessageComposeViewController alloc] init];
  [self presentViewController:self.composeViewController animated:YES completion:NULL];
  self.composeViewController.messageComposeDelegate = self;
  self.composeViewController.recipments = self.draftRecipients;
  self.composeViewController.body = self.draftBody;
  self.draftRecipients = nil;
  self.draftBody = nil;
}

#pragma mark - LAMessageComposeViewControllerDelegate

- (BOOL)messageComposeControllerWillCancelComposingMessage:(LAMessageComposeViewController *)messageComposeController
                                                withSender:(id)sender {
  if(self.confirmLocked)
    return NO;
  self.confirmLocked = YES;
  UIActionSheet *as =
  [[UIActionSheet alloc]
   initWithTitle:nil
   delegate:self
   cancelButtonTitle:nil
   destructiveButtonTitle:NSLocalizedString(@"Discard Draft", nil)
   otherButtonTitles:NSLocalizedString(@"Save Draft", nil),
   nil];
  if([sender isKindOfClass:[UIBarButtonItem class]])
    [as showFromBarButtonItem:sender animated:YES];
  else
    [as showInView:self.view];
  return NO;
}

- (BOOL)messageComposeControllerWillFinishComposingMessage:(LAMessageComposeViewController *)messageComposeController
                                                withSender:(id)sender  {
  [SVProgressHUD showWithStatus:@"Sending" maskType:SVProgressHUDMaskTypeGradient];
  double delayInSeconds = 2.0;
  dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
  dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
    [SVProgressHUD showSuccessWithStatus:@"Sent!"];
    [self.composeViewController dismissViewControllerAnimated:YES completion:NULL];
    self.composeViewController = nil;
  });
  return NO;
}

#pragma mark - UIActionSheetDelegate

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
  self.confirmLocked = NO;
  if(buttonIndex == 1) {
    self.draftRecipients = self.composeViewController.recipments;
    self.draftBody = self.composeViewController.body;
  } else {
    self.draftRecipients = nil;
    self.draftBody = nil;
  }
  if(buttonIndex >= 0) {
    [self.composeViewController dismissViewControllerAnimated:YES completion:NULL];
    self.composeViewController = nil;
  }
}


@end
