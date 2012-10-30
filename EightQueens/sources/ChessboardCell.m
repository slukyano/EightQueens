//
//  ChessboardCell.m
//  EightQueensProject
//
//  Created by Admin on 19/10/2012.
//  Copyright (c) 2012 Admin. All rights reserved.
//

#import "ChessboardCell.h"

@implementation ChessboardCell

- (BOOL) isOccupied
{
    return isOccupied;
}

- (void) setOccupied
{
    isOccupied = YES;
}

- (void) resetOccupied
{
    isOccupied = NO;
}

- (BOOL) isUnderAttack
{
    return isUnderArrack;
}

- (void) setUnderAttack
{
    isUnderArrack = YES;
}

- (void) resetUnderAttack
{
    isUnderArrack = NO;
}

@end
