//
//  ChessboardCell.h
//  EightQueensProject
//
//  Created by Admin on 19/10/2012.
//  Copyright (c) 2012 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ChessboardCell : NSObject
{
    BOOL isOccupied;
    BOOL isUnderArrack;
}
- (BOOL) isOccupied;
- (void) setOccupied;
- (void) resetOccupied;
- (BOOL) isUnderAttack;
- (void) setUnderAttack;
- (void) resetUnderAttack;
@end
