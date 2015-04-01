#import <Preferences/Preferences.h>

@interface WelcomeText: PSListController {
}
@end

@implementation WelcomeText
- (id)specifiers {
        if(_specifiers == nil) {
                _specifiers = [[self loadSpecifiersFromPlistName:@"WelcomeText" target:self] retain];
        }
        return _specifiers;
}

@end

// vim:ft=objc