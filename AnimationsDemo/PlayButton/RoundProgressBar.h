//
// Created by edseventeen on 2/24/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>

@interface RoundProgressBar : UIControl{

    UIImage *playButton;
    UIImage *pauseButton;
    BOOL playing;

    UITouch *triggerToucht;
}

@property (strong, nonatomic) UIColor *BarColor;
@property (strong, nonatomic) UIColor *CenterBackGroundColor;
@property (strong, nonatomic) UIColor *BorderBackGroundColor;
@property (strong, nonatomic) UIColor *EmptyBarColor;
@property (strong, nonatomic) UIColor *TextColor;
@property (assign)            BOOL playing;

@property (nonatomic) CGFloat value;
@property (nonatomic) CGFloat percentageValue;
@property (nonatomic) CGFloat maxValue;
@property (nonatomic) BOOL hideScreenDecoration;


-(void)play;

@end

