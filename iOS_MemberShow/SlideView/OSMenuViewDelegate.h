//
//  OSMenuViewDelegate.h
//  iOS_MemberShow
//
//  Created by WorkShop on 14-5-10.
//  Copyright (c) 2014年 BifidyCAPs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OSMemberCardViewController.h"

@interface OSMenuViewDelegate : NSObject
-(OSMemberCardViewController *)createViewControllerFor:(NSString *)str;
@end
