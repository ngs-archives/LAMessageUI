//
//  LAMessageMailItem.h
//  LAMessageUI
//
//  Created by Atsushi Nagase on 5/20/13.
//
//

#import <Foundation/Foundation.h>
#import "LAMessageRecipmentItem.h"

@interface LAMessageMailItem : NSObject<LAMessageRecipmentItem,NSCopying,NSCoding>

@property (nonatomic, copy) NSString *address;

+ (instancetype)itemWithTitle:(NSString *)title
                  withAddress:(NSString *)address;

@end
