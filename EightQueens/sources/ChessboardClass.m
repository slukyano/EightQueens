//
//  ChessboardClass.m
//  EightQueensProject
//
//  Created by Admin on 19/10/2012.
//  Copyright (c) 2012 Admin. All rights reserved.
//

#import "ChessboardClass.h"
#import "ChessboardCell.h"
#import <stdio.h>

@implementation ChessboardClass

- (id) init
{
    self = [super init];
    
    if (self)
    {
        cells = [[NSMutableArray alloc] init];
        
        for (int i = 0; i < 8; i++)
        {
            NSMutableArray *row = [[NSMutableArray alloc] init];
            
            for (int j = 0; j < 8; j++)
            {
                ChessboardCell *newCell = [[ChessboardCell alloc] init];
                
                [row addObject: newCell];
                
                [newCell release];
            }
            
            [cells addObject: row];
            
            [row release];
        }
    }
    
    return self;
}

- (void) dealloc
{
    [cells removeAllObjects];
    [cells release];
    
    [super dealloc];
}

- (ChessboardCell*) cellAtRow: (int)row atColumn: (int)column
{
    return [[cells objectAtIndex: row] objectAtIndex: column];
}

- (BOOL) isCellUnderAttackAtRow: (int)row atColumn: (int)column
{
    return [[self cellAtRow: row atColumn: column] isUnderAttack];
}

- (void) update
{
    for (int i = 0; i < 8; i++)
    {
        for (int j = 0; j < 8; j++)
        {
            [[self cellAtRow: i atColumn: j] resetUnderAttack];
        }
    }
    
    for (int i = 0; i < 8; i++)
    {
        for (int j = 0; j < 8; j++)
        {
            if ([[self cellAtRow: i atColumn: j] isOccupied])
            {
                for (int k = 0; k < 8; k++)
                {
                    if (k != j)
                        [[self cellAtRow: i atColumn: k] setUnderAttack];
                    
                    if (k != i)
                        [[self cellAtRow: k atColumn: j] setUnderAttack];
                    
                    if (((i + k) < 8) && ((j + k) < 8))
                        [[self cellAtRow: (i + k) atColumn: (j + k)] setUnderAttack];
                    
                    if (((i - k) > 0) && ((j - k) > 0))
                        [[self cellAtRow: (i - k) atColumn: (j - k)] setUnderAttack];
                    
                    if (((i + k) < 8) && ((j - k) > 0))
                        [[self cellAtRow: (i + k) atColumn: (j - k)] setUnderAttack];
                    
                    if (((i - k) > 0) && ((j + k) < 8))
                        [[self cellAtRow: (i - k) atColumn: (j + k)] setUnderAttack];
                }
            }
        }
    }
}

- (void) placeQueenAtRow: (int)row atColumn: (int)column
{
    [[self cellAtRow: row atColumn: column] setOccupied];
    [self update];
}

- (void) clearCellAtRow: (int)row atColumn: (int)column
{
    [[self cellAtRow: row atColumn: column] resetOccupied];
    [self update];
}

- (int) findColumnForQueenAtRow: (int)row columnEqualOrGreater: (int)minColumn
{
    for (int i = minColumn; i < 8; i++)
    {
        if ([self isCellUnderAttackAtRow: row atColumn: i])
        {
            continue;
        }
        else
        {
            return i;
        }
    }
             
    return -1;
}

- (BOOL) solveProblemAtRow: (int)row
{
    int column = -1;
    
    for (;;)
    {
        column = [self findColumnForQueenAtRow: row columnEqualOrGreater: (column + 1)];
        if (column == -1)
            return NO;
        
        [self placeQueenAtRow: row atColumn: column];
        
        if (row == 7)
            return YES;
        if ([self solveProblemAtRow: (row + 1)])
            return YES;
        else
        {
            [self clearCellAtRow: row atColumn: column];
        }
    }
}

- (void) printChessboard
{
    for (int i = 0; i < 8; i++)
    {
        for (int j = 0; j < 8; j++)
        {
            if ([[self cellAtRow: i atColumn: j] isOccupied])
                printf("Q");
            else
                printf("0");
        }
        
        printf("\n");
    }
}

@end
