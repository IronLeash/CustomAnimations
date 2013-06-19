//
// Created by edseventeen on 2/24/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "RoundProgressBar.h"


void Initalize();

@implementation RoundProgressBar
{

}
@synthesize playing;
@synthesize maxValue = _maxValue;
@synthesize value = _value;
@synthesize CenterBackGroundColor = _CenterBackGroundColor;
@synthesize BorderBackGroundColor = _BorderBackGroundColor;
@synthesize BarColor = _BarColor;
@synthesize percentageValue = _percentageValue;
@synthesize EmptyBarColor = _EmptyBarColor;
@synthesize hideScreenDecoration = _hideScreenDecoration;
@synthesize TextColor = _TextColor;


- (id)initWithFrame:(CGRect)frame
{

    self = [super initWithFrame:frame];
    if (self)
    {
        [self Initialize];

    }

    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{

    self = [super initWithCoder:aDecoder];
    if (self)
    {
        [self Initialize];
        self.contentMode=UIViewContentModeScaleToFill;



    }

    return self;
}


- (void)Initialize
{
    self.backgroundColor= [UIColor clearColor];
    self.opaque= YES;
    self.value =0;
    self.MaxValue=100;
    self.multipleTouchEnabled = NO;
    _BarColor= [UIColor darkGrayColor];
    _CenterBackGroundColor=[UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
    _BorderBackGroundColor=[UIColor colorWithRed: 0.703 green: 0.703 blue: 0.703 alpha: 1];
//    _TextColor= [UIColor blackColor];
    _value=0;
    _hideScreenDecoration= false;
    
    /*
    _EmptyBarColor= [UIColor colorWithRed:198.0/255.0
                                     green:198.0/255.0
                                      blue:198.0/255.0
                                     alpha:1];
     */
    
    
    _EmptyBarColor= [UIColor grayColor];
    
    playButton  = [UIImage imageNamed:@"playButton.png"];
    pauseButton = [UIImage imageNamed:@"pauseButton.png"];

}


- (void)setCenterBackGroundColor:(UIColor *)CenterBackGroundColor
{
    _CenterBackGroundColor=CenterBackGroundColor;
    [self setNeedsDisplay];
}

- (void)setBorderBackGroundColor:(UIColor *)BorderBackGroundColor
{
    _BorderBackGroundColor=BorderBackGroundColor;
    [self setNeedsDisplay];
}

- (void)setHideScreenDecoration:(BOOL)hideScreenDecoration
{
    _hideScreenDecoration=hideScreenDecoration;
    [self setNeedsDisplay];
}

- (void)setEmptyBarColor:(UIColor *)EmptyBarColor
{
    _EmptyBarColor=EmptyBarColor;
    [self setNeedsDisplay];
}

-(void)setBarColor:(UIColor *)BarColor
{
    _BarColor=BarColor;
    [self setNeedsDisplay];
}


- (void)setTextColor:(UIColor *)TextColor
{
    _TextColor= TextColor;
    [self setNeedsDisplay];
}

-(CGFloat)PercentageValue
{
    if (_maxValue<=0)
        return 0;

    return _value /_maxValue;
}

- (void)setValue:(CGFloat)value
{
    if (value>_maxValue)
        value=_maxValue;
    if (value<0)
        value=0;
    else
        _value=value;
    [self setNeedsDisplay];
}




- (void)drawRect:(CGRect)rect
{



    //// General Declarations
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextScaleCTM(context, (self.frame.size.width-2)/97, (self.frame.size.height-2)/97);






//// Color Declarations
    UIColor* fillColor = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
    UIColor* strokeColor = [UIColor colorWithRed: 0.047 green: 0.047 blue: 0.047 alpha: 1];
    UIColor* transparent = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 0];

    //The most outer ring
//    UIColor* color4 = [UIColor colorWithRed: 0 green: 11 blue: 0 alpha: 1];
    UIColor* color4 = strokeColor;

    UIColor* highlight2 = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];



// BackGround Oval
    UIBezierPath* backGroundOvalPath = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(2, 2, 95, 95)];
    [_EmptyBarColor setFill];
    [backGroundOvalPath fill];

