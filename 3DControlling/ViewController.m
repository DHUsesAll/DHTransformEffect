//
//  ViewController.m
//  3DControlling
//
//  Created by DreamHack on 15-10-15.
//  Copyright (c) 2015年 DreamHack. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) CALayer * transformLayer;
@property (nonatomic, assign) CGFloat lastTranslate;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self.view.layer addSublayer:self.transformLayer];
    [self.view addGestureRecognizer:[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(onPanGesture:)]];
}
#pragma mark - callback
- (void)onPanGesture:(UIPanGestureRecognizer *)sender
{
    if (sender.state == UIGestureRecognizerStateBegan) {
        
    } else if (sender.state == UIGestureRecognizerStateChanged) {
        
    } else if (sender.state == UIGestureRecognizerStateCancelled || sender.state == UIGestureRecognizerStateEnded) {
        
    }
}
#pragma mark - getter
- (CALayer *)transformLayer
{
    if (!_transformLayer) {
        _transformLayer = ({
        
            CALayer * layer = [CALayer layer];
            layer.frame = CGRectMake(0, 0, 200, 320);
            layer.position = self.view.center;
            
            layer.backgroundColor = [UIColor blueColor].CGColor;
            
            layer;
        
        });
    }
    return _transformLayer;
}


@end
