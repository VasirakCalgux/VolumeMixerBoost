#import "BDInfoListController.h"
#import <Preferences/PSSpecifier.h>

extern UIApplication *UIApp;

@interface PSTableCell()
- (id)iconImageView;
@end

@implementation BDInfoListController
- (void)loadView{
    [super loadView];
    self.navigationItem.title = @"vasirakcalgux";
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    PSTableCell *cell = (PSTableCell *)[super tableView:tableView cellForRowAtIndexPath:indexPath];
    UIImageView *imageView = cell.iconImageView;
    imageView.layer.cornerRadius = 7.0;
    imageView.layer.masksToBounds = YES;
    return cell;
}
- (NSArray *)specifiers {
    if (!_specifiers) {
        _specifiers = [NSMutableArray arrayWithCapacity:5];

        PSSpecifier* spec;

        spec = [PSSpecifier emptyGroupSpecifier];
        [_specifiers addObject:spec];

        spec = [PSSpecifier preferenceSpecifierNamed:@"Follow Me On Twitter"
                                              target:self
                                                 set:NULL
                                                 get:NULL
                                              detail:Nil
                                                cell:PSLinkCell
                                                edit:Nil];
        spec->action = @selector(open_twitter);
        if(@available(iOS 8.0, *)){
            [spec setProperty:@YES forKey:@"hasIcon"];
            [spec setProperty:[UIImage imageNamed:@"twitter" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil] forKey:@"iconImage"];
        }
        [_specifiers addObject:spec];

        spec = [PSSpecifier preferenceSpecifierNamed:@"Donate"
                                              target:self
                                                 set:NULL
                                                 get:NULL
                                              detail:Nil
                                                cell:PSLinkCell
                                                edit:Nil];
        spec->action = @selector(open_paypal);
        if(@available(iOS 8.0, *)){
            [spec setProperty:@YES forKey:@"hasIcon"];
            [spec setProperty:[UIImage imageNamed:@"paypal" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil] forKey:@"iconImage"];
        }
        [_specifiers addObject:spec];


        spec = [PSSpecifier preferenceSpecifierNamed:@"Source Code"
                                              target:self
                                                 set:NULL
                                                 get:NULL
                                              detail:Nil
                                                cell:PSLinkCell
                                                edit:Nil];
        spec->action = @selector(open_github);
        if(@available(iOS 8.0, *)){
            [spec setProperty:@YES forKey:@"hasIcon"];
            [spec setProperty:[UIImage imageNamed:@"github" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil] forKey:@"iconImage"];
        }
        [_specifiers addObject:spec];

        spec = [PSSpecifier preferenceSpecifierNamed:[[NSBundle bundleForClass:[self class]] localizedStringForKey:@"ADD_MY_REPO" value:@"Add my repo" table:@"Root"]
                                              target:self
                                                 set:NULL
                                                 get:NULL
                                              detail:Nil
                                                cell:PSLinkCell
                                                edit:Nil];
        spec->action = @selector(open_cydia);
        if(@available(iOS 8.0, *)){
            [spec setProperty:@YES forKey:@"hasIcon"];
            [spec setProperty:[UIImage imageNamed:@"cydia" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil] forKey:@"iconImage"];
        }
        [_specifiers addObject:spec];


        //
        spec = [PSSpecifier emptyGroupSpecifier];
        [_specifiers addObject:spec];

        spec = [PSSpecifier preferenceSpecifierNamed:@"打赏"
                                              target:self
                                                 set:NULL
                                                 get:NULL
                                              detail:Nil
                                                cell:PSLinkCell
                                                edit:Nil];
        spec->action = @selector(open_alipay);
        if(@available(iOS 8.0, *)){
            [spec setProperty:@YES forKey:@"hasIcon"];
            [spec setProperty:[UIImage imageNamed:@"alipay" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil] forKey:@"iconImage"];
        }
        [_specifiers addObject:spec];


        spec = [PSSpecifier preferenceSpecifierNamed:@"Bilibili"
                                              target:self
                                                 set:NULL
                                                 get:NULL
                                              detail:Nil
                                                cell:PSLinkCell
                                                edit:Nil];
        spec->action = @selector(open_bilibili);
        if(@available(iOS 8.0, *)){
            [spec setProperty:@YES forKey:@"hasIcon"];
            [spec setProperty:[UIImage imageNamed:@"bilibili" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil] forKey:@"iconImage"];
        }
        [_specifiers addObject:spec];
    }
    return _specifiers;
}

- (void)openURL:(NSURL *)url {
    if ([[UIApplication sharedApplication] respondsToSelector:@selector(openURL:options:completionHandler:)]) {
        [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];
    } else {
        [[UIApplication sharedApplication] openURL:url];
    }
}

- (void)open_bilibili{
    if ([UIApp canOpenURL:[NSURL URLWithString:@"bilibili://space/22182611"]]) {
        [self openURL:[NSURL URLWithString:@"bilibili://space/22182611"]];
    } else {
        [self openURL:[NSURL URLWithString:@"https://space.bilibili.com/22182611"]];
    }
}
- (void)open_github{
    [self openURL:[NSURL URLWithString:@"https://github.com/vasirakcalgux/VolumeMixer"]];
}
- (void)open_alipay{
    [self openURL:[NSURL URLWithString:@"https://qr.alipay.com/fkx199226yyspdubbiibddc"]];
}
- (void)open_paypal{
    [self openURL:[NSURL URLWithString:@"https://paypal.me/brend0n"]];
}
- (void)open_cydia{
    if ([UIApp canOpenURL:[NSURL URLWithString:@"cydia://url/https://cydia.saurik.com/api/share#?source=http://vasirakcalgux.github.io"]]){
        [self openURL:[NSURL URLWithString:@"cydia://url/https://cydia.saurik.com/api/share#?source=http://vasirakcalgux.github.io"]];
    }
    else{
        [self openURL:[NSURL URLWithString:@"sileo://source/https://vasirakcalgux.github.io"]];
    }
}
- (void)open_twitter{
    if ([UIApp canOpenURL:[NSURL URLWithString:@"twitter://user?screen_name=vasirakcalgux"]]) {
        [self openURL:[NSURL URLWithString:@"twitter://user?screen_name=vasirakcalgux"]];
    }
    else if ([UIApp canOpenURL:[NSURL URLWithString:@"tweetbot:///user_profile/vasirakcalgux"]]) {
        [self openURL:[NSURL URLWithString:@"tweetbot:///user_profile/vasirakcalgux"]];
    }
    else {
        [self openURL:[NSURL URLWithString:@"https://mobile.twitter.com/vasirakcalgux"]];
    }
}

@end