//// Gradient Declarations
    NSArray* gradientColors = [NSArray arrayWithObjects:
                                               (id) _BarColor.CGColor,
                                               nil];
    CGFloat gradientLocations[] = {0,  1};
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)gradientColors, gradientLocations);
    NSArray* gradientHiglightColors = [NSArray arrayWithObjects:
                                                       (id)transparent.CGColor,
                                                       (id)[UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 0.5].CGColor,
                                                       (id)highlight2.CGColor,
                                                       (id)[UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 0.5].CGColor,
                                                       (id)transparent.CGColor, nil];

    CGFloat gradientHiglightLocations[] = {0.84, 0.93, 0.93, 0.98, 0.98};
    CGGradientRef gradientHiglight = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)gradientHiglightColors, gradientHiglightLocations);
    NSArray* gradientBackgroundColors = [NSArray arrayWithObjects:
                                                         (id)_CenterBackGroundColor.CGColor,
                                                         (id)_BorderBackGroundColor.CGColor, nil];

    CGFloat gradientBackgroundLocations[] = {0.01,  1};
    CGGradientRef gradientBackground = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)gradientBackgroundColors, gradientBackgroundLocations);
    NSArray* screenGradientColors = [NSArray arrayWithObjects:
                                                     (id)transparent.CGColor,
                                                     (id)[UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 0.5].CGColor,
                                                     (id)fillColor.CGColor,
                                                     (id)[UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 0.5].CGColor,
                                                     (id)transparent.CGColor,
                                                     (id)[UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 0].CGColor,
                                                     (id)transparent.CGColor,
                                                     (id)fillColor.CGColor,
                                                     (id)[UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 0.5].CGColor,
                                                     (id)transparent.CGColor, nil];
    CGFloat screenGradientLocations[] = {0, 0.05, 0.06, 0.29, 0.36, 0.63, 0.76, 0.94, 1, 1};
    CGGradientRef screenGradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)screenGradientColors, screenGradientLocations);

//// Abstracted Attributes

    CGFloat progressBarEndAngle = 0;

    CGFloat percentage=self.PercentageValue;
    if (percentage==0)
        progressBarEndAngle=270;
    else
    {
        progressBarEndAngle=(percentage*360)-90;
        if (progressBarEndAngle==270)
            progressBarEndAngle=269.9;
    }

//    NSString * textPercentajeContent= [NSString stringWithFormat:@"%.0f",(_value)];

//// Group
    {
        //// ProgressBar Drawing
        CGRect progressBarRect = CGRectMake(1.5, 1.5, 97, 97);
        UIBezierPath* progressBarPath = [UIBezierPath bezierPath];
        [progressBarPath addArcWithCenter: CGPointMake(CGRectGetMidX(progressBarRect), CGRectGetMidY(progressBarRect)) radius: CGRectGetWidth(progressBarRect) / 2 startAngle: 270 * M_PI/180 endAngle: progressBarEndAngle * M_PI/180 clockwise: YES];
        [progressBarPath addLineToPoint: CGPointMake(CGRectGetMidX(progressBarRect), CGRectGetMidY(progressBarRect))];
        [progressBarPath closePath];

        
        CGContextSaveGState(context);
        [progressBarPath addClip];
        CGContextDrawRadialGradient(context, gradient,
                CGPointMake(50, 50), 0,
                CGPointMake(50, 50), 44.79,
                kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
        CGContextRestoreGState(context);



        //// Oval 5 Drawing

        UIBezierPath* oval5Path = [UIBezierPath bezierPath];
        [oval5Path moveToPoint: CGPointMake(76.37, 77.22)];
        [oval5Path addCurveToPoint: CGPointMake(76.37, 22.78) controlPoint1: CGPointMake(91.21, 62.19) controlPoint2: CGPointMake(91.21, 37.81)];
        [oval5Path addCurveToPoint: CGPointMake(22.63, 22.78) controlPoint1: CGPointMake(61.53, 7.74) controlPoint2: CGPointMake(37.47, 7.74)];
        [oval5Path addCurveToPoint: CGPointMake(22.63, 77.22) controlPoint1: CGPointMake(7.79, 37.81) controlPoint2: CGPointMake(7.79, 62.19)];
        [oval5Path addCurveToPoint: CGPointMake(76.37, 77.22) controlPoint1: CGPointMake(37.47, 92.26) controlPoint2: CGPointMake(61.53, 92.26)];
        [oval5Path closePath];
        oval5Path.miterLimit = 20;

        CGContextSaveGState(context);
        [oval5Path addClip];
        CGContextDrawRadialGradient(context, gradientBackground,
                CGPointMake(51.75, 48.15), 1.86,
                CGPointMake(50, 50.3), 52.44,
                kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
        CGContextRestoreGState(context);
        [strokeColor setStroke];
        oval5Path.lineWidth = 0;
        [oval5Path stroke];
        
        UIBezierPath* oval7Path = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(11, 11, 77, 78)];
        [strokeColor setStroke];
        oval7Path.lineWidth = 1;
        [oval7Path stroke];



        ////Outer circle
        
        UIBezierPath* oval6Path = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(1.5, 1.5, 96, 96)];
        [color4 setStroke];
        oval6Path.lineWidth = 1;
        [oval6Path stroke];

    }


