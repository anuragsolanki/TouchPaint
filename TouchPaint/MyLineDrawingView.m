//
//  MyLineDrawingView.m
//  DrawLines
//
//  Created by Anurag Solanki on 25/05/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "MyLineDrawingView.h"

@implementation MyLineDrawingView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
                
        self.backgroundColor = [UIColor whiteColor];
        myPath = [[UIBezierPath alloc] init];
        myPath.lineCapStyle = kCGLineCapRound;
        myPath.miterLimit = 0;
        myPath.lineWidth = 10;
        brushPattern = [UIColor redColor];

        // Arrays for saving undo-redo steps in arrays
        pathArray = [[NSMutableArray alloc] init];
        bufferArray =  [[NSMutableArray alloc] init];
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    [brushPattern setStroke];
    for (UIBezierPath *_path in pathArray) 
        [_path strokeWithBlendMode:kCGBlendModeNormal alpha:1.0];    
//    [myPath strokeWithBlendMode:kCGBlendModeNormal alpha:1.0];
    
    // Drawing code
    //[myPath stroke];
}

#pragma mark - Touch Methods
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    myPath = [[UIBezierPath alloc] init];
    myPath.lineWidth = 10;
        
    UITouch *mytouch = [[touches allObjects] objectAtIndex:0];
    [myPath moveToPoint:[mytouch locationInView:self]];
    [pathArray addObject:myPath];
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{    
    UITouch *mytouch = [[touches allObjects] objectAtIndex:0];
    [myPath addLineToPoint:[mytouch locationInView:self]];
    [self setNeedsDisplay];
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}

#pragma mark - Undo/Redo Methods
-(void)undoButtonClicked
{
    if([pathArray count]>0){
        UIBezierPath *_path = [pathArray lastObject];
        [bufferArray addObject:_path];
        [pathArray removeLastObject];
        [self setNeedsDisplay];
    }
}

-(void)redoButtonClicked
{
    if([bufferArray count]>0){
        UIBezierPath *_path = [bufferArray lastObject];
        [pathArray addObject:_path];
        [bufferArray removeLastObject];
        [self setNeedsDisplay];
    }
}

@end