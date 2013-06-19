//
//  HelloWorldLayer.m
//  TextureFun
//
//  Created by Jakub Vlk on 6/19/13.
//  Copyright Jakub Vlk 2013. All rights reserved.
//


// Import the interfaces
#import "HelloWorldLayer.h"

// Needed to obtain the Navigation Controller
#import "AppDelegate.h"

#pragma mark - HelloWorldLayer

// HelloWorldLayer implementation
@implementation HelloWorldLayer

// Helper class method that creates a Scene with the HelloWorldLayer as the only child.
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	HelloWorldLayer *layer = [HelloWorldLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
-(id) init
{
	if( (self=[super init] )) {
        CGSize winSize = [CCDirector sharedDirector].winSize;
        
        CCSpriteBatchNode *backgroundBgNode;
        backgroundBgNode = [CCSpriteBatchNode batchNodeWithFile:@"background.pvr.ccz"];
        [self addChild:backgroundBgNode];
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"background.plist"];
        CCSprite *background = [CCSprite spriteWithSpriteFrameName:@"MuleDeer-ipadhd.png"];
        background.anchorPoint = ccp(0,0);
        [backgroundBgNode addChild:background];
        
        // More coming here soon...

	}
	return self;
}

// on "dealloc" you need to release all your retained objects

#pragma mark GameKit delegate

-(void) achievementViewControllerDidFinish:(GKAchievementViewController *)viewController
{
	AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
	[[app navController] dismissModalViewControllerAnimated:YES];
}

-(void) leaderboardViewControllerDidFinish:(GKLeaderboardViewController *)viewController
{
	AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
	[[app navController] dismissModalViewControllerAnimated:YES];
}
@end
