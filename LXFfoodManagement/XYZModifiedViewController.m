//
//  XYZModifiedViewController.m
//  LXFfoodManagement
//
//  Created by 刘 雪峰 on 1/8/14.
//  Copyright (c) 2014 刘 雪峰. All rights reserved.
//

#import "XYZModifiedViewController.h"

@interface XYZModifiedViewController ()
@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneButton;
@property (weak, nonatomic) IBOutlet UITextField *itemNameMod;
@property (weak, nonatomic) IBOutlet UIDatePicker *outDateMod;
@property (strong, nonatomic) IBOutlet UIPickerView *typeMod;
@property NSArray *types;
@end

@implementation XYZModifiedViewController
@synthesize item = _item;

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
    

    if (_item) {
        self.itemNameMod.text = [_item itemName];
        NSLog(@"itemName");
        self.outDateMod.date = [_item outDate];
        self.typeMod.delegate = self;
        self.types = [[NSArray alloc] initWithObjects:@"type1", @"type2", @"type3", nil];
        
    }
    
    
	// Do any additional setup after loading the view.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if (sender != self.doneButton) {
        return;
    }
    if (self.itemNameMod.text.length > 0) {
        _item.itemName = self.itemNameMod.text;
        _item.outDate = self.outDateMod.date;
        _item.type_3 = [self.types objectAtIndex:[self.typeMod selectedRowInComponent:0]];
        NSLog(@"%@", _item.type_3);
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [self.types count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [self.types objectAtIndex:row];
}

- (IBAction)TextFiledDidEndOnExit:(id)sender {
    [sender resignFirstResponder];
}

@end
