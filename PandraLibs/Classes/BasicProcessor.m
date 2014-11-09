//
//  BasicProcessor.m
//  Dirtygram
//
//  Created by Admin on 25.10.14.
//  Copyright (c) 2014 Pandra. All rights reserved.
//

#import "BasicProcessor.h"


@implementation BasicProcessor

-(NSMutableArray*)getObjectsFromIds:(NSMutableArray*)ids{
    NSMutableArray *readyObjects = [[NSMutableArray alloc] init];
    for (int i = 0; i<ids.count; i++) {
        NSManagedObject *currUser = [[[BasicCoredataManager sharedInstance] managedObjectContext] objectWithID:ids[i]];
        [readyObjects addObject:currUser];
    }
    return readyObjects;
}
-(void)linkObjectsWithIds:(NSMutableArray*)ids andCallback:(void (^)(NSMutableArray *ids))callback
{
    [self.linker linkObjects:ids withCallback:^(NSMutableArray *ids) {
        callback(ids);
    }];
}
@end
