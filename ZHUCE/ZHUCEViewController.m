//
//  ZHUCEViewController.m
//  JING01
//
//  Created by 楠木凉生本青春 on 2018/3/18.
//  Copyright © 2018年 楠木凉生本青春. All rights reserved.
//

#import "ZHUCEViewController.h"
#import "DENGRUViewController.h"
#import "mainView.h"
#import "leftNav.h"
#import "YSHYSlideViewController.h"
#import <BmobSDK/Bmob.h>


@interface ZHUCEViewController ()
@property (weak, nonatomic) IBOutlet UIButton *zhuce;
@property (weak, nonatomic) IBOutlet UITextField *user;
@property (weak, nonatomic) IBOutlet UITextField *email;
@property (weak, nonatomic) IBOutlet UITextField *password01;
@property (weak, nonatomic) IBOutlet UITextField *password02;
@property (weak, nonatomic) IBOutlet UIButton *btn;

@end

@implementation ZHUCEViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
//    UIButton*view01=[[UIButton alloc]initWithFrame:CGRectMake(88,500,241, 83)];
//    UIImageView*imageView01=[[UIImageView alloc]init];
//    imageView01.frame=CGRectMake(88,500,241,83);
//    UIImage*image01=[UIImage imageNamed:@"BUTTONWHITE.png"];
//    imageView01.image=image01;
//    view01.backgroundColor=[UIColor clearColor];
//    [view01 setTitle:@"创建账号" forState:0];
//    [view01 setTitleColor:[UIColor colorWithRed:0.0/255 green:0.0/255 blue:0.0/255 alpha:1] forState:0];
//    [self.view addSubview:view01];
//    [self.view addSubview:imageView01];
    
//    UILabel*L01=[[UILabel alloc]initWithFrame:CGRectMake(88,180,240, 83)];
//     UIColor *color = [UIColor colorWithPatternImage:[UIImage imageNamed:@"BUTTONBLUE.png"]];
//    [L01 setBackgroundColor:color];
//    [self.view addSubview:L01];
//
//    view01 .userInteractionEnabled=YES;
//    UITapGestureRecognizer*rec=[[UITapGestureRecognizer alloc]initWithTarget:self action:@ selector(touchAble:)];
//    [view01  addGestureRecognizer:rec];
    
    _zhuce.layer.masksToBounds=YES;
    _zhuce.layer.cornerRadius=_zhuce.bounds.size.height/2;

    [_zhuce addTarget:self  action:@selector(jump) forControlEvents:UIControlEventTouchDown];
    
    
    _user.layer.masksToBounds=YES;
    _user.layer.cornerRadius=_user.bounds.size.height/2;
    _email.layer.masksToBounds=YES;
    _email.layer.cornerRadius=_email.bounds.size.height/2;
    _password01.layer.masksToBounds=YES;
    _password01.layer.cornerRadius=_password01.bounds.size.height/2;
    _password02.layer.masksToBounds=YES;
    _password02.layer.cornerRadius=_password02.bounds.size.height/2;
    [_user setValue:[UIFont systemFontOfSize:20] forKeyPath:@"_placeholderLabel.font"];
    [_email setValue:[UIFont systemFontOfSize:20] forKeyPath:@"_placeholderLabel.font"];
    [_password01 setValue:[UIFont systemFontOfSize:20] forKeyPath:@"_placeholderLabel.font"];
    [_password02 setValue:[UIFont systemFontOfSize:20] forKeyPath:@"_placeholderLabel.font"];
   
}
- (IBAction)ttt:(id)sender {
    UIWindow *win=[[UIWindow alloc]init];
    win=self.view.window;
    //    ZHUCEViewController *HAHA=[[ZHUCEViewController alloc]init];
    
    DENGRUViewController *JM=[[DENGRUViewController alloc]init];
    
    
    //     mainView *haa=[[mainView alloc]init];
    //
    //
    //        [[YSHYSlideViewController shareInstance] setMainViewController:haa];
    win.rootViewController = JM;
    //[self presentViewController:JM animated:YES completion:nil];
}
-(void)addUser{
    BmobObject *gameScore = [BmobObject objectWithClassName:@"_User"];
    [gameScore setObject:self.user.text forKey:@"username"];
    [gameScore setObject:self.password01.text forKey:@"password"];
    // [gameScore setObject:[NSNumber numberWithBool:YES] forKey:@"cheatMode"];
    [gameScore saveInBackgroundWithResultBlock:^(BOOL isSuccessful, NSError *error) {
        if (isSuccessful) {
            UIAlertController *alt=[UIAlertController alertControllerWithTitle:@"" message:@"注册成功" preferredStyle:UIAlertControllerStyleAlert];
            [self presentViewController:alt animated:YES completion:nil];
            UIAlertAction *guan=[UIAlertAction actionWithTitle:@"关闭" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                [self dismissViewControllerAnimated:YES completion:nil];
                UIWindow *win=[[UIWindow alloc]init];
                win=self.view.window;
                //    ZHUCEViewController *HAHA=[[ZHUCEViewController alloc]init];
                
                DENGRUViewController *JM=[[DENGRUViewController alloc]init];
                
                
                //     mainView *haa=[[mainView alloc]init];
                //
                //
                //        [[YSHYSlideViewController shareInstance] setMainViewController:haa];
                win.rootViewController = JM;
                //[self presentViewController:JM animated:YES completion:nil];
            }];
            
            
            [alt addAction:guan];
                                } else if (error){
                                    //发生错误后的动作
                                    NSLog(@"%@",error);
                                } else {
                                    NSLog(@"Unknow error");
                                }
        //进行操作
    }];
    
}


-(void)jump{
    [self addUser];
   
   
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.user resignFirstResponder];
    [self.email resignFirstResponder];
    [_password01 resignFirstResponder];
    [_password02 resignFirstResponder];
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
