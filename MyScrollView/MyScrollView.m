//
//  MyScrollView.m
//  MyScrollView
//
//  Created by Nathan Hsu on 2018-02-26.
//  Copyright © 2018 Nathan Hsu. All rights reserved.
//

#import "MyScrollView.h"


@implementation MyScrollView

- (instancetype)init
{
    self = [super init];
    if (self) {
        UIPanGestureRecognizer *myPanGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panHandler:)];
        [self addGestureRecognizer:myPanGestureRecognizer];
    }
    return self;
}

// If we wanted to use storyboard, then custom initializers will need to be overrident with initWithCoder:

//- (instancetype)initWithCoder:(NSCoder *)aDecoder{
//
//    self = [super initWithCoder:aDecoder];
//    if ( self ){
//
//        UIPanGestureRecognizer *myPanGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panHandler:)];
//        [self addGestureRecognizer:myPanGestureRecognizer];
//
//    }
//    return self;
//}


-(void) panHandler: (UIPanGestureRecognizer *)gestureRecognizer {
    
    CGPoint panned = [gestureRecognizer translationInView:self];
//    NSLog(@"%@", NSStringFromCGPoint(panned));
    
    // content limits
    CGRect upperLimit = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.bounds.size.width, self.bounds.size.height);
    CGRect lowerLimit = CGRectMake(self.frame.origin.x, self.contentSize.height - self.bounds.size.height, self.bounds.size.width, self.bounds.size.height);
    CGRect pannedExtent = CGRectMake(self.bounds.origin.x, self.bounds.origin.y - panned.y, self.bounds.size.width, self.bounds.size.height);
    
    CGRect clippedExtent; //this will be passed into UIView method `setBounds` to move our custom scroll view.
    
    // logic to set the CGRect that will actually be used to move the scroll view
    if (pannedExtent.origin.y < upperLimit.origin.y) {
        clippedExtent = upperLimit;
    } else if (pannedExtent.origin.y > lowerLimit.origin.y) {
        clippedExtent = lowerLimit;
    } else {
        clippedExtent = pannedExtent;
    }
    
    // setting the bounds
    [self setBounds:clippedExtent];
    
    
//    NSLog(@"%@", NSStringFromCGPoint(self.bounds.origin));
    
    // this resets each gesture event to zero so that the next gesture event does not pile on top of existing values from the previous gesture.
    [gestureRecognizer setTranslation:CGPointZero inView:self];
}


@end
