//
//  LVRotatingButton.m
//  IBRotatingButton
//
//  Created by Ilker Baltaci on 4/23/13.
//  Copyright (c) 2013 Ilker Baltaci. All rights reserved.
//

#import "LVRotatingButton.h"

@implementation LVRotatingButton
@synthesize activeState;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:CGRectMake(frame.origin.x, frame.origin.y, 40, 40)];
    if (self) {
        activeState  = NO;
//        self.imageView.image  = [UIImage imageNamed:@"plusButton.png"];
        [self setImage:[UIImage imageNamed:@"plusButton.png"] forState:UIControlStateNormal];
        self.imageView.clipsToBounds = NO;
        self.imageView.contentMode = UIViewContentModeCenter;
        self.backgroundColor = [UIColor lightGrayColor];
        self.layer.borderColor = [UIColor grayColor].CGColor;
        self.layer.borderWidth = 1.0f;
        self.layer.cornerRadius = 4.0f;
    }
    return self;
}

-(void)rotateButton{
//    NSLog( @"Rotating button" );
    [UIView beginAnimations:@"rotate" context:nil];
    [UIView setAnimationDuration:.2f];
    if( CGAffineTransformEqualToTransform( self.imageView.transform, CGAffineTransformIdentity ) )
    {
        self.imageView.transform = CGAffineTransformMakeRotation(M_PI/4);
    } else {
        self.imageView.transform = CGAffineTransformIdentity;
    }
    [UIView commitAnimations];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
