//
//  BasicMTContextProcessor.m
//  Dirtygram
//
//  Created by Admin on 25.10.14.
//  Copyright (c) 2014 Pandra. All rights reserved.
//

#import "BasicMTContextProcessor.h"

@implementation BasicMTContextProcessor
-(void)startMultithreadContextOperationWithCallback:(void (^)(NSMutableArray *ids))callback{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSManagedObjectContext *context = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSPrivateQueueConcurrencyType];
        [context setParentContext:[[[ManagersFactory sharedInstance] contextManager] getMainContext]];
        NSMutableArray *ids = [self performOperationInContext:context];
        [self saveContext:context withCallback:^{
            dispatch_async(dispatch_get_main_queue(), ^{
                callback(ids);
            });
        }];
    });
}
-(NSMutableArray*)performOperationInContext:(NSManagedObjectContext*)context{
    return nil;
}
-(void)saveContext:(NSManagedObjectContext*)context withCallback:(void (^)())callback{
    NSError *error;
    if (![context save:&error])
    {
        NSLog(@"error saving context %@",error);
    }
    [[[[ManagersFactory sharedInstance] contextManager] getMainContext] performBlock:^{
        NSError *error;
        if (![[[[ManagersFactory sharedInstance] contextManager] getMainContext] save:&error])
        {
            NSLog(@"error saving main context %@",error);
        }else{
            callback();
        }
    }];
}
@end
