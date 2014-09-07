//
//  ViewController.m
//  beaconsscanner
//
//  Created by HUGE | Atish Narlawar on 8/5/14.
//  Copyright (c) 2014 HugeInc. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@property (nonatomic, strong) HGBeaconManager *beaconManager;

@end

@implementation ViewController

#pragma mark - view lifecycle


- (void)viewDidLoad {
    [super viewDidLoad];
    
    HGBeaconUUID *uuid = [[HGBeaconUUID alloc] init];
    uuid.uuid = @"CF4A4210-B9E0-11E3-A5E2-0800200C9A66";
    
    NSArray *arrayToScan = @[uuid];

    self.beaconManager = [[HGBeaconManager alloc] initWithUUIDS:arrayToScan];
    self.beaconManager.beaconDelegate = self;
    //
    [self addLabel];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void) addLabel {
    _label =  [[UILabel alloc] initWithFrame:CGRectMake(40, 243, 240, 21)];
    
    _label.textColor = [UIColor redColor];
    _label.backgroundColor = [UIColor whiteColor];
    _label.text = @"Label";
    
    [self.view addSubview:self.label];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)beaconManager:(HGBeaconManager*)beaconManager foundBeacon:(CLBeacon *)beacon {
    NSLog(@"found beacon");
}
- (void)beaconManager:(HGBeaconManager*)beaconManager lostBeacon:(CLBeacon *)beacon {
    NSLog(@"lost");
}
- (void)statusChange:(HGBeaconManager*)beaconManager stateChange:(CBPeripheralManagerState)newState {
    NSLog(@"New State");
    
    if (newState == CBPeripheralManagerStatePoweredOn) {
        [self.beaconManager startScanning];
    } else {
        NSLog(@"turn on bluetooth!!!!");
    }
}


@end
