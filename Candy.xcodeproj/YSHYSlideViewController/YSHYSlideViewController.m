//
//  MainViewController.m
//  YSHYSlideController
//
//  Created by 杨淑园 on 15/10/29.
//  Copyright © 2015年 yangshuyaun. All rights reserved.
//

#import "YSHYSlideViewController.h"
#import "DENGRUViewController.h"
//#import "LeftMenuController.h"
#import "mainView.h"
#import "ZUST.h"
#import "searchViewTableViewController.h"
#import "Design.h"
#import "SuccOderViewController.h"
#import"sent.h"
#import "PrintStore.h"
#import "search.h"
static YSHYSlideViewController *signletonInstance;

@interface YSHYSlideViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UIButton *daohang;
    ZUST *haah;
    UIButton *btn1;
    UIButton *btn2;
    UIImageView *re;
    UIButton *sousuo;
    UIView *kongbai;
    UIView *storeView;
}
@end

@implementation YSHYSlideViewController

+(YSHYSlideViewController *)shareInstance
{
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        signletonInstance = [[self alloc] init];
    });
    return  signletonInstance;
}
-(void)changeJiaFrame{
    _jia.frame=CGRectMake([UIScreen mainScreen].bounds.size.width-110, 520, 100, 100);
}
-(void)viewWillAppear:(BOOL)animated
{
    
    [super viewWillAppear:animated];
    [[YSHYSlideViewController shareInstance] addGesture];
    
    
    
}
-(void)firstJiaFrame{
     _jia.frame=CGRectMake([UIScreen mainScreen].bounds.size.width-110, 560, 100, 100);
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [[YSHYSlideViewController shareInstance] removeAllGesture];
    _jia.frame=CGRectMake([UIScreen mainScreen].bounds.size.width-110, 560, 100, 100);
}



