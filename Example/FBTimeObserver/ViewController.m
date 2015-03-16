//
//  ViewController.m
//  FBTimeObserver
//
//  Created by Alekseenko Oleg on 16.03.15.
//  Copyright (c) 2015 alekoleg. All rights reserved.
//

#import "ViewController.h"
#import "FBUnactiveAppTimeObserver.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [[FBUnactiveAppTimeObserver observer] registerObserver:self forTimeInterval:100 block:^{
        <#code#>
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
