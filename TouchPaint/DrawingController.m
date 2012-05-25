//
//  DrawingController.m
//  DrawLines
//
//  Created by Anurag Solanki on 25/05/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "DrawingController.h"

@implementation DrawingController
@synthesize segmentBar;
@synthesize drawScreen;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
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
    [self.view setBackgroundColor:[UIColor whiteColor]];

    self.drawScreen = [[MyLineDrawingView alloc] initWithFrame:CGRectMake(0, 45, 768, 1004)];
    [self.view addSubview:drawScreen];
    
    UIButton *undoButton = [UIButton  buttonWithType:UIButtonTypeCustom];
    [undoButton setTitle:@"UNDO" forState:UIControlStateNormal];
    [undoButton setBackgroundColor:[UIColor darkGrayColor]];
    undoButton.frame = CGRectMake(0, 0, 100, 40);
    [undoButton addTarget:self action:@selector(undoButtonClicked:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:undoButton];
    
    UIButton *redoButton = [UIButton  buttonWithType:UIButtonTypeCustom];
    [redoButton setTitle:@"REDO" forState:UIControlStateNormal];
    [redoButton setBackgroundColor:[UIColor darkGrayColor]];
    redoButton.frame = CGRectMake(668, 0, 100, 40);
    [redoButton addTarget:self action:@selector(redoButtonClicked:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:redoButton];

    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)segmentBarValueChanged:(id)sender
{
    for(UIView *view in [self.view subviews])
    {
        if([view isKindOfClass:[MyLineDrawingView class]] || [view isKindOfClass:[MyPatternBrush class]])
            [view removeFromSuperview];
    }
    
    switch ([(UISegmentedControl *)sender selectedSegmentIndex]) {
        case 0:
        {
            self.drawScreen = [[MyLineDrawingView alloc] initWithFrame:CGRectMake(0, 45, 768, 1004)];
            [self.view addSubview:drawScreen];
        }
            break;
        case 1:
        {
            self.drawScreen = [[MyPatternBrush alloc] initWithFrame:CGRectMake(0, 45, 768, 1004)];
            [self.view addSubview:drawScreen];
        }
            break;
    }
}


-(IBAction)undoButtonClicked:(id)sender
{
    [((MyLineDrawingView *)drawScreen) undoButtonClicked];
}

-(IBAction)redoButtonClicked:(id)sender
{
    [((MyLineDrawingView *)drawScreen) redoButtonClicked];    
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.drawScreen = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return ((interfaceOrientation == UIInterfaceOrientationPortrait) || (interfaceOrientation == UIInterfaceOrientationPortraitUpsideDown));
}

@end
