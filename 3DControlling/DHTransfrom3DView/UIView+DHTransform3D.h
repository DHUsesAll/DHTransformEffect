//
//  UIView+DHTransform3D.h
//  3DControlling
//
//  Created by DreamHack on 15-10-19.
//  Copyright (c) 2015年 DreamHack. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (DHTransform3D)

@property (nonatomic, assign) CGFloat transformUnit;

/**
 *   调用一次，主要是设置transform.m34来实现透视效果
 *   在初始化这个view之后就调用
 */
- (void)prepareForTransform3D;

/**
 *  使用pan手势的transitionInView方法获取transition
 *
 *  @param panTransition pan手势的transition
 */
- (void)setTransform3DWithPanTranslation:(CGPoint)panTranslation;

/**
 *  使用缩放手势的scale属性来控制视图的缩放
 *
 *  @param pinchScale pinch手势的scale属性
 */

// coming soon
//- (void)zoomWithPinchScale:(CGFloat)pinchScale;


/**
 *  围绕Z轴旋转
 *
 *  @param radian 旋转的弧度
 */
// coming soon
//- (void)rotateByZWithRadian:(CGFloat)radian;

@end
