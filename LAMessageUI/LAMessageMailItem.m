//
//  LAMessageMailItem.m
//  LAMessageUI
//
//  Created by Atsushi Nagase on 5/20/13.
//
//

#import "LAMessageMailItem.h"

@implementation LAMessageMailItem
@synthesize title;


+ (instancetype)itemWithTitle:(NSString *)title
                  withAddress:(NSString *)address {
  LAMessageMailItem *item = [[self alloc] init];
  item.title = title;
  item.address = address;
  return item;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
  [aCoder encodeObject:self.title forKey:@"title"];
  [aCoder encodeObject:self.address forKey:@"address"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
  if(self = [super init]) {
    self.title = [aDecoder decodeObjectForKey:@"title"];
    self.address = [aDecoder decodeObjectForKey:@"address"];
  }
  return self;
}

- (id)copyWithZone:(NSZone *)zone {
  LAMessageMailItem *copy = [[[self class] alloc] init];
  copy.address = self.address;
  copy.title = self.title;
  return copy;
}


@end
