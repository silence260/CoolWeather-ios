//
//  twoModel.m
//
//  Created by  黄孔慧 on 17/1/5
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "twoModel.h"
#import "twoHeWeather.h"


NSString *const ktwoModelHeWeather = @"HeWeather";


@interface twoModel ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation twoModel

@synthesize heWeather = _heWeather;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
    NSObject *receivedtwoHeWeather = [dict objectForKey:ktwoModelHeWeather];
    NSMutableArray *parsedtwoHeWeather = [NSMutableArray array];
    
    if ([receivedtwoHeWeather isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedtwoHeWeather) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedtwoHeWeather addObject:[twoHeWeather modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedtwoHeWeather isKindOfClass:[NSDictionary class]]) {
       [parsedtwoHeWeather addObject:[twoHeWeather modelObjectWithDictionary:(NSDictionary *)receivedtwoHeWeather]];
    }

    self.heWeather = [NSArray arrayWithArray:parsedtwoHeWeather];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForHeWeather = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.heWeather) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForHeWeather addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForHeWeather addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForHeWeather] forKey:ktwoModelHeWeather];

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

    self.heWeather = [aDecoder decodeObjectForKey:ktwoModelHeWeather];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_heWeather forKey:ktwoModelHeWeather];
}

- (id)copyWithZone:(NSZone *)zone {
    twoModel *copy = [[twoModel alloc] init];
    
    
    
    if (copy) {

        copy.heWeather = [self.heWeather copyWithZone:zone];
    }
    
    return copy;
}


@end
