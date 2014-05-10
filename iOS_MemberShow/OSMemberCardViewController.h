//
//  OSMemberCardViewController.h
//  iOS_MemberShow
//
//  Created by WorkShop on 14-5-10.
//  Copyright (c) 2014年 BifidyCAPs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OSMemberCardViewController : UIViewController
-(id)initWithYourViewController:(id)VC;
-(void)setName:(NSString *)name Icon:(NSString *)icon Age:(NSString *)age Prefix:(NSString *)prefix job:(NSString *)job Advantage:(NSString *)advantage Introduce:(NSString *)introduce;

@end
