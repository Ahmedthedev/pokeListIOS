//
//  AppDelegate.m
//  PokeList
//
//  Created by Jeyaksan RAJARATNAM on 14/01/2017.
//  Copyright © 2017 grp1.moc. All rights reserved.
//

#import "AppDelegate.h"
#import "Tools.h"
#import "RootViewController.h"
@import GoogleMaps;

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Chargement de la clé de l'api dans les services GMap
    [GMSServices provideAPIKey:@"AIzaSyCYCZvYrGhaw-lWETvIQ-dHnVxMdLkxWaE"];
    RootViewController* rootViewController = [[RootViewController alloc] init]; // Construction
    UINavigationController* navigationController = [[UINavigationController alloc]initWithRootViewController:rootViewController];
    CGRect screenRect = [UIScreen mainScreen].bounds; // Récup taille ecran courant
    UIWindow* window = [[UIWindow alloc] initWithFrame:screenRect]; // creation de la fenetre
    navigationController.navigationBar.barTintColor = [Tools UIColorFromRGB:0xB71C1C];
    navigationController.navigationBar.tintColor = [UIColor whiteColor];
    [navigationController.navigationBar
     setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    window.rootViewController = navigationController;
    [window makeKeyAndVisible];
    self.window = window; // Passer la nouvelle fenetre a la fenetre courant [frame]
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
