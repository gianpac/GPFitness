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

- (void)setupHorizontalToolbar {
    
    NSArray *itemsArray = [NSArray arrayWithObjects:@"Add", @"Modify", @"Remove", nil];
    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc] initWithItems:itemsArray];
    segmentedControl.segmentedControlStyle = UISegmentedControlStyleBar;
    segmentedControl.tintColor = [UIColor blackColor];
    
    UIBarButtonItem *segmentedControlBarButtonItem =[[UIBarButtonItem alloc] initWithCustomView:segmentedControl];
    [segmentedControl release];
    UIBarButtonItem *flexButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];                
    
    horizontalToolbar = [[UIToolbar alloc] init];
	horizontalToolbar.tintColor = [UIColor blackColor];
    [horizontalToolbar setItems:[NSArray arrayWithObjects:flexButton, segmentedControlBarButtonItem, flexButton, nil]];
	[segmentedControlBarButtonItem release];
    [flexButton release];
	[self.view addSubview:horizontalToolbar];
	[horizontalToolbar release];
}

/*
- (void)setupClientsView {
	UITableView *todayTableView = [[UITableView alloc] initWithFrame:CGRectMake(44, 0, 320, self.view.frame.size.height) style:UITableViewStylePlain];
	todayTableView.backgroundColor = [UIColor clearColor];
	UIScrollView *newsScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(todayTableView.frame.size.width + verticalToolbar.frame.size.width, 0, self.view.frame.size.width - (todayTableView.frame.size.width + verticalToolbar.frame.size.width), 220.0f)];
	newsScrollView.backgroundColor = [UIColor blueColor];
	newsScrollView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleRightMargin;
	UIScrollView *clientsScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(todayTableView.frame.size.width + verticalToolbar.frame.size.width, newsScrollView.frame.size.height, self.view.frame.size.width - (todayTableView.frame.size.width + verticalToolbar.frame.size.width), self.view.frame.size.height - newsScrollView.frame.size.height)];
	clientsScrollView.backgroundColor = [UIColor redColor];
	clientsScrollView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleHeight;
	
	[self.view addSubview:todayTableView];
	[self.view addSubview:newsScrollView];
	[self.view addSubview:clientsScrollView];
	[todayTableView release];
	[newsScrollView release];
	[clientsScrollView release];
}
*/

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	[self setupVerticalToolbar];
	[self setupHorizontalToolbar];
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
        horizontalToolbar.frame = CGRectMake(44, 0, 724, 44);
	}
	else {
		verticalToolbar.frame = CGRectMake(0, 0, 44, 748);
        horizontalToolbar.frame = CGRectMake(verticalToolbar.frame.size.width, self.view.frame.size.height/2, self.view.frame.size.height - verticalToolbar.frame.size.width + 20, 44);
	}
	verticalToolbar.transform = CGAffineTransformMakeRotation(270*M_PI/180);
	for (UIView *v in [self.view subviews]) {
		//NSLog(@"%@", v);
	}
	return YES;
}

- (IBAction)pushButton:(id)sender {
    NSLog(@"button pushed");
}

@end
