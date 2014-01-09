//
//  XYZArrayItem.m
//  LXFfoodManagement
//
//  Created by 刘 雪峰 on 1/7/14.
//  Copyright (c) 2014 刘 雪峰. All rights reserved.
//

#import "XYZArrayItem.h"

@implementation XYZArrayItem

@synthesize itemName = _itemName;
@synthesize imageName = _imageName;
@synthesize type_1 = _type_1;
@synthesize type_2 = _type_2;
@synthesize type_3 = _type_3;
@synthesize addedDate = _addedDate;
@synthesize outDate = _outDate;

- (id)initWithXYZItem:(XYZItem *)item
{
    self = [super init];
    if (self) {
        _itemName = [item itemName];
        _imageName = [item imageName];
        _type_1 = [item type_1];
        _type_2 = [item type_2];
        _type_3 = [item type_3];
        _addedDate = [item addedDate];
        _outDate = [item outDate];
    }
    return self;
}
- (void)writeToPlist:(NSMutableArray *)itemList
{
    NSMutableArray *array = [[NSMutableArray alloc] init];
    for (XYZItem *item in itemList) {
        NSMutableArray *itemDic = [[NSMutableArray alloc] init];
        [itemDic setValue:[item itemName] forKey:@"ItemName"];
        [itemDic setValue:[item imageName] forKey:@"Image"];
        [itemDic setValue:[item type_1] forKey:@"Type_1"];
        [itemDic setValue:[item type_2] forKey:@"Type_2"];
        [itemDic setValue:[item type_3] forKey:@"type_3"];
        [itemDic setValue:[item addedDate] forKey:@"AddDate"];
        [itemDic setValue:[item outDate] forKey:@"OutDate"];
        [array addObject:itemDic];
    }
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES);
    NSString *path = [paths objectAtIndex:0];
    NSString *filename = [path stringByAppendingPathComponent:@"data.plist"];
    NSLog(@"%@", filename);
    
    
    if ([array writeToFile:filename atomically:YES]) {
        NSLog(@"write plist successfully");
    }
}

@end
