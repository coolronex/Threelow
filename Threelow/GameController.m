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
        
        _diceArray = [[NSMutableArray alloc] initWithCapacity:5];
        _heldDicesArray = [[NSMutableArray alloc] init];
        
        for (int i = 0; i < 5; i++) {
            
            Dice *dice = [[Dice alloc] init];
            [dice randomizeDiceValue];
            [_diceArray addObject:dice];
        }
    }
    return self;
}

-(void)printGamesStatus;{
    NSUInteger index = 1;
    for (Dice *dice in self.diceArray){
        if (dice.isHeld){
            NSLog(@"Dice %lu is: --------- [%d]", (unsigned long)index, dice.currentDiceValue);
        }else {
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
    int userInput = userDiceSelection.intValue; //converting user input into int value
    if (userInput < 6 && userInput > 0 ) {
        userInput -= 1; //-1 so it can match index of array
        Dice *dice = self.diceArray[userInput];
        dice.isHeld = YES; //
        
        if (![self.heldDicesArray containsObject:dice]) {
        
            [self.heldDicesArray addObject:dice];
            NSLog(@"Number of dices in heldDicesArray: %ld", [self.heldDicesArray count]);
        }
        
        NSLog(@"Holding Dice #%@", userDiceSelection);
        [self printGamesStatus];
        
        return YES;
        
    } else {
        NSLog(@"Dice Number not found");
        return NO;
    }
    
}

- (NSInteger) calculateScore {

    NSInteger sum = 0;
    if ([self.heldDicesArray count] == 5 ) {
        
        for (Dice *dice in self.heldDicesArray) {
        
            if (dice.currentDiceValue == 3) {
                dice.currentDiceValue = 0;
            }
            
            sum += dice.currentDiceValue;
        }
        
        NSLog(@"Total score: %ld", sum);
    }
    return sum;
}

@end
