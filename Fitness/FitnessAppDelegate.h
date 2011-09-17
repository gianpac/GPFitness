//
//  FitnessAppDelegate.h
//  Fitness
//
//  Created by AKGian on 11-07-08.
//  Copyright 2011 Akaibo. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ToolBarViewController;

@interface FitnessAppDelegate : NSObject <UIApplicationDelegate> {
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet ToolBarViewController *rootViewController;

@property (nonatomic, retain, readonly) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain, readonly) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, retain, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
