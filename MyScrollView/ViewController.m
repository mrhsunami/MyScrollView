//
//  ViewController.m
//  MyScrollView
//
//  Created by Nathan Hsu on 2018-02-26.
//  Copyright © 2018 Nathan Hsu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) MyScrollView *myScrollView;
@property (strong, nonatomic)  UIView *redView;
@property (strong, nonatomic)  UIView *greenView;
@property (strong, nonatomic)  UIView *blueView;
@property (strong, nonatomic)  UIView *yellowView;

@end




@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.myScrollView = [[MyScrollView alloc] init];
    [self.view addSubview: self.myScrollView];
    self.myScrollView.frame = self.view.bounds;
    

    self.redView = [[UIView alloc] init];
    [self.myScrollView addSubview:self.redView];
    self.redView.frame = CGRectMake(20, 20+20, 100, 100); //i added 20 to the y origin so that it has a margin away from the top bar.
    self.redView.backgroundColor = UIColor.redColor;
    
    self.greenView = [[UIView alloc] init];
    [self.myScrollView addSubview:self.greenView];
    self.greenView.frame = CGRectMake(150, 150, 150, 200);
    self.greenView.backgroundColor = UIColor.greenColor;

    self.blueView = [[UIView alloc] init];
    [self.myScrollView addSubview:self.blueView];
    self.blueView.frame = CGRectMake(40, 400, 200, 150);
    self.blueView.backgroundColor = UIColor.blueColor;

    self.yellowView = [[UIView alloc] init];
    [self.myScrollView addSubview:self.yellowView];
    self.yellowView.frame = CGRectMake(100, 600, 180, 150);
    self.yellowView.backgroundColor = UIColor.yellowColor;

    CGFloat maxHeight = 0;
    
    for (UIView *subview in self.myScrollView.subviews) {
        CGFloat bottomOfSubview = subview.frame.size.height + subview.frame.origin.y + 20;
        if (bottomOfSubview > maxHeight)
        {
            maxHeight = bottomOfSubview;
        }
    }
    
    self.myScrollView.contentSize = CGSizeMake(self.myScrollView.bounds.size.width, maxHeight);
}




- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
//    CGRect movedDown100 = CGRectMake(0, 100, self.view.bounds.size.width, self.view.bounds.size.height);
//    self.myScrollView.bounds = movedDown100;
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
