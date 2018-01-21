//
//  InputHandler.m
//  Threelow
//
//  Created by Aaron Chong on 1/17/18.
//  Copyright © 2018 Aaron Chong. All rights reserved.
//

#import "InputHandler.h"

@implementation InputHandler

+ (NSString *) getUserInput {
    
    char inputChar[255];
    fgets(inputChar, 255, stdin);
    
    NSString *result = [NSString stringWithCString: inputChar encoding:NSUTF8StringEncoding];
    
    NSString *newResult = [result stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    return newResult;
}




@end
