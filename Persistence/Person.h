//
//  Person.h
//  Persistence
//
//  Created by Liam Williams on 2016-11-23.
//  Copyright © 2016 Lighthouse. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject <NSCoding>

@property NSString *firstName;
@property NSString *lastName;
@property NSNumber *idNumber;

@end
