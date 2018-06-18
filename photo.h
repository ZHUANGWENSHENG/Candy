//
//  photo.h
//  Candy
//
//  Created by QUAQUA on 2018/3/23.
//  Copyright © 2018年 JING. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface photo : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UIImageView *photo;
@property (weak, nonatomic) IBOutlet UIImageView *head;
@property (weak, nonatomic) IBOutlet UILabel *user;

@end
