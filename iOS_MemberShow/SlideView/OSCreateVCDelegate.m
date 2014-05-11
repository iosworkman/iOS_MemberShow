//
//  OSMenuViewDelegate.m
//  iOS_MemberShow
//
//  Created by WorkShop on 14-5-10.
//  Copyright (c) 2014年 BifidyCAPs. All rights reserved.
//
#import "OSCreateVCDelegate.h"
#import "OSMemberListSingleton.h"
#import "BCViewController.h"

@implementation OSCreateVCDelegate
-(id)createViewControllerFor:(NSInteger)num{
    id yourViewController;
    switch (num) {
        case 0:
        {yourViewController=[[BCViewController alloc]init];
            break;}
            
            //Insert your View Controller here likes the example~~~~~~~~~~~~~~~~~
        default:
        {yourViewController=[[UIViewController alloc]init];
            break;}
    }
    return yourViewController;
}
@end
