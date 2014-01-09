//
//  XYZItemDetialViewController.m
//  LXFfoodManagement
//
//  Created by 刘 雪峰 on 13-12-23.
//  Copyright (c) 2013年 刘 雪峰. All rights reserved.
//


#import "XYZItemDetialViewController.h"
#import "XYZModifiedViewController.h"


@interface XYZItemDetialViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *itemImage;
@property (weak, nonatomic) IBOutlet UILabel *itemName;
@property (weak, nonatomic) IBOutlet UILabel *addedDate;
@property (weak, nonatomic) IBOutlet UILabel *itemType;
@property (weak, nonatomic) IBOutlet UILabel *outDate;


@end

@implementation XYZItemDetialViewController



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    XYZItem *item = [self.itemList objectAtIndex:self.itemIndex];
    if (item) {
        [self setTitle:[item itemName]];
        [self.itemImage setImage:[item image]];
        [self.itemName setText:[item itemName]];
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        NSTimeZone *timeZone = [NSTimeZone localTimeZone];
        [formatter setTimeZone:timeZone];
        [formatter setDateFormat:@"yyyy/M/d"];
        [self.addedDate setText:[formatter stringFromDate:[item addedDate]]];
        [self.outDate setText:[formatter stringFromDate:[item outDate]]];
        [self.itemType setText:[item type_3]];
        
        self.itemImage.layer.masksToBounds = YES;
        self.itemImage.layer.borderColor = [UIColor blueColor].CGColor;
        self.itemImage.layer.cornerRadius = 10.0;
        self.itemImage.layer.borderWidth = 1.f;
        
        self.itemName.layer.masksToBounds = YES;
        self.itemName.layer.borderColor = [UIColor blueColor].CGColor;
        self.itemName.layer.cornerRadius = 10.0;
        self.itemName.layer.borderWidth = 1.f;
        
        self.addedDate.layer.masksToBounds = YES;
        self.addedDate.layer.borderColor = [UIColor blueColor].CGColor;
        self.addedDate.layer.cornerRadius = 10.0;
        self.addedDate.layer.borderWidth = 1.f;

        self.outDate.layer.masksToBounds = YES;
        self.outDate.layer.borderColor = [UIColor blueColor].CGColor;
        self.outDate.layer.cornerRadius = 10.0;
        self.outDate.layer.borderWidth = 1.f;

        self.itemType.layer.masksToBounds = YES;
        self.itemType.layer.borderColor = [UIColor blueColor].CGColor;
        self.itemType.layer.cornerRadius = 10.0;
        self.itemType.layer.borderWidth = 1.f;
        
        self.view.backgroundColor = [UIColor grayColor];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)unwindToDetail:(UIStoryboardSegue *)segue{
//    XYZItemModifiedViewController *source = [segue sourceViewController];
    
    [self writeToPlist:self.itemList];
    [self viewDidLoad];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ( [segue.identifier isEqualToString:@"ItemModified"]) {
        NSLog(@"wha");
        XYZItem *item = [self.itemList objectAtIndex:self.itemIndex];
        
        id theSegue = segue.destinationViewController;
        [theSegue setItem:item];
        
        
    }
    else{
        NSLog(@"wha2");
        
    }
}

- (void)writeToPlist:(NSMutableArray *)itemList
{
    NSMutableArray *array = [[NSMutableArray alloc] init];
    for (XYZItem *item in itemList) {
        NSMutableDictionary *itemDic = [[NSMutableDictionary alloc] init];
        [itemDic setObject:[item itemName] forKey:@"ItemName"];
        [itemDic setObject:[item imageName] forKey:@"Image"];
        [itemDic setObject:[item type_1] forKey:@"Type_1"];
        [itemDic setObject:[item type_2] forKey:@"Type_2"];
        [itemDic setObject:[item type_3] forKey:@"Type_3"];
        [itemDic setObject:[item addedDate] forKey:@"AddedDate"];
        [itemDic setObject:[item outDate] forKey:@"OutDate"];
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
