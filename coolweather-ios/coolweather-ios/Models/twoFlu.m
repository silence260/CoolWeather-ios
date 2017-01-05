//
//  twoFlu.m
//
//  Created by  黄孔慧 on 17/1/5
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "twoFlu.h"


NSString *const ktwoFluBrf = @"brf";
NSString *const ktwoFluTxt = @"txt";


@interface twoFlu ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation twoFlu

@synthesize brf = _brf;
@synthesize txt = _txt;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.brf = [self objectOrNilForKey:ktwoFluBrf fromDictionary:dict];
            self.txt = [self objectOrNilForKey:ktwoFluTxt fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.brf forKey:ktwoFluBrf];
    [mutableDict setValue:self.txt forKey:ktwoFluTxt];

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

    self.brf = [aDecoder decodeObjectForKey:ktwoFluBrf];
    self.txt = [aDecoder decodeObjectForKey:ktwoFluTxt];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_brf forKey:ktwoFluBrf];
    [aCoder encodeObject:_txt forKey:ktwoFluTxt];
}

- (id)copyWithZone:(NSZone *)zone {
    twoFlu *copy = [[twoFlu alloc] init];
    
    
    
    if (copy) {

        copy.brf = [self.brf copyWithZone:zone];
        copy.txt = [self.txt copyWithZone:zone];
    }
    
    return copy;
}


@end
