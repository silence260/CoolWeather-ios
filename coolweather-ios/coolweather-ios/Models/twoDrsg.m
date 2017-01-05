//
//  twoDrsg.m
//
//  Created by  黄孔慧 on 17/1/5
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "twoDrsg.h"


NSString *const ktwoDrsgBrf = @"brf";
NSString *const ktwoDrsgTxt = @"txt";


@interface twoDrsg ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation twoDrsg

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
            self.brf = [self objectOrNilForKey:ktwoDrsgBrf fromDictionary:dict];
            self.txt = [self objectOrNilForKey:ktwoDrsgTxt fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.brf forKey:ktwoDrsgBrf];
    [mutableDict setValue:self.txt forKey:ktwoDrsgTxt];

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

    self.brf = [aDecoder decodeObjectForKey:ktwoDrsgBrf];
    self.txt = [aDecoder decodeObjectForKey:ktwoDrsgTxt];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_brf forKey:ktwoDrsgBrf];
    [aCoder encodeObject:_txt forKey:ktwoDrsgTxt];
}

- (id)copyWithZone:(NSZone *)zone {
    twoDrsg *copy = [[twoDrsg alloc] init];
    
    
    
    if (copy) {

        copy.brf = [self.brf copyWithZone:zone];
        copy.txt = [self.txt copyWithZone:zone];
    }
    
    return copy;
}


@end
