//
//  MyScene.m
//  Tower Defense
//
//  Created by Jason Chu on 6/23/14.
//  Copyright (c) 2014 Jason Chu. All rights reserved.
//

#import "MyScene.h"

@interface MyScene ()

@property Map* map;

@end

@implementation MyScene

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
		self.anchorPoint = CGPointMake(0.0, 0.7);
        self.backgroundColor = [SKColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:1.0];
        
		Map* map = [[Map alloc] initWithWidth:320.0 height:200.0 map:defaultMap];
		[map drawMap:self];
		self.map = map;
		
		
        //[self addChild:myLabel];
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    for (UITouch *touch in touches) {
        SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithColor:[UIColor greenColor] size:CGSizeMake(10, 10)];

		SKAction *action = [SKAction followPath:[self.map returnVisiblePath] duration:[self.map totalTimeForSpeed:0.5]];
		[sprite runAction:action];
		[self addChild:sprite];
    }
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
