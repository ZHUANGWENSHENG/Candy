//
//  photography.m
//  Candy
//
//  Created by QUAQUA on 2018/3/23.
//  Copyright © 2018年 JING. All rights reserved.
//

#import "photography.h"
#import "photo.h"
#import "PersonDesignViewController.h"

@interface photography (){
    NSMutableArray *arr1;
    NSMutableArray *arr2;
    NSMutableArray *arr3;
    
}

@end

@implementation photography

- (void)viewDidLoad {
    [super viewDidLoad];
      self.navigationController.navigationBar.barTintColor=[UIColor whiteColor];
    [self.tableView registerNib:[UINib nibWithNibName:@"photo" bundle:nil] forCellReuseIdentifier:@"photo"];
    self.tableView.rowHeight=425;
    self.title=@"摄影";
  
    arr1=[[NSMutableArray alloc]initWithObjects:@"奥黛丽.赫本",@"真理与反思",@"石原里美", nil];
    arr2=[[NSMutableArray alloc]initWithObjects:@"奥黛丽.赫本",@"zhen",@"奥黛丽.赫本", nil];
    
    UIButton *back=[[UIButton alloc]init];
    UIImage *img2=[UIImage imageNamed:@"Chevron"];
    [back setImage:img2 forState:UIControlStateNormal];
    //    back.frame=CGRectMake(0, 0, 12.5, 21);
    [back addTarget:self action:@selector(toIndexView) forControlEvents:UIControlEventTouchDown];
    UIBarButtonItem *left=[[UIBarButtonItem alloc]initWithCustomView:back];
    self.navigationItem.leftBarButtonItem=left;
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
-(void)toIndexView{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.navigationController pushViewController:[PersonDesignViewController new] animated:YES];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 3;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    photo *cell = [tableView dequeueReusableCellWithIdentifier:@"photo" forIndexPath:indexPath];
    
   
    cell.name.text=arr1[indexPath.row];
    cell.photo.image=[UIImage imageNamed:arr2[indexPath.row]];
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
