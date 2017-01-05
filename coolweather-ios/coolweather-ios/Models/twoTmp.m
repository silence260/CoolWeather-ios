//
//  twoTmp.m
//
//  Created by  黄孔慧 on 17/1/5
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "twoTmp.h"


NSString *const ktwoTmpMax = @"max";
NSString *const ktwoTmpMin = @"min";


@interface twoTmp ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation twoTmp

@synthesize max = _max;
@synthesize min = _min;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.max = [self objectOrNilForKey:ktwoTmpMax fromDictionary:dict];
            self.min = [self objectOrNilForKey:ktwoTmpMin fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.max forKey:ktwoTmpMax];
    [mutableDict setValue:self.min forKey:ktwoTmpMin];

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

    self.max = [aDecoder decodeObjectForKey:ktwoTmpMax];
    self.min = [aDecoder decodeObjectForKey:ktwoTmpMin];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_max forKey:ktwoTmpMax];
    [aCoder encodeObject:_min forKey:ktwoTmpMin];
}

- (id)copyWithZone:(NSZone *)zone {
    twoTmp *copy = [[twoTmp alloc] init];
    
    
    
    if (copy) {

        copy.max = [self.max copyWithZone:zone];
        copy.min = [self.min copyWithZone:zone];
    }
    
    return copy;
}


@end
