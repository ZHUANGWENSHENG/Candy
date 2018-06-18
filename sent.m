//
//  sent.m
//  Candy
//
//  Created by QUAQUA on 2018/3/22.
//  Copyright © 2018年 JING. All rights reserved.
//

#import "sent.h"
#import <objc/runtime.h>
#import <AipOcrSdk/AipOcrSdk.h>


@interface sent ()
@property (weak, nonatomic) IBOutlet UITextView *ga;
@property (weak, nonatomic) IBOutlet UITextField *input;

@end

@implementation sent
{
        // 默认的识别成功的回调
        void (^_successHandler)(id);
        // 默认的识别失败的回调
        void (^_failHandler)(NSError *);
        
}

- (IBAction)ee:(id)sender {
//    NSString *licenseFile = [[NSBundle mainBundle] pathForResource:@"aip" ofType:@"license"];
//    NSData *licenseFileData = [NSData dataWithContentsOfFile:licenseFile];
//    [[AipOcrService shardService] authWithLicenseFileData:licenseFileData];
    // 授权方法2（更安全）： 下载授权文件，添加至资源
//        NSString *licenseFile = [[NSBundle mainBundle] pathForResource:@"aip-2" ofType:@"license"];
//        NSData *licenseFileData = [NSData dataWithContentsOfFile:licenseFile];
//        if(!licenseFileData) {
//            [[[UIAlertView alloc] initWithTitle:@"授权失败" message:@"授权文件不存在" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil] show];
//        }
//        [[AipOcrService shardService] authWithLicenseFileData:licenseFileData];
         [[AipOcrService shardService] authWithAK:@"qVCnA808DOKxTvpsy5BRb09D" andSK:@"x1hwFCwyIc4lXcEa24xjwhckDkKdB84g"];
    SEL funSel = NSSelectorFromString(@"generalBasicOCR");
    if (funSel) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        [self performSelector:funSel];
#pragma clang diagnostic pop
        
    }
    [self configCallback];
}
- (void)generalBasicOCR{
    
    UIViewController * vc = [AipGeneralVC ViewControllerWithHandler:^(UIImage *image) {
        NSDictionary *options = @{@"language_type": @"CHN_ENG", @"detect_direction": @"true"};
        [[AipOcrService shardService] detectTextBasicFromImage:image
                                                   withOptions:options
                                                successHandler:_successHandler
                                                   failHandler:_failHandler];
        
    }];
    [self presentViewController:vc animated:YES completion:nil];
}
- (void)configCallback {
    __weak typeof(self) weakSelf = self;
    NSMutableString *message = [NSMutableString string];
    
    
    // 这是默认的识别成功的回调
    _successHandler = ^(id result){
        NSLog(@"%@", result);
        NSString *title = @"识别结果";
        
        
        if(result[@"words_result"]){
            if([result[@"words_result"] isKindOfClass:[NSDictionary class]]){
                [result[@"words_result"] enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
                    if([obj isKindOfClass:[NSDictionary class]] && [obj objectForKey:@"words"]){
                        [message appendFormat:@"%@: %@", key, obj[@"words"]];
                    }else{
                        [message appendFormat:@"%@: %@", key, obj];
                    }
                    
                }];
            }else if([result[@"words_result"] isKindOfClass:[NSArray class]]){
                for(NSDictionary *obj in result[@"words_result"]){
                    if([obj isKindOfClass:[NSDictionary class]] && [obj objectForKey:@"words"]){
                        [message appendFormat:@"%@", obj[@"words"]];
                    }else{
                        [message appendFormat:@"%@", obj];
                    }
                    
                }
            }
            
        }else{
            [message appendFormat:@"%@", result];
        }
        
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title message:message delegate:weakSelf cancelButtonTitle:@"确定" otherButtonTitles:nil];
            
            [alertView show];
            
            
            //ii=message;
            
            
        }];
        //[self.navigationController pushViewController:ha animated:YES];
    };
    
    _failHandler = ^(NSError *error){
        NSLog(@"%@", error);
        NSString *msg = [NSString stringWithFormat:@"%li:%@", (long)[error code], [error localizedDescription]];
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            [[[UIAlertView alloc] initWithTitle:@"识别失败" message:msg delegate:weakSelf cancelButtonTitle:@"确定" otherButtonTitles:nil] show];
        }];
    };
    
    

}

- (void)mockBundlerIdForTest {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
    [self mockClass:[NSBundle class] originalFunction:@selector(bundleIdentifier) swizzledFunction:@selector(sapicamera_bundleIdentifier)];
#pragma clang diagnostic pop
}
-(BOOL)shouldAutorotate{
    return NO;
}
- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}
- (void)mockClass:(Class)class originalFunction:(SEL)originalSelector swizzledFunction:(SEL)swizzledSelector {
    
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    
    BOOL didAddMethod = class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
    
    if (didAddMethod) {
        class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
    
}
#pragma mark UIAlertViewDelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    self.ga.text=alertView.message;
    [self dismissViewControllerAnimated:YES completion:nil];
    
    //[self presentViewController:ha animated:YES completion:nil];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"发布需求";
    UIButton *back=[[UIButton alloc]init];
    [back setTitle:@"关闭" forState:UIControlStateNormal];
    [back setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //[back setImage:img2 forState:UIControlStateNormal];
    //    back.frame=CGRectMake(0, 0, 12.5, 21);
    [back addTarget:self action:@selector(toIndexView) forControlEvents:UIControlEventTouchDown];
    UIBarButtonItem *left=[[UIBarButtonItem alloc]initWithCustomView:back];
    self.navigationItem.rightBarButtonItem=left;
    // Do any additional setup after loading the view from its nib.

//    _ga.placeholder=@"请输入您的需求";
//    _ga.placeholderAttributes = @{NSFontAttributeName:[UIFont systemFontOfSize:16],NSForegroundColorAttributeName:[UIColor colorWithRed:175.0f/255.0f green:175.0f/255.0f blue:175.0f/255.0f alpha:1]};
    //_ga.maxInputLength = 30;
}
-(void)toIndexView{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.input resignFirstResponder];
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
