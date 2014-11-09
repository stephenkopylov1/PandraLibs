//
//  BasicLinker.m
//  Dirtygram
//
//  Created by Admin on 25.10.14.
//  Copyright (c) 2014 Pandra. All rights reserved.
//

#import "BasicLinker.h"

@implementation BasicLinker{
    NSMutableArray *objectForLink;
}
-(void)linkObjects:(id)objects withCallback:(void (^)(NSMutableArray *ids))callback{
    objectForLink = objects;
    [self startMultithreadContextOperationWithCallback:^(NSMutableArray *ids) {
        callback(ids);
    }];
}

-(NSMutableArray *)performOperationInContext:(NSManagedObjectContext *)context{
    return [self performLinking:objectForLink inContext:context];
}

-(NSMutableArray*)performLinking:(id)objects inContext:(NSManagedObjectContext*)context{
    return nil;
}
@end
