//
//  CustomCell.h
//  TransitionAnimation
//
//  Created by Jeffrey on 15/9/20.
//  Copyright © 2015年 Jeffrey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EFCircleImageView.h"

@interface CustomCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet EFCircleImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *indexLabel;

@end
