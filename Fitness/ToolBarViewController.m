//
//  RootViewController.m
//  Fitness
//
//  Created by AKGian on 11-07-08.
//  Copyright 2011 Akaibo. All rights reserved.
//

#import "ToolBarViewController.h"
#import "ClientViewController.h"
#import <CoreGraphics/CoreGraphics.h>

@implementation ToolBarViewController

- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - Set Up Views

- (void)setupVerticalToolbar {
	// Set up VERTICAL TOOLBAR
	UIBarButtonItem *initButton = [[UIBarButtonItem alloc] initWithTitle:@"inicio" style:UIBarButtonItemStyleBordered target:self action:@selector(pushButton:)];
	UIBarButtonItem *flexButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
	UIBarButtonItem *endButton = [[UIBarButtonItem alloc] initWithTitle:@"final" style:UIBarButtonItemStyleBordered target:self action:@selector(pushButton:)];
	
	verticalToolbar = [[UIToolbar alloc] init];
	verticalToolbar.tintColor = [UIColor blackColor];
	[verticalToolbar setItems:[NSArray arrayWithObjects:initButton, flexButton, endButton, nil]];
	[initButton release];
	[flexButton release];
	[endButton release];
	[self.view addSubview:verticalToolbar];
	[verticalToolbar release];
}



#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	[self setupVerticalToolbar];
    clientViewController = [[ClientViewController alloc] init];
    [clientViewController.view setFrame:CGRectMake(44, 0, self.view.bounds.size.width - 44, self.view.frame.size.height)];
     clientViewController.view.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:clientViewController.view];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	if (interfaceOrientation == UIInterfaceOrientationPortrait | interfaceOrientation == UIInterfaceOrientationPortraitUpsideDown) {
		verticalToolbar.frame = CGRectMake(0, 0, 44, 1004);
	}
	else {
		verticalToolbar.frame = CGRectMake(0, 0, 44, 748);
	}
	verticalToolbar.transform = CGAffineTransformMakeRotation(270*M_PI/180);
	return YES;
}

- (IBAction)pushButton:(id)sender {
    NSLog(@"button pushed");
}

@end
