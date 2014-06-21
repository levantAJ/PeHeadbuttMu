//
//  ViewController.h
//  PeHeadButtMi
//
//  Created by AJ on 6/17/14.
//  Copyright (c) 2014 ATteam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface ViewController : UIViewController
{
    IBOutlet UIImageView *imgPepeFirst;
    IBOutlet UIImageView *imgPepeSecond;
    IBOutlet UIImageView *imgMillerFirst;
    IBOutlet UIImageView *imgMillerSecond;
    IBOutlet UIImageView *imgPow;
    IBOutlet UIImageView *imgBubble;
    IBOutlet UILabel *lblTapToStart;
    IBOutlet UILabel *lblPoints;
    IBOutlet UILabel *lblTimer;
    IBOutlet UILabel *lblPointed;
    IBOutlet UILabel *lblTitle;
    IBOutlet UIView *viewParent;
    IBOutlet UIView *viewGameOver;
    IBOutlet UIButton *btnNewGame;
    IBOutlet UIButton *btnAJ;
    BOOL start;
    int points;
    int timers;
    NSTimer *tmrTimer;
}

- (IBAction)newGameTouchInSide:(id)sender;
- (IBAction)AJ:(id)sender;

@end