-(void)appearTable{
    storeView=[UIView new];
    storeView.backgroundColor=[UIColor clearColor];
    storeView.frame=CGRectMake(0, [UIScreen mainScreen].bounds.size.height-300, [UIScreen mainScreen].bounds.size.width, 300);
  //  storeView.layer.masksToBounds=YES;
  //  storeView.layer.cornerRadius=20;

    UIImage *ima=[UIImage imageNamed:@"touming"];
    UIImageView *tou=[[UIImageView alloc]initWithImage:ima];
    tou.frame=CGRectMake(0,-20, [UIScreen mainScreen].bounds.size.width,300);
     [storeView addSubview:tou];
    UIImageView *tou1=[[UIImageView alloc]initWithImage:ima];
    tou1.frame=CGRectMake(0,50, [UIScreen mainScreen].bounds.size.width,300);
    [storeView addSubview:tou1];
    UITableView *hah=[[UITableView alloc]initWithFrame:CGRectMake(30, 30, storeView.bounds.size.width-40, storeView.bounds.size.height) style:UITableViewStylePlain];
    [hah registerNib:[UINib nibWithNibName:@"search" bundle:nil] forCellReuseIdentifier:@"sousuo"];
    hah.delegate=self;
    hah.dataSource=self;
    hah.backgroundColor=[UIColor clearColor];
    UIImage *henTiao=[UIImage imageNamed:@"heng"];
    UIImageView *img=[[UIImageView alloc]initWithImage:henTiao];
    img.frame=CGRectMake([UIScreen mainScreen].bounds.size.width/2-40, 15, 80, 15);
    [storeView addSubview:img];
    [storeView addSubview:hah];
    [self.view addSubview:storeView];
    //滑动手势
     UISwipeGestureRecognizer  *settingrecognizer = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleSwipeFrom1:)];
    [settingrecognizer setDirection:(UISwipeGestureRecognizerDirectionDown)];
    [storeView addGestureRecognizer:settingrecognizer];
}
//下划
- (void)handleSwipeFrom1:(UISwipeGestureRecognizer *)recognizer{
    if(recognizer.direction == UISwipeGestureRecognizerDirectionDown) {
        storeView.hidden=YES;
        [self addGesture];
        NSLog(@"swipe down");
    }
    if(recognizer.direction == UISwipeGestureRecognizerDirectionUp) {
        NSLog(@"swipe up");
    }
    if(recognizer.direction == UISwipeGestureRecognizerDirectionLeft) {
        NSLog(@"swipe left");
    }
    if(recognizer.direction == UISwipeGestureRecognizerDirectionRight) {
        NSLog(@"swipe right");
    }
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
      [tableView deselectRowAtIndexPath:indexPath animated:NO];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    


    UIImage *ii=[UIImage imageNamed:@"Rectangle 6"];
    re=[[UIImageView alloc]initWithImage:ii];
    
    
    btn1=[[UIButton alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/2-60, 40, 61, 20)];
    UILabel *dayin=[[UILabel alloc]init];

    dayin.text=@"打印";
      //[dayin setFont:[UIFont systemFontOfSize:10]];
    [btn1 setTitle:dayin.text forState:UIControlStateNormal];
    [btn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn1.titleLabel.font=[UIFont systemFontOfSize:15];
    re.frame=CGRectMake([UIScreen mainScreen].bounds.size.width/2-70, 30, 80, 50);

    [self.view addSubview:re];

    [self.view addSubview:btn1];

   
   
    btn2=[[UIButton alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/2, 40, 61, 20)];
    UILabel *sheji=[[UILabel alloc]init];
    
    sheji.text=@"印刷";
    //[dayin setFont:[UIFont systemFontOfSize:10]];
    [btn2 setTitle:sheji.text forState:UIControlStateNormal];
    [btn2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn2.titleLabel.font=[UIFont systemFontOfSize:15];

   
    
    [self.view addSubview:btn2];
    
   
    [btn1 addTarget:self action:@selector(ha) forControlEvents:UIControlEventTouchDown];
    [btn2 addTarget:self action:@selector(he) forControlEvents:UIControlEventTouchDown];
    
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.navigationBar.hidden = YES;
    signletonInstance = self;
    self.delegate = self;
    //禁止NavigationController中的系统自带pop效果
//    self.interactivePopGestureRecognizer.enabled = NO;
    self.MenuIsOpen = NO;
    [self ConfigUI];
    UIImage *ima=[UIImage imageNamed:@"daohang"];
    daohang=[[UIButton alloc]init];
    
    [daohang setImage:ima forState:UIControlStateNormal];
    daohang.frame=CGRectMake(40, 40, 20, 20);
  
    [self.view addSubview:daohang];
    UIImage *ima1=[UIImage imageNamed:@"Search"];
    sousuo=[[UIButton alloc]init];
    
    [sousuo setImage:ima1 forState:UIControlStateNormal];
    sousuo.frame=CGRectMake([UIScreen mainScreen].bounds.size.width-40, 40, 20, 20);
    [sousuo addTarget:self action:@selector(search) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:sousuo];

    haah=[[ZUST alloc]init];
    
    UIImage *jia1=[UIImage imageNamed:@"addspot-action"];
    
    _jia=[[UIButton alloc]init];
    
    [_jia setImage:jia1 forState:UIControlStateNormal];
    _jia.frame=CGRectMake([UIScreen mainScreen].bounds.size.width-110, 560, 100, 100);
    [_jia addTarget:self action:@selector(qqq) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:_jia];
    [self appearTable];
    storeView.hidden=YES;
}
-(void)qqq{

    storeView.hidden=NO;
    [self removeAllGesture];
    //[self appearTable];
 
}
-(void)search{
    storeView.hidden=YES;
    UINavigationController *aa=[[UINavigationController alloc]initWithRootViewController:[[searchViewTableViewController alloc]init]];
    [self presentViewController:aa animated:YES completion:nil];
}
-(void)ConfigUI
{
    CGFloat widthRation = kMenuWidth/(CGFloat)kScreenWidthFor6;
    self.menuWidth = widthRation * kScreenWidth;  ;
    
    self.view.layer.shadowColor =[UIColor darkGrayColor].CGColor;
    self.view.layer.shadowOpacity = 1;
    self.view.layer.shadowRadius =10;
    self.view.layer.shouldRasterize = YES;
}
-(void)addGesture
{
//    UISwipeGestureRecognizer  *settingrecognizer = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(PanGestureRespond:)];
//    [settingrecognizer setDirection:(UISwipeGestureRecognizerDirectionRight)];
//    [self.view addGestureRecognizer:settingrecognizer];
    //添加手势
    UIPanGestureRecognizer * panGesture = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(PanGestureRespond:)];
    panGesture.minimumNumberOfTouches = 1;
    [self.view addGestureRecognizer:panGesture];
    [daohang addTarget:self action:@selector(aaa) forControlEvents:UIControlEventTouchDown];
}

-(void)removeAllGesture
{
    for (UIGestureRecognizer * gesture in self.view.gestureRecognizers) {
        [self.view removeGestureRecognizer:gesture];
    }
}
-(void)yyy{
    daohang.hidden=YES;
    btn1.hidden=YES;
    btn2.hidden=YES;
    re.hidden=YES;
    sousuo.hidden=YES;
   _jia.hidden=YES;
}
-(void)ppp{
    daohang.hidden=NO;
    btn1.hidden=NO;
    btn2.hidden=NO;
    re.hidden=NO;
    sousuo.hidden=NO;
    _jia.hidden=NO;
}
#pragma mark - 设置
-(void)setMainViewController:(UIViewController *)ViewController
{
    [super pushViewController:ViewController animated:YES];
}

-(void)SwipGestureRespond:(UISwipeGestureRecognizer * )gesture
{
    if(gesture.direction == UISwipeGestureRecognizerDirectionRight)
    {
        [self OpenMenu];
    }
    else if(gesture.direction ==UISwipeGestureRecognizerDirectionLeft)
    {
        [self CloseMenu];
    }
}
-(void)PanGestureRespond:(UIPanGestureRecognizer *)gesture
{
    CGFloat translationX = [gesture translationInView:self.view].x;
    if(gesture.state == UIGestureRecognizerStateChanged)
    {
        UIView *coverView = self.leftMenu.view.subviews[1];
        CGFloat orignX,orignY,tempWidth,tempHeigth;
        tempWidth = self.view.frame.size.width;
        
        if(translationX > 0  )
        {
            orignX =self.view.frame.origin.x < self.menuWidth?self.view.frame.origin.x + 10: self.menuWidth;
            coverView.alpha = coverView.alpha <= 0?0:coverView.alpha - 0.02;
        }
        else
        {
            orignX = self.view.frame.origin.x  > 0 ?self.view.frame.origin.x - 10: 0;
            coverView.hidden = NO;
            coverView.alpha =coverView.alpha > 1.0?1.0f:coverView.alpha + 0.02;
        }
        orignY = orignX/ 2;
        tempHeigth = kScreenHeight - orignY*2;
        
        [UIView  animateWithDuration:0.15 animations:^{
            [self.view setFrame:CGRectMake(orignX, orignY, tempWidth, tempHeigth)];
            [self.view.window insertSubview:self.leftMenu.view atIndex:0];
        }];
        
    }
    else if (gesture.state == UIGestureRecognizerStateEnded)
    {
        if(translationX > 0 && self.view.frame.origin.x > self.menuWidth / 3)
        {
            [self OpenMenu];
          
        }
        else
        {
            [self CloseMenu];
            
        }
    }
    
   
}
-(void)ha{
    
[[YSHYSlideViewController shareInstance] GotoRootViewController];
//    [self.navigationController popViewControllerAnimated:YES];
    btn1.enabled=NO;
    btn2.enabled=YES;
    re.frame=CGRectMake([UIScreen mainScreen].bounds.size.width/2-70, 30, 80, 50);
   // [self.view ]
    [self.view addSubview:re];
   // [btn1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:btn1];
      self.jia.hidden=NO;
  
   [_jia removeTarget:self action:@selector(sent) forControlEvents:UIControlEventTouchDown];
      [_jia addTarget:self action:@selector(qqq) forControlEvents:UIControlEventTouchDown];
}
-(void)he{
    [[YSHYSlideViewController shareInstance] setMainViewController:[[Design alloc]init]];
    
    btn2.enabled=NO;
    btn1.enabled=YES;
    re.frame=CGRectMake([UIScreen mainScreen].bounds.size.width/2-10, 30, 80, 50);
    // [self.view ]
    [self.view addSubview:re];
    // [btn1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:btn2];
    _jia.hidden=NO;
    [_jia removeTarget:self action:@selector(qqq) forControlEvents:UIControlEventTouchDown];
    [_jia addTarget:self action:@selector(sent) forControlEvents:UIControlEventTouchDown];
    storeView.hidden=YES;
    
    
}
-(void)sent{

    UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:[sent new]];
    [self presentViewController:nav animated:YES completion:nil];
}
-(void)aaa{
    
    [self OpenMenu];
    [self addGesture];
    storeView.hidden=YES;
    //[[YSHYSlideViewController shareInstance] setMainViewController:haah];

}

