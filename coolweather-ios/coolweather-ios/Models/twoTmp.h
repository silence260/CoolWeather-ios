//
//  twoTmp.h
//
//  Created by  黄孔慧 on 17/1/5
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface twoTmp : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *max;
@property (nonatomic, strong) NSString *min;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
