# DHTransformEffect
Controlling transform3D for a view by pan gesture

![fig1](https://github.com/DHUsesAll/GitImages/blob/master/DHTransform3D/2.gif)

#Usage
It's very easy to use.

You import the category, make a view call prepareForTransform3D, set the transformUnit property to (0, 100).
Then add a pan gesture and implement the gesture callback like this:
```
- (void)onPanGesture:(UIPanGestureRecognizer *)sender
{
    if (sender.state == UIGestureRecognizerStateBegan) {
        
    } else if (sender.state == UIGestureRecognizerStateChanged) {
        
        [sender.view setTransform3DWithPanTransition:[sender translationInView:sender.view]];
        
    } else if (sender.state == UIGestureRecognizerStateCancelled || sender.state == UIGestureRecognizerStateEnded) {
        
    }
}
```



![fig2](https://github.com/DHUsesAll/GitImages/blob/master/DHTransform3D/1.gif)
