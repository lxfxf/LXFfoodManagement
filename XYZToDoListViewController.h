//
//  XYZToDoListViewController.h
//  LXFfoodManagement
//
//  Created by 刘 雪峰 on 13-12-23.
//  Copyright (c) 2013年 刘 雪峰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XYZToDoListViewController : UITableViewController
@property NSMutableArray *itemList;


- (void) deletePlist;

//- (void) getRemoteData;

- (void) createPlist;

- (void) writePlist;

@end