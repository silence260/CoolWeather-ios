//
//  Cell3.m
//  coolweather-ios
//
//  Created by silence on 17/1/5.
//  Copyright © 2017年 silence. All rights reserved.
//

#import "Cell3.h"

@implementation Cell3

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
        
        
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(10, 0, wight-20, 100)];
        view.backgroundColor =  [UIColor colorWithRed:((1) / 255.0) green:((1) / 255.0) blue:((1) / 255.0) alpha:(0.4)];
        
        UILabel *uilabel =[[UILabel alloc] init];
        [uilabel setFrame:CGRectMake(wight/4-40, 0, 80, 70)];
        uilabel.font = [UIFont systemFontOfSize:46];
        [uilabel setTextColor:[UIColor whiteColor]];
        uilabel.textAlignment = NSTextAlignmentCenter;

        self.dateLabel1 = uilabel;
        
        UILabel *uilabel2 =[[UILabel alloc] init];
        [uilabel2 setFrame:CGRectMake(wight*3/4-40, 0, 80, 70)];
        uilabel2.font = [UIFont systemFontOfSize:46];
        uilabel2.textAlignment = NSTextAlignmentCenter;

        [uilabel2 setTextColor:[UIColor whiteColor]];
        
        UILabel *uilabel3 =[[UILabel alloc] init];
        [uilabel3 setFrame:CGRectMake(wight/4-40, 60, 80, 30)];
        uilabel3.font = [UIFont systemFontOfSize:13];
        uilabel3.textAlignment = NSTextAlignmentCenter;

        [uilabel3 setTextColor:[UIColor whiteColor]];
        
        UILabel *uilabel4 =[[UILabel alloc] init];
        [uilabel4 setFrame:CGRectMake(wight*3/4-40, 60, 80, 30)];
        uilabel4.font = [UIFont systemFontOfSize:13];
        uilabel4.textAlignment = NSTextAlignmentCenter;

        [uilabel4 setTextColor:[UIColor whiteColor]];
        
        [self.contentView addSubview:view];

        [self.contentView addSubview:uilabel];
        [self.contentView addSubview:uilabel2];
        [self.contentView addSubview:uilabel3];
        [self.contentView addSubview:uilabel4];

        self.dateLabel1 = uilabel;
        self.dateLabel2 = uilabel2;
        self.dateLabel3 = uilabel3;
        self.dateLabel4 = uilabel4;

    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
