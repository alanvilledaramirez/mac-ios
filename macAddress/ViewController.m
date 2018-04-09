//
//  ViewController.m
//  macAddress
//
//  Created by Qualtop Group on 06/04/18.
//  Copyright © 2018 Izzi.testMac. All rights reserved.
//
@import SystemConfiguration.CaptiveNetwork;
#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



/**
 Obtiene los datos de la red
 y se pintan en la interfaz de usuario
 
 @param sender el boton que invoca el evento
 */
- (IBAction)btnGetDataWifi:(UIButton *)sender {
    NSDictionary * dicInfo = [self fetchSSIDInfo];
    if (dicInfo) {
        NSString * mac = [dicInfo objectForKey:@"BSSID"];
        self.txtInfo.text = [NSString stringWithFormat:@"%@",dicInfo];
        if (mac) {
            self.lblMac.text = [NSString stringWithFormat:@"MAC: %@",mac];
        }
    }
}

/**
 Limpa los datos de la intefaz de usuario
 
 @param sender el boton que invoca el evento
 */
- (IBAction)btnCleanData:(UIButton *)sender {
    self.txtInfo.text = @"";
    self.lblMac.text = @"";
}


/**
 Metodo que realiza la busqueda de la información
 de la red

 @return diccionario con la informacion de la red
 */
- (NSDictionary *)fetchSSIDInfo
{
    NSArray *interfaceNames = CFBridgingRelease(CNCopySupportedInterfaces());
    NSLog(@"%s: Supported interfaces: %@", __func__, interfaceNames);
    
    NSDictionary *SSIDInfo;
    for (NSString *interfaceName in interfaceNames) {
        SSIDInfo = CFBridgingRelease(CNCopyCurrentNetworkInfo((__bridge CFStringRef)interfaceName));
        NSLog(@"%s: %@ => %@", __func__, interfaceName, SSIDInfo);
        
        BOOL isNotEmpty = (SSIDInfo.count > 0);
        if (isNotEmpty) {
            break;
        }
    }
    return SSIDInfo;
}
@end
