//
//  OSMenuViewDelegate.m
//  iOS_MemberShow
//
//  Created by WorkShop on 14-5-10.
//  Copyright (c) 2014年 BifidyCAPs. All rights reserved.
//
#import "OSMenuViewDelegate.h"
#import "BCViewController.h"

//Insert Your header files here

@implementation OSMenuViewDelegate
-(OSMemberCardViewController *)createViewControllerFor:(NSString *)str{
    if ([str isEqualToString:@"BC"]) {
       BCViewController *VC= [[BCViewController alloc]init];
        return [[OSMemberCardViewController alloc]initWithYourViewController:VC];
    }
    
    //Insert your Controller here like the sample

    return [[OSMemberCardViewController alloc]init];
}
@end
