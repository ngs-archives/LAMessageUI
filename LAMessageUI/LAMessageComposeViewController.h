//
//  LAMessageComposeViewController.h
//  LAMessageUI
//
//  Created by Atsushi Nagase on 5/17/13.
//
//

#import <UIKit/UIKit.h>

@protocol LAMessageComposeViewControllerDelegate;

@interface LAMessageComposeViewController : UINavigationController

@property (nonatomic, assign) id<LAMessageComposeViewControllerDelegate> messageComposeDelegate;
@property (nonatomic, assign) BOOL showSubjectField;
@property (nonatomic, strong) NSArray *recipments;
@property (nonatomic, strong) NSString *body;

@end
