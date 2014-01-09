//
//  XYZItemDetialViewController.h
//  LXFfoodManagement
//
//  Created by 刘 雪峰 on 13-12-23.
//  Copyright (c) 2013年 刘 雪峰. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XYZToDoItem.h"
#import "XYZItem.h"

@interface XYZItemDetialViewController : UIViewController

@property XYZToDoItem *toDoItem;
@property NSMutableArray *itemList;
@property NSInteger itemIndex;
@property XYZItem *item;

@end
