//
//  BasicSaver.m
//  Dirtygram
//
//  Created by Admin on 25.10.14.
//  Copyright (c) 2014 Pandra. All rights reserved.
//

#import "BasicSaver.h"

@implementation BasicSaver{
    NSMutableArray* objectsForSave;
}
-(instancetype)init{
    self.syncer = [BasicSyncer sharedInstance];
    return [super init];
}

-(void)saveObjects:(id)objects withCallback:(void (^)(NSMutableArray *ids))callback{
    objectsForSave = objects;
    [self startMultithreadContextOperationWithCallback:^(NSMutableArray *ids) {
        callback(ids);
    }];
}

-(NSMutableArray *)performOperationInContext:(NSManagedObjectContext *)context{
    return [self performSaving:objectsForSave inContext:context];
}

-(NSMutableArray*)performSaving:(id)objects inContext:(NSManagedObjectContext*)context{
    return nil;
}
@end
