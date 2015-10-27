//
//  MainMenu.h
//  Wigglywormhole
//
//  Created by lushangshu on 14-11-7.
//  Copyright (c) 2014年 lushangshu. All rights reserved.
//
//  Username: ACP14SL
#import <UIKit/UIKit.h>

@interface MainMenu : UIViewController

//{
//    NSMutableArray *ScoreArray;
//}

@property (nonatomic, strong) NSMutableArray *ScoreArray;

@property (strong) IBOutlet UITextField *txf;


-(IBAction)TextField_DidEndOnExit:(id)sender;
-(IBAction)View_TouchDown:(id)sender;
@end
