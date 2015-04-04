#import <SpringBoard/SpringBoard.h>
#import <AudioToolbox/AudioServices.h>
#import <AVFoundation/AVFoundation.h>
#import <AVFoundation/AVAudioPlayer.h>
#import <Foundation/Foundation.h>

#define Dismiss [[NSBundle bundleWithPath:@"/Library/PreferenceBundles/VibrateOnStart.bundle"] localizedStringForKey:@"DISMISS" value:@"" table:@"VibrateOnStart"]

#define Dismiss_iPad [[NSBundle bundleWithPath:@"/Library/PreferenceBundles/VibrateOnStart.bundle"] localizedStringForKey:@"DISMISS" value:@"" table:@"VibrateOnStart-iPad"]

@interface Event : NSObject {}

+ (void)vibration;
+ (void)flashlight;
+ (void)sound;
+ (void)welcome;

@end


@implementation Event

#define APEX @"/Library/EventOnStart/Apex.caf"
#define BEACON @"/Library/EventOnStart/Beacon.caf"
#define BULLETIN @"/Library/EventOnStart/Bulletin.caf"
#define BYTHESEASIDE @"/Library/EventOnStart/By The Seaside.caf"
#define CHIMES @"/Library/EventOnStart/Chimes.caf"
#define CIRCUIT @"/Library/EventOnStart/Circuit.caf"
#define CONSTELLATION @"/Library/EventOnStart/Constellation.caf"
#define COSMIC @"/Library/EventOnStart/Cosmic.caf"
#define CRYSTALS @"/Library/EventOnStart/Crystals.caf"
#define HILLSIDE @"/Library/EventOnStart/Hillside.caf"
#define ILLUMINATE @"/Library/EventOnStart/Illuminate.caf"
#define NIGHTOWL @"/Library/EventOnStart/Night Owl.caf"
#define OPENING @"/Library/EventOnStart/Opening.caf"
#define PLAYTIME @"/Library/EventOnStart/Playtime.caf"
#define PRESTO @"/Library/EventOnStart/Presto.caf"
#define RADAR @"/Library/EventOnStart/Radar.caf"
#define RADIATE @"/Library/EventOnStart/Radiate.caf"
#define RIPPLES @"/Library/EventOnStart/Ripples.caf"
#define SENCHA @"/Library/EventOnStart/Sencha.caf"
#define SIGNAL @"/Library/EventOnStart/Signal.caf"
#define SILK @"/Library/EventOnStart/Silk.caf"
#define SLOWRISE @"/Library/EventOnStart/Slow Rise.caf"
#define STARGAZE @"/Library/EventOnStart/Stargaze.caf"
#define SUMMIT @"/Library/EventOnStart/Summit.caf"
#define TWINKLE @"/Library/EventOnStart/Twinkle.caf"
#define UPLIFT @"/Library/EventOnStart/Uplift.caf"
#define WAVES @"/Library/EventOnStart/Waves.caf"

#define AURORA @"/Library/EventOnStart/Aurora.caf"
#define BAMBOO @"/Library/EventOnStart/Bamboo.caf"
#define CHORD @"/Library/EventOnStart/Chord.caf"
#define CIRCLES @"/Library/EventOnStart/Circles.caf"
#define COMPLETE @"/Library/EventOnStart/Complete.caf"
#define HELLO @"/Library/EventOnStart/Hello.caf"
#define INPUT @"/Library/EventOnStart/Input.caf"
#define KEYS @"/Library/EventOnStart/Keys.caf"
#define NOTE @"/Library/EventOnStart/Note.caf"
#define POPCORN @"/Library/EventOnStart/Popcorn.caf"
#define PULSE @"/Library/EventOnStart/Pulse.caf"
#define SYNTH @"/Library/EventOnStart/Synth.caf"

#define BEEP @"/Library/EventOnStart/Beep.caf"
#define MAC @"/Library/EventOnStart/Mac.caf"
#define UBUNTU @"/Library/EventOnStart/Ubuntu.caf"

