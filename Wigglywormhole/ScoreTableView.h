//
//  ScoreTableView.h
//  Wigglywormhole
//
//  Created by lushangshu on 14-11-7.
//  Copyright (c) 2014年 lushangshu. All rights reserved.
//
//  Username: ACP14SL
#import <UIKit/UIKit.h>

@interface ScoreTableView : UIViewController <UITableViewDataSource,UITableViewDelegate>


//@property (strong) NSMutableArray *scoreArray;
@property (weak) IBOutlet UITableView *tableViewObject;
@property (strong) NSMutableArray *scoreArray;
@property (strong) NSMutableArray *scoreTime;

@property NSString *data;

@property (strong) IBOutlet UILabel *label;

-(void)backToMainmenu;

-(void)initScoreArray;
@end

