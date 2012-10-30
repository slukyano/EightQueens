//
//  main.m
//  EightQueens
//
//  Created by Admin on 20/10/2012.
//  Copyright (c) 2012 LSA. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ChessboardCell.h"
#import "ChessboardClass.h"
#import <stdio.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        ChessboardClass *chessboard = [[ChessboardClass alloc] init];
        
        if ([chessboard solveProblemAtRow: 0])
        {
            printf("Solved!\n");
            [chessboard printChessboard];
        }
        else
        {
            printf("There is no solution.");
        }
        
        [chessboard release];
    }
    return 0;
}

