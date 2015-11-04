//
//  SecondViewController.m
//  TransitionAnimation
//
//  Created by Jeffrey on 15/9/19.
//  Copyright © 2015年 Jeffrey. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];

//    self.detailImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"Image_%@", @(self.indexPath.row)]];
    
    [self.detailImageView setImageURL:self.imageURL withPlaceholderImage:[UIImage imageNamed:[NSString stringWithFormat:@"Image_%@", @(self.indexPath.row)]]];
    self.descriptionLabel.text = [NSString stringWithFormat:@"Image %@", @(self.indexPath.row + 1)];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
}

@end
