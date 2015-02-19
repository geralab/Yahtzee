//
//  YahtzeeViewController.m
//  Yahtzee
//
//  Created by Gerald Blake on 9/10/13.
//  Copyright (c) 2013 Gerald Blake. All rights reserved.
//
// For convenience (Debugging and Testing) an extra UILabel named Test is included to show
// how the dice are labeled internally and to show weather the condition for a cobination was realized
//
// You may also change maxRolls to an arbitrarilly large number and set singleTaps to NO
// using the reset button repeatedly is also an option
// for any questions or concerns please e-mail , call or text me at 918-706-5595
// if you call or text please say who you are or i will not reply or return a missed call
// Thanks


// Gerald Blake



#import "YahtzeeViewController.h"


@interface YahtzeeViewController ()
@property (strong, nonatomic) IBOutlet UIButton *D0;

@property (strong, nonatomic) IBOutlet UIButton *D1;

@property (strong, nonatomic) IBOutlet UIButton *D2;
@property (strong, nonatomic) IBOutlet UIButton *D3;

@property (strong, nonatomic) IBOutlet UIButton *D4;
@property (strong, nonatomic) IBOutlet UILabel *onesL;

@property (strong, nonatomic) IBOutlet UILabel *twosL;
@property (strong, nonatomic) IBOutlet UILabel *threesL;
@property (strong, nonatomic) IBOutlet UILabel *foursL;
@property (strong, nonatomic) IBOutlet UILabel *fivesL;
@property (strong, nonatomic) IBOutlet UILabel *sixsL;
@property (strong, nonatomic) IBOutlet UILabel *Upper;
@property (strong, nonatomic) IBOutlet UILabel *YahtzeeL;
@property (strong, nonatomic) IBOutlet UILabel *threeOfAkindL;
@property (strong, nonatomic) IBOutlet UILabel *fourOfAKindL;
@property (strong, nonatomic) IBOutlet UILabel *fullHouseL;
@property (strong, nonatomic) IBOutlet UILabel *SMStraightL;
@property (strong, nonatomic) IBOutlet UILabel *chance;
@property (strong, nonatomic) IBOutlet UILabel *totalL;
@property (strong, nonatomic) IBOutlet UILabel *lowerTotalL;
@property (strong, nonatomic) IBOutlet UIButton *RollText;
@property (strong, nonatomic) IBOutlet UILabel *LGStraightL;
@property (strong, nonatomic) IBOutlet UILabel *chanceL;

@property (strong, nonatomic) IBOutlet UILabel *Test;

@end

