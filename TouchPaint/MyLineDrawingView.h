//
//  MyLineDrawingView.h
//  DrawLines
//
//  Created by Anurag Solanki on 25/05/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyLineDrawingView : UIView {
    
    UIBezierPath *myPath;
    UIColor *brushPattern;
    NSMutableArray *pathArray;
    NSMutableArray *bufferArray;
    
}

@property(nonatomic,assign) NSInteger undoSteps;

-(void)undoButtonClicked;
-(void)redoButtonClicked;


@end
