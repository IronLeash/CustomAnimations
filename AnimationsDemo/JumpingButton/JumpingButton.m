//
//  JumpingButton.m
//  AnimationsDemo
//
//  Created by Ilker Baltaci on 2/28/13.
//  Copyright (c) 2013 Ilker Baltaci. All rights reserved.
//

#import "JumpingButton.h"

@interface JumpingButton ()

@end

@implementation JumpingButton

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
    self.view.backgroundColor = [UIColor grayColor];
    
    self.navigationItem.title = @"Jump shadow";
    self.navigationItem.backBarButtonItem.title = @"Back";
    
    UIButton *aButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [aButton addTarget:self action:@selector(startTheAnimation:) forControlEvents:UIControlEventTouchUpInside];
    [aButton setTitle:@"Jump" forState:UIControlStateNormal];
    
    [self.view addSubview:aButton];
    [aButton setFrame:CGRectMake(0, 0, 100, 40)];
    aButton.center = self.view.center;
    
    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)startTheAnimation:(id)sender{

   UIButton *currentButton = (UIButton*)sender;
    currentButton.layer.shadowColor = [UIColor blackColor].CGColor;
    currentButton.layer.shadowOpacity = 0.7f;
    currentButton.layer.shadowOffset = CGSizeMake(3.0f, 3.0f);
    currentButton.layer.shadowRadius = 2.0f;
    currentButton.layer.masksToBounds = NO;
    
    CGSize size =currentButton.bounds.size;
    CGRect ovalRect = CGRectMake(3, size.height-5, size.width-12, 3);
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:ovalRect];
    currentButton.layer.shadowPath = path.CGPath;
    
    
    //Animate frame for jump effect
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
    animation.duration = .3;
    animation.repeatCount = 5;
    animation.fromValue = [NSValue valueWithCGPoint:currentButton.center];
    animation.toValue = [NSValue valueWithCGPoint:CGPointMake(currentButton.center.x, currentButton.center.y-30)];
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    animation.autoreverses = YES;
    animation.removedOnCompletion = NO;
    [currentButton.layer addAnimation:animation forKey:@"position"];
    
    
    //Animate Shadow offset
    CABasicAnimation *theAnimation = [CABasicAnimation animationWithKeyPath:@"shadowOffset"];
    theAnimation.duration = .3;
    theAnimation.repeatCount = 5;
    theAnimation.autoreverses = YES;
    theAnimation.removedOnCompletion = YES;
    theAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    theAnimation.toValue   = [NSValue valueWithCGSize:CGSizeMake(3.0f, 33.0f)];
    [currentButton.layer addAnimation:theAnimation forKey:@"shadowOffset"];
    
    //Animate growing shadowpath
    CABasicAnimation *shadowPathAnimation = [CABasicAnimation animationWithKeyPath:@"shadowPath"];
    shadowPathAnimation.duration = .3;
    shadowPathAnimation.repeatCount = 5;
    shadowPathAnimation.autoreverses = YES;
    shadowPathAnimation.removedOnCompletion = NO;
    shadowPathAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    shadowPathAnimation.fromValue = (id)[UIBezierPath bezierPathWithOvalInRect:ovalRect].CGPath;
    shadowPathAnimation.toValue = (id)[UIBezierPath bezierPathWithOvalInRect:CGRectMake(ovalRect.origin.x-6, ovalRect.origin.y-4, ovalRect.size.width+12, ovalRect.size.height+8)].CGPath;
    shadowPathAnimation.delegate = self;
    [currentButton.layer addAnimation:shadowPathAnimation forKey:@"shadowPath"];


}

@end
