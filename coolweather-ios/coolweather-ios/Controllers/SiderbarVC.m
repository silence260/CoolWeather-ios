//
//  SiderbarVC.m
//  coolweather-ios
//
//  Created by silence on 17/1/5.
//  Copyright © 2017年 silence. All rights reserved.
//

#import "SiderbarVC.h"
#import "AFN_Helper_Z.h"

@interface SiderbarVC ()<UITableViewDelegate, UITableViewDataSource>
{
    NSMutableArray * _dataArr;
}
@property (nonatomic, retain) UITableView *menuTableView;
@end

@implementation SiderbarVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _dataArr = [NSMutableArray array];
    [self loadDataFromNetwork];
    [self mainInit];
}

- (void)mainInit
{
    self.menuTableView = [[UITableView alloc] init ];
    self.menuTableView.backgroundColor = [UIColor clearColor];
    self.menuTableView.scrollIndicatorInsets = UIEdgeInsetsMake(0, 0, 0, 0);
    
    int juliInt;
    int rowHeightInt;
    if (iPhone6P) {
        juliInt = 90;
        rowHeightInt = 54;
    }
    else if (iPhone6){
        juliInt = 85;
        rowHeightInt = 50;
    }
    else if (iPhone5){
        juliInt = 75;
        rowHeightInt = 39;
    }
    else{
        juliInt = 70;
        rowHeightInt = 35;
    }
    self.menuTableView.frame = CGRectMake(0, juliInt, self.contentView.bounds.size.width, self.contentView.bounds.size.height-120);
    self.menuTableView.contentSize = CGSizeMake(self.contentView.bounds.size.width,rowHeightInt*14);
    self.menuTableView.rowHeight = rowHeightInt;
    
    self.menuTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.menuTableView.delegate = self;
    self.menuTableView.dataSource = self;
    self.contentView.backgroundColor = RGBa(1, 1, 1, 0);
    [self.contentView addSubview:self.menuTableView];
}

#pragma mark
#pragma mark - 从服务端获取数据
- (void)loadDataFromNetwork
{
    [AFN_Helper_Z getJSONWithUrl:@"http://guolin.tech/api/china/24/226" parameters:nil success:^(id responseObject) {
        _dataArr = responseObject;
        [self.menuTableView reloadData];
    } fail:^(id responseObject){
    }];
}

#pragma mark
#pragma mark - UITableViewDelegate/UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString * identifier= @"cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    NSDictionary *m =  _dataArr[indexPath.row];
    cell.textLabel.text = m[@"name"];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.backgroundColor =  [UIColor colorWithRed:((1) / 255.0) green:((1) / 255.0) blue:((1) / 255.0) alpha:(0.4)];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSDictionary *m =  _dataArr[indexPath.row];
    if([self.delegate respondsToSelector:@selector(getTheNumber:)]) {
        [self.delegate getTheNumber:m[@"weather_id"]];
    }
    [self showHideSidebar];
}


@end
