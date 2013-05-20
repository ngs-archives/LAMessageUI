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

- (id<LAMessageItem>)messageComposeController:(LAMessageComposeViewController *)messageComposeController
                    willCreateNewItemWithText:(NSString *)text;

- (BOOL)messageComposeControllerWillFinishComposingMessage:(LAMessageComposeViewController *)messageComposeController;

@end
