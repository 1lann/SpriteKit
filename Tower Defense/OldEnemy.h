//
//  Enemy.h
//  Tower Defense
//
//  Created by Jason Chu on 6/30/14.
//  Copyright (c) 2014 Jason Chu. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface OldEnemy : SKSpriteNode

@property BOOL enemy;
@property SKSpriteNode* visualEnemy;
@property NSInteger health;
@property UIColor* visualColor;
@property NSMutableArray* enemyCheckArray;
@property NSInteger maxHealth;

- (void)takeDamage:(NSInteger)damage;

@end
