//
//  OSIntroductionViewController.m
//  iOS_MemberShow
//
//  Created by WorkShop on 14-5-10.
//  Copyright (c) 2014年 BifidyCAPs. All rights reserved.
//

#import "OSIntroductionViewController.h"
#import <UIViewController+ECSlidingViewController.h>
@interface OSIntroductionViewController ()

@end

@implementation OSIntroductionViewController

-(id)init{
    self=[super init];
    UIStoryboard *storyboard=[UIStoryboard storyboardWithName:@"OSContainer" bundle:nil];
    self=[storyboard instantiateViewControllerWithIdentifier:@"OSIntroductionViewController"];
    return self;
}

- (void)viewDidLoad
{
    [self.view addGestureRecognizer:[self.slidingViewController panGesture]];
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