AVAudioPlayer *audioPlayer;

NSMutableDictionary *prefs = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.ziph0n.vibrateonstart.plist"];
NSString *welcomeMessage = [prefs objectForKey:@"welcomeString"];
//NSTimeInterval flashlightduration = [prefs objectForKey:@"flashlightDuration"];
BOOL enabled = [[prefs objectForKey:@"enabled"] boolValue];
BOOL vibration = [[prefs objectForKey:@"vibration"] boolValue];
BOOL flashlight = [[prefs objectForKey:@"flashlight"] boolValue];
BOOL sound = [[prefs objectForKey:@"sound"] boolValue];
BOOL welcome = [[prefs objectForKey:@"welcome"] boolValue];


NSURL *apexurl = [NSURL fileURLWithPath:[NSString stringWithFormat:APEX]];
NSURL *beaconurl = [NSURL fileURLWithPath:[NSString stringWithFormat:BEACON]];
NSURL *bulletinurl = [NSURL fileURLWithPath:[NSString stringWithFormat:BULLETIN]];
NSURL *bytheseasideurl = [NSURL fileURLWithPath:[NSString stringWithFormat:BYTHESEASIDE]];
NSURL *chimesurl = [NSURL fileURLWithPath:[NSString stringWithFormat:CHIMES]];
NSURL *circuiturl = [NSURL fileURLWithPath:[NSString stringWithFormat:CIRCUIT]];
NSURL *constellationurl = [NSURL fileURLWithPath:[NSString stringWithFormat:CONSTELLATION]];
NSURL *cosmicurl = [NSURL fileURLWithPath:[NSString stringWithFormat:COSMIC]];
NSURL *crystalsurl = [NSURL fileURLWithPath:[NSString stringWithFormat:CRYSTALS]];
NSURL *hillsideurl = [NSURL fileURLWithPath:[NSString stringWithFormat:HILLSIDE]];
NSURL *illuminateurl = [NSURL fileURLWithPath:[NSString stringWithFormat:ILLUMINATE]];
NSURL *nightowlurl = [NSURL fileURLWithPath:[NSString stringWithFormat:NIGHTOWL]];
NSURL *openingurl = [NSURL fileURLWithPath:[NSString stringWithFormat:OPENING]];
NSURL *playtimeurl = [NSURL fileURLWithPath:[NSString stringWithFormat:PLAYTIME]];
NSURL *prestourl = [NSURL fileURLWithPath:[NSString stringWithFormat:PRESTO]];
NSURL *radarurl = [NSURL fileURLWithPath:[NSString stringWithFormat:RADAR]];
NSURL *radiateurl = [NSURL fileURLWithPath:[NSString stringWithFormat:RADIATE]];
NSURL *ripplesurl = [NSURL fileURLWithPath:[NSString stringWithFormat:RIPPLES]];
NSURL *senchaurl = [NSURL fileURLWithPath:[NSString stringWithFormat:SENCHA]];
NSURL *signalurl = [NSURL fileURLWithPath:[NSString stringWithFormat:SIGNAL]];
NSURL *silkurl = [NSURL fileURLWithPath:[NSString stringWithFormat:SILK]];
NSURL *slowriseurl = [NSURL fileURLWithPath:[NSString stringWithFormat:SLOWRISE]];
NSURL *stargazeurl = [NSURL fileURLWithPath:[NSString stringWithFormat:STARGAZE]];
NSURL *summiturl = [NSURL fileURLWithPath:[NSString stringWithFormat:SUMMIT]];
NSURL *twinkleurl = [NSURL fileURLWithPath:[NSString stringWithFormat:TWINKLE]];
NSURL *uplifturl = [NSURL fileURLWithPath:[NSString stringWithFormat:UPLIFT]];
NSURL *wavesurl = [NSURL fileURLWithPath:[NSString stringWithFormat:WAVES]];

