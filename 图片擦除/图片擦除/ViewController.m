//
//  ViewController.m
//  图片擦除
//
//  Created by niuwan on 16/7/25.
//  Copyright © 2016年 niuwan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageV;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    
    [self.view addGestureRecognizer:pan];
}

- (void)pan:(UIPanGestureRecognizer *)pan {

    CGPoint point = [pan locationInView:self.view];
    
    CGFloat wh = 50;
    CGFloat x = point.x - wh * 0.5;
    CGFloat y = point.y - wh * 0.5;
    
    CGRect curR = CGRectMake(x, y, wh, wh);
    
    UIGraphicsBeginImageContextWithOptions(self.view.bounds.size, NO, 0);
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    [self.imageV.layer renderInContext:ctx];
    
    //擦除
    CGContextClearRect(ctx, curR);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    self.imageV.image = image;
    
    
    
    
}

@end
