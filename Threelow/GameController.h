//
//  GameController.h
//  Threelow
//
//  Created by Aaron Chong on 1/17/18.
//  Copyright © 2018 Aaron Chong. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Dice;


@interface GameController : NSObject

@property (nonatomic) NSMutableArray *heldDicesArray;
@property (nonatomic) NSMutableArray *diceArray;

- (void) printGamesStatus;
- (BOOL) holdDie:(NSString *)userDiceSelection;
- (void) rollDice;
- (NSInteger) calculateScore;

@end
