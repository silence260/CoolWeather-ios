//
//  ViewController.m
//  coolweather-ios
//
//  Created by silence on 17/1/5.
//  Copyright © 2017年 silence. All rights reserved.
//

#import "ViewController.h"
#import "SiderbarVC.h"
#import "Cell1.h"
#import "Cell2.h"
#import "Cell3.h"
#import "Cell4.h"
#import "DataModels.h"
#import "AFN_Helper_Z.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate,LLBlurSidebarDelegate>
{

    NSMutableArray *_dataArr;
    NSArray *myArr;
    UITableView *mytableView;
    NSString *wenduStr;
    NSString *tmpStr;
    NSString *pmStr;
    NSString *aqiStr;
    UILabel *title;
    UILabel *title1;
    NSMutableArray *_dataArr1;

}
@property (nonatomic, retain) SiderbarVC *sidebarVC;
@end

@implementation ViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    
    [self loadDataFromNetwork];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self navigationInit];
    [self mainInit];
    [self sidebarInit];
    [self navigationInit];

}

#pragma mark
#pragma mark - navigationInit
- (void)navigationInit
{
    title = [[UILabel alloc] init];
    title.frame = CGRectMake(0, 0, systemWidth, 80);
    title.font = [UIFont systemFontOfSize:17];
    title.textAlignment = NSTextAlignmentCenter;
    title.textColor = [UIColor whiteColor];
    title.backgroundColor = [UIColor clearColor];
    [self.view addSubview:title];
    
    title1 = [[UILabel alloc] init];
    title1.frame = CGRectMake(0, 0, systemWidth-10, 80);
    title1.font = [UIFont systemFontOfSize:17];
    title1.textAlignment = NSTextAlignmentRight;
    title1.textColor = [UIColor whiteColor];
    title1.backgroundColor = [UIColor clearColor];
    [self.view addSubview:title1];
    
    UIButton *leftBarBT = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBarBT.frame = CGRectMake(16, 30, 29, 24);
    [leftBarBT setImage:[UIImage imageNamed:@"nav_list_pre"] forState:UIControlStateNormal];
    [leftBarBT addTarget:self action:@selector(leftBarButItemClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:leftBarBT];
}

#pragma mark
#pragma mark - loadDataFromNetwork
- (void)loadDataFromNetwork{
    [self getTheNumber:@"CN101300101"];
}

#pragma mark
#pragma mark - sidebarInit
- (void)sidebarInit
{
    // 左侧边栏开始
    UIPanGestureRecognizer* panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panDetected:)];
    [panGesture delaysTouchesBegan];
    [self.view addGestureRecognizer:panGesture];
    
    self.sidebarVC = [[SiderbarVC alloc] init];
    self.sidebarVC.delegate = self;
    [self.sidebarVC setBgRGB:0xffffff];
    [self.view addSubview:self.sidebarVC.view];
    self.sidebarVC.view.frame  = self.view.bounds;
}

-(void)mainInit{
    UIImage *image = [[UIImage alloc] initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://cn.bing.com/az/hprichbg/rb/MacawFlight_ZH-CN10427294606_1920x1080.jpg"]]];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    imageView.frame = CGRectMake(0,0,systemWidth,systemHeight);
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    [self.view addSubview:imageView];
    NSLog(@"------%.0f",systemWidth);
    _dataArr = [NSMutableArray array];
    _dataArr1 = [NSMutableArray array];

    myArr = [[NSArray alloc] initWithObjects:@" ",@"  预报",@"  空气质量",@"  生活建议",nil];
    
    mytableView = [[UITableView alloc] init];
    mytableView.frame = CGRectMake(0, 80, systemWidth, systemHeight-80);
    mytableView.separatorStyle =  UITableViewCellSeparatorStyleNone;
    mytableView.delegate = self;
    mytableView.dataSource = self;
    mytableView.backgroundColor = [UIColor clearColor];
    
    [self.view addSubview:mytableView];

    [mytableView registerClass:[Cell1 class] forCellReuseIdentifier:@"myCell1"];
    [mytableView registerClass:[Cell2 class] forCellReuseIdentifier:@"myCell2"];
    [mytableView registerClass:[Cell3 class] forCellReuseIdentifier:@"myCell3"];
    [mytableView registerClass:[Cell4 class] forCellReuseIdentifier:@"myCell4"];
}

#pragma mark
#pragma mark - ButItemClick
- (void)leftBarButItemClick
{
    [self.sidebarVC showHideSidebar];
}

- (void)panDetected:(UIPanGestureRecognizer*)recoginzer
{
    [self.sidebarVC panDetected:recoginzer];
}

#pragma mark --LLBlurSidebarDelegate
-(void)getTheNumber:(NSString *)numberString{
    [_dataArr removeAllObjects];
    [_dataArr1 removeAllObjects];
    NSString *urlStr = [NSString stringWithFormat:@"http://guolin.tech/api/weather?cityid=%@&key=7b558bfa951a4e35878b13d11f05b952",numberString];
    
    [AFN_Helper_Z getJSONWithUrl:urlStr parameters:nil success:^(id responseObject) {
        NSDictionary *dict = responseObject;
        NSArray *arr = dict[@"HeWeather"];
        NSDictionary *dict1 = arr[0];
        NSDictionary *dict2 = dict1[@"basic"];
        aqiStr = dict1[@"aqi"][@"city"][@"aqi"];
        pmStr = dict1[@"aqi"][@"city"][@"pm25"];
        NSArray *arr1 = dict1[@"daily_forecast"];
        NSArray *arr2 = dict1[@"hourly_forecast"];
        NSDictionary *dict3 = arr2[0];
        wenduStr = dict3[@"cond"][@"txt"];
        tmpStr = dict3[@"tmp"];
        _dataArr = [NSMutableArray arrayWithArray:arr1];
        title.text = dict1[@"basic"][@"city"];
        title1.text = [dict2[@"update"][@"loc"] substringFromIndex:11];
        [_dataArr1 addObject:dict1[@"suggestion"][@"air"]];
        [_dataArr1 addObject:dict1[@"suggestion"][@"comf"]];
        [_dataArr1 addObject:dict1[@"suggestion"][@"cw"]];
        [_dataArr1 addObject:dict1[@"suggestion"][@"drsg"]];
        [_dataArr1 addObject:dict1[@"suggestion"][@"flu"]];
        [_dataArr1 addObject:dict1[@"suggestion"][@"trav"]];
        [_dataArr1 addObject:dict1[@"suggestion"][@"uv"]];
        [mytableView reloadData];
    } fail:^(id responseObject){
    }];
}




#pragma mark --uitableviewDelegate&datasource

//组尾高
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 0.01;
    }
    else{
        return 40;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 30;
}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 0,systemWidth , 1)];
        view.backgroundColor = [UIColor clearColor];
        return view;
    }
    else{
        UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 0,systemWidth, 40)];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, systemWidth-20, 40)];
        label.backgroundColor = RGBa(1,1,1,0.4);
        label.font = [UIFont systemFontOfSize:16];
        label.textColor = [UIColor whiteColor];
        label.text = myArr[section];
        label.textAlignment = NSTextAlignmentLeft;
        [view addSubview:label];
        return view;
    }
}

