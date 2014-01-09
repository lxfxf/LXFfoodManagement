//
//  XYZItem.m
//  LXFfoodManagement
//
//  Created by 刘 雪峰 on 1/6/14.
//  Copyright (c) 2014 刘 雪峰. All rights reserved.
//

#import "XYZItem.h"

@implementation XYZItem
@synthesize itemName = _itemName;
@synthesize image = _image;
@synthesize imageName = _imageName;
@synthesize type_1 = _type_1;
@synthesize type_2 = _type_2;
@synthesize type_3 = _type_3;
@synthesize addedDate = _addedDate;
@synthesize outDate = _outDate;

- (id)initWithItem:(NSDictionary *)item
{
    self = [super init];
    if (self) {
        _itemName = [item objectForKey:@"ItemName"];
        _image = [UIImage imageNamed:[item objectForKey:@"Image"]];
        _imageName = [item objectForKey:@"Image"];
        _type_1 = [item objectForKey:@"Type_1"];
        _type_2 = [item objectForKey:@"Type_2"];
        _type_3 = [item objectForKey:@"Type_3"];
        _addedDate = [item objectForKey:@"AddedDate"];
        _outDate = [item objectForKey:@"OutDate"];
        
    }
    return self;
}


@end
