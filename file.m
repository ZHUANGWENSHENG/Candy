//
//  file.m
//  Candy
//
//  Created by QUAQUA on 2018/4/21.
//  Copyright © 2018年 JING. All rights reserved.
//

#import "file.h"
#import <BmobSDK/Bmob.h>
#import"TableViewCell.h"


@interface file ()<UITableViewDelegate,UITableViewDataSource>{
    NSMutableArray *fileName;
     NSMutableArray *arr;
    NSString *qq;
    NSString *haha;
    //BmobFile *file;
    
}

@end

@implementation file{
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *back=[[UIButton alloc]init];
    UIImage *img=[UIImage imageNamed:@"Chevron"];
    [back setImage:img forState:UIControlStateNormal];
    //    back.frame=CGRectMake(0, 0, 12.5, 21);
    [back addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchDown];
    UIBarButtonItem *left=[[UIBarButtonItem alloc]initWithCustomView:back];
    self.navigationItem.leftBarButtonItem=left;
    [self.tableView registerNib:[UINib nibWithNibName:@"TableViewCell" bundle:nil] forCellReuseIdentifier:@"ha"];
    self.title=@"文件";
    [Bmob registerWithAppKey:@"a8bfc0dc7c2e368bf0b6650f10a799dd"];

    
    BmobQuery   *bquery = [BmobQuery queryWithClassName:@"_User"];
    //查找GameScore表的数据
        arr=[[NSMutableArray alloc]init];
    [bquery findObjectsInBackgroundWithBlock:^(NSArray *array, NSError *error) {
    
        for (BmobObject *obj in array) {
            //打印playerName

             BmobFile *file = (BmobFile *)[obj objectForKey:@"haha"];
            //[arr addObject:file.name];
           // NSLog(@"%@",array);
             //NSLog(@"%@",file.name);
           haha=[[NSString alloc]initWithFormat:@"%@", file.name];
            //haha=file.name;
            
            [arr addObject:haha];
            

            
        }
        NSLog(@"%@",arr);
         [self.tableView reloadData];
//        NSLog(@"%lu",(unsigned long)array.count);
    }];
 
}
-(void)back{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return arr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ha" forIndexPath:indexPath];
    cell.qq.text=arr[indexPath.row];
    // Configure the cell...
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

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
