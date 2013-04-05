//
//  ProductAddViewController.h
//  FoodStock
//
//  Created by Moritz on 05.04.13.
//  Copyright (c) 2013 dittmann.moritz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProductAddViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *isbnTextField;
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *categoryTextField;


- (IBAction)save:(id)sender;
- (IBAction)cancel:(id)sender;

@end
