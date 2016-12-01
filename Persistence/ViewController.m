//
//  ViewController.m
//  Persistence
//
//  Created by Liam Williams on 2016-11-23.
//  Copyright © 2016 Lighthouse. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "Animal.h"
#import "Species.h"
#import "AppDelegate.h"
#import "Human.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
  
  
  //[self testArchiving];
  
  AppDelegate * appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
  
  
  Species *bear = [NSEntityDescription insertNewObjectForEntityForName:@"Species" inManagedObjectContext:appDelegate.managedObjectContext];
  bear.type = @"Goat";
  
  Animal *teddy = [NSEntityDescription insertNewObjectForEntityForName:@"Animal" inManagedObjectContext:appDelegate.managedObjectContext];
  teddy.name = @"Ally";
  teddy.species = bear;
  
  Human *h1 = [NSEntityDescription insertNewObjectForEntityForName:@"Human" inManagedObjectContext:appDelegate.managedObjectContext];
  h1.name = @"John";
  Human *h2 = [NSEntityDescription insertNewObjectForEntityForName:@"Human" inManagedObjectContext:appDelegate.managedObjectContext];
  h2.name = @"Ryan";
  
  [h1 addPetsObject:teddy];
  [h2 addPetsObject:teddy];
  
  NSError *error = nil;
  if ([appDelegate.managedObjectContext save:&error] == NO) {
    NSAssert(NO, @"Error saving context: %@\n%@", [error localizedDescription], [error userInfo]);
  }
  
  NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Human"];
  [request setPredicate:[NSPredicate predicateWithFormat:@"ANY pets.name == 'Ally'"]];
  [request setSortDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:@"name" ascending:true]]];
  //[request setRelationshipKeyPathsForPrefetching:@[@"owner"]];
  
  NSError *error2 = nil;
  NSArray<Human *> *results = [appDelegate.managedObjectContext executeFetchRequest:request error:&error2];
  
  if (!results) {
    NSLog(@"Error fetching Employee objects: %@\n%@", [error2 localizedDescription], [error2 userInfo]);
    abort();
  }
  NSLog(@"Found %ld", results.count);
  for (Human *human in results) {
    NSLog(@"%@ owns %ld owned pets", human.name, human.pets.count);
  }
  
  // [self otherTest];
  
}

- (void) otherTest {
  AppDelegate * appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
  
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Animal"];
    [request setPredicate:[NSPredicate predicateWithFormat:@"owner.name == 'Ryan' AND species.type == 'Goat'"]];
    [request setSortDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:@"name" ascending:true]]];
  
    NSError *error2 = nil;
    NSArray<Animal *> *results = [appDelegate.managedObjectContext executeFetchRequest:request error:&error2];
  
    if (!results) {
      NSLog(@"Error fetching Employee objects: %@\n%@", [error2 localizedDescription], [error2 userInfo]);
      abort();
    }
    NSLog(@"Found %ld", results.count);
    for (Animal *animal in results) {
  
      NSLog(@"%@ named %@ owned by %@", animal.species.type, animal.name, animal.owner.name);
    }
}

- (void) testArchiving {
    Person *person = [Person new];
    person.firstName = @"Liam";
    person.lastName = @"Williams";
    person.idNumber = @15;
  
    NSData *archive = [NSKeyedArchiver archivedDataWithRootObject:person];
    [[NSUserDefaults standardUserDefaults] setObject:archive forKey:@"Person"];
  
    NSData *unarchive = [[NSUserDefaults standardUserDefaults] objectForKey:@"Person"];
  
    Person *person2 = [NSKeyedUnarchiver unarchiveObjectWithData:unarchive];
  
    NSLog(@"%@ %@ %@", person2.idNumber, person2.firstName, person2.lastName);
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
