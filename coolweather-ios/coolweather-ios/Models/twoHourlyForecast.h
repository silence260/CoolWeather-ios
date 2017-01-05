//
//  twoHourlyForecast.h
//
//  Created by  黄孔慧 on 17/1/5
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class twoWind, twoCond;

@interface twoHourlyForecast : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) twoWind *wind;
@property (nonatomic, strong) NSString *pres;
@property (nonatomic, strong) NSString *hum;
@property (nonatomic, strong) NSString *date;
@property (nonatomic, strong) twoCond *cond;
@property (nonatomic, strong) NSString *pop;
@property (nonatomic, strong) NSString *tmp;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
