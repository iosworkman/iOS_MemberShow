//
//  OSMemberCardViewController.m
//  iOS_MemberShow
//
//  Created by WorkShop on 14-5-10.
//  Copyright (c) 2014年 BifidyCAPs. All rights reserved.
//

#import "OSMemberCardViewController.h"
#import "OSMemberListSingleton.h"
#import "OSCreateVCDelegate.h"
@interface OSMemberCardViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UILabel *age;
@property (weak, nonatomic) IBOutlet UILabel *prefix;
@property (weak, nonatomic) IBOutlet UILabel *job;
@property (weak, nonatomic) IBOutlet UILabel *advantage;
@property (weak, nonatomic) IBOutlet UITextView *introduce;

@property(nonatomic,strong)id pushViewController;
@property(nonatomic,strong)OSCreateVCDelegate *createDelegate;
@property(nonatomic)NSInteger ownerNumber;
@end

@implementation OSMemberCardViewController

- (IBAction)showYourAPPs:(UIButton *)sender {
    [self.navigationController pushViewController:[self.createDelegate createViewControllerFor:self.ownerNumber] animated:YES];
}

-(id)init{
    self=[super init];
    UIStoryboard *storyboard=[UIStoryboard storyboardWithName:@"OSContainer" bundle:[NSBundle mainBundle]];
    self=[storyboard instantiateViewControllerWithIdentifier:@"OSMemberCardViewController"];
    return self;

}

+(id)allocWithNumber:(NSInteger)num{
    OSMemberCardViewController *obj=[[OSMemberCardViewController alloc]init];
    obj.ownerNumber=num;
    return obj;
}


-(void)setInformationWithNumber:(NSInteger)num{
    NSDictionary *dic=[OSMemberList shareMemberList].memberList[num];
    self.navigationController.title=dic[@"name"];
    self.age.text=dic[@"age"];
    self.prefix.text=dic[@"prefix"];
    self.job.text=dic[@"job"];
    self.advantage.text=dic[@"advantage"];
    self.introduce.text=dic[@"introduce"];
    self.icon.image=[UIImage imageNamed:dic[@"icon"]];
    NSLog(@"%@",[dic description]);
}

- (void)viewDidLoad
{    [self setInformationWithNumber:self.ownerNumber];
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
