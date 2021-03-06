//
//  MyPatternBrush.h
//  DrawLines
//
//  Created by Anurag Solanki on 25/05/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyPatternBrush : UIView {
    
    UIBezierPath *myPath;
    UIColor *brushPattern;
    NSMutableArray *pathArray;
    NSMutableArray *bufferArray;
    
}

-(void)undoButtonClicked;
-(void)redoButtonClicked;

@end
