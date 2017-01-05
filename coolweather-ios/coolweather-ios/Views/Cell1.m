//
//  Cell1.m
//  coolweather-ios
//
//  Created by silence on 17/1/5.
//  Copyright © 2017年 silence. All rights reserved.
//

#import "Cell1.h"


@implementation Cell1

- (void) layoutSubviews
{
    [super layoutSubviews];

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

        UILabel *uilabel =[[UILabel alloc] init];
        [uilabel setFrame:CGRectMake(20, 0, wight-40, 60)];
        uilabel.font = [UIFont systemFontOfSize:46];
        uilabel.textAlignment = NSTextAlignmentRight;
        [uilabel setTextColor:[UIColor whiteColor]];

        UILabel *uilabel2 =[[UILabel alloc] init];
        [uilabel2 setFrame:CGRectMake(20, 60, wight-40, 30)];
        uilabel2.font = [UIFont systemFontOfSize:15];
        [uilabel2 setTextColor:[UIColor whiteColor]];
        uilabel2.textAlignment = NSTextAlignmentRight;

        [self.contentView addSubview:view];
        [self.contentView addSubview:uilabel];
        [self.contentView addSubview:uilabel2];
        
        self.dateLabel1 = uilabel;
        self.dateLabel2 = uilabel2;
    }
    return self;
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
