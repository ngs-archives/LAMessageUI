//
//  LAMessageComposeRootViewController.h
//  LAMessageUI
//
//  Created by Atsushi Nagase on 5/17/13.
//
//

#import <UIKit/UIKit.h>
#import "APTokenFieldDelegate.h"

@class LAMessageComposeViewController, LAMessageComposeView;
@protocol APTokenFieldDataSource;
@interface LAMessageComposeRootViewController : UIViewController<APTokenFieldDelegate>

- (id)initWithMessageComposeController:(LAMessageComposeViewController *)messageComposeController;

@property (nonatomic, weak) id<APTokenFieldDataSource> recipientFieldDataSource;
@property (nonatomic, strong) UIBarButtonItem *doneButtonItem;
@property (nonatomic, strong) UIBarButtonItem *cancelButtonItem;
@property (nonatomic, strong) LAMessageComposeView *composeView;

@end
