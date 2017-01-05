//
//  twoDailyForecast.h
//
//  Created by  黄孔慧 on 17/1/5
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class twoWind, twoAstro, twoCond, twoTmp;

@interface twoDailyForecast : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) twoWind *wind;
@property (nonatomic, strong) twoAstro *astro;
@property (nonatomic, strong) NSString *pres;
@property (nonatomic, strong) NSString *pcpn;
@property (nonatomic, strong) NSString *uv;
@property (nonatomic, strong) NSString *hum;
@property (nonatomic, strong) NSString *date;
@property (nonatomic, strong) NSString *vis;
@property (nonatomic, strong) NSString *pop;
@property (nonatomic, strong) twoCond *cond;
@property (nonatomic, strong) twoTmp *tmp;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
