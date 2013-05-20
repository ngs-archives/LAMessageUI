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

@interface LAMessageComposeRootViewController ()

@property (nonatomic, strong) UIBarButtonItem *doneButtonItem;
@property (nonatomic, strong) UIBarButtonItem *cancelButtonItem;
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

  }
  return self;
}

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  [self.navigationItem setLeftBarButtonItem:self.cancelButtonItem animated:animated];
  [self.navigationItem setRightBarButtonItem:self.doneButtonItem animated:animated];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor whiteColor];
  self.title = NSLocalizedString(@"New Message", nil);
}

- (void)done:(id)sender {
  if(![self.messageComposeController.messageComposeDelegate respondsToSelector:@selector(messageComposeControllerWillFinishComposingMessage:)] ||
     [self.messageComposeController.messageComposeDelegate messageComposeControllerWillFinishComposingMessage:self.messageComposeController]) {
    [self dismissViewControllerAnimated:YES completion:NULL];
  }
}

- (void)cancel:(id)sender {
  [self dismissViewControllerAnimated:YES completion:NULL];
}

@end
