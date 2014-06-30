//
//  MapGenerator.m
//  Tower Defense
//
//  Created by Jason Chu on 6/23/14.
//  Copyright (c) 2014 Jason Chu. All rights reserved.
//

#import "Map.h"

#define MAP_WIDTH 15
#define MAP_HEIGHT 10

@interface Map ()

@property CGPathRef visiblePath;
@property NSMutableArray* internalPath;
@property NSMutableDictionary* internalMap;
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
        
        self.internalMap = [[NSMutableDictionary alloc] init];
        
        self.internalPath = [@[@[@1,@1],@[@1,@2],@[@2,@2],@[@3,@2],@[@4,@2],@[@5,@2],@[@6,@2],@[@7,@2],@[@8,@2],@[@9,@2],
                               @[@10,@2],@[@11,@2],@[@12,@2],@[@13,@2],@[@13,@3],
							   @[@13,@4],@[@13,@5],@[@12,@5],@[@11,@5],@[@10,@5],@[@9,@5],
                               @[@8,@5],@[@7,@5],@[@6,@5],@[@5,@5],@[@4,@5],@[@3,@5],@[@2,@5],@[@2,@5],
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
		
		MapObject* pathObject = [[MapObject alloc] initWithName:@"Path" imageName:NULL color:NULL objectType:Path spriteObject:NULL scene:scene];
		[self storeObjectAtX:[coords[0] integerValue] y:[coords[1] integerValue] mapObject:pathObject];
	}
}

- (float)returnPathDistance {
	return [self.internalPath count];
}

- (float)totalTimeForSpeed:(float)tilesPerSecond {
	return [self.internalPath count]*tilesPerSecond;
}

- (void)storeObjectAtX:(NSInteger)x y:(NSInteger)y mapObject:(MapObject*)mapObject {
    if (x <= MAP_WIDTH && x > 0 && y <= MAP_HEIGHT && y > 0) {
        [self.internalMap setObject:mapObject forKey:[NSString stringWithFormat:@"%i:%i",x,y]];
		[mapObject putAtPosition:[self pixelPointFromGridPoint:CGPointMake(x, y)]];
    } else {
        NSLog(@"WARNING: Attempt to place object on invalid location");
    }
}

- (MapObject*)retrieveObjectAtX:(NSInteger)x y:(NSInteger)y {
    if (x <= MAP_WIDTH && x > 0 && y <= MAP_HEIGHT && y > 0) {
        if (self.internalMap[[NSString stringWithFormat:@"%i:%i",x,y]]) {
            return self.internalMap[[NSString stringWithFormat:@"%i:%i",x,y]];
        } else {
            return [[MapObject alloc] initAsEmpty];
        }
    } else {
        NSLog(@"WARNING: Attempt to retrieve object on invalid location");
    }
    return NULL;
}

- (NSArray*)retrieveObjectsWithType:(MapObjectType)objectType {
    NSMutableArray* retObjects = [[NSMutableArray alloc] init];
    for (MapObject* mapObject in self.internalMap) {
        if (!mapObject.empty && (mapObject.objectType == objectType)) {
            [retObjects addObject:mapObject];
        }
    }
    
    return [retObjects copy];
}

- (CGPoint)gridFromTouchPoint:(CGPoint)point {
    NSInteger gridX = roundf((point.x + self.objectWidth/2)/self.objectWidth);
    NSInteger gridY = roundf((point.y - self.objectHeight + self.objectHeight/2)/self.objectHeight)*-1;
    return CGPointMake(gridX, gridY);
}

- (CGPoint)pixelPointFromGridPoint:(CGPoint) point {
	NSInteger x = point.x*self.objectWidth - self.objectWidth/2;
	NSInteger y = point.y*-1*self.objectHeight - self.objectHeight/2 + self.objectHeight;
	return CGPointMake(x, y);
}

@end
