//
//  FIRST.m
//  JING01
//
//  Created by DMT on 2018/3/16.
//  Copyright © 2018年 楠木凉生本青春. All rights reserved.
//

#import "FIRST.h"
#import "YSHYSlideViewController.h"
#import "mainView.h"
#import "leftNav.h"

#import "ZHUCEViewController.h"


@interface FIRST ()<UIScrollViewDelegate>{

    UISearchBar *customSearchBar;
    UIImageView *bnm;
    UIImageView *bnm2;
    UIImageView *bnm3;
    
    UIScrollView *banner;
}
@property (nonatomic, retain)UIPageControl *myPageControl;
@end

@implementation FIRST

- (void)viewDidLoad {
    [super viewDidLoad];
    banner=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    banner.pagingEnabled=YES;
    UIImage *bannerImage=[UIImage imageNamed:@"HelpFrist"];
    bnm=[[UIImageView alloc]initWithImage:bannerImage];
    bnm.frame=CGRectMake(0, 0,[UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    UILabel *l1=[[UILabel alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/2-200, 120, 400, 50)];
    l1.textAlignment=NSTextAlignmentCenter;
    l1.text=@"欢迎来到印·设";
    l1.textColor=[UIColor whiteColor];
    [l1 setFont:[UIFont systemFontOfSize:29]];
    UILabel *ll1 =[[UILabel alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/2-200, 190, 400, 50)];
    ll1.textAlignment=NSTextAlignmentCenter;
    ll1.text=@"一款集打印与设计为一体的手机应用";
    ll1.textColor=[UIColor whiteColor];
    [ll1 setFont:[UIFont systemFontOfSize:18]];
    [banner addSubview:bnm];
    [banner addSubview:l1];
    [banner addSubview:ll1];
    UIImage *bannerImage2=[UIImage imageNamed:@"HelpSecond"];
    bnm2=[[UIImageView alloc]initWithImage:bannerImage2];
    bnm2.frame=CGRectMake(banner.bounds.size.width, 0,[UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    UILabel *l2=[[UILabel alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width+[UIScreen mainScreen].bounds.size.width/2-200, 200, 400, 50)];
    l2.textAlignment=NSTextAlignmentCenter;
    l2.textAlignment=NSTextAlignmentCenter;
    l2.text=@"科技改变世界，创新方便你我";
    l2.textColor=[UIColor whiteColor];
    [l2 setFont:[UIFont systemFontOfSize:20]];
    [banner addSubview:bnm2];
    [banner addSubview:l2];
//    UILabel *l3=[[UILabel alloc]initWithFrame:CGRectMake(2*[UIScreen mainScreen].bounds.size.width+[UIScreen mainScreen].bounds.size.width/2-200, 500, 400, 50)];
//    l3.textAlignment=NSTextAlignmentCenter;
//    l3.text=@"";
//    l3.textColor=[UIColor grayColor];
//    [l3 setFont:[UIFont systemFontOfSize:22]];
//    UIImage *bannerImage3=[UIImage imageNamed:@"HelpFrist"];
//    bnm3=[[UIImageView alloc]initWithImage:bannerImage3];
//    bnm3.frame=CGRectMake(banner.bounds.size.width*2, 0,[UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
//    [banner addSubview:bnm3];
//    [banner addSubview:l3];
    CGRect bnr=banner.bounds;
    CGRect bnr2=bnr;
    bnr2.size.width*=2.0;
    banner.contentSize=bnr2.size;
    banner.bounces=NO;
    banner.showsVerticalScrollIndicator=NO;
    banner.showsHorizontalScrollIndicator=NO;
    banner.delegate=self;
    
    self.myPageControl = [[UIPageControl alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/2-CGRectGetWidth(self.view.frame)/2,0.7483*[UIScreen mainScreen].bounds.size.height, CGRectGetWidth(self.view.frame),20)];
    self.myPageControl.numberOfPages = 2;
    self.myPageControl.currentPage = 0;
    _myPageControl.currentPageIndicatorTintColor=[UIColor colorWithRed:0.41 green:0.274 blue:0.95 alpha:1];
     [self.view addSubview:banner];
   [self.view addSubview:self.myPageControl];
  

    banner.tag=1000;
    
    // Do any additional setup after loading the view.
    UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/2-180, 0.789*[UIScreen mainScreen].bounds.size.height, 360, 70)];
    UIButton *btn1=[[UIButton alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/2-180, 0.7823*[UIScreen mainScreen].bounds.size.height, 360, 70)];
    [btn1 setTitle:@"开始" forState:UIControlStateNormal];
  //  [btn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    UIImage *img=[UIImage imageNamed:@"btn"];
    [btn setImage:img forState:UIControlStateNormal];
    [self.view addSubview:btn];
    [self.view addSubview:btn1];
    [btn1 addTarget:self  action:@selector(jump) forControlEvents:UIControlEventTouchDown];
 
    

    
}
-(void)jump{
    UIWindow *win=[[UIWindow alloc]init];
    win=self.view.window;
//    LeftMenuController * leftMenu = [[LeftMenuController alloc]init];
//    [YSHYSlideViewController shareInstance].leftMenu = leftMenu;
//    leftNav * leftMenu = [[leftNav alloc]init];
//    [YSHYSlideViewController shareInstance].leftMenu = leftMenu;
//     mainView *haa=[[mainView alloc]init];
//
//
//        [[YSHYSlideViewController shareInstance] setMainViewController:haa];
    ZHUCEViewController *zhuce=[[ZHUCEViewController alloc]init];
   // [self presentViewController:zhuce animated:YES completion:nil];
    win.rootViewController = zhuce;
   // win.rootViewController=[YSHYSlideViewController shareInstance];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"haha");
    int index = banner.contentOffset.x /375;
    _myPageControl.currentPage =index;
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
