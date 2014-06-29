//
//  Tower.m
//  Tower Defense
//
//  Created by Jason Chu on 6/29/14.
//  Copyright (c) 2014 Jason Chu. All rights reserved.
//

#import "TowerObject.h"

@implementation TowerObject
#warning Need to add support for projectile type/size and damage

- (void)fireTower {
	// Loop over each enemy object
	for (Enemy *enemy in [self.scene valueForKey:@"enemies"]) {
		if ([self distanceFromPoint:enemy.position] < 100) {
			SKAction* action = [SKAction moveTo:enemy.position duration:[self distanceFromPoint:enemy.position]/150];
			SKSpriteNode* projectile = [SKSpriteNode spriteNodeWithColor:[UIColor redColor] size:CGSizeMake(5.0, 5.0)];
			projectile.position = self.spriteObject.position;
			[self.scene addChild:projectile];
			[projectile runAction:action completion:^(void){[projectile removeFromParent]; [enemy removeFromParent];}];
			break;
		}
	}
}

- (void)startTower {
	[NSTimer scheduledTimerWithTimeInterval:self.attackSpeed/1.0 target:self selector:@selector(fireTower) userInfo:NULL repeats:YES];
}

@end
