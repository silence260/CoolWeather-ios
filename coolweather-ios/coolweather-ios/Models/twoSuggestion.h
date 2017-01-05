//
//  twoSuggestion.h
//
//  Created by  黄孔慧 on 17/1/5
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class twoDrsg, twoSport, twoFlu, twoAir, twoTrav, twoCw, twoComf, twoUv;

@interface twoSuggestion : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) twoDrsg *drsg;
@property (nonatomic, strong) twoSport *sport;
@property (nonatomic, strong) twoFlu *flu;
@property (nonatomic, strong) twoAir *air;
@property (nonatomic, strong) twoTrav *trav;
@property (nonatomic, strong) twoCw *cw;
@property (nonatomic, strong) twoComf *comf;
@property (nonatomic, strong) twoUv *uv;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
