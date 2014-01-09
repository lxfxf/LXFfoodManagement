//
//  XYZModifiedViewController.h
//  LXFfoodManagement
//
//  Created by 刘 雪峰 on 1/8/14.
//  Copyright (c) 2014 刘 雪峰. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XYZItem.h"


@interface XYZModifiedViewController: UIViewController<UIPickerViewDelegate, UIPickerViewDataSource>

@property XYZItem *item;

@end
