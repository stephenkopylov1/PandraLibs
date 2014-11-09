//
//  BasicContextManager.m
//  Piquadro
//
//  Created by Admin on 09.11.14.
//  Copyright (c) 2014 Pandra. All rights reserved.
//

#import "BasicContextManager.h"

@implementation BasicContextManager
static id shared = nil;
+ (instancetype)sharedInstance {
    static dispatch_once_t pred;
    dispatch_once(&pred, ^{
        shared = [(BasicContextManager *) [super alloc] initUniqueInstance];
    });
    return shared;
}

- (instancetype)initUniqueInstance {
    self.mainContext = [[CoredataManager sharedInstance] managedObjectContext];
    return (BasicContextManager *) [super init];
}

- (NSManagedObjectContext *)getMainContext {
    //lmAppDelegate *currentDelegate = (lmAppDelegate *) [[UIApplication sharedApplication] delegate];
    return self.mainContext;
}
@end
