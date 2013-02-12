//
//  SplitAnimation.h
//  AnimationsDemo
//
//  Created by Ilker Baltaci on 2/11/13.
//  Copyright (c) 2013 Ilker Baltaci. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol SplitAnimationDelegate <NSObject>

-(void)removeFromSuperViewWithSplitAnimation:(UIImage*)screenImage;

@end

@interface SplitAnimation : UIViewController
{
    UIImageView *backgroundImageView;
    
    UIButton *animationButton;

}







@property (nonatomic,unsafe_unretained) id<SplitAnimationDelegate>delegate;



@end