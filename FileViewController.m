//
//  FileViewController.m
//  Candy
//
//  Created by 牛魔王 on 2018/7/16.
//  Copyright © 2018年 JING. All rights reserved.
//

#import "FileViewController.h"
#import "SYCacheFileViewController.h"
#import "SYCacheFileManager.h"

@interface FileViewController ()

@end

@implementation FileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"缓存目录";
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Cache" style:UIBarButtonItemStyleDone target:self action:@selector(buttonClick)];
    NSLog(@"%@",NSHomeDirectory());
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)buttonClick
{
    SYCacheFileViewController *cacheVC = [[SYCacheFileViewController alloc] init];
    // 指定目录，或默认目录
    //    NSString *path = [SYCacheFileManager documentDirectoryPath];
    //    NSArray *array = [SYCacheFileManager fileModelsWithFilePath:path];
    //    cacheVC.cacheArray = [NSMutableArray arrayWithArray:array];
    // 其它属性设置
    cacheVC.cacheTitle = @"我的缓存文件";
    [self.navigationController pushViewController:cacheVC animated:YES];
    
    NSString *path = [SYCacheFileManager homeDirectoryPath];
    NSLog(@"path = %@", path);
    //
    //    path = [SYCacheFileManager documentDirectoryPath];
    //    NSLog(@"path = %@", path);
    //
    //    path = [SYCacheFileManager cacheDirectoryPath];
    //    NSLog(@"path = %@", path);
    //
    //    path = [SYCacheFileManager libraryDirectoryPath];
    //    NSLog(@"path = %@", path);
    //
    //    path = [SYCacheFileManager tmpDirectoryPath];
    //    NSLog(@"path = %@", path);
    //
    //    path = [SYCacheFileManager newFilePathWithPath:[SYCacheFileManager tmpDirectoryPath] name:@"Tmp001"];
    //    NSLog(@"path = %@", path);
    //
    //    path = [SYCacheFileManager newFilePathCacheWithName:@"Tmp002"];
    //    NSLog(@"path = %@", path);
    //
    //    path = [SYCacheFileManager newFilePathDocumentWithName:@"Document001"];
    //    NSLog(@"path = %@", path);
    //
    //    path = [SYCacheFileManager newFilePathWithPath:[SYCacheFileManager tmpDirectoryPath] name:@"Tmp001.png"];
    //    NSLog(@"path = %@", path);
    
    
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
