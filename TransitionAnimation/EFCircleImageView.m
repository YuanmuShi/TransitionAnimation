//
//  EFCircleImageView.m
//  EFProgressTest
//
//  Created by Jeffey Shi on 9/14/15.
//  Copyright (c) 2015 EF. All rights reserved.
//

#import "EFCircleImageView.h"

@implementation EFCircleImageView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self buildView];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self buildView];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self buildView];
    }
    return self;
}

- (void)buildView
{
    CGRect rect;
    rect.size = self.frame.size;
    rect.origin = CGPointZero;
    
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, [UIColor clearColor].CGColor);

    CGRect rectImage = CGRectMake(1.0, 1.0, rect.size.width-2.0, rect.size.height-2.0);
    CGContextAddEllipseInRect(context, rectImage);
    CGContextClip(context);
    
    [self.image drawInRect:rect];
    CGContextAddEllipseInRect(context, rect);
    CGContextStrokePath(context);
    self.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    self.layer.shadowOpacity = 0.5;
    self.layer.shadowOffset = CGSizeMake(1.5, 1.5);
}

- (void)setImageURL:(NSURL *)imageURL withPlaceholderImage:(UIImage *)placeholderImage
{
    self.image = placeholderImage;
    [self buildView];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSData *data = [[NSData alloc] initWithContentsOfURL:imageURL];
        if (data) {
            UIImage *webImage = [UIImage imageWithData:data];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                self.image = webImage;
                [self buildView];
            });
        }
    });
}

@end
