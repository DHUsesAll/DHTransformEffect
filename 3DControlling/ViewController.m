//
//  ViewController.m
//  3DControlling
//
//  Created by DreamHack on 15-10-15.
//  Copyright (c) 2015年 DreamHack. All rights reserved.
//

#import "ViewController.h"
#import "DHVector.h"

static const CGFloat maxTranslate_ = 400.f;
//static const CGFloat maxTranslateY_ = 700.f;
static const CGFloat maxRotateRadian_   =   M_PI * 2;

@interface ViewController ()

@property (nonatomic, strong) CALayer * transformLayer;
@property (nonatomic, strong) UIView * transformView;
@property (nonatomic, assign) CGPoint lastPosition;

@property (nonatomic, strong) DHVector * lastTranslate;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
//    [self.view.layer addSublayer:self.transformLayer];
    [self.view addSubview:self.transformView];
    
    CATransform3D transform = self.transformView.layer.transform;
    transform.m34 = -1.f/700;
    
    self.transformView.layer.transform = transform;
    
    
    [self.view addGestureRecognizer:[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(onPanGesture:)]];
}

#pragma mark - private methods

- (CATransform3D)perspectiveRotationTransform:(CGFloat)rotationRadian forTransform:(CATransform3D)transform
{
    CATransform3D retTransform = CATransform3DIdentity;
    
    retTransform.m34 = - 1.f/700;
    
    
    return retTransform;
}


#pragma mark - callback
- (void)onPanGesture:(UIPanGestureRecognizer *)sender
{
//    CGFloat referenceHeight = CGRectGetHeight(self.view.bounds);
    if (sender.state == UIGestureRecognizerStateBegan) {
        
    } else if (sender.state == UIGestureRecognizerStateChanged) {
        
        CGPoint position = [sender translationInView:sender.view];
        position.y = -position.y;
        DHVector * vector = [[DHVector alloc] initWithCoordinateExpression:position];
        
        DHVector * translateVector = [DHVector aVector:vector substractedByOtherVector:self.lastTranslate];
        
        self.lastTranslate = vector;
        
        CGFloat length = 2;
        CGFloat radian = length / maxTranslate_ * maxRotateRadian_;
        
        DHVector * rotateVector = [DHVector vectorWithVector:translateVector];
        [rotateVector rotateClockwiselyWithRadian:M_PI/2];
        [rotateVector translationToPoint:CGPointZero];
        
        self.transformView.layer.transform = CATransform3DRotate(self.transformView.layer.transform, radian, rotateVector.endPoint.x, - rotateVector.endPoint.y, 0);
        
        
    } else if (sender.state == UIGestureRecognizerStateCancelled || sender.state == UIGestureRecognizerStateEnded) {
        
    }
}
#pragma mark - getter
- (CALayer *)transformLayer
{
    if (!_transformLayer) {
        _transformLayer = ({
        
            CALayer * layer = [CALayer layer];
            layer.frame = CGRectMake(0, 0, 320, 240);
            layer.position = self.view.center;
            
            layer.backgroundColor = [UIColor blueColor].CGColor;
            
            layer;
        
        });
    }
    return _transformLayer;
}

- (UIView *)transformView
{
    if (!_transformView) {
        _transformView = ({
        
            UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 240)];
            view.center = self.view.center;
            view.backgroundColor = [UIColor blueColor];
            view.layer.contents = (__bridge id)[UIImage imageNamed:@"1.jpg"].CGImage;
            view;
        
        });
        
    }
    return _transformView;
}


@end