//// TextPercentaje Drawing
    /*
    CGRect textPercentajeRect = CGRectMake(15, 23, 73, 52);
    [strokeColor setFill];
    [_TextColor setFill];
    [textPercentajeContent drawInRect: textPercentajeRect withFont: [UIFont fontWithName: @"Helvetica" size: 41] lineBreakMode: UILineBreakModeWordWrap alignment: UITextAlignmentCenter];
     */

//// Highlight
    {
        //// Oval 3 Drawing

        /*
        UIBezierPath* oval3Path = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(0, 1, 97, 97)];
        CGContextSaveGState(context);
        [oval3Path addClip];
        CGContextDrawRadialGradient(context, gradientHiglight,
                CGPointMake(48, 50), 0,
                CGPointMake(48, 50), 44,
                kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
        CGContextRestoreGState(context);
        */

        if (!_hideScreenDecoration)
        {
            //// Decoration Drawing
            UIBezierPath* decorationPath = [UIBezierPath bezierPath];
            [decorationPath moveToPoint: CGPointMake(76.37, 77.22)];
            [decorationPath addCurveToPoint: CGPointMake(76.37, 22.78) controlPoint1: CGPointMake(91.21, 62.19) controlPoint2: CGPointMake(91.21, 37.81)];
            [decorationPath addCurveToPoint: CGPointMake(22.63, 22.78) controlPoint1: CGPointMake(61.53, 7.74) controlPoint2: CGPointMake(37.47, 7.74)];
            [decorationPath addCurveToPoint: CGPointMake(22.63, 77.22) controlPoint1: CGPointMake(7.79, 37.81) controlPoint2: CGPointMake(7.79, 62.19)];
            [decorationPath addCurveToPoint: CGPointMake(76.37, 77.22) controlPoint1: CGPointMake(37.47, 92.26) controlPoint2: CGPointMake(61.53, 92.26)];
            [decorationPath closePath];
            decorationPath.miterLimit = 20;

            CGContextSaveGState(context);
            [decorationPath addClip];
            CGContextDrawLinearGradient(context, screenGradient,
                    CGPointMake(81.28, 32.82),
                    CGPointMake(29.84, 72.73),
                    kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
            CGContextRestoreGState(context);
        }

    }

    
    if (self.playing) {
    [pauseButton drawInRect:CGRectMake(24, 24, 50, 50)];
    }else{
    [playButton drawInRect:CGRectMake(24, 24, 50, 50)];
    }
    

//// Cleanup
    CGGradientRelease(gradient);
    CGGradientRelease(gradientHiglight);
    CGGradientRelease(gradientBackground);
    CGGradientRelease(screenGradient);
    CGColorSpaceRelease(colorSpace);




}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    if (!triggerToucht) {
//    [self sendActionsForControlEvents:UIControlEventTouchUpInside];
        triggerToucht = [[touches allObjects] objectAtIndex:0];
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *currentTouch = [[touches allObjects] objectAtIndex:0];
    CGPoint touchPoint = [currentTouch locationInView:self];

    NSLog(@"Touch %@",currentTouch);
    
    if ([triggerToucht isEqual:currentTouch] && [self pointInside:touchPoint withEvent:nil]) {
        [self sendActionsForControlEvents:UIControlEventTouchUpInside];
//        triggerToucht = [[touches allObjects] objectAtIndex:0];
        triggerToucht = nil;
    }else{
        triggerToucht = nil;
    }
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    if( point.x > 0 && point.x < self.frame.size.width && point.y > 0 && point.y < self.frame.size.height )
    {
        NSLog(@"Inside");
        return YES;
    }
    return NO;
}

@end

