//
//  Card.m
//  Matchismo
//
//  Created by vaibhav patel on 4/11/13.
//  Copyright (c) 2013 Margev Inc. All rights reserved.
//

#import "Card.h"

@implementation Card
- (int) match:(NSArray *)otherCards
{
    int score = 0;
    for(Card *card in otherCards)
    {
        if([card.contents isEqualToString:self.contents])
        {
            score = 1;
        }
    }
    
    return score;
}
@end
