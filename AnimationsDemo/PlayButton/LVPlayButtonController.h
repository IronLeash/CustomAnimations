//
//  LVPlayButtonController.h
//  AnimationsDemo
//
//  Created by Ilker Baltaci on 6/13/13.
//  Copyright (c) 2013 Ilker Baltaci. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RoundProgressBar.h"
@interface LVPlayButtonController : UIViewController{

    int totalSeconds;
    NSTimer *timer;
    RoundProgressBar *roundProgressBar;
}

@end
