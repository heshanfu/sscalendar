//
//  SSCalendarDailyViewController.h
//  Pods
//
//  Created by Steven Preston on 7/26/13.
//  Copyright (c) 2013 Stellar16. All rights reserved.
//

#import "SSContentViewController.h"

@class SSCalendarWeekViewController, SSCalendarDayViewController, SSDayNode;

@interface SSCalendarDailyViewController : SSContentViewController <UICollectionViewDelegateFlowLayout>
{
    IBOutlet UIView *headerView;
    IBOutlet UIView *separatorView;
    IBOutlet NSLayoutConstraint *separatorViewHeightConstraint;
    IBOutlet UIBarButtonItem *todayBarButtonItem;
}

@property (nonatomic, strong) SSDayNode *day;
@property (nonatomic, copy) NSArray *years;
@property (nonatomic, strong) NSIndexPath *startingIndexPath;

@property (nonatomic, strong) IBOutlet UICollectionView *weekView;
@property (nonatomic, strong) SSCalendarWeekViewController *weekViewController;
@property (nonatomic, strong) IBOutlet UILabel *dateLabel;
@property (nonatomic, strong) IBOutlet UICollectionView *dayView;
@property (nonatomic, strong) SSCalendarDayViewController *dayViewController;

- (IBAction)todayPressed:(id)sender;

@end