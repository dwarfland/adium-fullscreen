//
//  FullScreenPlugin.m
//  AdiumFullScreen
//
//  Created by marc hoffman on 10/21/11.
//  Copyright (c) 2011 marc hoffman. All rights reserved.
//

#import <Adium/AIChat.h>
#import <Adium/AIInterfaceControllerProtocol.h>
#import <Adium/AIChatControllerProtocol.h>
#import <Adium/AIStatusControllerProtocol.h>
#import <Adium/AIContactAlertsControllerProtocol.h>

#import "FullScreenPlugin.h"


@implementation FullScreenPlugin 

- (void) installPlugin
{
    NSLog(@"[FullScreenPlugin installPlugin]");
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(chatDidOpen:) name:Chat_DidOpen object:nil];
}

- (void) uninstallPlugin
{
    NSLog(@"[FullScreenPlugin uninstallPlugin]");
}

- (void)chatDidOpen:(NSNotification *)notification
{
    NSLog(@"[FullScreenPlugin chatDidOpen:%@]", [notification userInfo]);
    for (AIChat *c in [[adium chatController] openChats])
    {
        NSWindow *w = [[adium interfaceController] windowForChat:c]; 
        [w setCollectionBehavior:[w collectionBehavior]+NSWindowCollectionBehaviorFullScreenPrimary];
    }
}

- (NSString *)pluginAuthor
{
    return @"marc hoffman";
}

- (NSString *)pluginVersion
{
    return @"0.1";
}

- (NSString *)pluginDescription
{
    return @"Adium Fullscreen support on 10.7";
}

- (NSString *)pluginURL
{
    return @"http://www.marc-hoffman.com";
}

@end
