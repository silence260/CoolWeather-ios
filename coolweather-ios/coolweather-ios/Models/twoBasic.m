//
//  twoBasic.m
//
//  Created by  黄孔慧 on 17/1/5
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "twoBasic.h"
#import "twoUpdate.h"


NSString *const ktwoBasicId = @"id";
NSString *const ktwoBasicLat = @"lat";
NSString *const ktwoBasicCnty = @"cnty";
NSString *const ktwoBasicCity = @"city";
NSString *const ktwoBasicLon = @"lon";
NSString *const ktwoBasicUpdate = @"update";


@interface twoBasic ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation twoBasic

@synthesize basicIdentifier = _basicIdentifier;
@synthesize lat = _lat;
@synthesize cnty = _cnty;
@synthesize city = _city;
@synthesize lon = _lon;
@synthesize update = _update;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.basicIdentifier = [self objectOrNilForKey:ktwoBasicId fromDictionary:dict];
            self.lat = [self objectOrNilForKey:ktwoBasicLat fromDictionary:dict];
            self.cnty = [self objectOrNilForKey:ktwoBasicCnty fromDictionary:dict];
            self.city = [self objectOrNilForKey:ktwoBasicCity fromDictionary:dict];
            self.lon = [self objectOrNilForKey:ktwoBasicLon fromDictionary:dict];
            self.update = [twoUpdate modelObjectWithDictionary:[dict objectForKey:ktwoBasicUpdate]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.basicIdentifier forKey:ktwoBasicId];
    [mutableDict setValue:self.lat forKey:ktwoBasicLat];
    [mutableDict setValue:self.cnty forKey:ktwoBasicCnty];
    [mutableDict setValue:self.city forKey:ktwoBasicCity];
    [mutableDict setValue:self.lon forKey:ktwoBasicLon];
    [mutableDict setValue:[self.update dictionaryRepresentation] forKey:ktwoBasicUpdate];

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

    self.basicIdentifier = [aDecoder decodeObjectForKey:ktwoBasicId];
    self.lat = [aDecoder decodeObjectForKey:ktwoBasicLat];
    self.cnty = [aDecoder decodeObjectForKey:ktwoBasicCnty];
    self.city = [aDecoder decodeObjectForKey:ktwoBasicCity];
    self.lon = [aDecoder decodeObjectForKey:ktwoBasicLon];
    self.update = [aDecoder decodeObjectForKey:ktwoBasicUpdate];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_basicIdentifier forKey:ktwoBasicId];
    [aCoder encodeObject:_lat forKey:ktwoBasicLat];
    [aCoder encodeObject:_cnty forKey:ktwoBasicCnty];
    [aCoder encodeObject:_city forKey:ktwoBasicCity];
    [aCoder encodeObject:_lon forKey:ktwoBasicLon];
    [aCoder encodeObject:_update forKey:ktwoBasicUpdate];
}

- (id)copyWithZone:(NSZone *)zone {
    twoBasic *copy = [[twoBasic alloc] init];
    
    
    
    if (copy) {

        copy.basicIdentifier = [self.basicIdentifier copyWithZone:zone];
        copy.lat = [self.lat copyWithZone:zone];
        copy.cnty = [self.cnty copyWithZone:zone];
        copy.city = [self.city copyWithZone:zone];
        copy.lon = [self.lon copyWithZone:zone];
        copy.update = [self.update copyWithZone:zone];
    }
    
    return copy;
}


@end
