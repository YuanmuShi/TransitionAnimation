//
//  SecondViewController.h
//  TransitionAnimation
//
//  Created by Jeffrey on 15/9/19.
//  Copyright © 2015年 Jeffrey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EFCircleImageView.h"

@interface SecondViewController : UIViewController

@property (strong, nonatomic) NSIndexPath *indexPath;
@property (strong, nonatomic) NSURL *imageURL;

@property (weak, nonatomic) IBOutlet EFCircleImageView *detailImageView;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;

@end
