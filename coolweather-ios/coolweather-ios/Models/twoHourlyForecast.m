//
//  twoHourlyForecast.m
//
//  Created by  黄孔慧 on 17/1/5
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "twoHourlyForecast.h"
#import "twoWind.h"
#import "twoCond.h"


NSString *const ktwoHourlyForecastWind = @"wind";
NSString *const ktwoHourlyForecastPres = @"pres";
NSString *const ktwoHourlyForecastHum = @"hum";
NSString *const ktwoHourlyForecastDate = @"date";
NSString *const ktwoHourlyForecastCond = @"cond";
NSString *const ktwoHourlyForecastPop = @"pop";
NSString *const ktwoHourlyForecastTmp = @"tmp";


@interface twoHourlyForecast ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation twoHourlyForecast

@synthesize wind = _wind;
@synthesize pres = _pres;
@synthesize hum = _hum;
@synthesize date = _date;
@synthesize cond = _cond;
@synthesize pop = _pop;
@synthesize tmp = _tmp;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.wind = [twoWind modelObjectWithDictionary:[dict objectForKey:ktwoHourlyForecastWind]];
            self.pres = [self objectOrNilForKey:ktwoHourlyForecastPres fromDictionary:dict];
            self.hum = [self objectOrNilForKey:ktwoHourlyForecastHum fromDictionary:dict];
            self.date = [self objectOrNilForKey:ktwoHourlyForecastDate fromDictionary:dict];
            self.cond = [twoCond modelObjectWithDictionary:[dict objectForKey:ktwoHourlyForecastCond]];
            self.pop = [self objectOrNilForKey:ktwoHourlyForecastPop fromDictionary:dict];
            self.tmp = [self objectOrNilForKey:ktwoHourlyForecastTmp fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.wind dictionaryRepresentation] forKey:ktwoHourlyForecastWind];
    [mutableDict setValue:self.pres forKey:ktwoHourlyForecastPres];
    [mutableDict setValue:self.hum forKey:ktwoHourlyForecastHum];
    [mutableDict setValue:self.date forKey:ktwoHourlyForecastDate];
    [mutableDict setValue:[self.cond dictionaryRepresentation] forKey:ktwoHourlyForecastCond];
    [mutableDict setValue:self.pop forKey:ktwoHourlyForecastPop];
    [mutableDict setValue:self.tmp forKey:ktwoHourlyForecastTmp];

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

    self.wind = [aDecoder decodeObjectForKey:ktwoHourlyForecastWind];
    self.pres = [aDecoder decodeObjectForKey:ktwoHourlyForecastPres];
    self.hum = [aDecoder decodeObjectForKey:ktwoHourlyForecastHum];
    self.date = [aDecoder decodeObjectForKey:ktwoHourlyForecastDate];
    self.cond = [aDecoder decodeObjectForKey:ktwoHourlyForecastCond];
    self.pop = [aDecoder decodeObjectForKey:ktwoHourlyForecastPop];
    self.tmp = [aDecoder decodeObjectForKey:ktwoHourlyForecastTmp];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_wind forKey:ktwoHourlyForecastWind];
    [aCoder encodeObject:_pres forKey:ktwoHourlyForecastPres];
    [aCoder encodeObject:_hum forKey:ktwoHourlyForecastHum];
    [aCoder encodeObject:_date forKey:ktwoHourlyForecastDate];
    [aCoder encodeObject:_cond forKey:ktwoHourlyForecastCond];
    [aCoder encodeObject:_pop forKey:ktwoHourlyForecastPop];
    [aCoder encodeObject:_tmp forKey:ktwoHourlyForecastTmp];
}

- (id)copyWithZone:(NSZone *)zone {
    twoHourlyForecast *copy = [[twoHourlyForecast alloc] init];
    
    
    
    if (copy) {

        copy.wind = [self.wind copyWithZone:zone];
        copy.pres = [self.pres copyWithZone:zone];
        copy.hum = [self.hum copyWithZone:zone];
        copy.date = [self.date copyWithZone:zone];
        copy.cond = [self.cond copyWithZone:zone];
        copy.pop = [self.pop copyWithZone:zone];
        copy.tmp = [self.tmp copyWithZone:zone];
    }
    
    return copy;
}


@end
