//
//  OSMenuViewController.m
//  iOS_MemberShow
//
//  Created by WorkShop on 14-5-10.
//  Copyright (c) 2014年 BifidyCAPs. All rights reserved.
//

#import "OSMenuViewController.h"
#import "OSMemberCardViewController.h"
#import "OSMenuViewDelegate.h"
#import <UIViewController+ECSlidingViewController.h>

@interface OSMenuViewController ()
@property(nonatomic,strong)NSMutableArray *memberList;
@property(nonatomic,strong)NSMutableDictionary *controllerList;
@property(nonatomic,strong)id delegate;
@end

@implementation OSMenuViewController

- (IBAction)unwindToMenuViewController:(UIStoryboardSegue *)segue{}

- (void)viewDidLoad
{self.memberList=[self memberList];
    self.delegate=[[OSMenuViewDelegate alloc]init];
    [super viewDidLoad];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//return self.nameArray.count;
    if (section) {
        return self.memberList.count;
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
    OSMemberCardViewController *memberCard=self.controllerList[_memberList[indexPath.row][@"prefix"]];
    [self setInfromationWithController:memberCard Number:indexPath.row];
    [self.slidingViewController.topViewController.navigationController pushViewController:memberCard animated:NO];
    
    //[self.slidingViewController resetTopViewAnimated:YES];
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

//此处需考虑性能，控制器过多时要考虑单独延迟实例化
-(id)controllerList{
    if (_controllerList==nil) {
        _controllerList=[[NSMutableDictionary alloc]init];
        for (id tmp in  _memberList) {
            OSMemberCardViewController  *memberCard=[self.delegate createViewControllerFor:tmp[@"prefix"]];
            [_controllerList setObject:memberCard forKey:tmp[@"prefix"]];
        }
    }
    return _controllerList;
}

-(id)memberList{
    if(_memberList==nil){
        NSString *path=[[[NSBundle mainBundle]resourcePath]  stringByAppendingString:@"/OSMemberList.plist"];
        _memberList=[[NSMutableArray alloc]initWithContentsOfFile:path];
    }
    return _memberList;
}


-(void)setInfromationWithController:(OSMemberCardViewController *)memberCard Number:(NSInteger)num{
    [memberCard setName:self.memberList[num][@"name"]
Icon:self.memberList[num][@"icon"]
Age:self.memberList[num][@"age"]
Prefix:self.memberList[num][@"prefix"]
job:self.memberList[num][@"job"]
Advantage:self.memberList[num][@"advantage"]
Introduce:self.memberList[num][@"introduce"]
     ];
    

}


@end
