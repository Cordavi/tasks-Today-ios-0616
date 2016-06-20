//
//  FISCustomRangeViewController.m
//  tasksToday
//
//  Created by Michael Amundsen on 6/20/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

#import "FISCustomRangeViewController.h"
#import "FISEventDetailViewController.h"
#import <EventKit/EventKit.h>

@interface FISCustomRangeViewController ()

@end

@implementation FISCustomRangeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    FISEventDetailViewController *customDateEventView = [segue destinationViewController];
    customDateEventView.eventList = [self getDateRangeEvents];
    
}

- (NSArray *)getDateRangeEvents {
    EKEventStore *store = [[EKEventStore alloc] init];
    
    // Create the predicate from the event store's instance method
    NSPredicate *predicate = [store predicateForEventsWithStartDate:self.startDate.date
                                                            endDate:self.endDate.date
                                                          calendars:nil];
    
    // Fetch all events that match the predicate
    NSArray *events = [store eventsMatchingPredicate:predicate];
    return events;
}


@end
