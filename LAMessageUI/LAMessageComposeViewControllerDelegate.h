//
//  LAMessageComposeViewControllerDelegate.h
//  LAMessageUI
//
//  Created by Atsushi Nagase on 5/17/13.
//
//

#import <Foundation/Foundation.h>

@class LAMessageComposeViewController;
@protocol LAMessageItem;

@protocol LAMessageComposeViewControllerDelegate <NSObject>

@optional

- (BOOL)messageComposeControllerWillFinishComposingMessage:(LAMessageComposeViewController *)messageComposeController
                                                withSender:(id)sender;

- (BOOL)messageComposeControllerWillCancelComposingMessage:(LAMessageComposeViewController *)messageComposeController
                                                withSender:(id)sender;

@end
