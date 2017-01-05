//
//  twoCity.h
//
//  Created by  黄孔慧 on 17/1/5
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface twoCity : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *qlty;
@property (nonatomic, strong) NSString *pm25;
@property (nonatomic, strong) NSString *aqi;
@property (nonatomic, strong) NSString *co;
@property (nonatomic, strong) NSString *o3;
@property (nonatomic, strong) NSString *pm10;
@property (nonatomic, strong) NSString *no2;
@property (nonatomic, strong) NSString *so2;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
