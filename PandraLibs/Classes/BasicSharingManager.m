//
// Created by Admin on 04.10.14.
// Copyright (c) 2014 Pandra. All rights reserved.
//


#import "BasicSharingManager.h"
@implementation BasicSharingManager {
    UIActionSheet *socialSelector;
    SHKVkontakte *vk;
    SHKFacebook *facebook;
    SHKTwitter *twitter;
    UIImage *loadedImage;
    bool sharing;
    SHKItem *currentItem;
    
}
- (instancetype)init {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(sharerAuthorized:) name:@"SHKAuthDidFinish" object:nil];
    vk = [[SHKVkontakte alloc] init];
    facebook = [[SHKFacebook alloc] init];
    twitter = [[SHKTwitter alloc] init];
    return (BasicSharingManager *) [super init];
}

- (void)sharerAuthorized:(NSNotification *)notification {
    NSLog(@"sharerAuthorized");
    if (sharing) {
        sharing = false;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 0.5 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
            [self mySharerAuthDidFinish:notification.object success:[notification.userInfo[@"success"] boolValue]];
        });
    }
}

-(void)share:(SHKItem*)item{
    sharing = true;
    currentItem = item;
    [self showSelector];
}

- (void)showSelector {
    UIActionSheet *socialSelectorActionSheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"Отмена" destructiveButtonTitle:nil otherButtonTitles:@"Facebook", @"Twitter",@"Vkontakte", nil];
    [socialSelectorActionSheet showInView:[UIApplication sharedApplication].keyWindow];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    NSLog(@"actionSheet  clickedButtonAtIndex %d",buttonIndex);
    switch (buttonIndex) {
        case 0:
            [self shareItem:currentItem inSocialNetwork:SharingNetworkTypeFacebook];
            break;
        case 1:
            [self shareItem:currentItem inSocialNetwork:SharingNetworkTypeTwitter];
            break;
        case 2:
            [self shareItem:currentItem inSocialNetwork:SharingNetworkTypeVk];
            break;
        default:
            break;
    }
}

-(void)shareItem:(SHKItem*)item inSocialNetwork:(SharingNetworkType)type{
    NSLog(@"shareItem  inSocialNetwork %d",type);
    switch (type) {
        case SharingNetworkTypeFacebook:
            if ([SHKFacebook isServiceAuthorized]) {
                [SHKFacebook shareItem:item];
            } else {
                [facebook authorize];
            }
            break;
        case SharingNetworkTypeTwitter:
            if ([SHKTwitter isServiceAuthorized]) {
                [SHKTwitter shareItem:item];
            } else {
                
                [twitter authorize];
            }
            break;
        case SharingNetworkTypeVk:
            if ([SHKVkontakte isServiceAuthorized]) {
                [SHKVkontakte shareItem:item];
            } else {
                [vk authorize];
            }
            break;
            
        default:
            break;
    }
    
}


- (void)mySharerAuthDidFinish:(SHKSharer *)sharer success:(BOOL)success {
    if(success){
        NSLog(@"mySharerAuthDidFinish Success %@",sharer);
    }else{
        NSLog(@"mySharerAuthDidFinish NotSuccess %@",sharer);
    }
    if ([sharer isKindOfClass:[SHKVkontakte class]]) {
        [SHKVkontakte shareItem:currentItem];
    } else if ([sharer isKindOfClass:[SHKFacebook class]]) {
        NSLog(@"Sharing item! %@",currentItem);
        [SHKFacebook shareItem:currentItem];
    } else if ([sharer isKindOfClass:[SHKTwitter class]]) {
        [SHKTwitter shareItem:currentItem];
    }
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end