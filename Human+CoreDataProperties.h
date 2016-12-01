//
//  Human+CoreDataProperties.h
//  Persistence
//
//  Created by Liam Williams on 2016-11-23.
//  Copyright © 2016 Lighthouse. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Human.h"

NS_ASSUME_NONNULL_BEGIN

@interface Human (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSSet<Animal *> *pets;

@end

@interface Human (CoreDataGeneratedAccessors)

- (void)addPetsObject:(Animal *)value;
- (void)removePetsObject:(Animal *)value;
- (void)addPets:(NSSet<Animal *> *)values;
- (void)removePets:(NSSet<Animal *> *)values;

@end

NS_ASSUME_NONNULL_END
