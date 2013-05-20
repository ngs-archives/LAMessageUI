//
//  LAMessageComposeView.h
//  LAMessageUI
//
//  Created by Atsushi Nagase on 5/19/13.
//
//

#import <UIKit/UIKit.h>

@class APTokenField;
@protocol APTokenFieldDelegate;
@protocol APTokenFieldDataSource;
@interface LAMessageComposeView : UIView

@property (nonatomic, readonly) UITextView *textView;
@property (nonatomic, readonly) APTokenField *recipientField;
@property (nonatomic, weak) id<APTokenFieldDataSource> tokenFieldDataSource;
@property (nonatomic, weak) id<APTokenFieldDelegate> tokenFieldDelegate;

@end
