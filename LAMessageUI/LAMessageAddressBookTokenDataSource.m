//
//  LAMessageAddressBookTokenDataSource.m
//  LAMessageUI
//
//  Created by Atsushi Nagase on 5/20/13.
//
//

#import "LAMessageAddressBookTokenDataSource.h"
#import "LAMessageMailItem.h"

@interface LAMessageAddressBookTokenDataSource ()

@property (nonatomic, copy) NSArray *results;
@property (nonatomic, copy) NSArray *contacts;

@end

@implementation LAMessageAddressBookTokenDataSource

- (id)tokenField:(APTokenField *)tokenField objectAtResultsIndex:(NSUInteger)index {
  return self.results[index];
}

- (void)tokenField:(APTokenField *)tokenField searchQuery:(NSString *)query {

}

- (UITableViewCell *)tokenField:(APTokenField *)tokenField tableView:(UITableView *)tableView cellForIndex:(NSUInteger)index {
  return nil;
}

- (NSString *)tokenField:(APTokenField *)tokenField titleForObject:(id)anObject {
  return [(LAMessageMailItem *)anObject title];
}

- (NSUInteger)numberOfResultsInTokenField:(APTokenField *)tokenField {
  return self.results.count;
}

@end
