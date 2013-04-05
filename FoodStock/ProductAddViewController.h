//
//  ProductAddViewController.h
//  FoodStock
//
//  Created by Moritz on 05.04.13.
//  Copyright (c) 2013 dittmann.moritz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProductAddViewController : UIViewController <UINavigationControllerDelegate,UIImagePickerControllerDelegate>

// Core Data Update
@property (strong) NSManagedObject *product;

// TextFields
@property (weak, nonatomic) IBOutlet UITextField *isbnTextField;
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *categoryTextField;

// Camera
@property (weak, nonatomic) IBOutlet UIImageView *productImageView;

// PickerView
@property (weak, nonatomic) IBOutlet UIPickerView *categoryPickerView;

// Textinput & virtual Keyboard
-(IBAction)textFieldReturn:(id)sender;
- (IBAction)showCategoryPickerView:(id)sender;

// Save & Cancel Button
- (IBAction)save:(id)sender;
- (IBAction)cancel:(id)sender;
// Take Photo Button
- (IBAction)tappedUseCamera:(id)sender;



@end
