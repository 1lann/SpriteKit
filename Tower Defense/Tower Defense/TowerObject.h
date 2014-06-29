//
//  Tower.h
//  Tower Defense
//
//  Created by Jason Chu on 6/29/14.
//  Copyright (c) 2014 Jason Chu. All rights reserved.
//

#import "MapObject.h"
#import "Enemy.h"

@interface TowerObject : MapObject

@property CGFloat attackSpeed;
@property UIColor* projectileColor;

- (void)startTower;

#warning Below needs to be implemented
@property CGSize projectileSize;
@property float attackDamage;

@end
