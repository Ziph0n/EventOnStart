#import <Preferences/Preferences.h>
#import <Social/SLComposeViewController.h>
#import <Social/SLServiceTypes.h>
#import <AVFoundation/AVAudioPlayer.h>
#import <UIKit/UIKit.h>

#define CreatedByMe [[NSBundle bundleWithPath:@"/Library/PreferenceBundles/VibrateOnStart.bundle"] localizedStringForKey:@"CREATEDBYME" value:@"" table:@"VibrateOnStart"]
#define Description [[NSBundle bundleWithPath:@"/Library/PreferenceBundles/VibrateOnStart.bundle"] localizedStringForKey:@"DESCRIPTION" value:@"" table:@"VibrateOnStart"]
#define Options [[NSBundle bundleWithPath:@"/Library/PreferenceBundles/VibrateOnStart.bundle"] localizedStringForKey:@"OPTIONS" value:@"" table:@"VibrateOnStart"]
#define About [[NSBundle bundleWithPath:@"/Library/PreferenceBundles/VibrateOnStart.bundle"] localizedStringForKey:@"ABOUT" value:@"" table:@"VibrateOnStart"]
#define Preview [[NSBundle bundleWithPath:@"/Library/PreferenceBundles/VibrateOnStart.bundle"] localizedStringForKey:@"PREVIEW" value:@"" table:@"VibrateOnStart"]

#define Preview_iPad [[NSBundle bundleWithPath:@"/Library/PreferenceBundles/VibrateOnStart.bundle"] localizedStringForKey:@"PREVIEW" value:@"" table:@"VibrateOnStart-iPad"]

@interface VibrateOnStartListController: PSListController {
}
@end


@implementation VibrateOnStartListController
- (id)specifiers {
	if(_specifiers == nil) {
	   if(UI_USER_INTERFACE_IDIOM () == UIUserInterfaceIdiomPad)  {
			_specifiers = [[self loadSpecifiersFromPlistName:@"VibrateOnStart-iPad" target:self] retain];
		}
	   else if ([[[UIDevice currentDevice] model] isEqual:@"iPod touch"]) {
		    _specifiers = [[self loadSpecifiersFromPlistName:@"VibrateOnStart-iPod" target:self] retain];
		}
	   else {
		    _specifiers = [[self loadSpecifiersFromPlistName:@"VibrateOnStart" target:self] retain];
		}
	}
	return _specifiers;
}


- (void)donation {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://www.paypal.com/notyet"]];
}

- (void)twitter {
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"twitter://user?screen_name=Ziph0n"]]) {
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"twitter://user?screen_name=Ziph0n"]];
    } else {
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://twitter.com/Ziph0n"]];
    }
}

- (void)sourceOnGithub {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://github.com/Ziph0n/EventOnStart/tree/master"]];
}

- (void)reddit {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.reddit.com/user/Ziph0n/"]];
}

-(void) sendEmail {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"mailto:ziph0ntweak@gmail.com?subject=EventOnStart"]];
}

@end

@protocol PreferencesTableCustomView
-(id)initWithSpecifier:(id)arg1;
@optional
-(CGFloat)preferredHeightForWidth:(CGFloat)arg1;
@end

@interface PSTableCell (EventOnStart)
-(id)initWithStyle:(int)style reuseIdentifier:(id)arg2;
@end

@interface EventOnStartCustomCell : PSTableCell <PreferencesTableCustomView> {

	UILabel *label;
	UILabel *underLabel;
	UILabel *otherLabel;
	UILabel *lineLabel;
}
@end

