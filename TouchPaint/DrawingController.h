//
//  DrawingController.h
//  DrawLines
//
//  Created by Anurag Solanki on 25/05/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyLineDrawingView.h"
#import "MyPatternBrush.h"

@interface DrawingController : UIViewController {
    
    IBOutlet UISegmentedControl *segmentBar;
    UIView *drawScreen;
    
}
@property(nonatomic) IBOutlet UISegmentedControl *segmentBar;
@property (nonatomic, strong) UIView *drawScreen;

@end
