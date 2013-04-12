//
//  Deck.h
//  Matchismo
//
//  Created by vaibhav patel on 4/11/13.
//  Copyright (c) 2013 Margev Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

- (void) addCard: (Card *)card
           atTop: (BOOL) atTop;
- (Card *) drawRandomCard;

@end
