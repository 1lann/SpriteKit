//
//  Enemy.m
//  Tower Defense
//
//  Created by Jason Chu on 7/2/14.
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
        for (SKSpriteNode* targetEnemies in self.targetEnemies) {
            [targetEnemies removeFromParent];
        }
        [self.enemyCheckArray removeObject:self];
    }
}

- (CGPoint)pointToAimWithTime:(float)time {
    float closest = 100;
    for (id timeDiff in self.targetEnemies) {
        if ([timeDiff floatValue] < closest) {
            closest = [timeDiff floatValue];
        }
    }
    return ((SKSpriteNode*)[self.targetEnemies objectForKey:@(closest)]).position;
}

- (void)addTargetEnemy:(SKSpriteNode *)enemy timeDiff:(float)timeDiff {
    [self.targetEnemies setObject:enemy forKey:@(timeDiff)];
}

- (CGPoint)visualEnemyPosition {
    return self.visualEnemy.position;
}

@end
