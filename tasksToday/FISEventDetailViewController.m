//
//  FISEventDetailViewController.m
//  tasksToday
//
//  Created by Michael Amundsen on 6/20/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

#import "FISEventDetailViewController.h"
#import <EventKit/EventKit.h>

@interface FISEventDetailViewController ()
@property (weak, nonatomic) IBOutlet UITextView *detailViewTextField;

@end

@implementation FISEventDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSMutableString *eventList = [@"" mutableCopy];
    NSUInteger eventCount = 0;
    for (EKEvent *event in self.eventList) {
        if (eventCount == 0) {
            [eventList appendString:event.title];
            eventCount++;
        } else {
            [eventList appendFormat:@"\n%@", event.title];
        }
    }
    self.detailViewTextField.text = eventList;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/



@end
