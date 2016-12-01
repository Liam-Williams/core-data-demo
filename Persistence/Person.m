//
//  Person.m
//  Persistence
//
//  Created by Liam Williams on 2016-11-23.
//  Copyright © 2016 Lighthouse. All rights reserved.
//

#import "Person.h"

@implementation Person

- (instancetype)initWithCoder:(NSCoder *)coder
{
  self = [super init];
  if (self) {
    self.firstName = [coder decodeObjectForKey:@"first"];
    self.lastName = [coder decodeObjectForKey:@"last"];
    self.idNumber = [coder decodeObjectForKey:@"id"];
  }
  return self;
}

- (void)encodeWithCoder:(NSCoder *)coder
{
  [coder encodeObject:self.firstName forKey:@"first"];
  [coder encodeObject:self.lastName forKey:@"last"];
  [coder encodeObject:self.idNumber forKey:@"id"];
}

@end
