#import "VMAuthorListController.h"
#import "BDInfoListController.h"
#import <Preferences/PSSpecifier.h>

extern UIApplication *UIApp;

@implementation VMAuthorListController
- (NSArray *)specifiers {
  if (!_specifiers) {
        _specifiers = [NSMutableArray new];

        PSSpecifier* spec;

        spec=[PSSpecifier emptyGroupSpecifier];
        [_specifiers addObject:spec];

        spec = [PSSpecifier preferenceSpecifierNamed:@"vasirakcalgux"
                                              target:self
                                                 set:NULL
                                                 get:NULL
                                              detail:Nil
                                                cell:PSLinkCell
                                                edit:Nil];
        spec->action = @selector(openvasirakcalgux);
        [_specifiers addObject:spec];


        spec=[PSSpecifier emptyGroupSpecifier];
        [spec setProperty:VMNSLocalizedString(@"AUTHOR_AUDIO_MIX") forKey:@"footerText"];
        [_specifiers addObject:spec];

        spec = [PSSpecifier preferenceSpecifierNamed:@"onewayticket255"
                                              target:self
                                                 set:NULL
                                                 get:NULL
                                              detail:Nil
                                                cell:PSButtonCell
                                                edit:Nil];
        spec->action = @selector(openOnewayticket);
        [_specifiers addObject:spec];

  }

  return _specifiers;
}
- (void)openvasirakcalgux{
  UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
  self.navigationItem.backBarButtonItem = backItem; 
  [self.navigationController pushViewController:[[BDInfoListController alloc] init] animated:YES];
}
- (void)openOnewayticket{
  NSURL *url = [NSURL URLWithString:@"https://github.com/onewayticket255"];
  if ([[UIApplication sharedApplication] respondsToSelector:@selector(openURL:options:completionHandler:)]) {
    [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];
  } else {
    [[UIApplication sharedApplication] openURL:url];
  }
}

@end
