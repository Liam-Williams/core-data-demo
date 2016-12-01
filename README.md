# Persistence & Core Data Relationships Demo
Lighthouse Labs Demo on Persistence & Core Data Relationships

We looked at persistence and explored more advanced methods of persistence.

## Archiving
Any object that conforms to NSCoding can be "archived" to disk as a file and "unarchived" later from said file. When conforming to NSCoding, a class must implement two methods: initWithCoder: to initialize a new object during decoding, and encodeWithCoder: to, well, encode properties that can be retrieved later from the archive. NSCoder is the class responsible for encoding and decoding. It is an abstract class but we have two concrete subclasses that we can use: NSKeyedArchiver and NSKeyedUnarchiver.

## Keychain
We also mentioned KeyChain for storing secure values like or tokens, keys

## Core Data
We reviewed a basic fetch request and how Core Data doesn't load the objects into memory until you try and access them.

We looked at relationships in Core Data. We looked deeper into setting up relationships between entities and how we can query across them. Relationship types 1 - 1, 1 - Many, Many - Many. This is what makes CoreData so powerful.

We touched on the risks and what to watch out for in versioning and migrating CoreData schemas

## Slides
https://drive.google.com/open?id=0B0pu9Lb4SfWYcnV6UDRSc3BtVkE

## References
1. Here is a reference point in the Apple Docs, good for the basics of CoreData usage. https://developer.apple.com/library/content/documentation/Cocoa/Conceptual/CoreData/FetchingObjects.html#//apple_ref/doc/uid/TP40001075-CH6-SW1
2. And on relationships: https://developer.apple.com/library/content/documentation/Cocoa/Conceptual/CoreData/HowManagedObjectsarerelated.html http://ios-compass.lighthouselabs.ca/days/w4d4/activities/119
