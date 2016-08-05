//
//  MainTableView.m
//  YX_IMStudy
//
//  Created by yang on 16/8/4.
//  Copyright © 2016年 poplary. All rights reserved.
//

#import "MainTableView.h"
@interface MainTableView()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic, strong) NSArray *firArr;
@property(nonatomic, strong) NSArray *sectionArr;
@property(nonatomic) BOOL index;
@property(nonatomic, strong) NSMutableArray *saveIndexArr;
@end
@implementation MainTableView

-(id)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    if (self = [super initWithFrame:frame style:style]) {
        self.delegate = self;
        self.dataSource = self;
        self.tableFooterView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, 0.01f)];
    }
    return self;
}
//-(NSArray *)sectionArr{
//    if (_sectionArr == nil) {
//        _sectionArr = [[NSArray alloc]initWithObjects:
//                       @[@"qq",@"ww",@"dd"],
//                       @[@"34",@"35"],
//                       @[@"//",@"##",@"&*"],
//                       nil];
//    }
//    return _sectionArr;
//}
- (void)setSectionTit:(NSArray *)sectionTit{
    _sectionTit = sectionTit;
}
-(void)setRowTit:(NSArray *)rowTit{
    _rowTit = rowTit;
}
-(NSMutableArray *)saveIndexArr{
    if (_saveIndexArr == nil) {
        _saveIndexArr = [NSMutableArray array];
        for (int i = 0; i<self.sectionTit.count; i++) {
            
            [_saveIndexArr addObject:@"0"];
            
        }
    }
    return _saveIndexArr;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.sectionTit.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if ([[self.saveIndexArr objectAtIndex:section] isEqualToString:@"1"]) {
        
        return [[self.rowTit objectAtIndex:section] count];
    }else{
        return 0;
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = [[self.rowTit objectAtIndex:indexPath.section]objectAtIndex:indexPath.row];
    return cell;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 40)];
    UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, tableView.frame.size.width/2, 40)];
    lab.text = [self.sectionTit objectAtIndex:section];
    lab.textAlignment = NSTextAlignmentCenter;
    [view addSubview:lab];
    
    view.backgroundColor = [UIColor grayColor];
    UIButton *btn = [[UIButton alloc]initWithFrame:view.frame];
    [btn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [btn setTag:section];
    [view addSubview:btn];
    
    return view;
}
-(void)click:(UIButton *)sender{
    
    if ([[self.saveIndexArr objectAtIndex:sender.tag]isEqualToString:@"0"]) {
        [self.saveIndexArr replaceObjectAtIndex:sender.tag withObject:@"1"];
    }else if([[self.saveIndexArr objectAtIndex:sender.tag]isEqualToString:@"1"]){
        [self.saveIndexArr replaceObjectAtIndex:sender.tag withObject:@"0"];
    }
    
    [self reloadData];
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 40;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if ([self.mainTableDelegate respondsToSelector:@selector(mainTableDelegatedidSelectRowAtIndexPath:)]) {
        [self.mainTableDelegate mainTableDelegatedidSelectRowAtIndexPath:indexPath];
    }
    
}

@end
