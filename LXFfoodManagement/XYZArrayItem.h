//
//  XYZArrayItem.h
//  LXFfoodManagement
//
//  Created by 刘 雪峰 on 1/7/14.
//  Copyright (c) 2014 刘 雪峰. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XYZItem.h"

@interface XYZArrayItem : NSObject

@property (strong, nonatomic) NSString *itemName;
@property (strong, nonatomic) NSString *imageName;
@property (strong, nonatomic) NSString *type_1;
@property (strong, nonatomic) NSString *type_2;
@property (strong, nonatomic) NSString *type_3;
@property (strong, nonatomic) NSDate *addedDate;
@property (strong, nonatomic) NSDate *outDate;

- (id)initWithXYZItem:(XYZItem *)item;
- (void)writeToPlist:(NSMutableArray *)itemList;
@end
