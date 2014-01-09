//
//  XYZToDoListViewController.m
//  LXFfoodManagement
//
//  Created by 刘 雪峰 on 13-12-23.
//  Copyright (c) 2013年 刘 雪峰. All rights reserved.
//

#import "XYZToDoListViewController.h"
#import "XYZToDoItem.h"
#import "XYZAddToDoitemViewController.h"
#import "XYZItemDetialViewController.h"
#import "XYZItem.h"

@interface XYZToDoListViewController ()

@property NSMutableArray *toDoItems;
@end

@implementation XYZToDoListViewController





- (void) loadInitialData
{
    XYZToDoItem *item1 = [[XYZToDoItem alloc] init];
    item1.itemName = @"Buy milk";
    [self.toDoItems addObject:item1];
}

- (IBAction)unwindToList:(UIStoryboardSegue *)segue
{
    XYZAddToDoItemViewController *source = [segue sourceViewController];
    XYZItem *item = source.item;
    if (item) {
        NSLog(@"newItem");
        [self writeToPlist:self.itemList :item];
        [self viewDidLoad];
    }
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString *dataPath = [[NSBundle mainBundle]pathForResource:@"ItemList" ofType:@"plist"];
    NSMutableArray *array = [[NSMutableArray alloc] initWithContentsOfFile:dataPath];
    //array = [NSMutableArray arrayWithContentsOfFile:dataPath];
    //[self deletePlist];
    //[self createPlist];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES);
    NSString *path = [paths objectAtIndex:0];
    NSString *filename = [path stringByAppendingPathComponent:@"data.plist"];
    NSLog(@"%@", filename);
    NSLog(@"%@", NSHomeDirectory());
    if (![fileManager fileExistsAtPath:filename]) {
        array = [NSMutableArray arrayWithContentsOfFile:dataPath];
        NSLog(@"first run");
        NSString *directoryPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Library/Documentation"];
        [fileManager createDirectoryAtPath:directoryPath withIntermediateDirectories:YES attributes:nil error:nil];
        [fileManager createFileAtPath:filename contents:nil attributes:nil];
        [array writeToFile:filename atomically:YES];
    }
    else{
        array = [NSMutableArray arrayWithContentsOfFile:filename];
        NSLog(@"exist");
    }
    
    
    if (![fileManager fileExistsAtPath:filename]) {
        NSLog(@"not exit");
    }
    
    self.itemList = [[NSMutableArray alloc] init];
    for (NSDictionary *item in array) {
        XYZItem *xyzitem = [[XYZItem alloc]initWithItem:item];
        [self.itemList addObject:xyzitem];
    }
    self.toDoItems = [[NSMutableArray alloc] init];
    [self loadInitialData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.itemList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ListPrototypeCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    //    XYZToDoItem *toDoItem = [self.toDoItems objectAtIndex:indexPath.row];
    //    cell.textLabel.text = toDoItem.itemName;
    
    XYZItem *item = [self.itemList objectAtIndex:indexPath.row];
    [cell.textLabel setText:[item itemName]];
    [cell.imageView setImage:[item image]];
    float sw = 50/cell.imageView.image.size.width;
    float sh = 40/cell.imageView.image.size.height;
    cell.imageView.transform = CGAffineTransformMakeScale(sw, sh);
    return cell;
}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [self.itemList removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [self writeToPlist:self.itemList];
    }
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    //   XYZToDoItem *toDoItem = [[XYZToDoItem alloc] init];
    if ( [segue.identifier isEqualToString:@"AddItem"]) {
        NSLog(@"wha1");
    }
    else{
        NSIndexPath *path = [self.tableView indexPathForSelectedRow];
        NSInteger itemIndex = path.row;
        NSMutableArray *itemList = self.itemList;
        
        [segue.destinationViewController setItemIndex:itemIndex];
        [segue.destinationViewController setItemList:itemList];
    }
}

- (void) viewWillAppear:(BOOL)animated
{
    NSLog(@"Refresh View");
    [self.tableView reloadData];
}

- (void)viewDidAppear:(BOOL)animated
{
    [self.tableView reloadData];
}

- (void) deletePlist
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES);
    NSString *documentsDirtory = [paths objectAtIndex:0];
    NSString *path = [documentsDirtory stringByAppendingPathComponent:@"data.plist"];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    [fileManager removeItemAtPath:path error:nil];
}

- (void) createPlist
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES);
    NSString *documentsDirtory = [paths objectAtIndex:0];
    NSString *path = [documentsDirtory stringByAppendingPathComponent:@"data.plist"];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    if (![fileManager fileExistsAtPath:path]) {
        //NSMutableArray *array = [[NSMutableArray alloc] init];
        
        
        NSLog(@"not exit");
        
        
    }
}

- (void) writePlist
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES);
    NSString *documentsDirtory = [paths objectAtIndex:0];
    NSString *path = [documentsDirtory stringByAppendingPathComponent:@"data.plist"];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    if ([fileManager fileExistsAtPath:path]) {
        NSString *dataPath = [[NSBundle mainBundle]pathForResource:@"ItemList" ofType:@"plist"];
        NSMutableArray *array = [NSMutableArray arrayWithContentsOfFile:dataPath];
        [array writeToFile:path atomically:YES];
    }
    else{
        NSString *appFile = [documentsDirtory stringByAppendingPathComponent:[NSString stringWithFormat:@"data.plist"]];
        NSString *dataPath = [[NSBundle mainBundle]pathForResource:@"ItemList" ofType:@"plist"];
        NSMutableArray *array = [NSMutableArray arrayWithContentsOfFile:dataPath];
        [array writeToFile:appFile atomically:YES];
        
    }
}

- (void)writeToPlist:(NSMutableArray *)itemList :(XYZItem *)item
{
    NSMutableArray *array = [[NSMutableArray alloc] init];
    NSMutableDictionary *itemDic = [[NSMutableDictionary alloc] init];
    [itemDic setObject:[item itemName] forKey:@"ItemName"];
    [itemDic setObject:@"default.jpg" forKey:@"Image"];
    [itemDic setObject:@"Type_1" forKey:@"Type_1"];
    [itemDic setObject:@"Type_2" forKey:@"Type_2"];
    [itemDic setObject:[item type_3] forKey:@"Type_3"];
    [itemDic setObject:[item addedDate] forKey:@"AddedDate"];
    [itemDic setObject:[item outDate] forKey:@"OutDate"];
    [array addObject:itemDic];
    
    
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
    [self.tableView reloadData];
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
