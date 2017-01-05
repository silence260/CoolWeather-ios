//
//  Cell4.m
//  coolweather-ios
//
//  Created by silence on 17/1/5.
//  Copyright © 2017年 silence. All rights reserved.
//

#import "Cell4.h"

@implementation Cell4

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseIdentifier];
    if (self)
    {
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
        
        int wight;
        
        if (iPhone6) {
            wight = 375;
        }
        
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(10, 0, wight-20, 60)];
        view.backgroundColor =  [UIColor colorWithRed:((1) / 255.0) green:((1) / 255.0) blue:((1) / 255.0) alpha:(0.4)];
        
        UILabel *uilabel =[[UILabel alloc] init];
        [uilabel setFrame:CGRectMake(20, 0, wight-40, 60)];
        uilabel.font = [UIFont systemFontOfSize:13];
        [uilabel setTextColor:[UIColor whiteColor]];
        uilabel.numberOfLines = 2;
        self.dateLabel = uilabel;

        [self.contentView addSubview:view];

        [self.contentView addSubview:uilabel];
        
        self.dateLabel = uilabel;
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
