//
//  twoNow.m
//
//  Created by  黄孔慧 on 17/1/5
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "twoNow.h"
#import "twoWind.h"
#import "twoCond.h"


NSString *const ktwoNowWind = @"wind";
NSString *const ktwoNowPres = @"pres";
NSString *const ktwoNowFl = @"fl";
NSString *const ktwoNowHum = @"hum";
NSString *const ktwoNowVis = @"vis";
NSString *const ktwoNowCond = @"cond";
NSString *const ktwoNowPcpn = @"pcpn";
NSString *const ktwoNowTmp = @"tmp";


@interface twoNow ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation twoNow

@synthesize wind = _wind;
@synthesize pres = _pres;
@synthesize fl = _fl;
@synthesize hum = _hum;
@synthesize vis = _vis;
@synthesize cond = _cond;
@synthesize pcpn = _pcpn;
@synthesize tmp = _tmp;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.wind = [twoWind modelObjectWithDictionary:[dict objectForKey:ktwoNowWind]];
            self.pres = [self objectOrNilForKey:ktwoNowPres fromDictionary:dict];
            self.fl = [self objectOrNilForKey:ktwoNowFl fromDictionary:dict];
            self.hum = [self objectOrNilForKey:ktwoNowHum fromDictionary:dict];
            self.vis = [self objectOrNilForKey:ktwoNowVis fromDictionary:dict];
            self.cond = [twoCond modelObjectWithDictionary:[dict objectForKey:ktwoNowCond]];
            self.pcpn = [self objectOrNilForKey:ktwoNowPcpn fromDictionary:dict];
            self.tmp = [self objectOrNilForKey:ktwoNowTmp fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.wind dictionaryRepresentation] forKey:ktwoNowWind];
    [mutableDict setValue:self.pres forKey:ktwoNowPres];
    [mutableDict setValue:self.fl forKey:ktwoNowFl];
    [mutableDict setValue:self.hum forKey:ktwoNowHum];
    [mutableDict setValue:self.vis forKey:ktwoNowVis];
    [mutableDict setValue:[self.cond dictionaryRepresentation] forKey:ktwoNowCond];
    [mutableDict setValue:self.pcpn forKey:ktwoNowPcpn];
    [mutableDict setValue:self.tmp forKey:ktwoNowTmp];

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

    self.wind = [aDecoder decodeObjectForKey:ktwoNowWind];
    self.pres = [aDecoder decodeObjectForKey:ktwoNowPres];
    self.fl = [aDecoder decodeObjectForKey:ktwoNowFl];
    self.hum = [aDecoder decodeObjectForKey:ktwoNowHum];
    self.vis = [aDecoder decodeObjectForKey:ktwoNowVis];
    self.cond = [aDecoder decodeObjectForKey:ktwoNowCond];
    self.pcpn = [aDecoder decodeObjectForKey:ktwoNowPcpn];
    self.tmp = [aDecoder decodeObjectForKey:ktwoNowTmp];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_wind forKey:ktwoNowWind];
    [aCoder encodeObject:_pres forKey:ktwoNowPres];
    [aCoder encodeObject:_fl forKey:ktwoNowFl];
    [aCoder encodeObject:_hum forKey:ktwoNowHum];
    [aCoder encodeObject:_vis forKey:ktwoNowVis];
    [aCoder encodeObject:_cond forKey:ktwoNowCond];
    [aCoder encodeObject:_pcpn forKey:ktwoNowPcpn];
    [aCoder encodeObject:_tmp forKey:ktwoNowTmp];
}

- (id)copyWithZone:(NSZone *)zone {
    twoNow *copy = [[twoNow alloc] init];
    
    
    
    if (copy) {

        copy.wind = [self.wind copyWithZone:zone];
        copy.pres = [self.pres copyWithZone:zone];
        copy.fl = [self.fl copyWithZone:zone];
        copy.hum = [self.hum copyWithZone:zone];
        copy.vis = [self.vis copyWithZone:zone];
        copy.cond = [self.cond copyWithZone:zone];
        copy.pcpn = [self.pcpn copyWithZone:zone];
        copy.tmp = [self.tmp copyWithZone:zone];
    }
    
    return copy;
}


@end
