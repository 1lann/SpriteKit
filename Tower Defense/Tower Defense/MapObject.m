//
//  MapObject.m
//  Tower Defense
//
//  Created by Jason Chu on 6/24/14.
//  Copyright (c) 2014 Jason Chu. All rights reserved.
//

#import "MapObject.h"

@implementation MapObject

- (id)initAsEmpty
{
    self = [super init];
    if (self) {
        self.empty = TRUE;
    }
    return self;
}

- (id)initWithName:(NSString *)name imageName:(NSString *)imageName color:(UIColor *)color objectType:(MapObjectType)objectType spriteObject:(SKSpriteNode *)spriteObject scene:(SKScene*)scene {
    self = [super init];
    if (self) {
        self.objectName = name;
        self.imageName = imageName;
        self.objectType = objectType;
		self.empty = FALSE;
		self.color = color;
		self.scene = scene;
        if (spriteObject) {
            self.spriteObject = spriteObject;
			[scene addChild:self.spriteObject];
        } else if (color) {
            self.spriteObject = [[SKSpriteNode alloc] initWithColor:color size:CGSizeMake(15.0, 15.0)];
			[scene addChild:self.spriteObject];
        } else if (imageName) {
			self.spriteObject = [[SKSpriteNode alloc] initWithImageNamed:imageName];
			[scene addChild:self.spriteObject];
		} else {
		}
    }
    return self;
}

- (void)putAtPosition:(CGPoint)position {
	if (self.spriteObject) {
		self.spriteObject.position = position;
	} else {

	}
}

- (CGFloat)distanceFromPoint:(CGPoint)point {
	if (self.spriteObject) {
		return abs(sqrt( (self.spriteObject.position.x - point.x)*(self.spriteObject.position.x - point.x) + (self.spriteObject.position.y - point.y)*(self.spriteObject.position.y - point.y) ));
	} else {
		NSLog(@"Attempt to calculate distance of spriteless object");
		return -1.0;
	}
}

@end
