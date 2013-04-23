//
//  LVRotatingButtonViewController.m
//  AnimationsDemo
//
//  Created by Ilker Baltaci on 4/23/13.
//  Copyright (c) 2013 Ilker Baltaci. All rights reserved.
//

#import "LVRotatingButtonViewController.h"
#import "LVRotatingButton.h"

@interface LVRotatingButtonViewController ()

@end

@implementation LVRotatingButtonViewController



- (void)viewDidLoad
{
    [super viewDidLoad];

    LVRotatingButton *rotateingButton = [[LVRotatingButton alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    rotateingButton.center = self.view.center;
    [rotateingButton addTarget:rotateingButton action:@selector(rotateButton)
              forControlEvents:UIControlEventTouchUpInside];
    [rotateingButton addTarget:self action:@selector(butonAction)
              forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:rotateingButton];
    

}

-(void)butonAction{
    
    NSLog(@"Action");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
