//
//  Dice.h
//  Yahtzee
//
//  Created by Gerald Blake on 9/14/13.
//  Copyright (c) 2013 Gerald Blake. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Dice : NSObject
{
    NSMutableArray *imageArray,*imageArrayS;
    NSMutableArray* diceButtons;
    int index;
}
@property (nonatomic,strong) UIButton *theButton;
@property (nonatomic) int index;
@property (nonatomic,strong) NSMutableArray *imageArray,*imageArrayS;
@property (nonatomic) BOOL isSelected;

@end
