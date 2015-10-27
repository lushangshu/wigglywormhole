//
//  ViewController.m
//  Wigglywormhole
//
//  Created by lushangshu on 14-11-3.
//  Copyright (c) 2014年 lushangshu. All rights reserved.
//
//  Username: ACP14SL
#import "MediumMode.h"
#define HEIGHT 20
#define WIDTH 14

@interface MediumMode ()

@end

@implementation MediumMode

static int cellGrid[20][14];
static int tag[20][14];
static int TimeRemain = 3;

- (void)viewDidLoad {
    [super viewDidLoad];
    UISwipeGestureRecognizer *swipeRightRecognizer = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleSwipeRight)];
    swipeRightRecognizer.direction = UISwipeGestureRecognizerDirectionRight;
    swipeRightRecognizer.numberOfTouchesRequired = 1;
    [self.view addGestureRecognizer:swipeRightRecognizer];
    
    UISwipeGestureRecognizer *swipeLeftRecognizer = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleSwipeLeft)];
    swipeLeftRecognizer.direction = UISwipeGestureRecognizerDirectionLeft;
    swipeLeftRecognizer.numberOfTouchesRequired = 1;
    [self.view addGestureRecognizer:swipeLeftRecognizer];
    
    UISwipeGestureRecognizer *swipeUpRecognizer = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleSwipeUp)];
    swipeUpRecognizer.direction = UISwipeGestureRecognizerDirectionUp;
    swipeUpRecognizer.numberOfTouchesRequired = 1;
    [self.view addGestureRecognizer:swipeUpRecognizer];
    
    UISwipeGestureRecognizer *swipeDownRecognizer = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleSwipeDown)];
    swipeDownRecognizer.direction = UISwipeGestureRecognizerDirectionDown;
    swipeDownRecognizer.numberOfTouchesRequired = 1;
    [self.view addGestureRecognizer:swipeDownRecognizer];

    snakeX = -20;
    snakeY = 0;
    Score = 0;
    [self GameStart];
    //[self HitBoundry];
    
    
}

-(IBAction)CountDown
{
    //[snakeMovement invalidate];
    if (TimeRemain==0) {
        _countDownLabel.hidden = YES;
        [countDown invalidate];
        TimeRemain = 3;
        snakeMovement = [NSTimer scheduledTimerWithTimeInterval:0.4 target:self selector:@selector(snakeMove) userInfo:nil repeats:YES];
        [self BackGroundCreate];
        [self WormholeCreate];
        [self MushroomCreate];
        [self HitBoundry];
        [self createSnake];
        
    }
    //[self.gamePanel addSubview:_countDownLabel];
    _countDownLabel.text = [NSString stringWithFormat:@"%d",TimeRemain];
    //UILabel *countDownLabel = [[UILabel alloc]init];
    //countDownLabel.center = CGPointMake(140, 200);
    //[self.gamePanel addSubview:countDownLabel];
    //countDownLabel.text = [NSString stringWithFormat:@"%d",TimeRemain];
    TimeRemain -= 1;
}



-(IBAction)backButtonPressed
{
    [snakeMovement invalidate];
    [itemViewUpdate invalidate];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)createSnake
{
    snakeBodyArray = [[NSMutableArray alloc]initWithCapacity:0];
    snakeHead = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"wormface.png"]];
    snakeHead.center = CGPointMake(130, 190);
    [snakeBodyArray addObject:snakeHead];
    [self.gamePanel addSubview:snakeHead];
    [self snakeAddBody];
    
    snakeSideMovement = YES;
    
}

-(void)snakeAddBody
{
    UIImageView *snakeBody;
    if ([snakeBodyArray count] ==1) {
        snakeBody = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"wormface.png"]];
        snakeBody.center = CGPointMake(snakeHead.center.x-snakeX, snakeHead.center.y-snakeY);
        [snakeBodyArray addObject:snakeBody];
    }
    else
    {
        UIImageView *previousSnakeBody = [snakeBodyArray lastObject];
        snakeBody = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"snakecell.png"]];
        snakeBody.center = previousSnakeBody.center;
        [snakeBodyArray addObject:snakeBody];
    }
    
    [self.gamePanel addSubview:snakeBody];
}

