//
//  Enemy.m
//  Tower Defense
//
//  Created by Jason Chu on 6/30/14.
//  Copyright (c) 2014 Jason Chu. All rights reserved.
//

#import "Enemy.h"

@implementation Enemy

- (void)takeDamage:(NSInteger)damage {
    if (!self.health) {
        self.maxHealth = 3;
        self.health = self.maxHealth;
    }
    
    self.health -= damage;
    self.visualEnemy.color = [UIColor colorWithRed:0.0 green:(float)self.health/self.maxHealth blue:0.0 alpha:1.0];
    if (self.health <= 0) {
        [self.visualEnemy removeFromParent];
        [self removeFromParent];
        [self.enemyCheckArray removeObject:self];
    }
}

@end
