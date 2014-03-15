//
//  PlayingCard.h
//  Matchismo
//
//  Created by shawn on 3/15/14.
//  Copyright (c) 2014 shawn. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray *)validSuits;
+ (NSUInteger)maxRank;

@end
