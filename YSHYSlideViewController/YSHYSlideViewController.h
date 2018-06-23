//
//  
//  Candy
//
//  Created by QUAQUA on 2018/4/21.
//  Copyright © 2018年 JING. All rights reserved.
//

#import <UIKit/UIKit.h>
#define  kScreenWidthFor6 375
#define  kMenuWidth 200
#define  kScreenWidth [UIScreen mainScreen].bounds.size.width
#define  kScreenHeight [UIScreen mainScreen].bounds.size.height


@interface YSHYSlideViewController : UINavigationController<UINavigationControllerDelegate>
@property (nonatomic, assign)NSInteger menuWidth;
@property (nonatomic, strong)UIViewController *leftMenu;
@property (nonatomic, assign)BOOL MenuIsOpen;
@property (nonatomic, strong)UIButton *jia;
+(YSHYSlideViewController *)shareInstance;
-(void)setMainViewController:(UIViewController *)ViewController;
-(void)GotoViewController:(UIViewController *)viewController;
-(void)GotoRootViewController;
-(void)SwitchMenuState;
-(void)addGesture;
-(void)removeAllGesture;
-(void)yyy;
-(void)ppp;
-(void)CloseMenu;
-(void)changeJiaFrame;
-(void)firstJiaFrame;
@end
