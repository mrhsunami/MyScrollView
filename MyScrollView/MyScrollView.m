//
//  MyScrollView.m
//  MyScrollView
//
//  Created by Nathan Hsu on 2018-02-26.
//  Copyright © 2018 Nathan Hsu. All rights reserved.
//

#import "MyScrollView.h"

@interface MyScrollView()

@end


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
    NSLog(@"%@", NSStringFromCGPoint(panned));
    
    
//    CGFloat height = self.contentSize.height;
    
    CGRect upperLimit = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.bounds.size.width, self.bounds.size.height);
    CGRect lowerLimit = CGRectMake(self.frame.origin.x, self.contentSize.height - self.bounds.size.height, self.bounds.size.width, self.bounds.size.height);
    CGRect newRect = CGRectMake(self.bounds.origin.x, self.bounds.origin.y - panned.y, self.bounds.size.width, self.bounds.size.height);
    
    CGRect actualNewRect;
    
    if (newRect.origin.y < upperLimit.origin.y) {
        actualNewRect = upperLimit;
    } else if (newRect.origin.y > lowerLimit.origin.y) {
        actualNewRect = lowerLimit;
    } else {
        actualNewRect = newRect;
    }
    
    
    [self setBounds:actualNewRect];
    
    
    NSLog(@"%@", NSStringFromCGPoint(self.bounds.origin));
    
    [gestureRecognizer setTranslation:CGPointZero inView:self];
}


@end