-(void)GameStart
{
    countDown = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(CountDown) userInfo:nil repeats:YES];
    //    snakeMovement = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(snakeMove) userInfo:nil repeats:YES];
    //    [self BackGroundCreate];
    //    [self WormholeCreate];
    //    [self MushroomCreate];
    //    [self HitBoundry];
    //    [self createSnake];
    
    
    
}
-(void)GameOver
{
    NSString *overMesg = [NSString stringWithFormat:@"You scored: %d" , Score*10];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oh no, you died!" message:overMesg delegate:self cancelButtonTitle:nil otherButtonTitles:@"Ok",nil];
    alert.delegate = self;
    [alert show];
    Score = 0;
    snakeX = -20;
    snakeY = 0;
    TimeRemain = 3;
    
    [countDown invalidate];
    for(UIView *subview in [self.gamePanel subviews])
    {
        if ([[subview class] isSubclassOfClass:[self.gamePanel class]]) {
            [subview removeFromSuperview];
        }
        
    }
    
    [self GameStart];
    
}

-(void)ScoreShow
{
    //self.ScoreLabel.text = @"100";
    _ScoreLabel.text = [NSString stringWithFormat:@"%i",Score*15];
}

-(void)snakeMove
{
    snakeHead.center = CGPointMake(snakeHead.center.x+snakeX, snakeHead.center.y+snakeY);
    
    for (int i = ((int)[snakeBodyArray count]-1); i>0; i--)
    {
        UIImageView *snakeBody = [snakeBodyArray objectAtIndex:i];
        if(i==0)
        {
            snakeBody.center = snakeHead.center;
        }
        else
        {
            UIImageView *previousBody = [snakeBodyArray objectAtIndex:(i-1)];
            snakeBody.center = CGPointMake(previousBody.center.x, previousBody.center.y);
        }
    }
    //snakeHead.center = CGPointMake(snakeHead.center.x+snakeX, snakeHead.center.y+snakeY);
    
    [self ScoreShow];
    
    if(snakeHead.center.x<9)
    {
        [snakeMovement invalidate];
        [self performSelector:@selector(GameOver) withObject:self afterDelay:0.3];
        snakeHead.hidden = YES;
    }
    if (snakeHead.center.x>279)
    {
        [snakeMovement invalidate];
        [self performSelector:@selector(GameOver) withObject:self afterDelay:0.3];
        snakeHead.hidden = YES;
    }
    if (snakeHead.center.y<9)
    {
        [snakeMovement invalidate];
        [self performSelector:@selector(GameOver) withObject:self afterDelay:0.3];
        snakeHead.hidden = YES;
    }
    if (snakeHead.center.y>399)
    {
        [snakeMovement invalidate];
        [self performSelector:@selector(GameOver) withObject:self afterDelay:0.3];
        snakeHead.hidden = YES;
    }
    
    for (int i=0; i<[wormholeArray count]; i++)
    {
        if (CGRectIntersectsRect(snakeHead.frame, [[wormholeArray objectAtIndex:i] frame])==YES)
        {
            [snakeMovement invalidate];
            [self GameOver];
        }
    }
    if ([snakeBodyArray count] > 5)
    {
        for (int i=5; i<[snakeBodyArray count]; i++)
        {
            if (CGRectIntersectsRect(snakeHead.frame, [[snakeBodyArray objectAtIndex:i] frame])== YES)
            {
                [snakeMovement invalidate];
                [self GameOver];
            }
        }
    }
    
    for (int i=0; i<[mushroomArray count]; i++)
    {
        if ((CGRectIntersectsRect(snakeHead.frame, [[mushroomArray objectAtIndex:i] frame])==YES)&&([[mushroomArray objectAtIndex:i] isHidden]==NO))
        {
            
            //[mushroomArray removeObjectAtIndex:i];
            //[[mushroomArray objectAtIndex:i] removeFromSuperview];
            NSLog(@"hit tag %d",i+1);
            //UIView *deleteView = [self.view viewWithTag:i+1];
            UIView *deleteView = [self.gamePanel viewWithTag:i+1];
            deleteView.hidden = YES;
            //[[mushroomArray objectAtIndex:i] isHidden ] = YES;
            //[self.gamePanel bringSubviewToFront:deleteView];
            [deleteView removeFromSuperview];
            //[mushroomArray removeObjectAtIndex:i];
            Score +=1;
            [self snakeAddBody];
            [self ScoreShow];
        }
    }
    
    
    
}
-(void)BackGroundCreate
{
    for (int i=0; i<WIDTH; i++)
    {
        for (int j=0; j<HEIGHT; j++)
        {
            UIImage *m = [UIImage imageNamed:@"emptycell.png"];
            UIImageView *mView = [[UIImageView alloc]initWithImage:m];
            mView.center = CGPointMake(i*20+10, j*20+10);
            [self.gamePanel addSubview:mView];
            cellGrid[j][i] = 0;
            tag[j][i]=0;
        }
    }
}

