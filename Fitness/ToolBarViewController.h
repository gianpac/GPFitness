//
//  RootViewController.h
//  Fitness
//
//  Created by AKGian on 11-07-08.
//  Copyright 2011 Akaibo. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ClientViewController;

@interface ToolBarViewController : UIViewController {
    UIToolbar *verticalToolbar;
    ClientViewController *clientViewController;
}

- (IBAction)pushButton:(id)sender;

@end
