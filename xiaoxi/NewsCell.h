//
//  NewsCell.h
//  ItApp1
//
//  Created by QUAQUA on 2017/11/1.
//  Copyright © 2017年 zws. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *news;
@property (weak, nonatomic) IBOutlet UIImageView *head;
@property (weak, nonatomic) IBOutlet UILabel *time;

@end
