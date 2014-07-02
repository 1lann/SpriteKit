//
//  Enemy.h
//  Tower Defense
//
//  Created by Jason Chu on 7/2/14.
//  Copyright (c) 2014 Jason Chu. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface Enemy : NSObject

@property BOOL enemy;
@property SKSpriteNode* visualEnemy;
@property NSInteger health;
@property UIColor* visualColor;
@property NSMutableArray* enemyCheckArray;
@property NSInteger maxHealth;
@property NSMutableDictionary* targetEnemies;

- (void)takeDamage:(NSInteger)damage;
- (CGPoint)pointToAimWithTime:(float)time;
- (void)addTargetEnemy:(SKSpriteNode*)enemy timeDiff:(float)timeDiff;
- (CGPoint)visualEnemyPosition;

@end
