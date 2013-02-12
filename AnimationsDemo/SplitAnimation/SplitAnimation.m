//
//  SplitAnimation.m
//  AnimationsDemo
//
//  Created by Ilker Baltaci on 2/11/13.
//  Copyright (c) 2013 Ilker Baltaci. All rights reserved.
//

#import "SplitAnimation.h"
#import <QuartzCore/QuartzCore.h>

@interface SplitAnimation ()

@end

@implementation SplitAnimation

@synthesize delegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    animationButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [animationButton setFrame:CGRectMake(20, self.view.frame.size.height-60, 280, 40)];
    [animationButton addTarget:self action:@selector(startAnimation:) forControlEvents:UIControlEventTouchUpInside];
    [animationButton setTitle:@"Press to split" forState:UIControlStateNormal];

    self.view.backgroundColor = [UIColor orangeColor];
    backgroundImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width,
                                                                        self.view.frame.size.height)];
    
    [backgroundImageView setImage:[UIImage imageNamed:@"registrationIphone5.png"]];
    [self.view addSubview:backgroundImageView];
    
	// Do any additional setup after loading the view.
    
    
    [self.view addSubview:animationButton];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)startAnimation:(id)sender
{

    UIGraphicsBeginImageContextWithOptions(self.view.bounds.size, self.view.opaque, 0.0);
    [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *screenshot = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    [self.delegate removeFromSuperViewWithSplitAnimation:screenshot];
    
}

@end
