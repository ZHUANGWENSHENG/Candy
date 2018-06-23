//
//  News.m
//  ItApp1
//
//  Created by QUAQUA on 2017/11/8.
//  Copyright © 2017年 zws. All rights reserved.
//

#import "News.h"
#import "NewsCell.h"
#import "YSHYSlideViewController.h"






@interface News ()<UITableViewDelegate,UITableViewDataSource>{
    NSMutableArray *arr1,*arr2,*image,*arr3,*arr4,*arr5;
    UIButton *bianJi;
    //int cellnum;
}

@end

@implementation News

- (void)viewDidLoad {
    [super viewDidLoad];
    UIRefreshControl *refresh = [[UIRefreshControl alloc]init];
    refresh.attributedTitle = [[NSAttributedString alloc]initWithString:@"下拉刷新"];
    [refresh addTarget:self action:@selector(refresh) forControlEvents:UIControlEventValueChanged];
    self.refreshControl = refresh;

    self.tableView.frame=[UIScreen mainScreen].bounds;
    NSLog(@"%f",[UIScreen mainScreen].bounds.size.height);
    self.tableView.tableFooterView=[[UIView alloc]init];
    self.title=@"消息";

  arr1=[[NSMutableArray alloc]initWithObjects:@"aaa",@"ccc",@"ddd",@"eee",@"fff", nil];
    arr2=[[NSMutableArray alloc]initWithObjects:@"ccc",@"ddd",@"aaa",@"ddd",@"sss", nil];
    image=[[NSMutableArray alloc]initWithObjects:@"Gallery - Image - 1",@"Gallery - Image - 2",@"Gallery - Image - 2",@"Gallery - Image - 1",@"Gallery - Image - 2", nil];

    
    [self.tableView registerNib:[UINib nibWithNibName:@"NewsCell" bundle:nil] forCellReuseIdentifier:@"News"];
   // [self.navigationController setNavigationBarHidden:NO];


    self.navigationController.navigationBar.barTintColor=[UIColor colorWithRed:0.317 green:0.72 blue:0.549 alpha:1];
    
////
    UIButton *back=[[UIButton alloc]init];
    UIImage *img=[UIImage imageNamed:@"Chevron"];
    [back setImage:img forState:UIControlStateNormal];
    //    back.frame=CGRectMake(0, 0, 12.5, 21);
    [back addTarget:self action:@selector(toIndexView) forControlEvents:UIControlEventTouchDown];
    UIBarButtonItem *left=[[UIBarButtonItem alloc]initWithCustomView:back];
    self.navigationItem.leftBarButtonItem=left;
   // self.tabBarController.tabBar.hidden=YES;
    self.editing=NO;

    
    self.navigationController.navigationBarHidden=YES;
    [self.navigationController setNavigationBarHidden:NO];


//    self.view.backgroundColor=[UIColor redColor];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
//-(void)editing{
//     self.editing=YES;
////    [bianJi setTitle:@"取消" forState:UIControlStateNormal];
////    [bianJi addTarget:self action:@selector(quXiao) forControlEvents:UIControlEventTouchDown];
//}
//-(void)quXiao{
//    self.editing=NO;
//}
-(void)toIndexView{
        [[YSHYSlideViewController shareInstance] ppp];
//     [self.navigationController setNavigationBarHidden:YES];
    self.tabBarController.tabBar.hidden=NO;
    [self.navigationController popViewControllerAnimated:YES];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated{
//    [self AFGetData];
//    [self AFNetMonitor];
    
    
}
- (void)refresh{
    //    if (self.refreshControl.refreshing){
    // [self.modelArray removeAllObjects];//清除旧数据，每次都加载最新的数据
    //self.refreshControl.attributedTitle = [[NSAttributedString alloc]initWithString:@"加载中..."];
    // [self addData];
    self.refreshControl.attributedTitle = [[NSAttributedString alloc]initWithString:@"下拉刷新"];
    [self.tableView reloadData];
//    [self AFGetData];
//    [self AFNetMonitor];
    [self.refreshControl endRefreshing];
    
}
#pragma mark - Table view data source
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 65;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
//- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
//    return 0.1;
//};
//-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
//    return 0.1;
//}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return arr1.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    NewsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"News" forIndexPath:indexPath];

    
    cell.name.text=arr1[indexPath.row];
    cell.news.text=arr2[indexPath.row];
    cell.head.image=[UIImage imageNamed:image[indexPath.row]];
    cell.head.layer.masksToBounds=YES;
    cell.head.layer.cornerRadius=cell.head.bounds.size.width/2;
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init]; //初始化格式器。
    [formatter setDateFormat:@"hh:mm:ss"];//定义时间为这种格式： YYYY-MM-dd hh:mm:ss 。
    NSString *currentTime = [formatter stringFromDate:[NSDate date]];//将NSDate  ＊对象 转化为 NSString ＊对象。
    cell.time.text=currentTime;
    return cell;
}


//- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
//        return NO;
//}
/*
 Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
     Return NO if you do not want the specified item to be editable.
    return YES;
}
*/



- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
//    if (editingStyle == UITableViewCellEditingStyleDelete) {
//        [arr1 removeObject:arr1[indexPath.row]];
//        [arr2 removeObject:arr2[indexPath.row]];
//        [image removeObject:image[indexPath.row]];
//
//
//        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
//    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
//
//    }
    //cellnum=indexPath.row+1;
    //[self AFDeleteData];
}
//-(void)AFNetMonitor{
//    [[AFNetworkReachabilityManager sharedManager]startMonitoring];
//    [[AFNetworkReachabilityManager sharedManager]
//     setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status){
//         switch(status){
//             case AFNetworkReachabilityStatusNotReachable:
//                 NSLog(@"无网络连接！");
//                 break;
//
//             case AFNetworkReachabilityStatusReachableViaWiFi:
//                 NSLog(@"通过wifi连接的网络");
//             case AFNetworkReachabilityStatusReachableViaWWAN:
//             {
//                 NSLog(@"通过4g");
//             }
//             default:
//                 break;
//
//         }
//         [self.tableView reloadData];
//
//     }];
//}
//-(void)AFGetData{
//
//    AFHTTPSessionManager* session=[AFHTTPSessionManager manager];
//    session.responseSerializer=[AFHTTPResponseSerializer serializer];
//    [session GET:@"http://127.0.0.1:3000/n" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        NSLog(@"下载成功");
//
//
//        NSDictionary *jsonObject = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
//        // NSLog(@"res=%@",jsonObject);
//
//        arr1=[NSMutableArray arrayWithArray:[jsonObject valueForKeyPath:@"name"]];
//        arr2=[NSMutableArray arrayWithArray:[jsonObject valueForKeyPath:@"news"]];
//        image=[NSMutableArray arrayWithArray:[jsonObject valueForKeyPath:@"head"]];
//
//        //     NSLog(@"%@",arr1);
//
//
//        [self.tableView reloadData];
//
//
//
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        NSLog(@"下载失败");
//    }];
//
//
//}
//-(void)AFDeleteData{
//    AFHTTPSessionManager* session=[AFHTTPSessionManager manager];
//    session.responseSerializer=[AFHTTPResponseSerializer serializer];
//    NSDictionary *parameters = @{@"id":@1};
//    [session DELETE:@"http://127.0.0.1:3000/n" parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        NSLog(@"成功");
//    //请求成功的操作
//
////    NSDictionary *dict = [NSJSONSerialization  JSONObjectWithData:responseObject options:0 error:NULL];
////    arr3=[NSMutableArray arrayWithArray:[dict valueForKeyPath:@"name"]];
////    arr4=[NSMutableArray arrayWithArray:[dict valueForKeyPath:@"news"]];
////    arr5=[NSMutableArray arrayWithArray:[dict valueForKeyPath:@"head"]];
//
//
//} failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//    NSLog(@"失败");
//    //失败的处理
//    //  [AFNetworkRequest requestFailed:error];
//
//
//}];
//}
//
/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:<#@"Nib name"#> bundle:nil];
    
    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
