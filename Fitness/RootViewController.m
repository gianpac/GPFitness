//
//  RootViewController.m
//  Fitness
//
//  Created by AKGian on 11-07-08.
//  Copyright 2011 Akaibo. All rights reserved.
//

#import "RootViewController.h"
#import <CoreGraphics/CoreGraphics.h>

@implementation RootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

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

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	// Set up VERTICAL TOOLBAR
	UIBarButtonItem *initButton = [[UIBarButtonItem alloc] initWithTitle:@"inicio" style:UIBarButtonItemStylePlain target:self action:nil];
	UIBarButtonItem *flexButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
	UIBarButtonItem *endButton = [[UIBarButtonItem alloc] initWithTitle:@"final" style:UIBarButtonItemStylePlain target:self action:nil];
	
	toolbar = [[UIToolbar alloc] init];
	toolbar.tintColor = [UIColor blackColor];
	[toolbar setItems:[NSArray arrayWithObjects:initButton, flexButton, endButton, nil]];
	[initButton release];
	[flexButton release];
	[endButton release];
	[self.view addSubview:toolbar];
	[toolbar release];
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
		toolbar.frame = CGRectMake(0, 0, 44, 1004);
	}
	else {
		toolbar.frame = CGRectMake(0, 0, 44, 748);
	}
	toolbar.transform = CGAffineTransformMakeRotation(270*M_PI/180);
	return YES;
}

@end
