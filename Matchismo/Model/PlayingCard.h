//
//  PlayingCard.h
//  Matchismo
//
//  Created by vaibhav patel on 4/11/13.
//  Copyright (c) 2013 Margev Inc. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray *) validSuits;
+ (NSArray *) rankStrings;
+ (NSUInteger) maxRank;

@end
