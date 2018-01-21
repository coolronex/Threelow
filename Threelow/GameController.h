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

@property (nonatomic) NSMutableSet *heldDices;
@property (nonatomic) NSArray *diceArray;

- (void)printGamesStatus;
- (BOOL) holdDie:(NSString *)userDiceSelection;
- (void)rollDice; 
@end