@implementation YahtzeeViewController
{
    int kind[8];
    int singles[8];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.bonus = 0;
    self.upperTotal = 0;
    
    self.total = 0;
    self.rollNumber = 0;
    self.diceImages = 6;
    self.diceNumber = 5;
    self.random = 0;
    self.maxRolls=3;
    
    self.yahtzeeTap = YES;
    self.chanceTap = YES;
    self.LGStraightTap = YES;
    self.SMStraightTap = YES;
    self.onesTap = YES;
    self.twosTap = YES;
    self.threesTap = YES;
    self.foursTap = YES;
    self.fivesTap = YES;
    self.sixesTap = YES;
    self.threeOfAKindTap = YES;
    self.fourOfAKindTap = YES;
    self.fullHouseTap=YES;
    self.rollTap=YES;
    self.singleTaos = YES;
    
    self.theDice = [[NSMutableArray alloc] initWithCapacity:5];
  

    self.theDice[0] =[[Dice alloc ]init];
    self.theDice[1] =[[Dice alloc ]init];
    self.theDice[2] =[[Dice alloc ]init];
    self.theDice[3] =[[Dice alloc ]init];
    self.theDice[4] =[[Dice alloc ]init];
    
    [self.theDice[0] initialize];
    [self.theDice[1] initialize];
    [self.theDice[2] initialize];
    [self.theDice[3] initialize];
    [self.theDice[4] initialize];
    
    ((Dice*)self.theDice[0]).theButton = self.D0;
    ((Dice*)self.theDice[1]).theButton = self.D1;
    ((Dice*)self.theDice[2]).theButton = self.D2;
    ((Dice*)self.theDice[3]).theButton = self.D3;
    ((Dice*)self.theDice[4]).theButton = self.D4;

    
    self.isYahtzee = NO;
    self.hasRolled = NO;
    
    for(int i = 0 ;i < 8;i++)
    {
        kind[i] = 0;
    
    }
    
    for(int i = 0; i < 8;i++)
    {
        singles[i]=0;
    
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
     
    // Dispose of any resources that can be recreated.
}
- (IBAction)DicePressed:(UIButton *)sender
{
    for(int i = 0; i < self.diceNumber;i++)
        
    if (self.hasRolled)
    {
        
        if(sender  == ((Dice*)self.theDice[i]).theButton && ((Dice*)self.theDice[i]).isSelected == NO)
        {
            
            [((Dice*)self.theDice[i]).theButton setBackgroundImage:((Dice*)self.theDice[i]).imageArrayS[((Dice*)self.theDice[i]).index] forState:UIControlStateNormal];
            ((Dice*)self.theDice[i]).isSelected = YES;
          
        }
        else if(sender  == ((Dice*)self.theDice[i]).theButton && ((Dice*)self.theDice[i]).isSelected == YES)
        {
        
         [((Dice*)self.theDice[i]).theButton setBackgroundImage:((Dice*)self.theDice[i]).imageArray[((Dice*)self.theDice[i]).index] forState:UIControlStateNormal];
            ((Dice*)self.theDice[i]).isSelected = NO;
               
        }
    }

  
}


- (IBAction)ScoresPressed:(UIButton *)sender
{
    
}
- (IBAction)Roll:(UIButton *)sender
  {
    self.hasRolled = YES;
    if(self.rollTap)
    {

        [sender setTitle:@"Re-Roll" forState:UIControlStateNormal];
        for(int i = 0; i < self.diceNumber;i++)
        {
            if(((Dice*)self.theDice[i]).isSelected==NO)
            {
                self.random =  arc4random() % self.diceImages;
              ((Dice*)self.theDice[i]).index = self.random;
            
            
            
                [((Dice*)self.theDice[i]).theButton setBackgroundImage:((Dice*)self.theDice[i]).imageArray[self.random]
                                  forState:UIControlStateNormal];
                       
            }

        }
        
        self.rollNumber++;
        self.Test.text=[NSString stringWithFormat:@"RollN: %i",self.rollNumber ];
            
        if(self.rollNumber >=self.maxRolls)
        {
            self.rollTap=NO;
            [sender setTitle:@"Roll" forState:UIControlStateNormal];

        
        }
    }
    
}


- (IBAction)Ones:(UIButton *)sender {
    if (self.hasRolled)
    {
        if(self.onesTap)
        {
    
            for(int i = 0; i < self.diceNumber;i++)
            {
                if(((Dice*)self.theDice[i]).index == 0){

                    singles[0]+=((Dice*)self.theDice[i]).index+1;
                    singles[7]+=((Dice*)self.theDice[i]).index+1;
                    self.total+=((Dice*)self.theDice[i]).index+1;
                                
                    self.Upper.text =[NSString stringWithFormat:@"%i",singles[7]];
                    self.totalL.text= [NSString stringWithFormat:@"%i",self.total];
                    
            }
    }
            

    }
    if(self.singleTaos)
    {
        self.onesTap=NO;
    }
        self.onesL.text =[NSString stringWithFormat:@"%i",singles[0]];
    }
   
}
- (IBAction)Twos:(UIButton *)sender
{
    if (self.hasRolled)
    {
        if(self.twosTap)
        {
            for(int i = 0; i < self.diceNumber;i++)
            {
                if(((Dice*)self.theDice[i]).index == 1)
                {
                    
                    singles[1]+=((Dice*)self.theDice[i]).index+1;
                    singles[7]+=((Dice*)self.theDice[i]).index+1;
                    self.total+=((Dice*)self.theDice[i]).index+1;

                   
                    
                    self.Upper.text =[NSString stringWithFormat:@"%i",singles[7]];
                    self.totalL.text= [NSString stringWithFormat:@"%i",self.total];
                    
                }
            }
    }
        if(self.singleTaos)
        {
            self.twosTap=NO;
        }
        self.twosL.text =[NSString stringWithFormat:@"%i",singles[1]];
    }
    

}
- (IBAction)Threes:(UIButton *)sender {
    if (self.hasRolled)
    {
        if(self.threesTap)
        {
        
            for(int i = 0; i < self.diceNumber;i++){
                if(((Dice*)self.theDice[i]).index == 2){
                    
                    singles[2]+=((Dice*)self.theDice[i]).index+1;
                    singles[7]+=((Dice*)self.theDice[i]).index+1;
                    self.total+=((Dice*)self.theDice[i]).index+1;
                    self.threesL.text =[NSString stringWithFormat:@"%i",singles[2]];
                    
                    self.Upper.text =[NSString stringWithFormat:@"%i",singles[7]];
                    self.totalL.text= [NSString stringWithFormat:@"%i",self.total];
                }
            
            }
        }
        if(self.singleTaos)
        {
            self.threesTap=NO;
        }
        self.threesL.text =[NSString stringWithFormat:@"%i",singles[2]];

    }


}
- (IBAction)Fours:(UIButton *)sender
{
    if (self.hasRolled)
    {
    if(self.foursTap)
    {
    
        for(int i = 0; i < self.diceNumber;i++)
        {
            if(((Dice*)self.theDice[i]).index == 3)
            {
                
                
                singles[3]+=((Dice*)self.theDice[i]).index+1;
                singles[7]+=((Dice*)self.theDice[i]).index+1;
                self.total+=((Dice*)self.theDice[i]).index+1;
               
                
                self.Upper.text =[NSString stringWithFormat:@"%i",singles[7]];
                self.totalL.text= [NSString stringWithFormat:@"%i",self.total];
            }
        }
    }
        if(self.singleTaos)
        {
            self.foursTap=NO;
        }
         self.foursL.text =[NSString stringWithFormat:@"%i",singles[3]];
    }
}
- (IBAction)Fives:(UIButton *)sender
{
    if (self.hasRolled)
    {
        if(self.fivesTap)
        {
        
            for(int i = 0; i < self.diceNumber;i++)
            {
                if(((Dice*)self.theDice[i]).index == 4)
                {
                    
                    singles[4]+=((Dice*)self.theDice[i]).index+1;
                    singles[7]+=((Dice*)self.theDice[i]).index+1;
                    self.total+=((Dice*)self.theDice[i]).index+1;
                    
                    self.fivesL.text =[NSString stringWithFormat:@"%i",singles[4]];
                    
                    self.Upper.text =[NSString stringWithFormat:@"%i",singles[7]];
                    self.totalL.text= [NSString stringWithFormat:@"%i",self.total];
                }
            }
    }
        if(self.singleTaos)
        {
        self.fivesTap=NO;
        }
        self.fivesL.text =[NSString stringWithFormat:@"%i",singles[4]];

    }

}
- (IBAction)Sixes:(UIButton *)sender
{
    if (self.hasRolled)
    {
        if(self.sixesTap)
        {
      
            for(int i = 0; i < self.diceNumber;i++)
            {
                if(((Dice*)self.theDice[i]).index == 5)
                {
                    
                    singles[5]+=((Dice*)self.theDice[i]).index+1;
                    singles[7]+=((Dice*)self.theDice[i]).index+1;
                    self.total+=((Dice*)self.theDice[i]).index+1;
                    
                    
                    self.Upper.text =[NSString stringWithFormat:@"%i",singles[7]];
                    self.totalL.text= [NSString stringWithFormat:@"%i",self.total];
                }
            }
    }
        
        if(self.singleTaos){
        self.sixesTap=NO;
        }
        self.sixsL.text =[NSString stringWithFormat:@"%i",singles[5]];
    }

}


    
- (IBAction)Yahtee:(UIButton *)sender
{
    if (self.hasRolled)
    {
        if(self.yahtzeeTap)
        {
       
        int test = ((Dice*)self.theDice[0]).index;
        self.isYahtzee = YES;
        for(int y = 0; y < self.diceNumber;y++)
        {
            if(((Dice*)self.theDice[y]).index != test)
            {
            
                self.isYahtzee = NO;
            
            }
        
        }
    
        if(self.isYahtzee)
        {
            kind[5]+=50;
            kind[7]+=50;
            self.total+=50;
            self.lowerTotalL.text = [NSString stringWithFormat:@"%i",kind[7]];

           
            self.totalL.text= [NSString stringWithFormat:@"%i",self.total];


        
        }
    }
        if(self.singleTaos)
        {
            self.yahtzeeTap=NO;
        }
         self.YahtzeeL.text = [NSString stringWithFormat:@"%i",kind[5]];
    }
    
}
- (IBAction)ThreeOfAKind:(UIButton *)sender {
    if (self.hasRolled)
    {
        if(self.threeOfAKindTap)
        {
        
            BOOL isThreeofKind = NO;
            int sum = 0;
            int temp[5];
               
            for (int copy = 0; copy < self.diceNumber; copy++)
            {
                sum+= (((Dice*)self.theDice[copy]).index + 1);
                temp[copy] = ((Dice*)self.theDice[copy]).index;
            }
                
                [self insertionSort: temp with:self.diceNumber];
                
                if((temp[0]==temp[1] && temp[2]==temp[1])
                   ||(temp[1]==temp[2]&&temp[2]==temp[3])||(temp[2]==temp[3] && temp[4]==temp[2]))
                {
                    isThreeofKind = YES;
                
                
                }
                self.Test.text = [NSString stringWithFormat:@"%i,%i,%i,%i,%i,T:%i,T:",temp[0]+1,temp[1]+1,temp[2]+1,temp[3]+1,temp[4]+1,isThreeofKind];

                if(isThreeofKind)
                {
                    kind[0]+=sum;
                    kind[7]+=sum;
                    self.total+=sum;
                               self.totalL.text = [NSString stringWithFormat:@"%i",self.total];
                    self.lowerTotalL.text = [NSString stringWithFormat:@"%i",kind[7]];
                }

            }
        if(self.singleTaos)
        {
            self.threeOfAKindTap=NO;
        }
        self.threeOfAkindL.text = [NSString stringWithFormat:@"%i",kind[0]];

    }
    }
- (IBAction)SMStraight:(UIButton *)sender
{
    if (self.hasRolled)
    {
        if(self.SMStraightTap)
        {
            BOOL isSMStraight= YES;
      
         
                
            int temp[5];
         
            for (int copy = 0; copy < self.diceNumber; copy++)
            {
                temp[copy] = ((Dice*)self.theDice[copy]).index;
            }
            
            [self insertionSort: temp with:self.diceNumber];
            self.Test.text = [NSString stringWithFormat:@"%i,%i,%i,%i,%i",temp[0]+1,temp[1]+1,temp[2]+1,temp[3]+1,temp[4]+1];
            
            for(int i = 1; i < self.diceNumber - 1; i++)
            {
                if(temp[i]!= (temp[i-1] + 1))
                {
                    isSMStraight = NO;
                }
                   
            }
                   

            if(isSMStraight)
            {
                kind[3]+=30;
                kind[7]+=30;
                self.total+=30;
                               self.totalL.text = [NSString stringWithFormat:@"%i",self.total];
                self.lowerTotalL.text = [NSString stringWithFormat:@"%i",kind[7]];
            
            }

        }
        if(self.singleTaos)
        {
            self.SMStraightTap=NO;
        }
        self.SMStraightL.text = [NSString stringWithFormat:@"%i",kind[3]];

    }
}

- (IBAction)LGStraight:(UIButton *)sender
{
    if(self.hasRolled)
    {
    
    if(self.LGStraightTap)
    {
        BOOL isLGStraight= YES;
        int temp[5];
        
        for (int copy = 0; copy < self.diceNumber; copy++)
        {
            temp[copy] = ((Dice*)self.theDice[copy]).index;
        }
        
        [self insertionSort: temp with:self.diceNumber];
        
        self.Test.text = [NSString stringWithFormat:@"%i,%i,%i,%i,%i",temp[0]+1,temp[1]+1,temp[2]+1,temp[3]+1,temp[4]+1];
        
        for(int i = 1; i < self.diceNumber; i++)
        {
            if(temp[i]!= (temp[i-1] + 1))
            {
                isLGStraight = NO;
            }
            
        }
        
    
        if(isLGStraight)
        {
            kind[4]+=40;
            kind[7]+=40;
            self.total+=40;
                        self.totalL.text = [NSString stringWithFormat:@"%i",self.total];
            self.lowerTotalL.text = [NSString stringWithFormat:@"%i",kind[7]];
            
        }
        
    }
        if(self.singleTaos)
        {
            self.LGStraightTap=NO;
        }
        self.LGStraightL.text = [NSString stringWithFormat:@"%i",kind[4]];

    }

}

- (IBAction)FourOfAKind:(UIButton *)sender
{
    if (self.hasRolled)
    {
        if(self.fourOfAKindTap)
        {
       
            BOOL isFourOfKind=NO;
            int sum = 0;
            int temp[5];
            for (int copy = 0; copy < self.diceNumber; copy++)
            {
                sum+= (((Dice*)self.theDice[copy]).index + 1);
                temp[copy] = ((Dice*)self.theDice[copy]).index;
            }
            
            [self insertionSort: temp with:self.diceNumber];
            
            if ((temp[0]==temp[1]&&temp[2]==temp[1]&&temp[3]==temp[2])
                ||(temp[1]==temp[2]&&temp[3]==temp[2]&&temp[4]==temp[3])) {
                isFourOfKind=YES;
            }
                    
            self.Test.text = [NSString stringWithFormat:@"%i,%i,%i,%i,%i,F:%i",temp[0]+1,temp[1]+1,temp[2]+1,temp[3]+1,temp[4]+1,isFourOfKind];

            
            if(isFourOfKind)
            {
                kind[1]+=sum;
                kind[7]+=sum;
                self.total+=sum;
                           self.totalL.text = [NSString stringWithFormat:@"%i",self.total];
                self.lowerTotalL.text = [NSString stringWithFormat:@"%i",kind[7]];
            }
            
    }
        if(self.singleTaos)
        {
            self.fourOfAKindTap=NO;
        }
        self.fourOfAKindL.text = [NSString stringWithFormat:@"%i",kind[1]];

    }

}
- (IBAction)FullHouse:(UIButton *)sender
{
    if (self.hasRolled)
    {
        if(self.fullHouseTap)
        {
            int temp[5];
         
            BOOL isFullHouse =NO;
            
            for (int copy = 0; copy < self.diceNumber; copy++)
            {
                temp[copy] = ((Dice*)self.theDice[copy]).index;
            }
            
            [self insertionSort: temp with:self.diceNumber];
             
            
                if ((temp[0]==temp[1] && temp[1]==temp[2]
                     &&temp[3] ==temp[4] && temp[2]!=temp[3])
                    || (temp[0]==temp[1] && temp[1]!=temp[2]
                    &&temp[2]==temp[3] &&temp[3]==temp[4]))
                {
                    isFullHouse=YES;
                }
            
        
        
        self.Test.text = [NSString stringWithFormat:@"%i,%i,%i,%i,%i,F:%i",temp[0]+1,temp[1]+1,temp[2]+1,temp[3]+1,temp[4]+1,isFullHouse];

        
        if(isFullHouse)
        {
            kind[2]+=25;
            kind[7]+=25;
            self.total+=25;
            
            self.totalL.text = [NSString stringWithFormat:@"%i",self.total];
            self.lowerTotalL.text = [NSString stringWithFormat:@"%i",kind[7]];

        
        }
    }
        if(self.singleTaos){
        self.fullHouseTap=NO;
        }
        self.fullHouseL.text = [NSString stringWithFormat:@"%i",kind[2]];
    }
    
}

- (IBAction)Chance:(UIButton *)sender
{
    if (self.hasRolled)
    {
        if(self.chanceTap)
        {
       
        
        int temp[5];
        int sum = 0;
        
      
        for (int copy = 0; copy < self.diceNumber; copy++)
        {
            sum+= ((Dice*)self.theDice[copy]).index+1;
            temp[copy]= ((Dice*)self.theDice[copy]).index;
        }
        
        
         [self insertionSort: temp with:self.diceNumber];
        self.Test.text = [NSString stringWithFormat:@"%i,%i,%i,%i,%i",temp[0]+1,temp[1]+1,temp[2]+1,temp[3]+1,temp[4]+1];
        
        
       
            kind[6]+=sum;
            kind[7]+=sum;
            self.total+=sum;
                    self.totalL.text = [NSString stringWithFormat:@"%i",self.total];
            self.lowerTotalL.text = [NSString stringWithFormat:@"%i",kind[7]];
        
        
    }
        if(self.singleTaos){
        self.chanceTap=NO;
        }
        self.chanceL.text = [NSString stringWithFormat:@"%i",kind[6]];

    }

   
}

- (void) insertionSort: (int*) temp with:(int) size
{
    for (int i = 0; i < size; i++)
    {
        int value = temp[i], j = i-1;
        while (j >= 0 && temp[j] > value)
        {
            temp[j + 1] = temp[j];
            j--;
        }
        temp[j + 1] = value;
    }
}
- (IBAction)Reset:(UIButton *)sender
{
    if(self.hasRolled)
    {
        self.threeOfAkindL.text=@"";
        self.LGStraightL.text=@"";
        self.SMStraightL.text=@"";
        self.lowerTotalL.text=@"";
        self.totalL.text=@"";;
        self.onesL.text=@"";
        self.twosL.text=@"";
        self.threesL.text=@"";
        self.foursL.text=@"";
        self.fivesL.text=@"";
        self.sixsL.text=@"";
        self.YahtzeeL.text=@"";
        self.fourOfAKindL.text=@"";
        self.fullHouseL.text=@"";
        self.chanceL.text=@"";
        self.Test.text=@"";
        self.Upper.text=@"";
        
    
        self.bonus = 0;
        self.upperTotal = 0;
        self.singleTaos= YES;
        self.total = 0;
        self.rollNumber = 0;
        self.diceImages = 6;
        self.diceNumber = 5;
        self.random = 0;
        self.maxRolls=3;
        
        self.yahtzeeTap = YES;
        self.chanceTap = YES;
        self.LGStraightTap = YES;
        self.SMStraightTap = YES;
        self.onesTap = YES;
        self.twosTap = YES;
        self.threesTap = YES;
        self.foursTap = YES;
        self.fivesTap = YES;
        self.sixesTap = YES;
        self.threeOfAKindTap = YES;
        self.fourOfAKindTap = YES;
        self.fullHouseTap=YES;
        self.rollTap=YES;

    
    
    for (int i = 0; i < self.diceNumber; i++)
    {
        ((Dice*)self.theDice[i]).isSelected = NO;
    }
    
    self.isYahtzee = NO;
    self.hasRolled = NO;
    
    for(int i = 0 ;i < 8;i++)
    {
        kind[i] = 0;
        
    }
    
    for(int i = 0; i < 8;i++)
    {
        singles[i]=0;
        
    }
    [self.RollText setTitle:@"Roll" forState:UIControlStateNormal];
    for(int i = 0; i < self.diceNumber;i++){
        if(((Dice*)self.theDice[i]).isSelected==NO)
        {
            
            [((Dice*)self.theDice[i]).theButton setBackgroundImage:Nil
                                                          forState:UIControlStateNormal];
            
        }
        
    }

    }
}



@end
