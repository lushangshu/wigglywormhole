//
//  MainMenu.m
//  Wigglywormhole
//
//  Created by lushangshu on 14-11-7.
//  Copyright (c) 2014年 lushangshu. All rights reserved.
//
//  Username: ACP14SL
#import "MainMenu.h"

@interface MainMenu ()

@end

@implementation MainMenu

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)TextField_DidEndOnExit:(id)sender
{
    [sender resignFirstResponder];
}

-(IBAction)View_TouchDown:(id)sender
{
    [[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    NSString *msg = _txf.text;
    UIViewController *send = segue.destinationViewController;
    if([send respondsToSelector:@selector(setData:)])
    {
        [send setValue:msg forKey:@"data"];
    }
}


@end
