//
//  EditMenuGR.h
//  TopoShot
//
//  Created by Tim Whitaker on 5/2/13.
//  Copyright (c) 2013 CSU Chico. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum ButtonType : NSInteger ButtonType;
enum ButtonType : NSInteger {bolt,route,text,none};

@interface EditMenuGR : UILongPressGestureRecognizer

@property (nonatomic) ButtonType chosenButtonType;

@end
