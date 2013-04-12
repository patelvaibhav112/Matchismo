//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by vaibhav patel on 4/11/13.
//  Copyright (c) 2013 Margev Inc. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()
@property (strong, nonatomic) NSMutableArray *cards;
@property (nonatomic) int score;
@property (strong, nonatomic) Deck *deck;
@end

@implementation CardMatchingGame

- (NSMutableArray *)cards
{
    if(!_cards)
    {
        _cards = [[NSMutableArray alloc]init];
    }
    return _cards;
}

- (id) initWithCardCount:(NSUInteger)cardCount usingDeck:(Deck *)deck
{
    self = [super init];
    self.deck = deck;
    
    if(self){
        for(int i=0; i<cardCount; i++)
        {
            Card *card = [deck drawRandomCard];
            if(!card)
            {
                self = nil;
            }
            else
            {
                self.cards[i] = card;
            }
        }
    }
    return self;
}

- (void) resetGame
{
    self.score = 0;
    for(int i=0; i<self.cards.count; i++)
    {
        self.cards[i] = [self.deck drawRandomCard];
    }
}

- (Card *)cardAtIndex:(NSUInteger)index
{
    return (index < self.cards.count) ? self.cards[index] : nil;
}

#define MATCH_BONUS 4
#define MISMATCH_PENALTY 2
#define FLIP_COST 1
#define MULTI_MATCH_BONUS 100
#define MULTI_MATCH_PENALTY 4

- (void) flipCardAtIndex:(NSUInteger)index
{
    Card *card = [self cardAtIndex:index];
    NSMutableArray *openCards = [[NSMutableArray alloc]init];
    
    if(!card.isUnplayable)
    {
        if(!card.isFaceUp)
        {
            self.statusOfLastFlip = [NSString stringWithFormat:@"Flipped up %@",card.contents];
            //see if flipping this card up creates a match
            for(Card *otherCard in self.cards)
            {
                if(otherCard.isFaceUp && !otherCard.isUnplayable)
                {
                    [openCards addObject:otherCard];
                    
                    int matchScore = [card match:@[otherCard]];
                    if(matchScore)
                    {
                        if(openCards.count > self.mode)
                        {
                            for(Card *openCard in openCards)
                            {
                                openCard.unplayable = YES;
                                card.unplayable = YES;
                            }
                        }
                        self.score += matchScore * MATCH_BONUS;
                        self.statusOfLastFlip = [NSString stringWithFormat:@"Matched %@ & %@ for %d points",card.contents, otherCard.contents, matchScore*MATCH_BONUS];
                        if(openCards.count >1)
                        self.score += matchScore * MULTI_MATCH_BONUS;
                    }
                    else
                    {
                        otherCard.faceUp = NO;
                        self.score -= MISMATCH_PENALTY;
                        self.statusOfLastFlip = [NSString stringWithFormat:@"%@ & %@ don't Match %d point penalty",card.contents, otherCard.contents, MISMATCH_PENALTY];
                        if(openCards.count > self.mode)
                        self.score -= MULTI_MATCH_PENALTY;
                    }
                }
            }
            self.score -= FLIP_COST;
        }
        card.faceUp = !card.isFaceUp;
    }
}
@end