NSURL *auroraurl = [NSURL fileURLWithPath:[NSString stringWithFormat:AURORA]];
NSURL *bamboourl = [NSURL fileURLWithPath:[NSString stringWithFormat:BAMBOO]];
NSURL *chordurl = [NSURL fileURLWithPath:[NSString stringWithFormat:CHORD]];
NSURL *circlesurl = [NSURL fileURLWithPath:[NSString stringWithFormat:CIRCLES]];
NSURL *completeurl = [NSURL fileURLWithPath:[NSString stringWithFormat:COMPLETE]];
NSURL *hellourl = [NSURL fileURLWithPath:[NSString stringWithFormat:HELLO]];
NSURL *inputurl = [NSURL fileURLWithPath:[NSString stringWithFormat:INPUT]];
NSURL *keysurl = [NSURL fileURLWithPath:[NSString stringWithFormat:KEYS]];
NSURL *noteurl = [NSURL fileURLWithPath:[NSString stringWithFormat:NOTE]];
NSURL *popcornurl = [NSURL fileURLWithPath:[NSString stringWithFormat:POPCORN]];
NSURL *pulseurl = [NSURL fileURLWithPath:[NSString stringWithFormat:PULSE]];
NSURL *synthurl = [NSURL fileURLWithPath:[NSString stringWithFormat:SYNTH]];

NSURL *macurl = [NSURL fileURLWithPath:[NSString stringWithFormat:MAC]];
NSURL *beepurl = [NSURL fileURLWithPath:[NSString stringWithFormat:BEEP]];
NSURL *ubuntuurl = [NSURL fileURLWithPath:[NSString stringWithFormat:UBUNTU]];


+ (void) vibration 
{
  AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
}

+ (void) flashlight 
{
  Class captureDeviceClass = NSClassFromString(@"AVCaptureDevice");
  if (captureDeviceClass != nil) 
  {
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    if ([device hasTorch] && [device hasFlash])
    {
      [device lockForConfiguration:nil];

		  [device setTorchMode:AVCaptureTorchModeOn];
		  [device setFlashMode:AVCaptureFlashModeOn];

      [NSThread sleepForTimeInterval:0.7];
	    
		  [device setTorchMode:AVCaptureTorchModeOff];
		  [device setFlashMode:AVCaptureFlashModeOff];

	    [device unlockForConfiguration];
    }
  }
}


+ (void) sound 
{
  NSInteger integer = [[prefs objectForKey:@"SoundList"] intValue];

    NSArray *soundURLs = @[apexurl, beaconurl, bulletinurl, bytheseasideurl, chimesurl, circuiturl, constellationurl, cosmicurl, crystalsurl, hillsideurl, illuminateurl, nightowlurl, openingurl, playtimeurl, prestourl, radarurl, radiateurl, ripplesurl, senchaurl, signalur, silkurl, slowriseurl, stargazeurl, summiturl, twinkleurl, uplifturl, wavesurl, auroraurl, bamboourl, chordurl, circlesurl, completeurl, hellourl, inputurl, keysurl, noteurl, popcornurl, pulseurl, synthurl, macurl, beepurl, ubuntuurl];

    audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundURLs[integer] error:nil];
    audioPlayer.numberOfLoops = 0;
    audioPlayer.volume = 1.0;
    [audioPlayer play];

  
}

+ (void) welcome 
{
  NSString *dismissString = UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad ? Dismiss_iPad : Dismiss;

    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" 
    message:welcomeMessage
    delegate:nil
    cancelButtonTitle:dismissString
    otherButtonTitles:nil];
      [alert show];
      [alert release];

}

@end


%hook SpringBoard

- (void)applicationDidFinishLaunching:(id)application {

if (enabled) {

if (vibration) {
    [Event vibration];
}

if (sound) {
    [Event sound];
}

if (welcome) {
    [Event welcome];
}

if (flashlight) {
    [Event flashlight];
}

}

%orig;

}

%end
