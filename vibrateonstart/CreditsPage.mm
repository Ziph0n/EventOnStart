#import <Preferences/Preferences.h>

@interface CreditsPage: PSListController {
}
@end

@implementation CreditsPage
- (id)specifiers {
        if(_specifiers == nil) {
                _specifiers = [[self loadSpecifiersFromPlistName:@"CreditsPage" target:self] retain];
        }
        return _specifiers;
}


- (void)twitterDesigner {
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"twitter://user?screen_name=HHunterDev"]]) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"twitter://user?screen_name=HHunterDev"]];
    } else {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://twitter.com/HHunterDev"]];
    }
}

- (void)twitterIdea {
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"twitter://user?screen_name=ReddestDream"]]) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"twitter://user?screen_name=ReddestDream"]];
    } else {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://twitter.com/ReddestDream"]];
    }
}

- (void)twitterBetaTester {
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"twitter://user?screen_name=iGeorgeTaylor"]]) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"twitter://user?screen_name=iGeorgeTaylor"]];
    } else {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://twitter.com/iGeorgeTaylor"]];
    }
}

- (void)twitterHelp1 {
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"twitter://user?screen_name=logandev22"]]) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"twitter://user?screen_name=logandev22"]];
    } else {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://twitter.com/logandev22"]];
    }
}

- (void)twitterHelp2 {
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"twitter://user?screen_name=openro0t"]]) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"twitter://user?screen_name=openro0t"]];
    } else {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://twitter.com/openro0t"]];
    }
}

- (void)redditJailbreakDevelopers {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.reddit.com/r/jailbreakdevelopers/"]];
}

- (void)redditJailbreak {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.reddit.com/r/jailbreak/"]];
}

@end

// vim:ft=objc