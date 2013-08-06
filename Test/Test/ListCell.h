//
//  ListCell.h
//  Test
//
//  Created by hcui on 13-8-6.
//  Copyright (c) 2013年 kada. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListCell : UITableViewCell
{
    UIImageView *image;
    UILabel *lable;
}
@property(retain,nonatomic) IBOutlet UIImageView *image;
@property(retain,nonatomic) IBOutlet UILabel *lable;
@end
