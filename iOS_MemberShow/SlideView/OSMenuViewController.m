//
//  OSMenuViewController.m
//  iOS_MemberShow
//
//  Created by WorkShop on 14-5-10.
//  Copyright (c) 2014年 BifidyCAPs. All rights reserved.
//

#import "OSMenuViewController.h"
#import "OSMemberListSingleton.h"
#import <UIViewController+ECSlidingViewController.h>
#import "OSCreateVCDelegate.h"
@interface OSMenuViewController ()
@property(nonatomic,strong)NSMutableArray *memberList;
@property(nonatomic,strong)NSMutableDictionary *controllerList;
@property(nonatomic,strong)id createDelegate;
@end

@implementation OSMenuViewController

- (IBAction)unwindToMenuViewController:(UIStoryboardSegue *)segue{}

- (void)viewDidLoad
{self.createDelegate=[[OSCreateVCDelegate alloc]init];
    [super viewDidLoad];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section) {
        return self.memberList.count ;
    }
    return 2;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{UITableViewCell *cell=[UITableViewCell alloc];

    if(indexPath.section){
        cell = [tableView dequeueReusableCellWithIdentifier:@"name" forIndexPath:indexPath];
        cell.textLabel.text=self.memberList[indexPath.row][@"name"];
    }else{
            cell = [tableView dequeueReusableCellWithIdentifier:@"title" forIndexPath:indexPath];
        }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section) {
        self.slidingViewController.topViewController=[self createViewControllerFor:indexPath.row];
    }
    [self.slidingViewController resetTopViewAnimated:YES];
}
//section title
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    switch (section) {
        case 0:
            return  @"介绍";
            break;
        case 1 :
            return @"成员";
        default:
            return @"";
            break;
    }
}


-(id)memberList{
    if(_memberList==nil){
        self.memberList=[OSMemberList shareMemberList].memberList;
    }
    return _memberList;
}

-(UINavigationController *)createViewControllerFor:(NSInteger)num{
    OSMemberCardViewController *memberCard=[OSMemberCardViewController allocWithNumber:num];
    UINavigationController *navVC=[[UINavigationController alloc]initWithRootViewController:memberCard];
    return navVC;
}
@end
