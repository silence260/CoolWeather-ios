//
//  twoWind.m
//
//  Created by  黄孔慧 on 17/1/5
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "twoWind.h"


NSString *const ktwoWindDir = @"dir";
NSString *const ktwoWindDeg = @"deg";
NSString *const ktwoWindSc = @"sc";
NSString *const ktwoWindSpd = @"spd";


@interface twoWind ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation twoWind

@synthesize dir = _dir;
@synthesize deg = _deg;
@synthesize sc = _sc;
@synthesize spd = _spd;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.dir = [self objectOrNilForKey:ktwoWindDir fromDictionary:dict];
            self.deg = [self objectOrNilForKey:ktwoWindDeg fromDictionary:dict];
            self.sc = [self objectOrNilForKey:ktwoWindSc fromDictionary:dict];
            self.spd = [self objectOrNilForKey:ktwoWindSpd fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.dir forKey:ktwoWindDir];
    [mutableDict setValue:self.deg forKey:ktwoWindDeg];
    [mutableDict setValue:self.sc forKey:ktwoWindSc];
    [mutableDict setValue:self.spd forKey:ktwoWindSpd];

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

    self.dir = [aDecoder decodeObjectForKey:ktwoWindDir];
    self.deg = [aDecoder decodeObjectForKey:ktwoWindDeg];
    self.sc = [aDecoder decodeObjectForKey:ktwoWindSc];
    self.spd = [aDecoder decodeObjectForKey:ktwoWindSpd];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_dir forKey:ktwoWindDir];
    [aCoder encodeObject:_deg forKey:ktwoWindDeg];
    [aCoder encodeObject:_sc forKey:ktwoWindSc];
    [aCoder encodeObject:_spd forKey:ktwoWindSpd];
}

- (id)copyWithZone:(NSZone *)zone {
    twoWind *copy = [[twoWind alloc] init];
    
    
    
    if (copy) {

        copy.dir = [self.dir copyWithZone:zone];
        copy.deg = [self.deg copyWithZone:zone];
        copy.sc = [self.sc copyWithZone:zone];
        copy.spd = [self.spd copyWithZone:zone];
    }
    
    return copy;
}


@end
