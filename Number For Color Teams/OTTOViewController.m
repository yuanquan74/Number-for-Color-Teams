//
//  OTTOViewController.m
//  Number For Color Teams
//
//  Created by Quan Yuan on 1/13/14.
//  Copyright (c) 2014 Quan Yuan. All rights reserved.
//

#import "OTTOViewController.h"

@interface OTTOViewController ()
@property (weak, nonatomic) IBOutlet UIView *yellowBlock;
- (IBAction)startButton:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *centerButton;
@property (weak, nonatomic) IBOutlet UIButton *cornerButton;
- (IBAction)pushConerButton:(id)sender;
- (IBAction)clickOnYellow:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *yellowLable;


@end

@implementation OTTOViewController {
    NSMutableString * programStatus;
    OTTOMagicJar *yellowJar;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    programStatus = [[NSMutableString alloc] init];
    [programStatus setString:@"idle"];
    [[self centerButton] setTitle:@"Start" forState:UIControlStateNormal];
    [[self cornerButton] setTitle:@"Setting" forState:UIControlStateNormal];
    yellowJar=[[OTTOMagicJar alloc] init];
    [yellowJar initJar];
    [yellowJar fillJar:16];


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startButton:(id)sender {
    if ([programStatus isEqualToString:@"in game"]) {
        //add code to do next round
        [[self centerButton] setTitle:@"Next Round" forState:UIControlStateNormal];
        [[self cornerButton] setTitle:@"End" forState:UIControlStateNormal];

    } else if ([programStatus isEqualToString:@"idle"]) {
        //add code to start the game here
        [[self centerButton] setTitle:@"Next Round" forState:UIControlStateNormal];
        [programStatus setString:@"in game"];
        [[self cornerButton] setTitle:@"End" forState:UIControlStateNormal];

    } else if ([programStatus isEqualToString:@"in setting"]) {
        //add code to end the setting here
        [[self centerButton] setTitle:@"Start" forState:UIControlStateNormal];
        [programStatus setString: @"idle"];
        [[self cornerButton] setTitle:@"Setting" forState:UIControlStateNormal];

    }

   

}
- (IBAction)pushConerButton:(id)sender {
    if ([programStatus isEqualToString:@"in game"]) {
        //add code to do next round
        [[self centerButton] setTitle:@"Start" forState:UIControlStateNormal];
        [programStatus setString: @"idle"];
        [[self cornerButton] setTitle:@"Setting" forState:UIControlStateNormal];
    } else if ([programStatus isEqualToString:@"idle"]) {
        //add code to start setting here
        [[self centerButton] setTitle:@"Done" forState:UIControlStateNormal];
        [programStatus setString: @"in setting"];
        [[self cornerButton] setTitle:@" " forState:UIControlStateNormal];
    }
}

- (IBAction)clickOnYellow:(id)sender {
    int myNumber = [yellowJar drawOneTicket];
    NSString * myString = [NSString stringWithFormat:@"%i",myNumber];
    
    [[self yellowLable] setText:myString];
    
}


@end
