//
//  SecondVC.m
//  NSObjectHUD
//
//  Created by wangzheng on 17/3/14.
//  Copyright © 2017年 WZheng. All rights reserved.
//

#import "SecondVC.h"
#import "NSObject+MBHUD.h"
@interface SecondVC ()
@property (strong, nonatomic) NSArray *operationArr;
@end

@implementation SecondVC

- (NSArray *)operationArr{
    if (!_operationArr) {
        _operationArr = [NSArray array];
    }
    return _operationArr;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.operationArr = @[
                          @{@"title":@"显示系统指示器",
                            @"subtitle":@"- (void)MB_showNetworkIndicator;",
                              },
                          ];
    
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

    if ([title isEqualToString:@"显示系统指示器"]){
        
        [SecondVC MB_showNetworkIndicator];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [SecondVC MB_hideNetworkIndicator];
        });
        
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
