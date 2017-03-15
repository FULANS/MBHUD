//
//  ViewController.m
//  NSObjectHUD
//
//  Created by wangzheng on 17/3/14.
//  Copyright © 2017年 WZheng. All rights reserved.
//

#import "ViewController.h"
#import "NSObject+MBHUD.h"
#import "SecondVC.h"
@interface ViewController ()

@property (strong, nonatomic) NSArray *operationArr;

@end

@implementation ViewController

- (NSArray *)operationArr{
    if (!_operationArr) {
        _operationArr = [NSArray array];
    }
    return _operationArr;
}


- (void)viewDidLoad {
    [super viewDidLoad];

    self.operationArr = @[
                          @{
                            @"title":@"显示成功文字和图片,几秒后消失",
                            @"subtitle":@"+ (void)MB_showSuccess:(NSString *)success;",
                              },
                          @{
                              @"title":@"显示成功文字和图片,几秒后消失(放到指定view中)",
                              @"subtitle":@"+ (void)MB_showSuccess:(NSString *)success toView:(UIView *)view;",
                              },
                          @{
                              @"title":@"显示出错图片和文字,几秒后消失",
                              @"subtitle":@"+ (void)MB_showError:(NSString *)error;",
                              },
                          @{
                              @"title":@"显示出错图片和文字,几秒后消失(放到指定view中)",
                              @"subtitle":@"+ (void)MB_showError:(NSString *)error toView:(UIView *)view;",
                              },
                          @{
                              @"title":@"只显示文字,几秒后消失",
                              @"subtitle":@"+ (void)MB_showText:(NSString *)text;",
                              },
                          @{
                              @"title":@"只显示文字,几秒后消失(放到指定view中)",
                              @"subtitle":@"+ (void)MB_showText:(NSString *)text toView:(UIView *)view;",
                              },
                          @{
                              @"title":@"只显示图片,几秒后消失",
                              @"subtitle":@"+ (void)MB_showIcon:(NSString *)icon;",
                              },
                          @{
                              @"title":@"只显示图片,几秒后消失(放到指定view中)",
                              @"subtitle":@"+ (void)MB_showIcon:(NSString *)icon toView:(UIView *)view;",
                              },
                          @{
                              @"title":@"显示文字和图片,几秒后消失",
                              @"subtitle":@"+ (void)MB_showText:(NSString *)text icon:(NSString *)icon;",
                              },
                          @{
                              @"title":@"显示文字和图片,几秒后消失(放到指定view中)",
                              @"subtitle":@"+ (void)MB_showText:(NSString *)text icon:(NSString *)icon view:(UIView *)view;",
                              },
                          
                          @{
                              @"title":@"只显示菊花(需要主动让它消失,HUD放在Window中)",
                              @"subtitle":@"+ (MBProgressHUD *)MB_showHUD;",
                              },
                          @{
                              @"title":@"显示菊花和文字(需要主动让它消失,HUD放在Window中)",
                              @"subtitle":@"+ (MBProgressHUD *)MB_showMessage:(NSString *)message;",
                              },
                          @{
                              @"title":@"显示菊花和文字(需要主动让它消失，HUD放到指定view中)",
                              @"subtitle":@"+ (MBProgressHUD *)MB_showMessage:(NSString *)message toView:(UIView *)view;",
                              },
                          
                          
                          ];
    

    UIBarButtonItem *BarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"跳转" style:UIBarButtonItemStyleDone target:self action:@selector(enterSecondVC)];
    self.navigationItem.rightBarButtonItem = BarButtonItem;  // 导航栏右侧

}

- (void)enterSecondVC{
    
    UIStoryboard * mainSB = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    SecondVC * vc = [mainSB instantiateViewControllerWithIdentifier:@"SecondVC"];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark --- tableveiw delegate
// 分区数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
// 行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.operationArr.count;
}

// cell 高度
- (CGFloat) tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}
// cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSDictionary *dic = self.operationArr[indexPath.row];
    
    static NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleSubtitle) reuseIdentifier:identifier];
    }
    cell.textLabel.text = dic[@"title"];
    cell.detailTextLabel.text = dic[@"subtitle"];
    return cell;
}
// 点击
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSDictionary *dic = self.operationArr[indexPath.row];
    NSString *title = dic[@"title"];
    if ([title isEqualToString:@"显示成功文字和图片,几秒后消失"]) {
        
        [ViewController MB_showSuccess:@"加载成功"];
        
    }else if ([title isEqualToString:@"显示成功文字和图片,几秒后消失(放到指定view中)"]){
        
        [ViewController MB_showSuccess:@"加载成功" toView:self.view];
        
    }else if ([title isEqualToString:@"显示出错图片和文字,几秒后消失"]){
        [ViewController MB_showError:@"显示出错图片和文字,几秒后消失"];
    }else if ([title isEqualToString:@"显示出错图片和文字,几秒后消失(放到指定view中)"]){
        
        [ViewController MB_showError:@"加载失败" toView:self.view];
        
        
    }else if ([title isEqualToString:@"只显示文字,几秒后消失"]){
        
        [ViewController MB_showText:@"签到失败"];
        
    }else if ([title isEqualToString:@"只显示文字,几秒后消失(放到指定view中)"]){
       
        [ViewController MB_showText:@"签到失败" toView:self.view];
        
    }else if ([title isEqualToString:@"只显示图片,几秒后消失"]){
        
        [ViewController MB_showIcon:@"info_white"];
        
    }else if ([title isEqualToString:@"只显示图片,几秒后消失(放到指定view中)"]){
        [ViewController MB_showIcon:@"info_white" toView:self.view];
        
    }else if ([title isEqualToString:@"显示文字和图片,几秒后消失"]){
        
        [ViewController MB_showText:@"结束时间不能小于开始时间" icon:@"info_white"];
        
    }else if ([title isEqualToString:@"显示文字和图片,几秒后消失(放到指定view中)"]){
        [ViewController MB_showText:@"结束时间不能小于开始时间" icon:@"info_white" toView:self.view];
        
    }else if ([title isEqualToString:@"只显示菊花(需要主动让它消失,HUD放在Window中)"]){
        
        [ViewController MB_showHUD];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [ViewController MB_hideHUD];
        });
        
        
    }else if ([title isEqualToString:@"显示菊花和文字(需要主动让它消失,HUD放在Window中)"]){
       
        [ViewController MB_showMessage:@"正在获取参照值"];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [ViewController MB_hideHUD];
        });
        
        
    }else if ([title isEqualToString:@"显示菊花和文字(需要主动让它消失，HUD放到指定view中)"]){

        [ViewController MB_showMessage:@"正在获取参照值" toView:self.view];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [ViewController MB_hideHUDForView:self.view];
        });
    
    }
    
    
    else{
        NSLog(@"匹配失败");
    }
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
