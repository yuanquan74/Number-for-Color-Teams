//
//  OTTOMagicJar.h
//  Number Draw
//
//  Created by Quan Yuan on 1/8/14.
//  Copyright (c) 2014 Quan Yuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OTTOMagicJar : NSObject

- (int) drawOneTicket;
- (void) fillJar: (int)totalTickets;
- (void) initJar;

/*initially all tickers are stored in level1, each time one tickets is drawed, it will be put into next level (level 2) and has less chance to be drawed. For picking tickets, first decide which level to pick (function of number of tickets, weight of each level), then randomly pick 1 tickets from that level*/


@end