//
//  YahtzeeViewController.h
//  Yahtzee
//
//  Created by Gerald Blake on 9/10/13.
//  Copyright (c) 2013 Gerald Blake. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Dice.h"
@interface YahtzeeViewController : UIViewController
@property (nonatomic) int lowerTotal;
@property (nonatomic) int upperTotal;
@property (nonatomic) int bonus;
@property (nonatomic) int total;
@property (nonatomic) int rollNumber;
@property (nonatomic) NSInteger random;
@property (nonatomic,strong) NSMutableArray *theDice;
@property (nonatomic) int diceNumber;
@property (nonatomic) int diceImages;
- (void) insertionSort: (int[]) temp with:(int) size;





@property (nonatomic) BOOL isYahtzee;
@property (nonatomic) BOOL is4ofAKind;
@property (nonatomic) BOOL isFullHouse;
@property (nonatomic) BOOL isSMStraight;
@property (nonatomic) BOOL isLGStraight;
@property (nonatomic) BOOL isChance;
@property (nonatomic) BOOL hasRolled;
@property (nonatomic) BOOL fullHouseTap;
@property (nonatomic) BOOL yahtzeeTap;
@property (nonatomic) BOOL threeOfAKindTap;
@property (nonatomic) BOOL fourOfAKindTap;
@property (nonatomic) BOOL LGStraightTap;
@property (nonatomic) BOOL SMStraightTap;
@property (nonatomic) BOOL chanceTap;
@property (nonatomic) BOOL onesTap;
@property (nonatomic) BOOL twosTap;
@property (nonatomic) BOOL threesTap;
@property (nonatomic) BOOL foursTap;
@property (nonatomic) BOOL fivesTap;
@property (nonatomic) BOOL sixesTap;
@property (nonatomic) BOOL rollTap;
@property (nonatomic) BOOL singleTaos;

@property (nonatomic) int maxRolls;

@end
