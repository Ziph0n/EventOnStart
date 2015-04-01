#import <Preferences/Preferences.h>

@interface Translators: PSListController {
}
@end

@implementation Translators
- (id)specifiers {
        if(_specifiers == nil) {
                _specifiers = [[self loadSpecifiersFromPlistName:@"Translators" target:self] retain];
        }
        return _specifiers;
}

- (void)Arabic {
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"twitter://user?screen_name=MiRO92"]]) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"twitter://user?screen_name=MiRO92"]];
    } else {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://twitter.com/MiRO92"]];
    }
}

- (void)Dutch {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.reddit.com/u/FlutterDutch/"]];
}

- (void)English1 {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.reddit.com/u/JackHaal/"]];
}

- (void)English2 {
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"twitter://user?screen_name=iGeorgeTaylor"]]) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"twitter://user?screen_name=iGeorgeTaylor"]];
    } else {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://twitter.com/iGeorgeTaylor"]];
    }
}

- (void)Finnish {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.reddit.com/u/Rousku_/"]];
}

- (void)French {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.reddit.com/u/Ziph0n/"]];
}

- (void)German {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.reddit.com/u/J0elll98123/"]];
}

- (void)Hindi {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.reddit.com/u/SalmanBurhan/"]];
}

- (void)Romanian {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.reddit.com/u/bobyroach/"]];
}

- (void)Russian {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.reddit.com/u/AOkhtenberg/"]];
}

- (void)Spanish1 {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.reddit.com/u/ElTsued/"]];
}

- (void)Spanish2 {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.reddit.com/u/Chino270/"]];
}

- (void)Turkish {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.reddit.com/u/foutley/"]];
}

- (void)Vietnamese {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.reddit.com/u/Dantae4C/"]];
}

@end

// vim:ft=objc