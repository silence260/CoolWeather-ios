//
//  twoCond.m
//
//  Created by  黄孔慧 on 17/1/5
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "twoCond.h"


NSString *const ktwoCondCode = @"code";
NSString *const ktwoCondTxt = @"txt";
NSString *const ktwoCondTxtD = @"txt_d";
NSString *const ktwoCondCodeN = @"code_n";
NSString *const ktwoCondCodeD = @"code_d";
NSString *const ktwoCondTxtN = @"txt_n";


@interface twoCond ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation twoCond

@synthesize code = _code;
@synthesize txt = _txt;
@synthesize txtD = _txtD;
@synthesize codeN = _codeN;
@synthesize codeD = _codeD;
@synthesize txtN = _txtN;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.code = [self objectOrNilForKey:ktwoCondCode fromDictionary:dict];
            self.txt = [self objectOrNilForKey:ktwoCondTxt fromDictionary:dict];
            self.txtD = [self objectOrNilForKey:ktwoCondTxtD fromDictionary:dict];
            self.codeN = [self objectOrNilForKey:ktwoCondCodeN fromDictionary:dict];
            self.codeD = [self objectOrNilForKey:ktwoCondCodeD fromDictionary:dict];
            self.txtN = [self objectOrNilForKey:ktwoCondTxtN fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.code forKey:ktwoCondCode];
    [mutableDict setValue:self.txt forKey:ktwoCondTxt];
    [mutableDict setValue:self.txtD forKey:ktwoCondTxtD];
    [mutableDict setValue:self.codeN forKey:ktwoCondCodeN];
    [mutableDict setValue:self.codeD forKey:ktwoCondCodeD];
    [mutableDict setValue:self.txtN forKey:ktwoCondTxtN];

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

    self.code = [aDecoder decodeObjectForKey:ktwoCondCode];
    self.txt = [aDecoder decodeObjectForKey:ktwoCondTxt];
    self.txtD = [aDecoder decodeObjectForKey:ktwoCondTxtD];
    self.codeN = [aDecoder decodeObjectForKey:ktwoCondCodeN];
    self.codeD = [aDecoder decodeObjectForKey:ktwoCondCodeD];
    self.txtN = [aDecoder decodeObjectForKey:ktwoCondTxtN];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_code forKey:ktwoCondCode];
    [aCoder encodeObject:_txt forKey:ktwoCondTxt];
    [aCoder encodeObject:_txtD forKey:ktwoCondTxtD];
    [aCoder encodeObject:_codeN forKey:ktwoCondCodeN];
    [aCoder encodeObject:_codeD forKey:ktwoCondCodeD];
    [aCoder encodeObject:_txtN forKey:ktwoCondTxtN];
}

- (id)copyWithZone:(NSZone *)zone {
    twoCond *copy = [[twoCond alloc] init];
    
    
    
    if (copy) {

        copy.code = [self.code copyWithZone:zone];
        copy.txt = [self.txt copyWithZone:zone];
        copy.txtD = [self.txtD copyWithZone:zone];
        copy.codeN = [self.codeN copyWithZone:zone];
        copy.codeD = [self.codeD copyWithZone:zone];
        copy.txtN = [self.txtN copyWithZone:zone];
    }
    
    return copy;
}


@end
