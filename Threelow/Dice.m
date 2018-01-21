//
//  Dice.m
//  Threelow
//
//  Created by Aaron Chong on 1/17/18.
//  Copyright © 2018 Aaron Chong. All rights reserved.
//

#import "Dice.h"

@implementation Dice

- (int)randomizeDiceValue {
    
    self.currentDiceValue = arc4random_uniform(6) + 1;
    
    return self.currentDiceValue;
    
}

@end
