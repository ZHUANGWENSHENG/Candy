//
//  DENGRUViewController.m
//  Candy
//
//  Created by DMT on 2018/3/19.
//  Copyright © 2018年 JING. All rights reserved.
//

#import "DENGRUViewController.h"
#import "YSHYSlideViewController.h"
#import "leftNav.h"
#import "mainView.h"

@interface DENGRUViewController ()
@property (weak, nonatomic) IBOutlet UIButton *load;
@property (weak, nonatomic) IBOutlet UITextField *user;
@property (weak, nonatomic) IBOutlet UITextField *password;

@end

@implementation DENGRUViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    

    _load.layer.masksToBounds=YES;
    _load.layer.cornerRadius=_load.bounds.size.height/2;
    [_load addTarget:self action:@selector(jump) forControlEvents:UIControlEventTouchDown];
    _user.layer.masksToBounds=YES;
    _user.layer.cornerRadius=_user.bounds.size.height/2;
    _password.layer.masksToBounds=YES;
    _password.layer.cornerRadius=_password.bounds.size.height/2;
    [_user setValue:[UIFont systemFontOfSize:20] forKeyPath:@"_placeholderLabel.font"];
     [_password setValue:[UIFont systemFontOfSize:20] forKeyPath:@"_placeholderLabel.font"];
}
-(void)jump{
    //[self dismissViewControllerAnimated:YES completion:nil];
    
    leftNav * leftMenu = [[leftNav alloc]init];
    [YSHYSlideViewController shareInstance].leftMenu = leftMenu;
    mainView *haa=[[mainView alloc]init];
    //ViewController *haha=[[ViewController alloc]init];
    
    [[YSHYSlideViewController shareInstance] setMainViewController:haa];
//    ZHUCEViewController *zhuce=[[ZHUCEViewController alloc]init];
    //self.view.window.rootViewController=nil;
   // self.view.window.rootViewController=[[UIViewController alloc]init];
    self.view.window.rootViewController = [YSHYSlideViewController shareInstance];
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
