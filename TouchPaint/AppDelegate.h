//
//  AppDelegate.h
//  TouchPaint
//
//  Created by Anurag Solanki on 25/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DrawingController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) DrawingController *viewController;

@end
