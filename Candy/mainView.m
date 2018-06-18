//
//  mainView.m
//  Candy
//
//  Created by student on 2018/3/13.
//  Copyright © 2018年 JING. All rights reserved.
//
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "mainView.h"
#import "YSHYSlideViewController.h"
#import "searchViewTableViewController.h"
#import "PrintStore.h"
#import "search.h"

#define LABEL_WIDTH 50
#define LABEL_HEIGHT 30
@interface mainView ()<MKMapViewDelegate,CLLocationManagerDelegate,UITableViewDataSource,UITableViewDelegate>

{
UIView *tiao;
MKMapView* _mapView;

    NSString *jin;
    NSString *wei;
}
@property (nonatomic,copy)    NSString *currentCity;//城市
@property (nonatomic,copy)    NSString *strLatitude;//经度
@property (nonatomic,copy)    NSString *strLongitude;//维度
@property (nonatomic,strong ) CLLocationManager *locationManager;
@property (weak, nonatomic) IBOutlet UIImageView *dian;

@end

@implementation mainView

-(void)viewWillAppear:(BOOL)animated
{
    
[self locatemap];
    tiao.hidden=YES;
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];

    //去掉透明后导航栏下边的黑边
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];


    [super viewWillAppear:animated];
    [[YSHYSlideViewController shareInstance] addGesture];
    self.navigationController.navigationBar.hidden=YES;
    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(ChargeEye)];
    [_dian setUserInteractionEnabled:YES];
    tap1.numberOfTapsRequired = 1;
    tap1.numberOfTouchesRequired = 1;
    
    [_dian addGestureRecognizer:tap1];
  
   
   [[YSHYSlideViewController shareInstance] firstJiaFrame];
    

}
-(void)ChargeEye{
    tiao=[[UIView alloc]initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height-60, [UIScreen mainScreen].bounds.size.width,60)];
    tiao.backgroundColor=[UIColor whiteColor];
    UIImageView *img=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"tiao"]];
    img.frame=CGRectMake(20, 5, [UIScreen mainScreen].bounds.size.width-80,50);
    tiao.layer.masksToBounds=YES;
    tiao.layer.cornerRadius=20;
    [tiao addSubview:img];
    
    [self.view addSubview:tiao];
    [[YSHYSlideViewController shareInstance] changeJiaFrame];
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [[YSHYSlideViewController shareInstance] removeAllGesture];
}
- (void)viewDidLoad {
    [super viewDidLoad];

// 
//    UIView *storeView=[UIView new];
//    storeView.backgroundColor=[UIColor whiteColor];
//    storeView.frame=CGRectMake(0, [UIScreen mainScreen].bounds.size.height-300, [UIScreen mainScreen].bounds.size.width, 300);
//    storeView.layer.masksToBounds=YES;
//    storeView.layer.cornerRadius=20;
//    UITableView *hah=[[UITableView alloc]initWithFrame:CGRectMake(20, 40, storeView.bounds.size.width, storeView.bounds.size.height) style:UITableViewStylePlain];
//    [hah registerNib:[UINib nibWithNibName:@"search" bundle:nil] forCellReuseIdentifier:@"sousuo"];
//    hah.delegate=self;
//    hah.dataSource=self;
//    [storeView addSubview:hah];
//    [self.navigationController.view addSubview:storeView];
    
       self.tabBarController.tabBar.hidden=YES;
    self.tabBarController.tabBar.backgroundColor=[UIColor clearColor];
    self.tabBarController.tabBar.alpha=0.1f;
//    self.navigationController.navigationBar.backgroundColor=[UIColor clearColor];
//    self.navigationController.navigationBar.alpha=0.1f;
    
    // Do any additional setup after loading the view from its nib.
}
-(void)haha{
    _mapView = [[MKMapView alloc] initWithFrame:self.view.bounds];
    _mapView.mapType = MKMapTypeStandard;
    _mapView.zoomEnabled = YES;
    // 设置地图可滚动
    _mapView.scrollEnabled = YES;
    // 设置地图不可旋转
    _mapView.rotateEnabled = NO;
    //是否显示交通流量
    _mapView.showsTraffic = YES;
    //旋转地图时是否显示指南针
    _mapView.showsCompass = YES;
    [self.view addSubview:_mapView];
    
    _mapView.showsUserLocation = YES;
    [self locateToLatitude:jin.floatValue longitude:wei.floatValue];
    CLLocationCoordinate2D to = {jin.floatValue , wei.floatValue};
    CLLocationCoordinate2D from = {jin.floatValue , wei.floatValue};
    MKMapCamera* camera = [MKMapCamera cameraLookingAtCenterCoordinate:to
                                                     fromEyeCoordinate:from eyeAltitude:70];
    _mapView.camera = camera;
}
- (void)locatemap{
    
    if ([CLLocationManager locationServicesEnabled]) {
        _locationManager = [[CLLocationManager alloc]init];
        _locationManager.delegate = self;
        [_locationManager requestAlwaysAuthorization];
        _currentCity = [[NSString alloc]init];
        [_locationManager requestWhenInUseAuthorization];
        _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        _locationManager.distanceFilter = 5.0;
        [_locationManager startUpdatingLocation];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - 定位失败
-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"请在设置中打开定位" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"打开定位" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSURL *settingURL = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
        [[UIApplication sharedApplication]openURL:settingURL];
    }];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alert addAction:cancel];
    [alert addAction:ok];
    [self presentViewController:alert animated:YES completion:nil];
}
#pragma mark - 定位成功
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations{
    
    [_locationManager stopUpdatingLocation];
    CLLocation *currentLocation = [locations lastObject];
    CLGeocoder *geoCoder = [[CLGeocoder alloc]init];
    //当前的经纬度
    NSLog(@"当前的经纬度 %f,%f",currentLocation.coordinate.latitude,currentLocation.coordinate.longitude);
    jin =[[NSString alloc]initWithFormat:@"%f",currentLocation.coordinate.latitude];
    wei =[[NSString alloc]initWithFormat:@"%f",currentLocation.coordinate.longitude];
    [self haha];
    CLLocationCoordinate2D center = {currentLocation.coordinate.latitude, currentLocation.coordinate.longitude};
    // 设置地图显示的范围, 地图显示范围越小，细节越清楚
    MKCoordinateSpan span = MKCoordinateSpanMake(0.01, 0.01);
    // 创建MKCoordinateRegion对象，该对象代表地图的显示中心和显示范围
    MKCoordinateRegion region = MKCoordinateRegionMake(center, span);
    // 设置当前地图的显示中心和显示范围
    [_mapView setRegion:region animated:YES];
    //这里的代码是为了判断didUpdateLocations调用了几次 有可能会出现多次调用 为了避免不必要的麻烦 在这里加个if判断 如果大于1.0就return
    NSTimeInterval locationAge = -[currentLocation.timestamp timeIntervalSinceNow];
    if (locationAge > 1.0){//如果调用已经一次，不再执行
        return;
    }
    //地理反编码 可以根据坐标(经纬度)确定位置信息(街道 门牌等)
    [geoCoder reverseGeocodeLocation:currentLocation completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        if (placemarks.count >0) {
            CLPlacemark *placeMark = placemarks[0];
            _currentCity = placeMark.locality;
            if (!_currentCity) {
                _currentCity = @"无法定位当前城市";
            }
            
            
            //看需求定义一个全局变量来接收赋值
//            NSLog(@"当前国家 - %@",placeMark.country);//当前国家
//            NSLog(@"当前城市 - %@",_currentCity);//当前城市
//            NSLog(@"当前位置 - %@",placeMark.subLocality);//当前位置
//            NSLog(@"当前街道 - %@",placeMark.thoroughfare);//当前街道
//            NSLog(@"具体地址 - %@",placeMark.name);//具体地址
//            NSString *message = [NSString stringWithFormat:@"%@,%@,%@,%@,%@",placeMark.country,_currentCity,placeMark.subLocality,placeMark.thoroughfare,placeMark.name];
//
//            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:message delegate:self cancelButtonTitle:nil otherButtonTitles:@"好", nil];
//            [alert show];
        }else if (error == nil && placemarks.count){
            
            NSLog(@"NO location and error return");
        }else if (error){
            
            NSLog(@"loction error:%@",error);
        }
    }];
    
}




- (void)locateToLatitude:(CGFloat)latitude longitude:(CGFloat)longitude{
    
    // 设置地图中心的经度、纬度
    CLLocationCoordinate2D center = {latitude , longitude};
    // 设置地图显示的范围, 地图显示范围越小，细节越清楚
    MKCoordinateSpan span = MKCoordinateSpanMake(0.001, 0.001);
    // 创建MKCoordinateRegion对象，该对象代表地图的显示中心和显示范围
    MKCoordinateRegion region = MKCoordinateRegionMake(center, span);
    // 设置当前地图的显示中心和显示范围
    [_mapView setRegion:region animated:YES];
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
