//
//  twoHeWeather.h
//
//  Created by  黄孔慧 on 17/1/5
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class twoNow, twoAqi, twoBasic, twoSuggestion;

@interface twoHeWeather : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *status;
@property (nonatomic, strong) NSArray *hourlyForecast;
@property (nonatomic, strong) twoNow *now;
@property (nonatomic, strong) NSArray *dailyForecast;
@property (nonatomic, strong) twoAqi *aqi;
@property (nonatomic, strong) twoBasic *basic;
@property (nonatomic, strong) twoSuggestion *suggestion;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
