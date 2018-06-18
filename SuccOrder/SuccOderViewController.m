//
//  SuccOderViewController.m
//  Candy
//
//  Created by DMT on 2018/3/20.
//  Copyright © 2018年 JING. All rights reserved.
//

#import "SuccOderViewController.h"
#import "SuccOrderTableViewCell.h"

@interface SuccOderViewController ()<UITableViewDelegate,UITableViewDataSource>


@end

@implementation SuccOderViewController
- (IBAction)hui:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
     [self.tableview registerNib:[UINib nibWithNibName:@"SuccOrderTableViewCell" bundle:nil] forCellReuseIdentifier:@"qq"];
    self.tableview.delegate=self;
    self.tableview.dataSource=self;
    self.tableview.rowHeight=80;
    
    // Do any additional setup after loading the view from its nib.
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
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SuccOrderTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"qq" forIndexPath:indexPath];
    return cell;
}







@end
