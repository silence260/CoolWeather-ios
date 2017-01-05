//
//  twoWind.h
//
//  Created by  黄孔慧 on 17/1/5
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface twoWind : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *dir;
@property (nonatomic, strong) NSString *deg;
@property (nonatomic, strong) NSString *sc;
@property (nonatomic, strong) NSString *spd;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
