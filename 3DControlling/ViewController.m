//
//  ViewController.m
//  3DControlling
//
//  Created by DreamHack on 15-10-15.
//  Copyright (c) 2015年 DreamHack. All rights reserved.
//

#import "ViewController.h"
#import "UIView+DHTransform3D.h"

@interface ViewController ()

@property (nonatomic, strong) UIView * transformView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    [self.view addSubview:self.transformView];
    
    [self.view addGestureRecognizer:[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(onPanGesture:)]];
}

#pragma mark - callback
- (void)onPanGesture:(UIPanGestureRecognizer *)sender
{
    if (sender.state == UIGestureRecognizerStateBegan) {
        
    } else if (sender.state == UIGestureRecognizerStateChanged) {
        
        [self.transformView setTransform3DWithPanTranslation:[sender translationInView:sender.view]];
        
    } else if (sender.state == UIGestureRecognizerStateCancelled || sender.state == UIGestureRecognizerStateEnded) {
        
    }
}
#pragma mark - getter

- (UIView *)transformView
{
    if (!_transformView) {
        _transformView = ({
        
            UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 240)];
            view.transformUnit = 2.5;
            view.center = self.view.center;
            view.backgroundColor = [UIColor blueColor];
            view.layer.contents = (__bridge id)[UIImage imageNamed:@"1.jpg"].CGImage;
            [view prepareForTransform3D];
            view;
        
        });
        
    }
    return _transformView;
}


@end
