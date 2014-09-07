//
//  ViewController.h
//  beaconsscanner
//
//  Created by HUGE | Atish Narlawar on 8/5/14.
//  Copyright (c) 2014 HugeInc. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <HGBeaconManager/HGBeaconManager.h>
#import <HGBeaconManager/HGBeaconUUID.h>

@interface ViewController : UIViewController <HGBeaconManagerProtocol>

@property (nonatomic, strong) UILabel *label;

@end

