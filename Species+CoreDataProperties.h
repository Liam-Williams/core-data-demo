//
//  Species+CoreDataProperties.h
//  Persistence
//
//  Created by Liam Williams on 2016-11-23.
//  Copyright © 2016 Lighthouse. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Species.h"

NS_ASSUME_NONNULL_BEGIN

@interface Species (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *type;

@end

NS_ASSUME_NONNULL_END
