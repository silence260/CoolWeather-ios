//
//  twoAstro.m
//
//  Created by  黄孔慧 on 17/1/5
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "twoAstro.h"


NSString *const ktwoAstroMs = @"ms";
NSString *const ktwoAstroMr = @"mr";
NSString *const ktwoAstroSs = @"ss";
NSString *const ktwoAstroSr = @"sr";


@interface twoAstro ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation twoAstro

@synthesize ms = _ms;
@synthesize mr = _mr;
@synthesize ss = _ss;
@synthesize sr = _sr;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.ms = [self objectOrNilForKey:ktwoAstroMs fromDictionary:dict];
            self.mr = [self objectOrNilForKey:ktwoAstroMr fromDictionary:dict];
            self.ss = [self objectOrNilForKey:ktwoAstroSs fromDictionary:dict];
            self.sr = [self objectOrNilForKey:ktwoAstroSr fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.ms forKey:ktwoAstroMs];
    [mutableDict setValue:self.mr forKey:ktwoAstroMr];
    [mutableDict setValue:self.ss forKey:ktwoAstroSs];
    [mutableDict setValue:self.sr forKey:ktwoAstroSr];

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

    self.ms = [aDecoder decodeObjectForKey:ktwoAstroMs];
    self.mr = [aDecoder decodeObjectForKey:ktwoAstroMr];
    self.ss = [aDecoder decodeObjectForKey:ktwoAstroSs];
    self.sr = [aDecoder decodeObjectForKey:ktwoAstroSr];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_ms forKey:ktwoAstroMs];
    [aCoder encodeObject:_mr forKey:ktwoAstroMr];
    [aCoder encodeObject:_ss forKey:ktwoAstroSs];
    [aCoder encodeObject:_sr forKey:ktwoAstroSr];
}

- (id)copyWithZone:(NSZone *)zone {
    twoAstro *copy = [[twoAstro alloc] init];
    
    
    
    if (copy) {

        copy.ms = [self.ms copyWithZone:zone];
        copy.mr = [self.mr copyWithZone:zone];
        copy.ss = [self.ss copyWithZone:zone];
        copy.sr = [self.sr copyWithZone:zone];
    }
    
    return copy;
}


@end
