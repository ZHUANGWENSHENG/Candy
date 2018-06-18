//
//  Design.m
//  Candy
//
//  Created by QUAQUA on 2018/3/18.
//  Copyright © 2018年 JING. All rights reserved.
//

#import "Design.h"
#import"YSHYSlideViewController.h"
#import "photography.h"

@interface Design ()
@property (weak, nonatomic) IBOutlet UILabel *p1;
@property (weak, nonatomic) IBOutlet UIImageView *p2;

@end

@implementation Design

- (void)viewDidLoad {
    [super viewDidLoad];
    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(ChargeEye)];
       UITapGestureRecognizer *tap2 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(ChargeEye)];
    [_p1 setUserInteractionEnabled:YES];
     [_p2 setUserInteractionEnabled:YES];
    tap1.numberOfTapsRequired = 1;
    tap1.numberOfTouchesRequired = 1;
    
    [_p1 addGestureRecognizer:tap2];
     [_p2 addGestureRecognizer:tap1];

    // Do any additional setup after loading the view from its nib.
}
-(void)ChargeEye{
    UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:[photography new]];
    [self presentViewController:nav animated:YES completion:nil];
}
-(void)viewWillAppear:(BOOL)animated
{
       [[YSHYSlideViewController shareInstance] firstJiaFrame];
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    
    //去掉透明后导航栏下边的黑边
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
    
    
    [super viewWillAppear:animated];
    [[YSHYSlideViewController shareInstance] addGesture];
    self.navigationController.navigationBar.hidden=YES;
    
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
