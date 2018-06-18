//
//  ZUST.m
//  Candy
//
//  Created by DMT on 2018/3/19.
//  Copyright © 2018年 JING. All rights reserved.
//

#import "ZUST.h"
#import "xianzhiViewController.h"

@interface ZUST ()
@property (weak, nonatomic) IBOutlet UILabel *dianji;
@property (weak, nonatomic) IBOutlet UIImageView *zi;

@end

@implementation ZUST

- (void)viewDidLoad {
    [super viewDidLoad];
    _zi.hidden=YES;
    _dianji.textColor=[UIColor blackColor];
    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(ChargeEye)];
    [_dianji setUserInteractionEnabled:YES];
    tap1.numberOfTapsRequired = 1;
    tap1.numberOfTouchesRequired = 1;
    
    [_dianji addGestureRecognizer:tap1];
    // Do any additional setup after loading the view from its nib.
}
-(void)ChargeEye{
    _zi.hidden=NO;
    _dianji.textColor=[UIColor whiteColor];
    [self presentViewController:[[xianzhiViewController alloc]init] animated:YES completion:nil];
    
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
