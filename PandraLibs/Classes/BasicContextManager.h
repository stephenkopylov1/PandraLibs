//
//  BasicContextManager.h
//  Piquadro
//
//  Created by Admin on 09.11.14.
//  Copyright (c) 2014 Pandra. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "BasicCoredataManager.h"

@interface BasicContextManager : NSObject
+ (instancetype)sharedInstance;

+ (instancetype)alloc __attribute__((unavailable("alloc not available, call sharedInstance instead")));

- (instancetype)init __attribute__((unavailable("init not available, call sharedInstance instead")));

+ (instancetype)new __attribute__((unavailable("new not available, call sharedInstance instead")));

@property (readwrite) NSManagedObjectContext *mainContext;
- (NSManagedObjectContext *)getMainContext;
@end
