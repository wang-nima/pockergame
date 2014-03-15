//
//  CardGameViewController.m
//  Matchismo
//
//  Created by shawn on 3/12/14.
//  Copyright (c) 2014 shawn. All rights reserved.
//

#import "CardGameViewController.h"
#import "PlayingCardDeck.h"

@interface CardGameViewController ()

@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;
@property (strong, nonatomic) PlayingCardDeck *deck;

@end

@implementation CardGameViewController

- (void)setFlipCount:(int)flipCount {
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", self.flipCount];
    NSLog(@"setFlipCount %d\n",self.flipCount);
}

- (IBAction)touchCardButton:(UIButton *)sender {
    if ([sender.currentTitle length]) {
        [sender setBackgroundImage:[UIImage imageNamed:@"back"]
                          forState:UIControlStateNormal];
        [sender setTitle:@"" forState:UIControlStateNormal];
    } else {
        [sender setBackgroundImage:[UIImage imageNamed:@"front"]
                          forState:UIControlStateNormal];
        [sender setTitle:[self.deck drawRandomCard].contents forState:UIControlStateNormal];
    }
    self.flipCount++;   //这里执行了setter函数，所以label能变
    NSLog(@"touchCardButton %d\n",self.flipCount);
}

- (PlayingCardDeck *)deck {
    if (!_deck) {
        _deck = [[PlayingCardDeck alloc] init];
    }
    return _deck;
}




@end
