//
//  OSMemberList.h
//  iOS_MemberShow
//
//  Created by WorkShop on 14-5-11.
//  Copyright (c) 2014年 BifidyCAPs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OSMemberCardViewController.h"

@interface OSMemberList : NSObject
@property(nonatomic,strong)NSMutableArray *memberList;
+ (OSMemberList *)shareMemberList ;

@end