-(void)WormholeCreate
{
    int holeNumber = 7;
    wormholeArray = [[NSMutableArray alloc]initWithCapacity:0];
    while (holeNumber>0)
    {
        int x=0;
        int y=0;
        x = arc4random()%14;
        y = arc4random()%20;
        UIImageView *holeView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"wormholecell.png"]];
        holeView.center = CGPointMake(x*20+10, y*20+10);
        holeNumber -=1;
        [wormholeArray addObject:holeView];
        [self.gamePanel addSubview:holeView];
        cellGrid[y][x] = 1;
    }
}

-(void)MushroomCreate
{
    int MushroomNumber = 0;
    mushroomArray = [[NSMutableArray alloc]initWithCapacity:0];
    while (MushroomNumber<40)
    {
        int x=0;
        int y=0;
        x = arc4random()%20;
        y = arc4random()%14;
        if (cellGrid[x][y]!=1)
        {
            cellGrid[x][y] = 2;
            UIImageView *shroomView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"shroomcell.png"]];
            shroomView.center = CGPointMake(y*20+10, x*20+10);
            
            //tag[x][y] = (int)[mushroomArray count]+1; //get the tag value
            MushroomNumber +=1;
            [mushroomArray addObject:shroomView];
            shroomView.tag = [mushroomArray count];
            [self.gamePanel addSubview:shroomView];
        }
        else
            cellGrid[x][y] = 1;
    }
    
}

-(void)MushroomAndHoleUpdate
{
    
}

-(void)HitBoundry
{
    for (int i=0; i<20; i++) {
        for (int j=0; j<14; j++) {
            NSLog(@"[%d][%d] = %d tag is %d",(i+1),(j+1),cellGrid[i][j],tag[i][j]);
            
        }
    }
}

-(IBAction)SnakeMoveDown
{
    if (snakeSideMovement == YES)
    {
        snakeX = 0;
        snakeY = 20;
        snakeHead.center = CGPointMake(snakeHead.center.x+snakeX, snakeHead.center.y+snakeY);
        snakeSideMovement = NO;
    }
    
}
-(IBAction)SnakeMoveUp
{
    if (snakeSideMovement == YES)
    {
        snakeX = 0;
        snakeY = -20;
        snakeHead.center = CGPointMake(snakeHead.center.x+snakeX, snakeHead.center.y+snakeY);
        snakeSideMovement = NO;
    }
    
}
-(IBAction)SnakeMoveLeft
{
    if (snakeSideMovement == NO)
    {
        snakeX = -20;
        snakeY = 0;
        snakeHead.center = CGPointMake(snakeHead.center.x+snakeX, snakeHead.center.y+snakeY);
        snakeSideMovement = YES;
    }
}
-(IBAction)SnakeMoveRight
{
    if (snakeSideMovement == NO)
    {
        snakeX = 20;
        snakeY = 0;
        snakeHead.center = CGPointMake(snakeHead.center.x+snakeX, snakeHead.center.y+snakeY);
        snakeSideMovement = YES;
    }
    
}

-(void)handleSwipeUp
{
    if (snakeSideMovement == YES)
    {
        snakeX = 0;
        snakeY = -20;
        snakeHead.center = CGPointMake(snakeHead.center.x+snakeX, snakeHead.center.y+snakeY);
        snakeSideMovement = NO;
    }
}

-(void)handleSwipeDown
{
    if (snakeSideMovement == YES)
    {
        snakeX = 0;
        snakeY = 20;
        snakeHead.center = CGPointMake(snakeHead.center.x+snakeX, snakeHead.center.y+snakeY);
        snakeSideMovement = NO;
    }
}

-(void)handleSwipeLeft
{
    if (snakeSideMovement == NO)
    {
        snakeX = -20;
        snakeY = 0;
        snakeHead.center = CGPointMake(snakeHead.center.x+snakeX, snakeHead.center.y+snakeY);
        snakeSideMovement = YES;
    }
}

-(void)handleSwipeRight
{
    if (snakeSideMovement == NO)
    {
        snakeX = 20;
        snakeY = 0;
        snakeHead.center = CGPointMake(snakeHead.center.x+snakeX, snakeHead.center.y+snakeY);
        snakeSideMovement = YES;
    }
}


@end
