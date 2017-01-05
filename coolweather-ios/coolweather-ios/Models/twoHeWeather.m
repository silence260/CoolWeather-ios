//
//  twoHeWeather.m
//
//  Created by  黄孔慧 on 17/1/5
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "twoHeWeather.h"
#import "twoHourlyForecast.h"
#import "twoNow.h"
#import "twoDailyForecast.h"
#import "twoAqi.h"
#import "twoBasic.h"
#import "twoSuggestion.h"


NSString *const ktwoHeWeatherStatus = @"status";
NSString *const ktwoHeWeatherHourlyForecast = @"hourly_forecast";
NSString *const ktwoHeWeatherNow = @"now";
NSString *const ktwoHeWeatherDailyForecast = @"daily_forecast";
NSString *const ktwoHeWeatherAqi = @"aqi";
NSString *const ktwoHeWeatherBasic = @"basic";
NSString *const ktwoHeWeatherSuggestion = @"suggestion";


@interface twoHeWeather ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation twoHeWeather

@synthesize status = _status;
@synthesize hourlyForecast = _hourlyForecast;
@synthesize now = _now;
@synthesize dailyForecast = _dailyForecast;
@synthesize aqi = _aqi;
@synthesize basic = _basic;
@synthesize suggestion = _suggestion;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.status = [self objectOrNilForKey:ktwoHeWeatherStatus fromDictionary:dict];
    NSObject *receivedtwoHourlyForecast = [dict objectForKey:ktwoHeWeatherHourlyForecast];
    NSMutableArray *parsedtwoHourlyForecast = [NSMutableArray array];
    
    if ([receivedtwoHourlyForecast isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedtwoHourlyForecast) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedtwoHourlyForecast addObject:[twoHourlyForecast modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedtwoHourlyForecast isKindOfClass:[NSDictionary class]]) {
       [parsedtwoHourlyForecast addObject:[twoHourlyForecast modelObjectWithDictionary:(NSDictionary *)receivedtwoHourlyForecast]];
    }

    self.hourlyForecast = [NSArray arrayWithArray:parsedtwoHourlyForecast];
            self.now = [twoNow modelObjectWithDictionary:[dict objectForKey:ktwoHeWeatherNow]];
    NSObject *receivedtwoDailyForecast = [dict objectForKey:ktwoHeWeatherDailyForecast];
    NSMutableArray *parsedtwoDailyForecast = [NSMutableArray array];
    
    if ([receivedtwoDailyForecast isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedtwoDailyForecast) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedtwoDailyForecast addObject:[twoDailyForecast modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedtwoDailyForecast isKindOfClass:[NSDictionary class]]) {
       [parsedtwoDailyForecast addObject:[twoDailyForecast modelObjectWithDictionary:(NSDictionary *)receivedtwoDailyForecast]];
    }

    self.dailyForecast = [NSArray arrayWithArray:parsedtwoDailyForecast];
            self.aqi = [twoAqi modelObjectWithDictionary:[dict objectForKey:ktwoHeWeatherAqi]];
            self.basic = [twoBasic modelObjectWithDictionary:[dict objectForKey:ktwoHeWeatherBasic]];
            self.suggestion = [twoSuggestion modelObjectWithDictionary:[dict objectForKey:ktwoHeWeatherSuggestion]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.status forKey:ktwoHeWeatherStatus];
    NSMutableArray *tempArrayForHourlyForecast = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.hourlyForecast) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForHourlyForecast addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForHourlyForecast addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForHourlyForecast] forKey:ktwoHeWeatherHourlyForecast];
    [mutableDict setValue:[self.now dictionaryRepresentation] forKey:ktwoHeWeatherNow];
    NSMutableArray *tempArrayForDailyForecast = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.dailyForecast) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForDailyForecast addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForDailyForecast addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForDailyForecast] forKey:ktwoHeWeatherDailyForecast];
    [mutableDict setValue:[self.aqi dictionaryRepresentation] forKey:ktwoHeWeatherAqi];
    [mutableDict setValue:[self.basic dictionaryRepresentation] forKey:ktwoHeWeatherBasic];
    [mutableDict setValue:[self.suggestion dictionaryRepresentation] forKey:ktwoHeWeatherSuggestion];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description  {
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict {
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];

    self.status = [aDecoder decodeObjectForKey:ktwoHeWeatherStatus];
    self.hourlyForecast = [aDecoder decodeObjectForKey:ktwoHeWeatherHourlyForecast];
    self.now = [aDecoder decodeObjectForKey:ktwoHeWeatherNow];
    self.dailyForecast = [aDecoder decodeObjectForKey:ktwoHeWeatherDailyForecast];
    self.aqi = [aDecoder decodeObjectForKey:ktwoHeWeatherAqi];
    self.basic = [aDecoder decodeObjectForKey:ktwoHeWeatherBasic];
    self.suggestion = [aDecoder decodeObjectForKey:ktwoHeWeatherSuggestion];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_status forKey:ktwoHeWeatherStatus];
    [aCoder encodeObject:_hourlyForecast forKey:ktwoHeWeatherHourlyForecast];
    [aCoder encodeObject:_now forKey:ktwoHeWeatherNow];
    [aCoder encodeObject:_dailyForecast forKey:ktwoHeWeatherDailyForecast];
    [aCoder encodeObject:_aqi forKey:ktwoHeWeatherAqi];
    [aCoder encodeObject:_basic forKey:ktwoHeWeatherBasic];
    [aCoder encodeObject:_suggestion forKey:ktwoHeWeatherSuggestion];
}

- (id)copyWithZone:(NSZone *)zone {
    twoHeWeather *copy = [[twoHeWeather alloc] init];
    
    
    
    if (copy) {

        copy.status = [self.status copyWithZone:zone];
        copy.hourlyForecast = [self.hourlyForecast copyWithZone:zone];
        copy.now = [self.now copyWithZone:zone];
        copy.dailyForecast = [self.dailyForecast copyWithZone:zone];
        copy.aqi = [self.aqi copyWithZone:zone];
        copy.basic = [self.basic copyWithZone:zone];
        copy.suggestion = [self.suggestion copyWithZone:zone];
    }
    
    return copy;
}


@end
