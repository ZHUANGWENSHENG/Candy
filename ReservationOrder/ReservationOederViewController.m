//
//  ReservationOederViewController.m
//  Candy
//
//  Created by DMT on 2018/3/20.
//  Copyright © 2018年 JING. All rights reserved.
//

#import "ReservationOederViewController.h"
#import"SuccOderViewController.h"
#import "file.h"

@interface ReservationOederViewController ()

@end

@implementation ReservationOederViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    // Do any additional setup after loading the view from its nib.
}


- (IBAction)wenjian:(id)sender {

    UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:[file new]];
    
    [self presentViewController:nav animated:YES completion:nil];
}
- (IBAction)fanhui:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)zhf:(id)sender {
    [self presentViewController:[SuccOderViewController new] animated:YES completion:nil];
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
