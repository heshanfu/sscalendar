//
//  SSCalendarYearViewController.m
//  Pods
//
//  Created by Steven Preston on 7/29/13.
//  Copyright (c) 2013 Stellar16. All rights reserved.
//

#import "SSCalendarYearViewController.h"
#import "SSCalendarYearHeaderView.h"
#import "SSCalendarAnnualLayout.h"
#import "SSCalendarMonthCell.h"
#import "SSCalendarMonthViewController.h"
#import "SSCalendarUtils.h"
#import "SSYearNode.h"

@implementation SSCalendarYearViewController

- (id)initWithView:(UICollectionView *)view
{
    self = [super init];
    if (self)
    {
        self.view = view;
        _view.collectionViewLayout = [[SSCalendarAnnualLayout alloc] init];
        
        [view registerNib:[UINib nibWithNibName:@"SSCalendarMonthCell" bundle:nil] forCellWithReuseIdentifier:@"MonthCell"];
        [view registerNib:[UINib nibWithNibName:@"SSCalendarYearHeaderView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"YearHeaderView"];
    }
    return self;
}


#pragma mark - UICollectionViewDataSource Methods

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return _years.count;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    SSYearNode *year = [_years objectAtIndex:section];
    return year.months.count;
}


- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    SSYearNode *year = [_years objectAtIndex:indexPath.section];
    
    SSCalendarYearHeaderView *view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"YearHeaderView" forIndexPath:indexPath];
    view.label.text = [NSString stringWithFormat:@"%li", (long)year.value];
    return view;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    SSYearNode *year = [_years objectAtIndex:indexPath.section];
    
    static NSString *CellIdentifier = @"MonthCell";
    SSCalendarMonthCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    
    cell.month = [year.months objectAtIndex:indexPath.row];
    return cell;
}

@end