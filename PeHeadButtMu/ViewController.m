//
//  ViewController.m
//  PeHeadButtMi
//
//  Created by AJ on 6/17/14.
//  Copyright (c) 2014 ATteam. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [lblTapToStart setFont:[UIFont fontWithName:@"04b_19" size:21]];
    [lblPoints setFont:[UIFont fontWithName:@"04b_19" size:61]];
    [lblTimer setFont:[UIFont fontWithName:@"04b_19" size:31]];
    [lblTitle setFont:[UIFont fontWithName:@"04b_19" size:21]];
    [lblPointed setFont:[UIFont fontWithName:@"04b_19" size:81]];
    [btnNewGame.titleLabel setFont:[UIFont fontWithName:@"04b_19" size:21]];
    [btnAJ.titleLabel setFont:[UIFont fontWithName:@"04b_19" size:15]];
    
    viewParent.backgroundColor = [UIColor colorWithWhite:1 alpha:0.5];
    viewGameOver.layer.borderColor = [[UIColor colorWithRed:212.0/255.0 green:212.0/255.0 blue:212.0/255.0 alpha:1] CGColor];
    viewGameOver.layer.borderWidth = 1;
    viewGameOver.layer.cornerRadius = 7;
    viewGameOver.layer.masksToBounds = YES;
    lblTitle.backgroundColor = [UIColor colorWithRed:134.0/255.0 green:191.0/255.0 blue:115.0/255.0 alpha:1];
    
    lblTitle.backgroundColor = [UIColor colorWithRed:134/255.0 green:191/255.0 blue:115/255.0 alpha:1];
    CALayer* layer = [lblTitle layer];
    CALayer *bottomBorder = [CALayer layer];
    bottomBorder.borderColor = [[UIColor colorWithRed:212.0/255.0 green:212.0/255.0 blue:212.0/255.0 alpha:1] CGColor];
    bottomBorder.borderWidth = 0.5;
    bottomBorder.frame = CGRectMake(-1, layer.frame.size.height-1, layer.frame.size.width, 1);
    [layer addSublayer:bottomBorder];


    
    [self newGame];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) newGame{
    start = NO;
    points = 0;
    timers = 27;
    [lblTimer setText:[NSString stringWithFormat:@"%d", timers]];
    [lblPoints setText:@"0"];
    lblTapToStart.hidden = NO;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    if (viewParent.hidden==YES){
        if (start==YES){
            imgMillerFirst.hidden = YES;
            imgMillerSecond.hidden = NO;
            imgPepeFirst.hidden = YES;
            imgPepeSecond.hidden = NO;
            imgPow.hidden = NO;
            imgBubble.hidden = NO;
            points++;
            [lblPoints setText:[NSString stringWithFormat:@"%d", points]];
            [NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(reheadbutt) userInfo:nil repeats:NO];
        }else{
            lblTapToStart.hidden = YES;
            start = YES;
            tmrTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(countTimes) userInfo:nil repeats:YES];
        }
    }
}

- (void)reheadbutt{
    imgMillerFirst.hidden = NO;
    imgMillerSecond.hidden = YES;
    imgPepeFirst.hidden = NO;
    imgPepeSecond.hidden = YES;
    imgPow.hidden = YES;
    imgBubble.hidden = YES;
}

- (void)countTimes{
    timers--;
    [lblTimer setText:[NSString stringWithFormat:@"%d", timers]];
    
    if (timers==0){
        [tmrTimer invalidate];
        tmrTimer = nil;
        start = NO;
        [self gameOver];
    }
}

- (void) gameOver{
    viewParent.hidden = NO;
    [lblPointed setText:[NSString stringWithFormat:@"%d", points]];
}

- (IBAction)newGameTouchInSide:(id)sender{
    [self newGame];
    viewParent.hidden = YES;
}

- (IBAction)AJ:(id)sender{
    NSURL *url = [[NSURL alloc] initWithString: @"https://twitter.com/levantAJ"];
    [[UIApplication sharedApplication] openURL:url];
}

@end
