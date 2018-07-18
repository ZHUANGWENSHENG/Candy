//
//  leftNav.m
//  Candy
//
//  Created by QUAQUA on 2018/3/18.
//  Copyright © 2018年 JING. All rights reserved.
//
#import "leftNav.h"
#import "YSHYSlideViewController.h"
#import "News.h"

@interface leftNav ()
@property (weak, nonatomic) IBOutlet UIImageView *home;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *name2;
@property (weak, nonatomic) IBOutlet UILabel *adress;
@property (weak, nonatomic) IBOutlet UILabel *news;
@property (weak, nonatomic) IBOutlet UILabel *history;
@property (weak, nonatomic) IBOutlet UILabel *collection;
@property (weak, nonatomic) IBOutlet UILabel *setting;
@property (weak, nonatomic) IBOutlet UILabel *ban;
@property (weak, nonatomic) IBOutlet UILabel *exit;
@property (weak, nonatomic) IBOutlet UILabel *advice;

@end

@implementation leftNav

- (void)viewDidLoad {
    [super viewDidLoad];
    self.coverView = [[UIView alloc]initWithFrame:CGRectMake(0,0, 0,0 )];
    [self.coverView setBackgroundColor:[UIColor blackColor]];
    self.coverView.alpha = 0;
    [self.view addSubview:self.coverView];
    self.coverView.hidden=YES;
    UIImage *backGround=[UIImage imageNamed:@""];
    
    UIImageView *img=[[UIImageView alloc]initWithImage:backGround];
    [self.view addSubview:img];
    _home.alpha=1.0;
    [self.view addSubview:_home];
    [self.view addSubview:_name];
    [self.view addSubview:_name2];
    [self.view addSubview:_news];
    [self.view addSubview:_adress];
    [self.view addSubview:_advice];
    [self.view addSubview:_history];
    [self.view addSubview:_exit];
    [self.view addSubview:_setting];
    [self.view addSubview:_collection];
    [self.view addSubview:_ban];
    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(ChargeEye)];
   
    [_news setUserInteractionEnabled:YES];
   
    tap1.numberOfTapsRequired = 1;
    tap1.numberOfTouchesRequired = 1;
    
    [_news addGestureRecognizer:tap1];
    
    // Do any additional setup after loading the view from its nib.
}
-(void)ChargeEye{
       [[YSHYSlideViewController shareInstance] setMainViewController:[[News alloc]init]];
    [[YSHYSlideViewController shareInstance] yyy];
    [[YSHYSlideViewController shareInstance] CloseMenu];
  
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
