//
//  BasicPostprocessor.m
//  Dirtygram
//
//  Created by Admin on 26.10.14.
//  Copyright (c) 2014 Pandra. All rights reserved.
//

#import "BasicPostprocessor.h"

@implementation BasicPostprocessor{
    NSMutableArray *objectsForProcess;
}

-(void)processObjects:(id)objects withCallback:(void (^)(NSMutableArray *ids))callback{
    objectsForProcess = objects;
    [self startMultithreadContextOperationWithCallback:^(NSMutableArray *ids) {
        callback(ids);
    }];
}
-(NSMutableArray *)performOperationInContext:(NSManagedObjectContext *)context{
      return [self performPostprocessOperation:objectsForProcess inContext:context];
}
-(NSMutableArray*)performPostprocessOperation:(NSMutableArray*)ids inContext:(NSManagedObjectContext*)context{
    return nil;
}
@end
