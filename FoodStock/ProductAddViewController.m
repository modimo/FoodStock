//
//  ProductAddViewController.m
//  FoodStock
//
//  Created by Moritz on 05.04.13.
//  Copyright (c) 2013 dittmann.moritz. All rights reserved.
//

#import "ProductAddViewController.h"

@interface ProductAddViewController ()

@end

@implementation ProductAddViewController

@synthesize product;
@synthesize isbnTextField;
@synthesize nameTextField;
@synthesize categoryTextField;
@synthesize productImageView;

- (NSManagedObjectContext *)managedObjectContext
{
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)])
    {
        context = [delegate managedObjectContext];
    }
    return context;
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
	// Do any additional setup after loading the view.
    if (self.product)
    {
        [self.isbnTextField setText:[self.product valueForKey:@"isbn"]];
        [self.nameTextField setText:[self.product valueForKey:@"name"]];
        [self.categoryTextField setText:[self.product valueForKey:@"category"]];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)save:(id)sender
{
    NSManagedObjectContext *context = [self managedObjectContext];
    
    if (self.product)
    {
        // Update existing device
        // Update existing device
        [self.product setValue:self.isbnTextField.text forKey:@"isbn"];
        [self.product setValue:self.nameTextField.text forKey:@"name"];
        [self.product setValue:self.categoryTextField.text forKey:@"category"];
        
    }
    else
    {
        // Create a new managed object
        NSManagedObject *newDevice = [NSEntityDescription insertNewObjectForEntityForName:@"Product" inManagedObjectContext:context];
        [newDevice setValue:self.isbnTextField.text forKey:@"isbn"];
        [newDevice setValue:self.nameTextField.text forKey:@"name"];
        [newDevice setValue:self.categoryTextField.text forKey:@"category"];
        [newDevice setValue:@"init" forKey:@"price"];
        [newDevice setValue:@"init" forKey:@"durable"];
    }
    
    NSError *error = nil;
    // Save the object to persistent store
    if (![context save:&error]) {
        NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)cancel:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)tappedUseCamera:(id)sender
{
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
    {
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        picker.delegate = self;
        [self presentViewController:picker animated:YES completion:nil];
    }
}

-(void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    [self.productImageView setImage:image];
    //[self dismissViewControllerAnimated:YES completion:nil];
}

-(IBAction)textFieldReturn:(id)sender
{
    [sender resignFirstResponder];
}

- (IBAction)showCategoryPickerView:(id)sender
{
    categoryTextField.hidden = NO;
}


@end
