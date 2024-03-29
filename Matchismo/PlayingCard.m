//
//  PlayingCard.m
//  Matchismo
//
//  Created by vaibhav patel on 4/11/13.
//  Copyright (c) 2013 Margev Inc. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard
@synthesize suit = _suit;

- (NSString *)contents
{
    NSArray *rankStrings = [PlayingCard rankStrings];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}


- (int) match:(NSArray *)otherCards
{
    int score = 0;
    
    if(otherCards.count == 1)
    {
        PlayingCard *otherCard = [otherCards lastObject];
        if([otherCard.suit isEqualToString:self.suit])
        {
            score = 1;
        }
        else if(otherCard.rank == self.rank)
        {
            score = 4;
        }
    }
    
    return score;
}
+ (NSUInteger)maxRank
{
    return [self rankStrings].count - 1;
}

+ (NSArray *)validSuits
{
    return @[@"♣",@"♥",@"♦",@"♠"];
}

+ (NSArray *) rankStrings
{
    return @[@"?", @"A", @"1", @"2", @"3", @"4", @"5",@"6",@"7",@"8",@"9", @"10",@"J", @"Q", @"K"];
}
- (void)setSuit:(NSString *)suit
{
    if([[PlayingCard validSuits ]containsObject:suit]){
        _suit = suit;
    }
}

- (void) setRank:(NSUInteger)rank
{
    if(rank <= [PlayingCard maxRank])
    {
        _rank = rank;
    }
}

- (NSString *)suit
{
    return _suit ? _suit : @"?";
}

@end