#pragma mark - 跳转到选中的Controller 中
-(void)GotoViewController:(UIViewController *)viewController
{
   // [self GotoRootViewController];
   // [super pushViewController:viewController animated:NO];
}
-(void)GotoRootViewController
{
    [self CloseMenu];
  [super popToRootViewControllerAnimated:YES];
  //  [self removeAllGesture];
}

-(void)SwitchMenuState
{
    if(self.MenuIsOpen)
    {
        [self CloseMenu];
    }
    else
    {
        [self OpenMenu];
    }
}
-(void)OpenMenu
{
    self.MenuIsOpen = YES;
    [UIView animateWithDuration:0.25 animations:^{
        [self.view setFrame:CGRectMake(self.menuWidth, self.menuWidth/2, self.view.frame.size.width, kScreenHeight- self.menuWidth)];
        [self.view.window insertSubview:self.leftMenu.view atIndex:0];
        //隐藏 半透明覆盖层
        UIView *view = self.leftMenu.view.subviews[1];
        view.alpha = 0.0f;
        view.hidden = YES;
    }];
    kongbai=[[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    [self.view addSubview:kongbai];
}

-(void)CloseMenu
{
    
    self.MenuIsOpen = NO;
    [UIView animateWithDuration:0.25 animations:^{
        [self.view setFrame:CGRectMake(0, 0, self.view.frame.size.width, kScreenHeight)];
        //显示 半透明覆盖层
        UIView *view = self.leftMenu.view.subviews[1];
        view.alpha = 0.5f;
        view.hidden = NO;
    } completion:nil];
    kongbai.hidden=YES;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 10;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
};

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
 
    cell.backgroundColor = [UIColor clearColor];
    

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    search *cell = [tableView dequeueReusableCellWithIdentifier:@"sousuo" forIndexPath:indexPath];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

@end
