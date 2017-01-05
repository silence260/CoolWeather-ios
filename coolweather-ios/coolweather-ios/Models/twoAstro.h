//
//  twoAstro.h
//
//  Created by  黄孔慧 on 17/1/5
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface twoAstro : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *ms;
@property (nonatomic, strong) NSString *mr;
@property (nonatomic, strong) NSString *ss;
@property (nonatomic, strong) NSString *sr;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
