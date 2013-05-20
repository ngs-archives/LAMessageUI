//
//  LAMessageComposeView.m
//  LAMessageUI
//
//  Created by Atsushi Nagase on 5/19/13.
//
//

#import "LAMessageComposeView.h"
#import "APTokenField.h"

@implementation LAMessageComposeView
@synthesize recipientField = _recipmentField
, textView = _textView
, tokenFieldDataSource = _tokenFieldDataSource
, tokenFieldDelegate = _tokenFieldDelegate
;

- (id)initWithFrame:(CGRect)frame {
  if (self = [super initWithFrame:frame]) {
    self.backgroundColor = [UIColor whiteColor];
  }
  return self;
}

- (APTokenField *)recipientField {
  if(nil==_recipmentField) {
    _recipmentField = [[APTokenField alloc] initWithFrame:CGRectZero];
    _recipmentField.allowDuplicates = YES;
    _recipmentField.tokenFieldDataSource = self.tokenFieldDataSource;
    _recipmentField.tokenFieldDelegate = self.tokenFieldDelegate;
    _recipmentField.rightView = [UIButton buttonWithType:UIButtonTypeContactAdd];
    [self addSubview:_recipmentField];
    [_recipmentField becomeFirstResponder];
  }
  return _recipmentField;
}

- (UITextView *)textView {
  if(nil == _textView) {
    _textView = [[UITextView alloc] initWithFrame:CGRectZero];
    [self addSubview:_textView];
  }
  return _textView;
}

- (void)setTokenFieldDataSource:(id<APTokenFieldDataSource>)tokenFieldDataSource {
  _tokenFieldDataSource = tokenFieldDataSource;
  _recipmentField.tokenFieldDataSource = tokenFieldDataSource;
}

- (void)setTokenFieldDelegate:(id<APTokenFieldDelegate>)tokenFieldDelegate {
  _tokenFieldDelegate = tokenFieldDelegate;
  _recipmentField.tokenFieldDelegate = tokenFieldDelegate;
}

- (void)layoutSubviews {
  [super layoutSubviews];
  [self.recipientField sizeToFit];
  [self bringSubviewToFront:self.recipientField];
  CGFloat w = self.frame.size.width;
  CGFloat t = 0;
  CGFloat h = self.recipientField.frame.size.height;
  self.recipientField.frame = CGRectMake(0, 0, w, h);
  t += h + 5;
  self.textView.frame = CGRectMake(2, t, w - 4, self.frame.size.height - t);
  self.textView.font = self.recipientField.font;
}

@end
