//
//  LVRotatingButton.h
//  IBRotatingButton
//
//  Created by Ilker Baltaci on 4/23/13.
//  Copyright (c) 2013 Ilker Baltaci. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface LVRotatingButton : UIButton
{
    BOOL activeState;
}

@property (assign) BOOL activeState;

-(void)rotateButton;

@end
