//
//  ChessboardClass.h
//  EightQueensProject
//
//  Created by Admin on 19/10/2012.
//  Copyright (c) 2012 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ChessboardCell.h"

@interface ChessboardClass : NSObject
{
    NSMutableArray *cells;
}
- (ChessboardCell*) cellAtRow: (int)row atColumn: (int)column;
- (BOOL) isCellUnderAttackAtRow: (int)row atColumn: (int)column;
- (void) update;
- (void) placeQueenAtRow: (int)row atColumn: (int)column;
- (void) clearCellAtRow: (int)row atColumn: (int)column;
- (int) findColumnForQueenAtRow: (int)row columnEqualOrGreater: (int)minColumn;
- (BOOL) solveProblemAtRow: (int)row;
- (void) printChessboard;

@end
