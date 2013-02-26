//
//  LVSuccessfulRegistration.m
//  forfone
//
//  Created by Ilker Baltaci on 2/6/13.
//
//
#import <QuartzCore/QuartzCore.h>
#import "UIViewOverlayAnimation.h"


@interface UIViewOverlayAnimation(private)

-(void)closeOverlayWithAnimation:(BOOL)animation;

@end

@implementation UIViewOverlayAnimation

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIView *semitransparentView = [[UIView alloc] initWithFrame:frame];
        semitransparentView.backgroundColor = [UIColor blackColor];
        semitransparentView.alpha = 0.6;
        [self addSubview:semitransparentView];
        
        UIButton *dummyBackgroundButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [dummyBackgroundButton setFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        [self addSubview:dummyBackgroundButton];

        
        boxOverlay = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"registrationOverlay.png"]];

        [boxOverlay setUserInteractionEnabled:YES];
        
        boxOverlay.frame = CGRectMake((self.frame.size.width-269)/2,
                                      (self.frame.size.height-324)/2, 269, 324);
        [self addSubview:boxOverlay];
        
        //Close Button
        closeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [closeButton setBackgroundImage:[UIImage imageNamed:@"closeButton.png"] forState:UIControlStateNormal];
        [closeButton setFrame:CGRectMake(boxOverlay.frame.origin.x+boxOverlay.frame.size.width-30,boxOverlay.frame.origin.y-10, 40, 40)];
        [closeButton addTarget:self action:@selector(closeOverlayWithAnimation:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:closeButton];

        
        /*
        //Welcome Logo
        UIImageView *welcomeLogo =[[UIImageView alloc] initWithFrame:CGRectMake((boxOverlay.frame.size.width-220)/2, 60, 220, 53)];
        [welcomeLogo setImage:[UIImage imageNamed:@"welcomeForfoneLogo.png"]];
        welcomeLogo.transform = CGAffineTransformMakeRotation(-5 * M_PI / 180);
        [boxOverlay addSubview:welcomeLogo];
        */
        
        
        /*
        //Welcome Label
        FXLabel *welcomeLabel = [[FXLabel alloc] initWithFrame:CGRectMake(20, 150, boxOverlay.frame.size.width-40, 160)];
        [welcomeLabel setBackgroundColor:[UIColor clearColor]];
        [welcomeLabel setFont:[UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:22]];
        [welcomeLabel setText:NSLocalizedStringFromTable(@"kSuccessfullyRegistered", @"ApplicationStrings", @"")];
        [welcomeLabel setTextAlignment:NSTextAlignmentCenter];
        [welcomeLabel setTextColor:[UIColor whiteColor]];
        [welcomeLabel setShadowOffset:CGSizeMake(0, 2)];
        [welcomeLabel setShadowColor:kWhiteTextShadowColor];
        
        welcomeLabel.transform = CGAffineTransformMakeRotation(-5 * M_PI / 180);
*/
//        [boxOverlay addSubview:welcomeLabel];
        
    }
    return self;
}

-(void)showInView:(UIView*)aView
{
    
    [aView addSubview:self];
    self.alpha = 0;
    
    [UIView animateWithDuration:0.8
                          delay:0.0
                        options: UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         self.alpha = 1;
                     }
                     completion:^(BOOL finished){

                         
                     }];
}

- (void)closeOverlayWithAnimation:(BOOL)animation{

    [UIView beginAnimations:@"animationShrink" context:NULL];
    [UIView setAnimationDuration:0.4];
    [UIView setAnimationDelegate:self];

    boxOverlay.transform = CGAffineTransformMakeScale(0.1, 0.1);
    boxOverlay.frame = CGRectMake(closeButton.frame.origin.x+5, closeButton.frame.origin.y+5, closeButton.frame.size.width-10, closeButton.frame.size.height-10);
    [self layoutIfNeeded];
    [UIView setAnimationDidStopSelector: @selector(animationDidStop:finished:context:)];

    CABasicAnimation* rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0 /* full rotation*/ * 4 * 0.3f ];
    rotationAnimation.duration = 0.4f;
    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount = 1;    
    [closeButton.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
    
    [UIView commitAnimations];
    
    

}

- (void)animationDidStop:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context{



    [UIView animateWithDuration:0.2
                          delay:0.0
                        options: UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         self.alpha = 0;
                     }
                     completion:^(BOOL finished){
                         [self removeFromSuperview];

                     }];

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
