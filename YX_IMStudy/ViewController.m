//
//  ViewController.m
//  YX_IMStudy
//
//  Created by yang on 16/8/4.
//  Copyright © 2016年 poplary. All rights reserved.
//

#import "ViewController.h"
#import <RongIMKit/RongIMKit.h>
#import "MainTableView.h"
@interface ViewController ()<MainTableDelegate>
@property(nonatomic, strong) MainTableView *tableView;

@property(nonatomic, strong) NSArray *sectionTitle;
@property(nonatomic, strong) NSArray *rowTitle;

@end

@implementation ViewController

-(MainTableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[MainTableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _tableView.mainTableDelegate = self;
    }
    return _tableView;
}
-(NSArray *)sectionTitle{
    if (_sectionTitle == nil) {
        _sectionTitle = @[@"亲朋好友",@"陌生人",@"黑名单"];
    }
    return _sectionTitle;
}
-(NSArray *)rowTitle{
    if (_rowTitle == nil) {
        _rowTitle = [[NSArray alloc]initWithObjects:
                     @[@"鸣人",@"雏田",@"小樱"],
                     @[@"梦想天空",@"不一样的你",@"安度因"],
                     @[@"梦想天空",@"不一样的你",@"安度因"],
                     nil];
    }
    return _rowTitle;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.sectionTit = self.sectionTitle;
    self.tableView.rowTit = self.rowTitle;
    [self.view addSubview:self.tableView];
    
    //    // Do any additional setup after loading the view, typically from a nib.
    //    //新建一个聊天会话View Controller对象
    //    RCConversationViewController *chat = [[RCConversationViewController alloc]init];
    //    //设置会话的类型，如单聊、讨论组、群聊、聊天室、客服、公众服务会话等
    //    chat.conversationType = ConversationType_PRIVATE;
    //    //设置会话的目标会话ID。（单聊、客服、公众服务会话为对方的ID，讨论组、群聊、聊天室为会话的ID）
    //    chat.targetId = @"targetIdYouWillChatIn";
    //    //设置聊天会话界面要显示的标题
    //    chat.title = @"想显示的会话标题";
    //    //显示聊天会话界面
    //    [self.navigationController pushViewController:chat animated:YES];
}
- (void)mainTableDelegatedidSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //新建一个聊天会话View Controller对象
    RCConversationViewController *chat = [[RCConversationViewController alloc]init];
    //设置会话的类型，如单聊、讨论组、群聊、聊天室、客服、公众服务会话等
    chat.conversationType = ConversationType_PRIVATE;
    //设置会话的目标会话ID。（单聊、客服、公众服务会话为对方的ID，讨论组、群聊、聊天室为会话的ID）
    chat.targetId = @"targetIdYouWillChatIn";
    //设置聊天会话界面要显示的标题
    chat.title = @"想显示的会话标题";
    //显示聊天会话界面
    [self.navigationController pushViewController:chat animated:YES];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
