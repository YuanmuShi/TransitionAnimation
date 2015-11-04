//
//  FirstViewController.m
//  TransitionAnimation
//
//  Created by Jeffrey on 15/9/19.
//  Copyright © 2015年 Jeffrey. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"
#import "CustomPushAnimation.h"
#import "CustomCell.h"

@interface FirstViewController () <UINavigationControllerDelegate, UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, strong) NSArray *contents;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"First";
    
    self.navigationController.delegate = self;
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.contents.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath;
{
    CustomCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CustomCell" forIndexPath:indexPath];
    
    [cell.imageView setImageURL:[NSURL URLWithString:[self.contents objectAtIndex:indexPath.row]] withPlaceholderImage:[UIImage imageNamed:@"Image_0"]];
    cell.indexLabel.text = [NSString stringWithFormat:@"Image %@", @(indexPath.row + 1)];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{    
    [self performSegueWithIdentifier:@"ShowSecondVCSegue" sender:indexPath];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"ShowSecondVCSegue"] && [sender isKindOfClass:[NSIndexPath class]]) {
        SecondViewController *vc = (SecondViewController *)segue.destinationViewController;
        vc.indexPath = (NSIndexPath *)sender;
        vc.imageURL = [NSURL URLWithString:[self.contents objectAtIndex:[(NSIndexPath *)sender row]]];
    }
}

- (id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                            animationControllerForOperation:(UINavigationControllerOperation)operation
                                                         fromViewController:(UIViewController *)fromVC
                                                           toViewController:(UIViewController *)toVC
{
    NSLog(@"animationControllerForOperation");
    return operation == UINavigationControllerOperationPush ? [CustomPushAnimation new] : nil;
}

#pragma mark - Getter & Setter

- (NSArray *)contents
{
    if (!_contents) {
        _contents = @[@"http://image226-c.poco.cn/best_pocoers/20140224/9122014022416201991361839.jpg",
                      @"http://psp.gamehome.tv/html/UploadFiles_9061/200709/20070901180105936.jpg",
                      @"http://image.xcar.com.cn/attachments/a/day_111102/2011110210_2dbe529db574460a2ea4KWgZ5D6a91Hn.jpg",
                      @"http://imgsrc.baidu.com/forum/pic/item/b497eeefce1b9d16b36f99ecf3deb48f8d546460.jpg",
                      @"http://imgsrc.baidu.com/forum/pic/item/53ef46a7d933c89525b33a14d11373f0800200df.jpg"];
    }
    return _contents;
}

@end
