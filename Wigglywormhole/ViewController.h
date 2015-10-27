//
//  ViewController.h
//  Wigglywormhole
//
//  Created by lushangshu on 14-11-3.
//  Copyright (c) 2014年 lushangshu. All rights reserved.
//
//  Username: ACP14SL
#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIGestureRecognizerDelegate>

{
    UIImageView *snakeHead;
    NSMutableArray *snakeBodyArray;
    NSMutableArray *mushroomArray;
    NSMutableArray *wormholeArray;
    UITextField *nameTextfield;
    
    NSTimer *snakeMovement;
    NSTimer *itemViewUpdate;
    NSTimer *countDown;
    
    BOOL snakeSideMovement;
    
    int snakeX;
    int snakeY;
    
    int Score;
    
}


@property (nonatomic,weak) id<UITextFieldDelegate> TextFielddelegate;
@property (nonatomic,weak) id<UIAlertViewDelegate> AlertViewdelegate;

@property (strong) UIImageView *img;
@property (weak) IBOutlet UIView *gamePanel;
@property (strong) IBOutlet UILabel *ScoreLabel;
@property (strong) IBOutlet UIButton *backButton;
@property (strong) IBOutlet UILabel *countDownLabel;

@property (strong) IBOutlet UIAlertView *gameOverAlert;

-(IBAction)backButtonPressed;
-(IBAction)CountDown;

-(void) MushroomAndHoleUpdate;

-(void) BackGroundCreate;
-(void) MushroomCreate;
-(void) WormholeCreate;
-(void) createSnake;
-(void) snakeAddBody;
-(void) snakeMove;
-(void) TextFieldGet;

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

