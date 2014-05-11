//
//  OSMemberList.m
//  iOS_MemberShow
//
//  Created by WorkShop on 14-5-11.
//  Copyright (c) 2014年 BifidyCAPs. All rights reserved.
//

#import "OSMemberListSingleton.h"
#import "OSCreateVCDelegate.h"
@interface OSMemberList()
@property(nonatomic,strong)OSCreateVCDelegate *createVC;
@end
@implementation OSMemberList
+ (OSMemberList *)shareMemberList {
    static OSMemberList *memberList = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        memberList = [[OSMemberList alloc] init];
    });
    return memberList;
}

-(id)memberList{
    if(_memberList==nil){
        NSString *path=[[[NSBundle mainBundle]resourcePath]  stringByAppendingString:@"/OSMemberList.plist"];
        _memberList=[[NSMutableArray alloc]initWithContentsOfFile:path];
    }
    return _memberList;
}

@end
