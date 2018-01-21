//
//  GameController.m
//  Threelow
//
//  Created by Aaron Chong on 1/17/18.
//  Copyright © 2018 Aaron Chong. All rights reserved.
//

#import "GameController.h"
#import "Dice.h"
#import "InputHandler.h"

@implementation GameController

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        
        Dice *diceOne = [[Dice alloc] init];
        [diceOne randomizeDiceValue];
        Dice *diceTwo = [[Dice alloc] init];
        [diceTwo randomizeDiceValue];
        Dice *diceThree = [[Dice alloc] init];
        [diceThree randomizeDiceValue];
        Dice *diceFour = [[Dice alloc] init];
        [diceFour randomizeDiceValue];
        Dice *diceFive = [[Dice alloc] init];
        [diceFive randomizeDiceValue];
        
        _diceArray = @[diceOne, diceTwo, diceThree, diceFour, diceFive];
    }
    return self;
}

-(void)printGamesStatus;{
    NSUInteger index = 0;
    for (Dice * dice in self.diceArray){
        if (dice.isHeld){
            NSLog(@"Dice %lu is: --------- [%d]", (unsigned long)index, dice.currentDiceValue);
        }else{
            NSLog(@"Dice %lu is: --------- %d", (unsigned long)index, dice.currentDiceValue);
        }
        index ++;
    }
}

-(void)rollDice; {
    for (Dice * dice in self.diceArray){
        if (!dice.isHeld){
            [dice randomizeDiceValue];
        }
    }
    [self printGamesStatus];
}

- (BOOL)holdDie:(NSString *)userDiceSelection {
    int userInput = userDiceSelection.intValue;
    if (userInput) {
        userInput -= 1;
        Dice * dice = self.diceArray[userInput];
        dice.isHeld = YES;
        NSLog(@"Holding Dice #%@", userDiceSelection);
        [self printGamesStatus];
        return YES;
    } else {
        NSLog(@"Dice Number not found");
        return NO;
    }
    
}
@end
