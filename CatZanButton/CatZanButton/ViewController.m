//
//  ViewController.m
//  CatZanButton
//
//  Created by MyMac on 15/11/1.
//  Copyright © 2015年 MyMac. All rights reserved.
//

#import "ViewController.h"
#import "CatZanButton.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CatZanButton *zanBtn=[[CatZanButton alloc] initWithFrame:CGRectMake(20, 20, 10, 10) zanImage:[UIImage imageNamed:@"Zan"] unZanImage:[UIImage imageNamed:@"UnZan"]];
    
    [zanBtn setFrame:CGRectMake(100, 100, 20, 20)];
    
    [self.view addSubview:zanBtn];
    
    [zanBtn setType:CatZanButtonTypeFirework];
    
    [zanBtn setClickHandler:^(CatZanButton *zanButton) {
        if (zanButton.isZan) {
            NSLog(@"Zan!");
        }else{
            NSLog(@"Cancel zan!");
        }
    }];

    
    
}

@end
