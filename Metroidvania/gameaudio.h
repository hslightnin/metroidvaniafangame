//
//  gameaudio.h
//  Metroidvania
//
//  Created by nick vancise on 10/25/18.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface gameaudio : NSObject


-(void)runBkgrndMusicForlvl:(int)lvlnum;
@property(nonatomic,strong) AVAudioPlayer*bkgrndmusic;


+(AVAudioPlayer*)setupRepeatingSound:(NSString*)file volume:(float)volume;
+(AVAudioPlayer*)setupSound:(NSString*)file volume:(float)volume;
+(void)playSound:(AVAudioPlayer*)player;
+(void)playSound:(AVAudioPlayer*)player afterDelay:(float)delaySeconds;
+(void)pauseSound:(AVAudioPlayer*)player;

@end
