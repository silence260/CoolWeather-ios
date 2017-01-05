//
//  twoSuggestion.m
//
//  Created by  黄孔慧 on 17/1/5
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "twoSuggestion.h"
#import "twoDrsg.h"
#import "twoSport.h"
#import "twoFlu.h"
#import "twoAir.h"
#import "twoTrav.h"
#import "twoCw.h"
#import "twoComf.h"
#import "twoUv.h"


NSString *const ktwoSuggestionDrsg = @"drsg";
NSString *const ktwoSuggestionSport = @"sport";
NSString *const ktwoSuggestionFlu = @"flu";
NSString *const ktwoSuggestionAir = @"air";
NSString *const ktwoSuggestionTrav = @"trav";
NSString *const ktwoSuggestionCw = @"cw";
NSString *const ktwoSuggestionComf = @"comf";
NSString *const ktwoSuggestionUv = @"uv";


@interface twoSuggestion ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation twoSuggestion

@synthesize drsg = _drsg;
@synthesize sport = _sport;
@synthesize flu = _flu;
@synthesize air = _air;
@synthesize trav = _trav;
@synthesize cw = _cw;
@synthesize comf = _comf;
@synthesize uv = _uv;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.drsg = [twoDrsg modelObjectWithDictionary:[dict objectForKey:ktwoSuggestionDrsg]];
            self.sport = [twoSport modelObjectWithDictionary:[dict objectForKey:ktwoSuggestionSport]];
            self.flu = [twoFlu modelObjectWithDictionary:[dict objectForKey:ktwoSuggestionFlu]];
            self.air = [twoAir modelObjectWithDictionary:[dict objectForKey:ktwoSuggestionAir]];
            self.trav = [twoTrav modelObjectWithDictionary:[dict objectForKey:ktwoSuggestionTrav]];
            self.cw = [twoCw modelObjectWithDictionary:[dict objectForKey:ktwoSuggestionCw]];
            self.comf = [twoComf modelObjectWithDictionary:[dict objectForKey:ktwoSuggestionComf]];
            self.uv = [twoUv modelObjectWithDictionary:[dict objectForKey:ktwoSuggestionUv]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.drsg dictionaryRepresentation] forKey:ktwoSuggestionDrsg];
    [mutableDict setValue:[self.sport dictionaryRepresentation] forKey:ktwoSuggestionSport];
    [mutableDict setValue:[self.flu dictionaryRepresentation] forKey:ktwoSuggestionFlu];
    [mutableDict setValue:[self.air dictionaryRepresentation] forKey:ktwoSuggestionAir];
    [mutableDict setValue:[self.trav dictionaryRepresentation] forKey:ktwoSuggestionTrav];
    [mutableDict setValue:[self.cw dictionaryRepresentation] forKey:ktwoSuggestionCw];
    [mutableDict setValue:[self.comf dictionaryRepresentation] forKey:ktwoSuggestionComf];
    [mutableDict setValue:[self.uv dictionaryRepresentation] forKey:ktwoSuggestionUv];

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

    self.drsg = [aDecoder decodeObjectForKey:ktwoSuggestionDrsg];
    self.sport = [aDecoder decodeObjectForKey:ktwoSuggestionSport];
    self.flu = [aDecoder decodeObjectForKey:ktwoSuggestionFlu];
    self.air = [aDecoder decodeObjectForKey:ktwoSuggestionAir];
    self.trav = [aDecoder decodeObjectForKey:ktwoSuggestionTrav];
    self.cw = [aDecoder decodeObjectForKey:ktwoSuggestionCw];
    self.comf = [aDecoder decodeObjectForKey:ktwoSuggestionComf];
    self.uv = [aDecoder decodeObjectForKey:ktwoSuggestionUv];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_drsg forKey:ktwoSuggestionDrsg];
    [aCoder encodeObject:_sport forKey:ktwoSuggestionSport];
    [aCoder encodeObject:_flu forKey:ktwoSuggestionFlu];
    [aCoder encodeObject:_air forKey:ktwoSuggestionAir];
    [aCoder encodeObject:_trav forKey:ktwoSuggestionTrav];
    [aCoder encodeObject:_cw forKey:ktwoSuggestionCw];
    [aCoder encodeObject:_comf forKey:ktwoSuggestionComf];
    [aCoder encodeObject:_uv forKey:ktwoSuggestionUv];
}

- (id)copyWithZone:(NSZone *)zone {
    twoSuggestion *copy = [[twoSuggestion alloc] init];
    
    
    
    if (copy) {

        copy.drsg = [self.drsg copyWithZone:zone];
        copy.sport = [self.sport copyWithZone:zone];
        copy.flu = [self.flu copyWithZone:zone];
        copy.air = [self.air copyWithZone:zone];
        copy.trav = [self.trav copyWithZone:zone];
        copy.cw = [self.cw copyWithZone:zone];
        copy.comf = [self.comf copyWithZone:zone];
        copy.uv = [self.uv copyWithZone:zone];
    }
    
    return copy;
}


@end
