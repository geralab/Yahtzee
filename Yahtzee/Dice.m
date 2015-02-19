//
//  Dice.m
//  Yahtzee
//
//  Created by Gerald Blake on 9/14/13.
//  Copyright (c) 2013 Gerald Blake. All rights reserved.
//

#import "Dice.h"

@implementation Dice

@synthesize imageArrayS;
@synthesize imageArray;
@synthesize theButton;
@synthesize index;
- (void)initialize {
   self.imageArray=[[NSMutableArray alloc] initWithCapacity:7];
   self.imageArrayS = [[NSMutableArray alloc] initWithCapacity:7];
   

    self.imageArray[0]= [UIImage imageNamed:@"1.png"];
       
    self.imageArrayS[0] = [UIImage imageNamed:@"1s.png"];
    
       
    self.imageArray[1] = [UIImage imageNamed:@"2.png"];
    self.imageArrayS[1] = [UIImage imageNamed:@"2s.png"];
    
    self.imageArray[2] = [UIImage imageNamed:@"3.png"];
    self.imageArrayS[2]= [UIImage imageNamed:@"3s.png"];
    
    self.imageArray[3] = [UIImage imageNamed:@"4.png"];
    self.imageArrayS[3]= [UIImage imageNamed:@"4s.png"];
    
    self.imageArray[4]= [UIImage imageNamed:@"5.png"];
    self.imageArrayS[4] = [UIImage imageNamed:@"5s.png"];
    
    self.imageArray[5] = [UIImage imageNamed:@"6.png"];
    self.imageArrayS[5]= [UIImage imageNamed:@"6s.png"];
    self.imageArray[6] = [UIImage imageNamed:@"6.png"];
    self.imageArrayS[6]= [UIImage imageNamed:@"6s.png"];
    self.index = 0;
    self.isSelected = NO;

}






    



@end
