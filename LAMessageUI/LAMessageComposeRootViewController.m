//
//  LAMessageComposeRootViewController.m
//  LAMessageUI
//
//  Created by Atsushi Nagase on 5/17/13.
//
//

#import "LAMessageComposeRootViewController.h"
#import "LAMessageComposeViewController.h"
#import "LAMessageComposeViewControllerDelegate.h"
#import "LAMessageComposeView.h"
#import "APTokenField.h"
#import "APTokenView.h"

@interface LAMessageComposeRootViewController ()

@property (nonatomic, unsafe_unretained) LAMessageComposeViewController *messageComposeController;

@end

@implementation LAMessageComposeRootViewController

- (id)initWithMessageComposeController:(LAMessageComposeViewController *)messageComposeController {
  if(self = [self initWithNibName:nil bundle:nil]) {
    self.messageComposeController = messageComposeController;
  }
  return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
  if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
    self.doneButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(done:)];
    self.cancelButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancel:)];
    self.title = NSLocalizedString(@"New Message", nil);

  }
  return self;
}

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  [self.navigationItem setLeftBarButtonItem:self.cancelButtonItem animated:animated];
  [self.navigationItem setRightBarButtonItem:self.doneButtonItem animated:animated];
  [self.composeView setNeedsLayout];
}

- (void)loadView {
  [super loadView];
  if(nil == self.composeView)
    self.composeView = [[LAMessageComposeView alloc] init];
  self.view = self.composeView;
  self.composeView.tokenFieldDelegate = self;
  self.composeView.tokenFieldDataSource = self.recipientFieldDataSource;
}


- (void)done:(id)sender {
  if(![self.messageComposeController.messageComposeDelegate respondsToSelector:@selector(messageComposeControllerWillFinishComposingMessage:withSender:)] ||
     [self.messageComposeController.messageComposeDelegate messageComposeControllerWillFinishComposingMessage:self.messageComposeController withSender:sender]) {
    [self dismissViewControllerAnimated:YES completion:NULL];
  }
}

- (void)cancel:(id)sender {
  if(![self.messageComposeController.messageComposeDelegate respondsToSelector:@selector(messageComposeControllerWillCancelComposingMessage:withSender:)] ||
     [self.messageComposeController.messageComposeDelegate messageComposeControllerWillCancelComposingMessage:self.messageComposeController withSender:sender]) {
    [self dismissViewControllerAnimated:YES completion:NULL];
  }
}

- (void)createNewObjectAndTokenWithTitle:(NSString *)title {
  id newObject = title;
  APTokenView *newToken = [APTokenView tokenWithTitle:title object:newObject colors:nil];
  [self.composeView.recipientField addToken:newToken];
}

#pragma mark - APTokenFieldDelegate

- (void)tokenField:(APTokenField *)tokenField didAddToken:(APTokenView *)token {
  [self.composeView setNeedsLayout];
}

- (BOOL)tokenField:(APTokenField *)tokenField shouldAddToken:(APTokenView *)token {
  return token.title.length > 0;
}

- (BOOL)tokenField:(APTokenField *)tokenField shouldRemoveToken:(APTokenView *)token {
  return YES;
}

- (void)tokenFieldDidReturn:(APTokenField *)tokenField {
  if(tokenField.text && tokenField.text.length > 0)
    [self createNewObjectAndTokenWithTitle:tokenField.text];
}

@end
