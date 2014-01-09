//
//  XYZItem.h
//  LXFfoodManagement
//
//  Created by 刘 雪峰 on 1/6/14.
//  Copyright (c) 2014 刘 雪峰. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XYZItem : NSObject

@property (strong, nonatomic) NSString *itemName;
@property (strong, nonatomic) UIImage *image;
@property (strong, nonatomic) NSString *imageName;
@property (strong, nonatomic) NSString *type_1;
@property (strong, nonatomic) NSString *type_2;
@property (strong, nonatomic) NSString *type_3;
@property (strong, nonatomic) NSDate *addedDate;
@property (strong, nonatomic) NSDate *outDate;

- (id)initWithItem:(NSDictionary *)item;

@end
