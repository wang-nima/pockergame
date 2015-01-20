//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by shiyu wang on 1/19/15.
//  Copyright (c) 2015 shawn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"



@interface CardMatchingGame : NSObject

- (instancetype) initWithCardCount:(NSUInteger) count
                         usingDeck:(Deck*)deck;

- (void) chooseCardAtIndex:(NSUInteger)index;
- (Card *)cardAtIndex:(NSUInteger)index;

@property (nonatomic, readonly) NSInteger score;

@end
