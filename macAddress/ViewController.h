//
//  ViewController.h
//  macAddress
//
//  Created by Qualtop Group on 06/04/18.
//  Copyright © 2018 Izzi.testMac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

/**
 Obtiene los datos de la red

 @param sender el boton que invoca el evento
 */
- (IBAction)btnGetDataWifi:(UIButton *)sender;

/**
 Limpa los datos de la intefaz de usuario

 @param sender el boton que invoca el evento
 */
- (IBAction)btnCleanData:(UIButton *)sender;

/**
 TextView con toda la información de la red
 */
@property (weak, nonatomic) IBOutlet UITextView *txtInfo;
/**
 Label con la dirección mac o bssin de la red
 */
@property (weak, nonatomic) IBOutlet UILabel *lblMac;

@end