@implementation EventOnStartCustomCell
-(id)initWithSpecifier:(id)specifier {

	self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
	if (self) {

		CGRect frame = CGRectMake(0, -15, [[UIScreen mainScreen] bounds].size.width, 60);
		CGRect underFrame = CGRectMake(0, 20, [[UIScreen mainScreen] bounds].size.width, 60);
		CGRect otherFrame = CGRectMake(0, 40, [[UIScreen mainScreen] bounds].size.width, 60);
		CGRect lineFrame = CGRectMake(0, 50, [[UIScreen mainScreen] bounds].size.width, 70);

		label = [[UILabel alloc] initWithFrame:frame];
		[label setNumberOfLines:1];
		label.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:48];
		[label setText:@"EventOnStart"];
		[label setBackgroundColor:[UIColor clearColor]];
		label.textColor = [UIColor colorWithRed:1 green:0.627 blue:0.192 alpha:1.0];
		label.textAlignment = NSTextAlignmentCenter;

		underLabel = [[UILabel alloc] initWithFrame:underFrame];
		[underLabel setNumberOfLines:1];
		underLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:14];
		[underLabel setText:Description];
		[underLabel setBackgroundColor:[UIColor clearColor]];
		underLabel.textColor = [UIColor grayColor];
		underLabel.textAlignment = NSTextAlignmentCenter;

		otherLabel = [[UILabel alloc] initWithFrame:otherFrame];
		[otherLabel setNumberOfLines:1];
		otherLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:14];
		[otherLabel setText:CreatedByMe];
		[otherLabel setBackgroundColor:[UIColor clearColor]];
		otherLabel.textColor = [UIColor grayColor];
		otherLabel.textAlignment = NSTextAlignmentCenter;

		lineLabel = [[UILabel alloc] initWithFrame:lineFrame];
		[lineLabel setNumberOfLines:1];
		lineLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:14];
		[lineLabel setText:@"------------------------------"];
		[lineLabel setBackgroundColor:[UIColor clearColor]];
		lineLabel.textColor = [UIColor grayColor];
		lineLabel.textAlignment = NSTextAlignmentCenter;	       

		[self addSubview:label];
		[self addSubview:underLabel];
		[self addSubview:otherLabel];
		[self addSubview:lineLabel];
	}
	return self;
}
 
-(CGFloat)preferredHeightForWidth:(CGFloat)arg1 {

	CGFloat prefHeight = 90.0;
	return prefHeight;
}

@end






@interface EventOnStartOptionsCell : PSTableCell <PreferencesTableCustomView> {

	UILabel *underLabel;

}
@end

@implementation EventOnStartOptionsCell
-(id)initWithSpecifier:(id)specifier {

	self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
	if (self) {

		CGRect Frame = CGRectMake(0, -30, [[UIScreen mainScreen] bounds].size.width, 60);

		underLabel = [[UILabel alloc] initWithFrame:Frame];
		[underLabel setNumberOfLines:1];
		underLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:28];
		[underLabel setText:Options];
		[underLabel setBackgroundColor:[UIColor clearColor]];
		underLabel.textColor = [UIColor colorWithRed:1 green:0.627 blue:0.192 alpha:1.0];
		underLabel.textAlignment = NSTextAlignmentCenter; 

		[self addSubview:underLabel];
	}
	return self;
}
 
-(CGFloat)preferredHeightForWidth:(CGFloat)arg1 {

	CGFloat prefHeight = 25.0;
	return prefHeight;
}

@end


@interface EventOnStartAboutCell : PSTableCell <PreferencesTableCustomView> {

	UILabel *underLabel;

}
@end

@implementation EventOnStartAboutCell
-(id)initWithSpecifier:(id)specifier {

	self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
	if (self) {

		CGRect Frame = CGRectMake(0, -20, [[UIScreen mainScreen] bounds].size.width, 60);

		underLabel = [[UILabel alloc] initWithFrame:Frame];
		[underLabel setNumberOfLines:1];
		underLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:28];
		[underLabel setText:About];
		[underLabel setBackgroundColor:[UIColor clearColor]];
		underLabel.textColor = [UIColor colorWithRed:1 green:0.627 blue:0.192 alpha:1.0];
		underLabel.textAlignment = NSTextAlignmentCenter; 

		[self addSubview:underLabel];
	}
	return self;
}
 
-(CGFloat)preferredHeightForWidth:(CGFloat)arg1 {

	CGFloat prefHeight = 25.0;
	return prefHeight;
}

@end


@interface EventOnStartSmileyCell : PSTableCell <PreferencesTableCustomView> {

	UILabel *smiley;

}
@end

@implementation EventOnStartSmileyCell
-(id)initWithSpecifier:(id)specifier {

	self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
	if (self) {

		CGRect Frame = CGRectMake(0, 200, [[UIScreen mainScreen] bounds].size.width, 60);

		smiley = [[UILabel alloc] initWithFrame:Frame];
		[smiley setNumberOfLines:1];
		smiley.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:60];
		[smiley setText:@":)"];
		[smiley setBackgroundColor:[UIColor clearColor]];
		smiley.textColor = [UIColor colorWithRed:1 green:0.627 blue:0.192 alpha:1.0];
		smiley.textAlignment = NSTextAlignmentCenter; 

		[self addSubview:smiley];
	}
	return self;
}
 
-(CGFloat)preferredHeightForWidth:(CGFloat)arg1 {

	CGFloat prefHeight = 25.0;
	return prefHeight;
}

@end


@interface CustomListItemsController : PSListItemsController
@end

AVAudioPlayer *audioPlayer;

@implementation CustomListItemsController

-(void)stopAudio{

if(audioPlayer && [audioPlayer isPlaying]){
    [audioPlayer stop];
    audioPlayer=nil;
    }
}

