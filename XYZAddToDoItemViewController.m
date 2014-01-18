//
//  XYZAddToDoitemViewController.m
//  LXFfoodManagement
//
//  Created by 刘 雪峰 on 13-12-23.
//  Copyright (c) 2013年 刘 雪峰. All rights reserved.
//

#import "XYZAddToDoitemViewController.h"

<<<<<<< HEAD

=======
>>>>>>> lxf-github/master
@interface XYZAddToDoItemViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneButton;
@property (weak, nonatomic) IBOutlet UIDatePicker *OutDate;
@property (strong, nonatomic) IBOutlet UIPickerView *itemType;
<<<<<<< HEAD
@property (strong, nonatomic) IBOutlet UIButton *addImageButton;
@property (strong, nonatomic) IBOutlet UIImageView *itemImage;
@property NSArray *types;

@end
=======
@property NSArray *types;

@end

>>>>>>> lxf-github/master
@implementation XYZAddToDoItemViewController
@synthesize item = _item;

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if (sender != self.doneButton) {
        return;
    }
    if (self.textField.text.length > 0 ) {
        NSLog(@"prepareForAdding");
        _item = [[XYZItem alloc] init];
        [_item setItemName:self.textField.text];
        [_item setType_3:[self.types objectAtIndex:[self.itemType selectedRowInComponent:0]]];
        [_item setOutDate:self.OutDate.date];
        [_item setAddedDate:[NSDate date]];
        
    }
}

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
    self.title = @"Add Item";
    self.types = [[NSArray alloc] initWithObjects:@"type1", @"type2", @"type3", nil];
    self.itemType.delegate = self;
	// Do any additional setup after loading the view.
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

- (IBAction)TextField_DidEndOnExit:(id)sender {
    
    [sender resignFirstResponder];
}
<<<<<<< HEAD
=======




>>>>>>> lxf-github/master
@end
