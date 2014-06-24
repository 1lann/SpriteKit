//
//  MapGenerator.h
//  Tower Defense
//
//  Created by Jason Chu on 6/23/14.
//  Copyright (c) 2014 Jason Chu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>
#import "MapObject.h"

@interface Map : NSObject

typedef enum {
    defaultMap
} MapType;

- initWithWidth:(CGFloat)width height:(CGFloat)height map:(MapType)map;
- (void)drawMap:(SKScene*)scene;
- (CGPathRef)returnVisiblePath;
- (float)returnPathDistance;
- (float)totalTimeForSpeed:(float)tilesPerSecond;

- (void)storeObjectAtX:(NSInteger)x y:(NSInteger)y mapObject:(MapObject*)mapObject;
- (MapObject*)retrieveObjectAtX:(NSInteger)x y:(NSInteger)y;
- (NSArray*)retrieveObjectsWithType:(NSString*)objectType;

- (CGPoint)gridFromTouchX:(float)x y:(NSInteger)y;

@end
