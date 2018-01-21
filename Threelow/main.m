//
//  main.m
//  Threelow
//
//  Created by Aaron Chong on 1/17/18.
//  Copyright © 2018 Aaron Chong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dice.h"
#import "InputHandler.h"
#import "GameController.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        GameController *gameController = [GameController new];
        [gameController printGamesStatus];
        
        while (true) {
            BOOL successfulHeld = NO;
            while (successfulHeld == NO) {
                NSLog(@"Which dice do you want to hold?");
                // gets input from user
                NSString *diceNumberHoldInput = [InputHandler getUserInput];
                successfulHeld = [gameController holdDie:diceNumberHoldInput];
            }
            successfulHeld = NO;
            
            NSLog(@"What do you want to do?");
            NSLog(@"Hold or roll?");

            NSString *optionSelected = [[InputHandler getUserInput] lowercaseString];
            if ([optionSelected isEqualToString: @"hold"]){
                while (successfulHeld == NO) {
                    NSLog(@"Which dice do you want to hold?");
                    
                    NSString *diceNumberHoldInput = [InputHandler getUserInput];
                    successfulHeld = [gameController holdDie:diceNumberHoldInput];
        
                }
            } else if ([optionSelected isEqualToString: @"roll"]){
                [gameController rollDice];
            }
                
                
                
            
         
            
            
            
            
        }
        return 0;
    }
}