-(UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 0,systemWidth , 30)];
    view.backgroundColor = [UIColor clearColor];
    return view;
}
//组数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}
//行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }
    else if (section == 1) {
        if (_dataArr.count != 0) {
            return _dataArr.count;
        }
        else{
            return 1;
        }
    }
    else if (section == 2) {
        return 1;
    }
    else  {
        if (_dataArr1.count != 0) {
            return _dataArr1.count;
        }
        else{
            return 1;
        }
    }
 
}
//行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 100;
    }
    else if(indexPath.section == 1) {
        return 40;
    }
    else if(indexPath.section == 2) {
        return 100;
    }
    else{
        return 60;
    }
}

//制定cell
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        Cell1 *cell = [tableView dequeueReusableCellWithIdentifier:@"myCell1"];
        cell.dateLabel1.text = [NSString stringWithFormat:@"%@℃",tmpStr] ;
        cell.dateLabel2.text = wenduStr;
        cell.backgroundColor = [UIColor clearColor];
        return cell;
    }
    else if(indexPath.section == 1){
        if (_dataArr.count == 0) {
            Cell2 *cell = [tableView dequeueReusableCellWithIdentifier:@"myCell2"];
            return  cell;
        }
        Cell2 *cell = [tableView dequeueReusableCellWithIdentifier:@"myCell2"];
        NSDictionary *dict = _dataArr[indexPath.row];
        cell.dateLabel1.text =  dict[@"date"];
        if ([[NSString stringWithFormat:@"%@",dict[@"cond"][@"txt_d"]] isEqualToString:[NSString stringWithFormat:@"%@",dict[@"cond"][@"txt_n"]]]) {
            cell.dateLabel2.text =  [NSString stringWithFormat:@"%@",dict[@"cond"][@"txt_d"]];
        }
        else{
            cell.dateLabel2.text =  [NSString stringWithFormat:@"%@~%@",dict[@"cond"][@"txt_d"],dict[@"cond"][@"txt_n"]];
        }
        cell.dateLabel3.text =  [NSString stringWithFormat:@"%@℃",dict[@"tmp"][@"max"]];
        cell.dateLabel4.text =  [NSString stringWithFormat:@"%@℃",dict[@"tmp"][@"min"]];
        cell.backgroundColor = [UIColor clearColor];
        return cell;
    }
    else if(indexPath.section == 2){
        Cell3 *cell = [tableView dequeueReusableCellWithIdentifier:@"myCell3"];
        cell.dateLabel1.text =  aqiStr;
        cell.dateLabel2.text =  pmStr;
        cell.dateLabel3.text =  @"AQI指数";
        cell.dateLabel4.text =  @"PM2.5指数";
        cell.backgroundColor = [UIColor clearColor];
        return cell;
    }
    else{
        if (_dataArr1.count == 0) {
            Cell4 *cell = [tableView dequeueReusableCellWithIdentifier:@"myCell4"];
            return  cell;
        }
        Cell4 *cell = [tableView dequeueReusableCellWithIdentifier:@"myCell4"];
        NSDictionary *dict = _dataArr1[indexPath.row];
        cell.dateLabel.text = [NSString stringWithFormat:@"%@:%@",dict[@"brf"],dict[@"txt"]];
        cell.backgroundColor = [UIColor clearColor];
        return cell;
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat sectionHeaderHeight = 40;
    if (scrollView.contentOffset.y<=sectionHeaderHeight&&scrollView.contentOffset.y>=0) {
        scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
    } else if (scrollView.contentOffset.y>=sectionHeaderHeight) {
        scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
