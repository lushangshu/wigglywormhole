//
//  MediumMode.h
//  Wigglywormhole
//
//  Created by lushangshu on 14-11-7.
//  Copyright (c) 2014年 lushangshu. All rights reserved.
//
//  Username: ACP14SL
#import <UIKit/UIKit.h>

@interface MediumMode : UIViewController

{
    UIImageView *snakeHead;
    NSMutableArray *snakeBodyArray;
    NSMutableArray *mushroomArray;
    NSMutableArray *wormholeArray;
    
    NSTimer *snakeMovement;
    NSTimer *itemViewUpdate;
    NSTimer *countDown;
    
    BOOL snakeSideMovement;
    
    int snakeX;
    int snakeY;
    
    int Score;
    
}

@property (strong) UIImageView *img;
@property (weak) IBOutlet UIView *gamePanel;
@property (strong) IBOutlet UILabel *ScoreLabel;
@property (strong) IBOutlet UIButton *backButton;
@property (weak) IBOutlet UILabel *countDownLabel;

-(IBAction)backButtonPressed;
-(IBAction)CountDown;

-(void) MushroomAndHoleUpdate;

-(void) BackGroundCreate;
-(void) MushroomCreate;
-(void) WormholeCreate;
-(void) createSnake;
-(void) snakeAddBody;
-(void) snakeMove;

-(void) GameStart;

-(void) HitBoundry;

-(void) ScoreShow;

-(IBAction)SnakeMoveDown;
-(IBAction)SnakeMoveUp;
-(IBAction)SnakeMoveLeft;
-(IBAction)SnakeMoveRight;

-(void) handleSwipeLeft;
-(void) handleSwipeRight;
-(void) handleSwipeUp;
-(void) handleSwipeDown;


@end
