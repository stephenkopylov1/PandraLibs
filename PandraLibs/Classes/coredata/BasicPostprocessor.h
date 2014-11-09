//
//  BasicPostprocessor.h
//  Dirtygram
//
//  Created by Admin on 26.10.14.
//  Copyright (c) 2014 Pandra. All rights reserved.
//

#import "BasicMTContextProcessor.h"

@interface BasicPostprocessor : BasicMTContextProcessor
-(void)processObjects:(id)objects withCallback:(void (^)(NSMutableArray *ids))callback;
-(NSMutableArray*)performPostprocessOperation:(NSMutableArray*)ids inContext:(NSManagedObjectContext*)context;
@end