- (void)preview:(id)arg1
{
	[self stopAudio];

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

	NSMutableDictionary *prefs = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.ziph0n.vibrateonstart.plist"];

    switch ([[prefs objectForKey:@"SoundList"] intValue]) {

    case 1: {
      audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:apexurl error:nil];
      audioPlayer.numberOfLoops = 0;
      audioPlayer.volume = 1.0;
      [audioPlayer play];
    break;
    }

    case 2: {
      audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:beaconurl error:nil];
      audioPlayer.numberOfLoops = 0;
      audioPlayer.volume = 1.0;
      [audioPlayer play];
    break;
    }

    case 3: {
      audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:bulletinurl error:nil];
      audioPlayer.numberOfLoops = 0;
      audioPlayer.volume = 1.0;
      [audioPlayer play];
    break;
    }

    case 4: {
      audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:bytheseasideurl error:nil];
      audioPlayer.numberOfLoops = 0;
      audioPlayer.volume = 1.0;
      [audioPlayer play];
    break;
    }

    case 5: {
      audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:chimesurl error:nil];
      audioPlayer.numberOfLoops = 0;
      audioPlayer.volume = 1.0;
      [audioPlayer play];
    break;
    }

    case 6: {
      audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:circuiturl error:nil];
      audioPlayer.numberOfLoops = 0;
      audioPlayer.volume = 1.0;
      [audioPlayer play];
    break;
    }

    case 7: {
      audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:constellationurl error:nil];
      audioPlayer.numberOfLoops = 0;
      audioPlayer.volume = 1.0;
      [audioPlayer play];
    break;
    }

    case 8: {
      audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:cosmicurl error:nil];
      [audioPlayer stop];
      audioPlayer.numberOfLoops = 1;
      audioPlayer.volume = 1.0;
      [audioPlayer play];
    break;
    }

    case 9: {
      audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:crystalsurl error:nil];
      audioPlayer.numberOfLoops = 0;
      audioPlayer.volume = 1.0;
      [audioPlayer play];
    break;
    }

    case 10: {
      audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:hillsideurl error:nil];
      audioPlayer.numberOfLoops = 0;
      audioPlayer.volume = 1.0;
      [audioPlayer play];
    break;
    }

    case 11: {
      audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:illuminateurl error:nil];
      audioPlayer.numberOfLoops = 0;
      audioPlayer.volume = 1.0;
      [audioPlayer play];
    break;
    }

    case 12: {
      audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:nightowlurl error:nil];
      audioPlayer.numberOfLoops = 0;
      audioPlayer.volume = 1.0;
      [audioPlayer play];
    break;
    }

    case 13: {
      audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:openingurl error:nil];
      audioPlayer.numberOfLoops = 0;
      audioPlayer.volume = 1.0;
      [audioPlayer play];
    break;
    }

    case 14: {
      audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:playtimeurl error:nil];
      audioPlayer.numberOfLoops = 0;
      audioPlayer.volume = 1.0;
      [audioPlayer play];
    break;
    }

    case 15: {
      audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:prestourl error:nil];
      audioPlayer.numberOfLoops = 0;
      audioPlayer.volume = 1.0;
      [audioPlayer play];
    break;
    }

    case 16: {
      audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:radarurl error:nil];
      audioPlayer.numberOfLoops = 0;
      audioPlayer.volume = 1.0;
      [audioPlayer play];
    break;
    }

    case 17: {
      audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:radiateurl error:nil];
      audioPlayer.numberOfLoops = 0;
      audioPlayer.volume = 1.0;
      [audioPlayer play];
    break;
    }

    case 18: {
      audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:ripplesurl error:nil];
      audioPlayer.numberOfLoops = 0;
      audioPlayer.volume = 1.0;
      [audioPlayer play];
    break;
    }

    case 19: {
      audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:senchaurl error:nil];
      audioPlayer.numberOfLoops = 0;
      audioPlayer.volume = 1.0;
      [audioPlayer play];
    break;
    }

    case 20: {
      audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:signalurl error:nil];
      audioPlayer.numberOfLoops = 0;
      audioPlayer.volume = 1.0;
      [audioPlayer play];
    break;
    }

    case 21: {
      audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:silkurl error:nil];
      audioPlayer.numberOfLoops = 0;
      audioPlayer.volume = 1.0;
      [audioPlayer play];
    break;
    }

    case 22: {
      audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:slowriseurl error:nil];
      audioPlayer.numberOfLoops = 0;
      audioPlayer.volume = 1.0;
      [audioPlayer play];
    break;
    }

    case 23: {
      audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:stargazeurl error:nil];
      audioPlayer.numberOfLoops = 0;
      audioPlayer.volume = 1.0;
      [audioPlayer play];
    break;
    }

    case 24: {
      audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:summiturl error:nil];
      audioPlayer.numberOfLoops = 0;
      audioPlayer.volume = 1.0;
      [audioPlayer play];
    break;
    }

    case 25: {
      audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:twinkleurl error:nil];
      audioPlayer.numberOfLoops = 0;
      audioPlayer.volume = 1.0;
      [audioPlayer play];
    break;
    }

    case 26: {
      audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:uplifturl error:nil];
      audioPlayer.numberOfLoops = 0;
      audioPlayer.volume = 1.0;
      [audioPlayer play];
    break;
    }

    case 27: {
      audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:wavesurl error:nil];
      audioPlayer.numberOfLoops = 0;
      audioPlayer.volume = 1.0;
      [audioPlayer play];
    break;
    }

    case 28: {
      audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:auroraurl error:nil];
      audioPlayer.numberOfLoops = 0;
      audioPlayer.volume = 1.0;
      [audioPlayer play];
    break;
    }

    case 29: {
      audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:bamboourl error:nil];
      audioPlayer.numberOfLoops = 0;
      audioPlayer.volume = 1.0;
      [audioPlayer play];
    break;
    }

    case 30: {
      audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:chordurl error:nil];
      audioPlayer.numberOfLoops = 0;
      audioPlayer.volume = 1.0;
      [audioPlayer play];
    break;
    }

    case 31: {
      audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:circlesurl error:nil];
      audioPlayer.numberOfLoops = 0;
      audioPlayer.volume = 1.0;
      [audioPlayer play];
    break;
    }

    case 32: {
      audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:completeurl error:nil];
      audioPlayer.numberOfLoops = 0;
      audioPlayer.volume = 1.0;
      [audioPlayer play];
    break;
    }

    case 33: {
      audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:hellourl error:nil];
      audioPlayer.numberOfLoops = 0;
      audioPlayer.volume = 1.0;
      [audioPlayer play];
    break;
    }

    case 34: {
      audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:inputurl error:nil];
      audioPlayer.numberOfLoops = 0;
      audioPlayer.volume = 1.0;
      [audioPlayer play];
    break;
    }

    case 35: {
      audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:keysurl error:nil];
      audioPlayer.numberOfLoops = 0;
      audioPlayer.volume = 1.0;
      [audioPlayer play];
    break;
    }

    case 36: {
      audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:noteurl error:nil];
      audioPlayer.numberOfLoops = 0;
      audioPlayer.volume = 1.0;
      [audioPlayer play];
    break;
    }

    case 37: {
      audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:popcornurl error:nil];
      audioPlayer.numberOfLoops = 0;
      audioPlayer.volume = 1.0;
      [audioPlayer play];
    break;
    }

    case 38: {
      audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:pulseurl error:nil];
      audioPlayer.numberOfLoops = 0;
      audioPlayer.volume = 1.0;
      [audioPlayer play];
    break;
    }

    case 39: {
      audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:synthurl error:nil];
      audioPlayer.numberOfLoops = 0;
      audioPlayer.volume = 1.0;
      [audioPlayer play];
    break;
    }

    case 40: {
      audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:macurl error:nil];
      audioPlayer.numberOfLoops = 0;
      audioPlayer.volume = 1.0;
      [audioPlayer play];
    break;
    }

    case 41: {
      audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:beepurl error:nil];
      audioPlayer.numberOfLoops = 0;
      audioPlayer.volume = 1.0;
      [audioPlayer play];
    break;
    }

    case 42: {
      audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:ubuntuurl error:nil];
      audioPlayer.numberOfLoops = 0;
      audioPlayer.volume = 1.0;
      [audioPlayer play];
    break;
    }
  }
}

-(id)initForContentSize:(CGSize)contentSize
{
    if (!(self = [super initForContentSize:contentSize])) {
    return nil;
    }

	if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
	UIBarButtonItem *previewButton([[UIBarButtonItem alloc] initWithTitle:Preview_iPad style:UIBarButtonItemStyleDone target:self action:@selector(preview:)]);
	    previewButton.tag = 1;
	    [[self navigationItem] setRightBarButtonItem:previewButton];
	    [previewButton release];
	}

	else {
		UIBarButtonItem *previewButton([[UIBarButtonItem alloc] initWithTitle:Preview style:UIBarButtonItemStyleDone target:self action:@selector(preview:)]);
	    previewButton.tag = 1;
	    [[self navigationItem] setRightBarButtonItem:previewButton];
	    [previewButton release];
	}
	
    return self;
}
@end



// vim:ft=objc
