//
//  OSMemberCardViewController.m
//  iOS_MemberShow
//
//  Created by WorkShop on 14-5-10.
//  Copyright (c) 2014年 BifidyCAPs. All rights reserved.
//

#import "OSMemberCardViewController.h"

@interface OSMemberCardViewController ()


@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UILabel *age;
@property (weak, nonatomic) IBOutlet UILabel *prefix;
@property (weak, nonatomic) IBOutlet UILabel *job;
@property (weak, nonatomic) IBOutlet UILabel *advantage;
@property (weak, nonatomic) IBOutlet UITextView *introduce;
@property(nonatomic,weak)id pushViewController;
@end

@implementation OSMemberCardViewController
- (IBAction)showYourAPPs:(UIButton *)sender {
    [self.navigationController pushViewController:self.pushViewController animated:YES];
}

-(id)init{
    self=[super init];
    UIStoryboard *storyboard=[UIStoryboard storyboardWithName:@"OSContainer" bundle:[NSBundle mainBundle]];
    self=[storyboard instantiateViewControllerWithIdentifier:@"OSMemberCardViewController"];
    return self;

}

-(id)initWithYourViewController:(id)VC{
    self=[super init];
    if ([VC isMemberOfClass:[UIViewController class]]) {
        self.pushViewController=VC;
    }
    return self;
}

-(void)setName:(NSString *)name Icon:(NSString *)icon Age:(NSString *)age Prefix:(NSString *)prefix job:(NSString *)job Advantage:(NSString *)advantage Introduce:(NSString *)introduce{
    self.navigationController.title=name;
    self.age.text=age;
    self.prefix.text=prefix;
    self.job.text=job;
    self.advantage.text=advantage;
    self.introduce.text=introduce;
    self.icon.image=[UIImage imageNamed:icon];
}

- (void)viewDidLoad
{
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
