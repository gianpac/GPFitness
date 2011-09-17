//
//  ClientViewController.m
//  Fitness
//
//  Created by Giancarlo Pacheco on 11-08-01.
//  Copyright 2011 Akaibo. All rights reserved.
//

#import "ClientViewController.h"

@interface ClientViewController ()
- (void)setupClientsListView;
- (void)setupHorizontalToolbar;
- (void)moveToolbar;
@end

@implementation ClientViewController

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupClientsListView];
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
	return YES;
}

- (void)setupHorizontalToolbar {
    
    NSArray *itemsArray = [NSArray arrayWithObjects:@"Add", @"Modify", @"Remove", nil];
    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc] initWithItems:itemsArray];
    segmentedControl.segmentedControlStyle = UISegmentedControlStyleBar;
    segmentedControl.tintColor = [UIColor blackColor];
    
    UIBarButtonItem *segmentedControlBarButtonItem =[[UIBarButtonItem alloc] initWithCustomView:segmentedControl];
    [segmentedControl release];
    UIBarButtonItem *arrowButton = [[UIBarButtonItem alloc] initWithTitle:@"up" style:UIBarButtonItemStylePlain target:self action:@selector(moveToolbar)];
    UIBarButtonItem *flexButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];                
    
    horizontalToolbar = [[UIToolbar alloc] init];
    horizontalToolbar.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    horizontalToolbar.frame = CGRectMake(0, 220, self.view.frame.size.width, 44);
	horizontalToolbar.tintColor = [UIColor blackColor];
    [horizontalToolbar setItems:[NSArray arrayWithObjects:flexButton, segmentedControlBarButtonItem, flexButton, arrowButton, nil]];
	[segmentedControlBarButtonItem release];
    [arrowButton release];
    [flexButton release];
	[self.view addSubview:horizontalToolbar];
}


- (void)setupClientsListView {
    listScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 220.0f)];
    listScrollView.backgroundColor = [UIColor blueColor];
    listScrollView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleRightMargin;
    
    clientViewScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, listScrollView.frame.size.height + 44, self.view.frame.size.width, self.view.frame.size.height - listScrollView.frame.size.height - 44)];
    clientViewScrollView.backgroundColor = [UIColor redColor];
    clientViewScrollView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleHeight;

    [self.view addSubview:listScrollView];
    [self.view addSubview:clientViewScrollView];
}

- (void)moveToolbar {
    [UIView beginAnimations:@"toolbar" context:nil];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    [UIView setAnimationDuration:0.35];
    
    if (horizontalToolbar.frame.origin.y == 0) {
        horizontalToolbar.frame = CGRectMake(0.0f, 220.0f, self.view.frame.size.width, 44.0f);
        listScrollView.frame = CGRectMake(0.0f, 0.0f, self.view.frame.size.width, 220.0f);
        clientViewScrollView.frame = CGRectMake(0.0f, listScrollView.frame.size.height + 44, self.view.frame.size.width, self.view.frame.size.height - listScrollView.frame.size.height - 44);
    }
    else {
        horizontalToolbar.frame = CGRectMake(0.0f, 0.0f, self.view.frame.size.width, 44.0f);
        listScrollView.frame = CGRectMake(0.0f, 0.0f, self.view.frame.size.width, 0.0f);
        clientViewScrollView.frame = CGRectMake(0.0f, listScrollView.frame.size.height + 44, self.view.frame.size.width, listScrollView.frame.size.height + self.view.frame.size.height - listScrollView.frame.size.height - 44);
    }
    
    [UIView commitAnimations];
}
 

@end
