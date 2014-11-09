//
//  CoredataManager.h
//  Piquadro
//
//  Created by Stephen Kopylov on 30/10/14.
//  Copyright (c) 2014 Pandra. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CoredataManager : NSObject
@property(nonatomic, retain, readonly) NSManagedObjectModel *managedObjectModel;
@property(nonatomic, retain, readonly) NSManagedObjectContext *managedObjectContext;
@property(nonatomic, retain, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator;
-(void)resetAll;
- (NSURL *)applicationDocumentsDirectory; // nice to have to reference files for core data
@end
