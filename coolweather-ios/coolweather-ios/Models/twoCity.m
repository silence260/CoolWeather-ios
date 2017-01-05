//
//  twoCity.m
//
//  Created by  黄孔慧 on 17/1/5
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "twoCity.h"


NSString *const ktwoCityQlty = @"qlty";
NSString *const ktwoCityPm25 = @"pm25";
NSString *const ktwoCityAqi = @"aqi";
NSString *const ktwoCityCo = @"co";
NSString *const ktwoCityO3 = @"o3";
NSString *const ktwoCityPm10 = @"pm10";
NSString *const ktwoCityNo2 = @"no2";
NSString *const ktwoCitySo2 = @"so2";


@interface twoCity ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation twoCity

@synthesize qlty = _qlty;
@synthesize pm25 = _pm25;
@synthesize aqi = _aqi;
@synthesize co = _co;
@synthesize o3 = _o3;
@synthesize pm10 = _pm10;
@synthesize no2 = _no2;
@synthesize so2 = _so2;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.qlty = [self objectOrNilForKey:ktwoCityQlty fromDictionary:dict];
            self.pm25 = [self objectOrNilForKey:ktwoCityPm25 fromDictionary:dict];
            self.aqi = [self objectOrNilForKey:ktwoCityAqi fromDictionary:dict];
            self.co = [self objectOrNilForKey:ktwoCityCo fromDictionary:dict];
            self.o3 = [self objectOrNilForKey:ktwoCityO3 fromDictionary:dict];
            self.pm10 = [self objectOrNilForKey:ktwoCityPm10 fromDictionary:dict];
            self.no2 = [self objectOrNilForKey:ktwoCityNo2 fromDictionary:dict];
            self.so2 = [self objectOrNilForKey:ktwoCitySo2 fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.qlty forKey:ktwoCityQlty];
    [mutableDict setValue:self.pm25 forKey:ktwoCityPm25];
    [mutableDict setValue:self.aqi forKey:ktwoCityAqi];
    [mutableDict setValue:self.co forKey:ktwoCityCo];
    [mutableDict setValue:self.o3 forKey:ktwoCityO3];
    [mutableDict setValue:self.pm10 forKey:ktwoCityPm10];
    [mutableDict setValue:self.no2 forKey:ktwoCityNo2];
    [mutableDict setValue:self.so2 forKey:ktwoCitySo2];

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

    self.qlty = [aDecoder decodeObjectForKey:ktwoCityQlty];
    self.pm25 = [aDecoder decodeObjectForKey:ktwoCityPm25];
    self.aqi = [aDecoder decodeObjectForKey:ktwoCityAqi];
    self.co = [aDecoder decodeObjectForKey:ktwoCityCo];
    self.o3 = [aDecoder decodeObjectForKey:ktwoCityO3];
    self.pm10 = [aDecoder decodeObjectForKey:ktwoCityPm10];
    self.no2 = [aDecoder decodeObjectForKey:ktwoCityNo2];
    self.so2 = [aDecoder decodeObjectForKey:ktwoCitySo2];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_qlty forKey:ktwoCityQlty];
    [aCoder encodeObject:_pm25 forKey:ktwoCityPm25];
    [aCoder encodeObject:_aqi forKey:ktwoCityAqi];
    [aCoder encodeObject:_co forKey:ktwoCityCo];
    [aCoder encodeObject:_o3 forKey:ktwoCityO3];
    [aCoder encodeObject:_pm10 forKey:ktwoCityPm10];
    [aCoder encodeObject:_no2 forKey:ktwoCityNo2];
    [aCoder encodeObject:_so2 forKey:ktwoCitySo2];
}

- (id)copyWithZone:(NSZone *)zone {
    twoCity *copy = [[twoCity alloc] init];
    
    
    
    if (copy) {

        copy.qlty = [self.qlty copyWithZone:zone];
        copy.pm25 = [self.pm25 copyWithZone:zone];
        copy.aqi = [self.aqi copyWithZone:zone];
        copy.co = [self.co copyWithZone:zone];
        copy.o3 = [self.o3 copyWithZone:zone];
        copy.pm10 = [self.pm10 copyWithZone:zone];
        copy.no2 = [self.no2 copyWithZone:zone];
        copy.so2 = [self.so2 copyWithZone:zone];
    }
    
    return copy;
}


@end
