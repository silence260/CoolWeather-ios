//
//  twoDailyForecast.m
//
//  Created by  黄孔慧 on 17/1/5
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "twoDailyForecast.h"
#import "twoWind.h"
#import "twoAstro.h"
#import "twoCond.h"
#import "twoTmp.h"


NSString *const ktwoDailyForecastWind = @"wind";
NSString *const ktwoDailyForecastAstro = @"astro";
NSString *const ktwoDailyForecastPres = @"pres";
NSString *const ktwoDailyForecastPcpn = @"pcpn";
NSString *const ktwoDailyForecastUv = @"uv";
NSString *const ktwoDailyForecastHum = @"hum";
NSString *const ktwoDailyForecastDate = @"date";
NSString *const ktwoDailyForecastVis = @"vis";
NSString *const ktwoDailyForecastPop = @"pop";
NSString *const ktwoDailyForecastCond = @"cond";
NSString *const ktwoDailyForecastTmp = @"tmp";


@interface twoDailyForecast ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation twoDailyForecast

@synthesize wind = _wind;
@synthesize astro = _astro;
@synthesize pres = _pres;
@synthesize pcpn = _pcpn;
@synthesize uv = _uv;
@synthesize hum = _hum;
@synthesize date = _date;
@synthesize vis = _vis;
@synthesize pop = _pop;
@synthesize cond = _cond;
@synthesize tmp = _tmp;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.wind = [twoWind modelObjectWithDictionary:[dict objectForKey:ktwoDailyForecastWind]];
            self.astro = [twoAstro modelObjectWithDictionary:[dict objectForKey:ktwoDailyForecastAstro]];
            self.pres = [self objectOrNilForKey:ktwoDailyForecastPres fromDictionary:dict];
            self.pcpn = [self objectOrNilForKey:ktwoDailyForecastPcpn fromDictionary:dict];
            self.uv = [self objectOrNilForKey:ktwoDailyForecastUv fromDictionary:dict];
            self.hum = [self objectOrNilForKey:ktwoDailyForecastHum fromDictionary:dict];
            self.date = [self objectOrNilForKey:ktwoDailyForecastDate fromDictionary:dict];
            self.vis = [self objectOrNilForKey:ktwoDailyForecastVis fromDictionary:dict];
            self.pop = [self objectOrNilForKey:ktwoDailyForecastPop fromDictionary:dict];
            self.cond = [twoCond modelObjectWithDictionary:[dict objectForKey:ktwoDailyForecastCond]];
            self.tmp = [twoTmp modelObjectWithDictionary:[dict objectForKey:ktwoDailyForecastTmp]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.wind dictionaryRepresentation] forKey:ktwoDailyForecastWind];
    [mutableDict setValue:[self.astro dictionaryRepresentation] forKey:ktwoDailyForecastAstro];
    [mutableDict setValue:self.pres forKey:ktwoDailyForecastPres];
    [mutableDict setValue:self.pcpn forKey:ktwoDailyForecastPcpn];
    [mutableDict setValue:self.uv forKey:ktwoDailyForecastUv];
    [mutableDict setValue:self.hum forKey:ktwoDailyForecastHum];
    [mutableDict setValue:self.date forKey:ktwoDailyForecastDate];
    [mutableDict setValue:self.vis forKey:ktwoDailyForecastVis];
    [mutableDict setValue:self.pop forKey:ktwoDailyForecastPop];
    [mutableDict setValue:[self.cond dictionaryRepresentation] forKey:ktwoDailyForecastCond];
    [mutableDict setValue:[self.tmp dictionaryRepresentation] forKey:ktwoDailyForecastTmp];

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

    self.wind = [aDecoder decodeObjectForKey:ktwoDailyForecastWind];
    self.astro = [aDecoder decodeObjectForKey:ktwoDailyForecastAstro];
    self.pres = [aDecoder decodeObjectForKey:ktwoDailyForecastPres];
    self.pcpn = [aDecoder decodeObjectForKey:ktwoDailyForecastPcpn];
    self.uv = [aDecoder decodeObjectForKey:ktwoDailyForecastUv];
    self.hum = [aDecoder decodeObjectForKey:ktwoDailyForecastHum];
    self.date = [aDecoder decodeObjectForKey:ktwoDailyForecastDate];
    self.vis = [aDecoder decodeObjectForKey:ktwoDailyForecastVis];
    self.pop = [aDecoder decodeObjectForKey:ktwoDailyForecastPop];
    self.cond = [aDecoder decodeObjectForKey:ktwoDailyForecastCond];
    self.tmp = [aDecoder decodeObjectForKey:ktwoDailyForecastTmp];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_wind forKey:ktwoDailyForecastWind];
    [aCoder encodeObject:_astro forKey:ktwoDailyForecastAstro];
    [aCoder encodeObject:_pres forKey:ktwoDailyForecastPres];
    [aCoder encodeObject:_pcpn forKey:ktwoDailyForecastPcpn];
    [aCoder encodeObject:_uv forKey:ktwoDailyForecastUv];
    [aCoder encodeObject:_hum forKey:ktwoDailyForecastHum];
    [aCoder encodeObject:_date forKey:ktwoDailyForecastDate];
    [aCoder encodeObject:_vis forKey:ktwoDailyForecastVis];
    [aCoder encodeObject:_pop forKey:ktwoDailyForecastPop];
    [aCoder encodeObject:_cond forKey:ktwoDailyForecastCond];
    [aCoder encodeObject:_tmp forKey:ktwoDailyForecastTmp];
}

- (id)copyWithZone:(NSZone *)zone {
    twoDailyForecast *copy = [[twoDailyForecast alloc] init];
    
    
    
    if (copy) {

        copy.wind = [self.wind copyWithZone:zone];
        copy.astro = [self.astro copyWithZone:zone];
        copy.pres = [self.pres copyWithZone:zone];
        copy.pcpn = [self.pcpn copyWithZone:zone];
        copy.uv = [self.uv copyWithZone:zone];
        copy.hum = [self.hum copyWithZone:zone];
        copy.date = [self.date copyWithZone:zone];
        copy.vis = [self.vis copyWithZone:zone];
        copy.pop = [self.pop copyWithZone:zone];
        copy.cond = [self.cond copyWithZone:zone];
        copy.tmp = [self.tmp copyWithZone:zone];
    }
    
    return copy;
}


@end
