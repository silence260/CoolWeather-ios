//
//  twoUpdate.h
//
//  Created by  黄孔慧 on 17/1/5
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface twoUpdate : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *loc;
@property (nonatomic, strong) NSString *utc;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
