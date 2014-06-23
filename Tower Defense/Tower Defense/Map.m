//
//  MapGenerator.m
//  Tower Defense
//
//  Created by Jason Chu on 6/23/14.
//  Copyright (c) 2014 Jason Chu. All rights reserved.
//

#import "Map.h"

#define MAP_WIDTH 13
#define MAP_HEIGHT 8

@interface Map ()

@property CGPathRef visiblePath;
@property NSMutableArray* internalPath;
@property CGFloat objectWidth;
@property CGFloat objectHeight;

@end

@implementation Map

- (id)initWithWidth:(CGFloat)width height:(CGFloat)height map:(MapType)map
{
    self = [super init];
    if (self) {
        self.objectWidth = width/MAP_WIDTH;
        self.objectHeight = height/MAP_HEIGHT;
		
		NSLog(@"Width: %f",self.objectWidth);
		NSLog(@"Height: %f",self.objectHeight);
        
        self.internalPath = [@[@[@1,@1],@[@1,@2],@[@2,@2],@[@3,@2],@[@4,@2],@[@5,@2],@[@6,@2],@[@7,@2],@[@8,@2],@[@9,@2],@[@9,@3],
							   @[@9,@4],@[@9,@5],@[@8,@5],@[@7,@5],@[@6,@5],@[@5,@5],@[@4,@5],@[@3,@5],@[@2,@5],@[@2,@5],
							   @[@2,@6],@[@2,@7],@[@2,@8],@[@3,@8],@[@4,@8],@[@5,@8],@[@6,@8],@[@7,@8],@[@8,@8],@[@8,@8],
							   @[@9,@8],@[@10,@8],@[@11,@8],@[@12,@8],@[@13,@8]] mutableCopy];
        
        CGMutablePathRef path = CGPathCreateMutable();
        CGPathMoveToPoint(path, NULL, [self.internalPath[0][0] floatValue]*self.objectWidth - self.objectWidth/2, [self.internalPath[0][1] floatValue]*self.objectHeight - self.objectHeight/2);
        for (NSArray* coords in self.internalPath) {
            CGPathAddLineToPoint(path, NULL, [coords[0] floatValue]*self.objectWidth - self.objectWidth/2, ([coords[1] floatValue]*self.objectHeight - self.objectHeight/2)*-1);
        }
		
		self.visiblePath = path;
    }
    return self;
}

- (CGPathRef)returnVisiblePath {
    return self.visiblePath;
}

- (void)drawMap:(SKScene*)scene {
	for (NSArray* coords in self.internalPath) {
		SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithColor:[UIColor blueColor] size:CGSizeMake(self.objectWidth, self.objectHeight)];
		sprite.position = CGPointMake([coords[0] floatValue]*self.objectWidth - self.objectWidth/2, ([coords[1] floatValue]*self.objectHeight - self.objectHeight/2)*-1);
		
		[scene addChild:sprite];
	}
}

- (float)returnPathDistance {
	return [self.internalPath count];
}

- (float)totalTimeForSpeed:(float)tilesPerSecond {
	return [self.internalPath count]*tilesPerSecond;
}

@end
