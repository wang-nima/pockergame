//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by shiyu wang on 1/19/15.
//  Copyright (c) 2015 shawn. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()
@property (readwrite, nonatomic) NSInteger score;
@property (nonatomic, strong) NSMutableArray *cards; //of card
@end

@implementation CardMatchingGame

- (NSMutableArray *) cards
{
    if(!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

- (instancetype) initWithCardCount:(NSUInteger)count
                         usingDeck:(Deck *)deck
{
    self = [super init];
    
    if(!self) {
        for(int i = 0; i < count; i++) {
            Card *card = [deck drawRandomCard];
            if (card) {
                [self.cards addObject:card];
            } else {
                self = nil;
                break;
            }
        }
    }
    
    return self;
}

- (Card *) cardAtIndex:(NSUInteger)index
{
    return (index < [self.cards count]) ? self.cards[index] : nil;
}

const int MISMATCH_PENALTY = 2;
const int MATCH_BONUS = 4;
const int COST_TO_CHOOSE = 1;

- (void) chooseCardAtIndex:(NSUInteger)index
{
    Card *card = [self cardAtIndex:index];
    
    if(!card.isMatched) {
        if(card.isChosen) {
            card.chosen = NO;
        } else {
            for (Card *othercard in self.cards) {
                if(othercard.isChosen && !othercard.isMatched) {
                    int matchScore = [card match:@[othercard]];
                    if(matchScore) {
                        self.score += matchScore * MATCH_BONUS;
                        othercard.matched = YES;
                        card.matched = YES;
                    } else {
                        self.score -= MISMATCH_PENALTY;
                        othercard.chosen = NO;
                    }
                    break;
                }
            }
            self.score -= COST_TO_CHOOSE;
            card.chosen = YES;
        }
    }
}


@end
