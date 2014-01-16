//
//  OTTOMagicJar.m
//  Number Draw
//
//  Created by Quan Yuan on 1/8/14.
//  Copyright (c) 2014 Quan Yuan. All rights reserved.
//

#import "OTTOMagicJar.h"


@implementation OTTOMagicJar {

    NSMutableArray *level;
    NSInteger totalLevel;
    NSInteger totalTicket;
    NSInteger levelFactor;
    
}

- (void)initJar {
    level=[NSMutableArray array];
    //levelFactor can be a dynamiclly equal to total number of tickets
    levelFactor=2;
}

- (void)fillJar: (int)numberOfTickets
{

    level=[NSMutableArray array];
    totalTicket=numberOfTickets;
    NSMutableArray *slots;
    slots=[NSMutableArray array];
    
    for (int i=1;i<=totalTicket;i++) {
        NSNumber *slot=[NSNumber numberWithInt: i];
        [slots addObject: slot];
    }
    
    [level addObject:slots];
    
}


- (int) drawOneTicket
{
    
    totalLevel=[level count];
    
    int totalWeight = 0;
    NSMutableArray *slot;
    int indexLevel=0;
    
    for (slot in level) {
        
        totalWeight+=[slot count]*pow(levelFactor,(totalLevel-indexLevel-1));
        indexLevel++;
    }
    
    int r;
    if (arc4random_uniform != NULL)
        r = arc4random_uniform (totalWeight);
    else
        r = (arc4random() % totalWeight);
    
    
    int remaining=r;
    indexLevel=0;
    int slotLength;
    int slotWeight;
    int targetSlot;
    int ticketValue;
    int levelDivider;
    NSNumber *picketTicket;
    for (slot in level) {
        slotLength=[slot count];
        levelDivider=pow(levelFactor,(totalLevel-indexLevel-1));
        slotWeight=slotLength*levelDivider;
        if (remaining<=slotWeight) {
            targetSlot=remaining/levelDivider;
            if (targetSlot==slotLength)
                targetSlot--;
            picketTicket=[slot objectAtIndex:targetSlot];
            ticketValue=[picketTicket integerValue];
            //start moving this ticket to higher level
            
            //if it's the last level, create new level
            if (indexLevel==(totalLevel-1)) {
                NSMutableArray *newSlots= [NSMutableArray array];
                [level addObject:newSlots];
                totalLevel++;
            };
            [[level objectAtIndex:indexLevel+1] addObject:picketTicket];
            [slot removeObjectAtIndex:targetSlot];
            //if one level is empty, remove the level
            if ([slot count]==0)    {
                [level removeObject:slot];
                totalLevel--;
            }
            return ticketValue;
        }
        remaining=remaining-slotWeight;
        indexLevel++;
    }
    return 0;
}

@end
