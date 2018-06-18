//
//  xianzhiViewController.m
//  Candy
//
//  Created by QUAQUA on 2018/3/22.
//  Copyright © 2018年 JING. All rights reserved.
//

#import "xianzhiViewController.h"
#import "ReservationOederViewController.h"

@interface xianzhiViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *fanhui;

@end

@implementation xianzhiViewController
- (IBAction)yuyue:(id)sender {
    [self presentViewController:[ReservationOederViewController new] animated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(ChargeEye)];
    [_fanhui setUserInteractionEnabled:YES];
    tap1.numberOfTapsRequired = 1;
    tap1.numberOfTouchesRequired = 1;
    
    [_fanhui addGestureRecognizer:tap1];
   // self.navigationController.view.hidden=YES;
    // Do any additional setup after loading the view from its nib.
}

-(void)ChargeEye{
    [self dismissViewControllerAnimated:YES completion:nil];
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
