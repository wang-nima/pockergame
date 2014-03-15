//
//  Deck.h
//  Matchismo
//
//  Created by shawn on 3/14/14.
//  Copyright (c) 2014 shawn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

- (void)addCard:(Card *)card atTop:(BOOL)atTop;
- (void)addCard:(Card *)card;
- (Card *)drawRandomCard;

@end
