//
//  AnimationsTableViewController.m
//  AnimationsDemo
//
//  Created by Ilker Baltaci on 2/11/13.
//  Copyright (c) 2013 Ilker Baltaci. All rights reserved.
//

#import "AnimationsTableViewController.h"
#import "UIViewOverlayAnimation.h"
#import "JumpingButton.h"
#import "LVRotatingButtonViewController.h"
#import "LVPlayButtonController.h"

@interface AnimationsTableViewController ()

@end

@implementation AnimationsTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"Custom Animations";

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    NSString *titleString;
    switch (indexPath.row) {
        case 0:
        {
        titleString = @"Split dissmiss animation";
            break;
        }
        case 1:
        {
            titleString = @"UIview Overlay animation";
            break;
        }
        case 2:
        {
            titleString = @"Jumping Button";
            break;
        }
        case 3:
        {
            titleString = @"Rotating Button";
            break;
        }
        case 4:
        {
            titleString = @"Play Button";
            break;
        }
            
            
        default:
            break;
    }
    
    [cell.textLabel setText:titleString];
    
    
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.row==0)
    {
        SplitAnimation *aSplitAnimation = [[SplitAnimation alloc] init];
        aSplitAnimation.delegate = self;
        [self presentViewController:aSplitAnimation animated:YES completion:nil];

    }else if (indexPath.row==1){
    
        UIViewOverlayAnimation *overlayAnimation = [[UIViewOverlayAnimation alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        [overlayAnimation showInView:self.view];
    
    }else if (indexPath.row==2){
    
        JumpingButton *jumpingButton = [[JumpingButton alloc] init];
        UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:nil action:nil];
        self.navigationItem.backBarButtonItem = backButton;

        [self.navigationController pushViewController:jumpingButton animated:YES];
    
    }else if (indexPath.row==3){
    
        LVRotatingButtonViewController *rotatingButton = [[LVRotatingButtonViewController alloc] init];
        UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:nil action:nil];
        self.navigationItem.backBarButtonItem = backButton;
        
        [self.navigationController pushViewController:rotatingButton animated:YES];
        
    }else{

        LVPlayButtonController *playButtonController = [[LVPlayButtonController alloc] init];
        UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:nil action:nil];
        self.navigationItem.backBarButtonItem = backButton;
        
        [self.navigationController pushViewController:playButtonController animated:YES];
    

    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark Animation Delegates

//SplitAnimation
-(void)removeFromSuperViewWithSplitAnimation:(UIImage*)screenImage{
        
    CGImageRef maskTopkRef = [[UIImage imageNamed:@"maskTop.png"] CGImage];
    CGImageRef maskTop = CGImageMaskCreate(CGImageGetWidth(maskTopkRef),
                                           CGImageGetHeight(maskTopkRef),
                                           CGImageGetBitsPerComponent(maskTopkRef),
                                           CGImageGetBitsPerPixel(maskTopkRef),
                                           CGImageGetBytesPerRow(maskTopkRef),
                                           CGImageGetDataProvider(maskTopkRef), NULL, false);
    
    CGImageRef imageRefTopmasked      = CGImageCreateWithMask([screenImage CGImage], maskTop);
    CGImageRef maskBottomRef = [[UIImage imageNamed:@"maskDown.png"] CGImage];
    CGImageRef maskBottom = CGImageMaskCreate(CGImageGetWidth(maskBottomRef),
                                              CGImageGetHeight(maskBottomRef),
                                              CGImageGetBitsPerComponent(maskBottomRef),
                                              CGImageGetBitsPerPixel(maskBottomRef),
                                              CGImageGetBytesPerRow(maskBottomRef),
                                              CGImageGetDataProvider(maskBottomRef), NULL, false);
    
    
    CGImageRef imageRefBottommasked      = CGImageCreateWithMask([screenImage CGImage], maskBottom);
    UIImage *imageTop = [UIImage imageWithCGImage:imageRefTopmasked];
    UIImage *imageBottom = [UIImage imageWithCGImage:imageRefBottommasked];
    UIImageView *topImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    UIImageView *bottomImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    CGImageRelease(maskTop);
    CGImageRelease(imageRefTopmasked);
    
    // 4. Assign images to image views:
    topImageView.image = imageTop;
    bottomImageView.image = imageBottom;
    
    [self.view addSubview:topImageView];
    [self.view addSubview:bottomImageView];
    
    [self dismissViewControllerAnimated:NO completion:nil];
    

    CGImageRelease(maskBottom);
    CGImageRelease(imageRefBottommasked);
    
    [UIView animateWithDuration:0.8f animations:^{
        
        topImageView.frame =CGRectMake(0, -self.view.frame.size.height, self.view.frame.size.width, self.view.frame.size.height);
        bottomImageView.frame =CGRectMake(0,self.view.frame.size.height, self.view.frame.size.width,self.view.frame.size.height);
        
    } completion:^(BOOL finished){
        [topImageView removeFromSuperview];
        [bottomImageView removeFromSuperview];
    }];

}
@end
