//
//  LVPlayButtonController.m
//  AnimationsDemo
//
//  Created by Ilker Baltaci on 6/13/13.
//  Copyright (c) 2013 Ilker Baltaci. All rights reserved.
//

#import "LVPlayButtonController.h"
#import "RoundProgressBar.h"

@interface LVPlayButtonController ()

@end

@implementation LVPlayButtonController


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    
    roundProgressBar = [[RoundProgressBar alloc] initWithFrame:CGRectMake(50, 50, 50, 50)];
    
    [roundProgressBar addTarget:self action:@selector(play) forControlEvents:UIControlEventTouchUpInside];
    roundProgressBar.value = 0;
    roundProgressBar.maxValue = 100;
//    roundProgressBar.BorderBackGroundColor = [UIColor darkGrayColor];
//    roundProgressBar.BarColor = [UIColor darkGrayColor];
    [self.view addSubview:roundProgressBar];
    
    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)play{
    if (!timer) {
        timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(incrementIndication) userInfo:nil repeats:YES];
        totalSeconds = 0;
        roundProgressBar.playing = YES;
        [roundProgressBar setNeedsDisplay];
    }else{
        roundProgressBar.value = 0;
        [timer invalidate];
        timer = nil;
        roundProgressBar.playing = NO;
        [roundProgressBar setNeedsDisplay];
    }
}

-(void)incrementIndication{
    
    if (totalSeconds !=100) {
        totalSeconds+=5;
        roundProgressBar.value = totalSeconds;
    }else{
        roundProgressBar.value = 0;
        [timer invalidate];
        timer = nil;
        roundProgressBar.playing = NO;
        [roundProgressBar setNeedsDisplay];
    }
    
}


@end
