//
//  twoBasic.h
//
//  Created by  黄孔慧 on 17/1/5
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class twoUpdate;

@interface twoBasic : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *basicIdentifier;
@property (nonatomic, strong) NSString *lat;
@property (nonatomic, strong) NSString *cnty;
@property (nonatomic, strong) NSString *city;
@property (nonatomic, strong) NSString *lon;
@property (nonatomic, strong) twoUpdate *update;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
