//
//  ViewController.m
//  ChuckNorrisIOS
//
//  Created by Ryan McCracken on 6/30/14.
//  Copyright (c) 2014 Sagetech LLC. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    CGRect chuckRect = CGRectMake(0, 341, 320, 227);
    UIView *chuckUzis = [[UIView alloc] initWithFrame:chuckRect];
    chuckUzis.backgroundColor = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"chuck-norris-uzis.jpg"]];
    [self.view addSubview:chuckUzis];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
