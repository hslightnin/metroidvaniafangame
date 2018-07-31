//
//  arachnusboss.m
//  Metroidvania
//
//  Created by nick vancise on 7/23/18.


#import "arachnusboss.h"

@implementation arachnusboss{
    SKAction *moveforeward;
    SKAction *movebackward;
    SKAction *fireattackleft;
    SKAction *fireattackright;
    SKAction *morphballattackright;
    SKAction *morphballattackleft;
    SKAction *slashattackleft;
    SKAction *slashattackright;
    SKAction *turnleft;
    SKAction *turnright;
    SKAction *recievedamage;
    
    SKAction *slashprojmoveanim;
}

-(instancetype)initWithImageNamed:(NSString *)name{
    __weak NSString *weakname=name;
    if(self == [super initWithImageNamed:weakname]){
        self.health=150;
        self.active=NO;
        
        SKTextureAtlas *arachnustextures=[SKTextureAtlas atlasNamed:@"Arachnus"];
        
        //initialize movements
        
        
        
        //initialize projectiles
        self.slashprojectile=[SKSpriteNode spriteNodeWithTexture:[arachnustextures textureNamed:@"arachnus_slash_1.png"]];
        self.slashprojectile.position=CGPointMake(27,0);
        SKSpriteNode *slashprojectiletrail=[SKSpriteNode spriteNodeWithTexture:[arachnustextures textureNamed:@"arachnus_slashsingle.png"]];
        slashprojectiletrail.position=CGPointMake(-15,0);
        slashprojectiletrail.alpha=0.8;
        [self.slashprojectile addChild:slashprojectiletrail];
        NSArray*projtextures=@[[arachnustextures textureNamed:@"arachnus_slash_1.png"],[arachnustextures textureNamed:@"arachnus_slash_2.png"],[arachnustextures textureNamed:@"arachnus_slash_3.png"],[arachnustextures textureNamed:@"arachnus_slash_4.png"]];
        slashprojmoveanim=[SKAction group:[NSArray arrayWithObjects:[SKAction repeatAction:[SKAction animateWithTextures:projtextures timePerFrame:0.05 resize:YES restore:YES] count:10],[SKAction moveBy:CGVectorMake(300,0) duration:2.0], nil]];
        //[self addChild:self.slashprojectile];
       
        //initialize animations
        NSArray *morphtoballrighttex=@[[arachnustextures textureNamed:@"toball_1.png"],[arachnustextures textureNamed:@"toball_2.png"],[arachnustextures textureNamed:@"toball_3.png"],[arachnustextures textureNamed:@"toball_4.png"]];
        SKAction *morphtoballrightanim=[SKAction animateWithTextures:morphtoballrighttex timePerFrame:0.15 resize:YES restore:YES];
        
        NSArray *ballrighttex=@[[arachnustextures textureNamed:@"ball_1.png"],[arachnustextures textureNamed:@"ball_2.png"],[arachnustextures textureNamed:@"ball_3.png"],[arachnustextures textureNamed:@"ball_4.png"]];
        SKAction *ballattackrightanim=[SKAction animateWithTextures:ballrighttex timePerFrame:0.04 resize:YES restore:YES];
        
        morphballattackright=[SKAction sequence:[NSArray arrayWithObjects:[SKAction scaleXTo:1 duration:0.08],morphtoballrightanim,[SKAction group:[NSArray arrayWithObjects:[SKAction repeatAction:ballattackrightanim count:15],[SKAction moveByX:300 y:0 duration:2.4], nil]], nil]];
        morphballattackleft=[SKAction sequence:[NSArray arrayWithObjects:[SKAction scaleXTo:-1 duration:0.08],morphtoballrightanim,[SKAction group:[NSArray arrayWithObjects:[SKAction repeatAction:ballattackrightanim count:15],[SKAction moveByX:-300 y:0 duration:2.4], nil]], nil]];
        
        NSArray *moveforewardtex=@[[arachnustextures textureNamed:@"walk_1.png"],[arachnustextures textureNamed:@"walk_2.png"],[arachnustextures textureNamed:@"walk_3.png"],[arachnustextures textureNamed:@"walk_4.png"],[arachnustextures textureNamed:@"walk_5.png"],[arachnustextures textureNamed:@"walk_6.png"],[arachnustextures textureNamed:@"walk_7.png"],[arachnustextures textureNamed:@"walk_8.png"],[arachnustextures textureNamed:@"walk_9.png"],[arachnustextures textureNamed:@"walk_10.png"],[arachnustextures textureNamed:@"walk_11.png"],[arachnustextures textureNamed:@"walk_12.png"]];
        SKAction *moveforewardanim=[SKAction animateWithTextures:moveforewardtex timePerFrame:0.08 resize:YES restore:YES];
        
        moveforeward=[SKAction sequence:[NSArray arrayWithObjects:[SKAction scaleXTo:1 duration:0.08],[SKAction group:[NSArray arrayWithObjects:[SKAction repeatAction:moveforewardanim count:3],[SKAction moveByX:150 y:0 duration:2.88], nil]], nil]];
        movebackward=[SKAction sequence:[NSArray arrayWithObjects:[SKAction scaleXTo:-1 duration:0.08],[SKAction group:[NSArray arrayWithObjects:[SKAction repeatAction:moveforewardanim count:3],[SKAction moveByX:-150 y:0 duration:2.88], nil]], nil]];
        
        NSArray *fireattackrighttex=@[[arachnustextures textureNamed:@"spitfire_1.png"],[arachnustextures textureNamed:@"spitfire_2.png"],[arachnustextures textureNamed:@"spitfire_3.png"],[arachnustextures textureNamed:@"spitfire_4.png"],[arachnustextures textureNamed:@"spitfire_5.png"]];
        SKAction *fireattackrightanim=[SKAction animateWithTextures:fireattackrighttex timePerFrame:0.17 resize:YES restore:YES];
        
        //NSArray *firesp=@[[arachnustextures textureNamed:@"Fire1.png"],[arachnustextures textureNamed:@"Fire2.png"],[arachnustextures textureNamed:@"Fire3.png"],[arachnustextures textureNamed:@"Fire4.png"]];
        //SKAction *firespanim=[SKAction animateWithTextures:firesp timePerFrame:0.1 resize:NO restore:YES];
        //SKSpriteNode*firesprite=[SKSpriteNode spriteNodeWithTexture:[arachnustextures textureNamed:@"Fire1.png"]];
        //[firesprite runAction:[SKAction repeatActionForever:firespanim]];
        //firesprite.position=CGPointMake(30,-5);
        //[self addChild:firesprite];
        //testing^-
        
        NSArray *slashrightex=@[[arachnustextures textureNamed:@"slash_1.png"],[arachnustextures textureNamed:@"slash_2.png"],[arachnustextures textureNamed:@"slash_3.png"],[arachnustextures textureNamed:@"slash_4.png"],[arachnustextures textureNamed:@"slash_5.png"],[arachnustextures textureNamed:@"slash_6.png"],[arachnustextures textureNamed:@"slash_7.png"],[arachnustextures textureNamed:@"slash_8.png"],[arachnustextures textureNamed:@"slash_9.png"],[arachnustextures textureNamed:@"slash_10.png"],[arachnustextures textureNamed:@"slash_11.png"],[arachnustextures textureNamed:@"slash_12.png"],[arachnustextures textureNamed:@"slash_13.png"],[arachnustextures textureNamed:@"slash_14.png"],[arachnustextures textureNamed:@"slash_15.png"]];
        SKAction *slashrightanim=[SKAction animateWithTextures:slashrightex timePerFrame:0.09 resize:YES restore:YES];
        
        
        NSArray *turnrighttex=@[[arachnustextures textureNamed:@"turn_1.png"],[arachnustextures textureNamed:@"turn_2.png"],[arachnustextures textureNamed:@"turn_3.png"],[arachnustextures textureNamed:@"turn_4.png"]];
        SKAction *turnrightanim=[SKAction animateWithTextures:turnrighttex timePerFrame:0.15 resize:YES restore:YES];
        
        
        NSArray *recievedamagetex=@[[arachnustextures textureNamed:@"damage_scream_1.png"],[arachnustextures textureNamed:@"damage_scream_2.png"],[arachnustextures textureNamed:@"damage_scream_3.png"],[arachnustextures textureNamed:@"damage_scream_4.png"],[arachnustextures textureNamed:@"damage_scream_5.png"]];
        SKAction *recievedamagerightanim=[SKAction animateWithTextures:recievedamagetex timePerFrame:0.15 resize:YES restore:YES];
        
        self.testallactions=[SKAction sequence:[NSArray arrayWithObjects:/*morphtoballrightanim,ballattackrightanim,ballattackrightanim,ballattackrightanim*/morphballattackright,morphballattackleft,/*moveforewardanim,moveforewardanim,moveforewardanim,*/moveforeward,movebackward,fireattackrightanim,slashrightanim,turnrightanim,recievedamagerightanim, nil]];//];
        
        //initialize attacks
        
        
        
    }
    
    return self;
}

@end
