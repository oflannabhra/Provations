//
//  SecondViewController.h
//  ProvationsApp
//
//  Created by Ben Flannery on 2/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ClientsViewController : UIViewController <UIScrollViewDelegate> {
    IBOutlet UIScrollView* clientsScrollView;
    IBOutlet UIPageControl* pageControl;
    
    BOOL pageControlIsChangingPage;
}

@property (nonatomic, strong) UIScrollView* clientsScrollView;
@property (nonatomic, strong) UIPageControl* pageControl;

- (IBAction)changePage:(id)sender;

- (void)setupPage;

@end
