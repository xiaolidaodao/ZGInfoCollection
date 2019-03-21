//
//  ViewController.m
//  ZGInfoCollectionDemo
//
//  Created by zhanggui on 16/8/18.
//  Copyright © 2016年 zhanggui. All rights reserved.
//

#import "ViewController.h"
#import "ZGInfoCollection.h"
#import "ZGPhoneOperatorInfo.h"
@interface ViewController ()<CLLocationManagerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *infoTextLabel;


@end

@implementation ViewController

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"%@",[ZGPhoneOperatorInfo getCurrentPhoneOperatorName]);
    NSDictionary *status = [ZGNetWorkInfo getCurrentDelegateSettings];
    NSLog(@"%@",status);
    ZGLocationInfo *info = [ZGLocationInfo currentLocation];
    [info getCurrentLocation:^(CLPlacemark *location, NSString *desc) {
        if (location) {
            self.infoTextLabel.text = [NSString stringWithFormat:@"%@\n%@",location.name,location.thoroughfare];
            self.title = desc;
        }else {
            self.infoTextLabel.text = desc;
        }
    }];
    NSLog(@"测试");
}
@end
