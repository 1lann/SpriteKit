//
//  spritekitdemoMyScene.m
//  SpriteKit Demo
//
//  Created by Jason Chu on 6/4/14.
//  Copyright (c) 2014 Jason Chu. All rights reserved.
//

#import "spritekitdemoMyScene.h"

@implementation spritekitdemoMyScene

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        self.backgroundColor = [SKColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:1.0];
        CGVector gravity = {0, -10};
        self.physicsWorld.gravity = (gravity);
        self.physicsWorld.speed = 1.0;
        
        SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithColor:[UIColor blueColor] size:CGSizeMake(1000.0, 10.0)];
        sprite.position = CGPointMake(10, 1);
         sprite.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:CGSizeMake(1000.0, 10.0)];
        sprite.physicsBody.affectedByGravity = NO;
        sprite.physicsBody.dynamic = NO;
        sprite.physicsBody.restitution = 0.5;
        [self addChild:sprite];
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        
        SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithColor:[UIColor blueColor] size:CGSizeMake(10.0, 10.0)];
        
        sprite.position = location;
        
        sprite.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:CGSizeMake(10.0, 10.0)];
        sprite.physicsBody.affectedByGravity = YES;
        sprite.physicsBody.mass = 2.0;
        
        
        //sprite.physicsBody.velocity = 1.0;
        
        [self addChild:sprite];
    }
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
