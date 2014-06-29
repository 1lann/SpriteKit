//
//  MapObject.h
//  Tower Defense
//
//  Created by Jason Chu on 6/24/14.
//  Copyright (c) 2014 Jason Chu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>

@interface MapObject : NSObject

typedef NS_ENUM(NSInteger, MapObjectType) {
	Path,
	Tower,
	Base,
	Environment
};

@property BOOL empty;
@property NSString* imageName;
@property NSString* objectName;
@property MapObjectType objectType;
@property UIColor* color;
@property SKSpriteNode* spriteObject;
@property SKScene* scene;

- (id)initAsEmpty;
- (id)initWithName:(NSString *)name imageName:(NSString *)imageName color:(UIColor*)color objectType:(MapObjectType)objectType spriteObject:(SKSpriteNode *)spriteObject scene:(SKScene*)scene;
- (void)putAtPosition:(CGPoint)position;
- (CGFloat)distanceFromPoint:(CGPoint)point;

@end
