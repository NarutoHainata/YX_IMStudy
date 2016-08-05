//
//  MainTableView.h
//  YX_IMStudy
//
//  Created by yang on 16/8/4.
//  Copyright © 2016年 poplary. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol MainTableDelegate <NSObject>

-(void)mainTableDelegatedidSelectRowAtIndexPath:(NSIndexPath *)indexPath;

@end

@interface MainTableView : UITableView
@property(nonatomic, weak) id<MainTableDelegate>mainTableDelegate;
@property(nonatomic, strong) NSArray *sectionTit;
@property(nonatomic, strong) NSArray *rowTit;
@end
