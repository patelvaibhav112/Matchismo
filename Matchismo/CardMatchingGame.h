//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by vaibhav patel on 4/11/13.
//  Copyright (c) 2013 Margev Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@interface CardMatchingGame : NSObject

- (id) initWithCardCount: (NSUInteger)cardCount
               usingDeck: (Deck *)deck;
- (void) flipCardAtIndex: (NSUInteger)index;
- (Card *)cardAtIndex: (NSUInteger)index;
@property (nonatomic,readonly) int score;
@property (strong, nonatomic) NSString *statusOfLastFlip;
- (void) resetGame;
@end
