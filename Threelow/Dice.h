//
//  Dice.h
//  Threelow
//
//  Created by Aaron Chong on 1/17/18.
//  Copyright © 2018 Aaron Chong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Dice : NSObject

@property int currentDiceValue;
@property BOOL isHeld;

- (int) randomizeDiceValue;



@end
