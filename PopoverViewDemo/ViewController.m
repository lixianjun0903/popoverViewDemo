//
//  ViewController.m
//  PopoverViewDemo
//
//  Created by guojiang on 4/9/14.
//  Copyright (c) 2014年 guojiang. All rights reserved.
//

#import "ViewController.h"
#import "PopoverView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 有图标按钮
    UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:CGRectMake(40, 100,100 , 60)];
    [button setBackgroundColor:[UIColor orangeColor]];
    [button setTitle:@"有图标pop" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [button.titleLabel setFont:[UIFont systemFontOfSize:15]];
    [button addTarget:self action:@selector(button1Clicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    // 无图标按钮
    UIButton *button2=[UIButton buttonWithType:UIButtonTypeCustom];
    [button2 setFrame:CGRectMake(180, 100,100 , 60)];
    [button2 setBackgroundColor:[UIColor orangeColor]];
    [button2 setTitle:@"无图标pop" forState:UIControlStateNormal];
    [button2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button2 setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [button2.titleLabel setFont:[UIFont systemFontOfSize:15]];
    [button2 addTarget:self action:@selector(button2Clicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];
    
}


-(void)button1Clicked:(UIButton *)sender
{
    CGPoint point = CGPointMake(sender.frame.origin.x + sender.frame.size.width/2, sender.frame.origin.y + sender.frame.size.height);
    NSArray *titles = @[@"销量1销量2销量", @"价格", @"评论",@"销量1销量2销量", @"价格", @"评论"];
    NSArray *images = @[@"28b.png", @"28b.png", @"28b.png"];
    PopoverView *pop = [[PopoverView alloc] initWithPoint:point titles:titles images:images];
    pop.selectRowAtIndex = ^(NSInteger index){
        NSLog(@"select index:%ld", index);
    };
    
    [pop show];
    
}

-(void)button2Clicked:(UIButton *)sender
{
    CGPoint point = CGPointMake(sender.frame.origin.x + sender.frame.size.width/2, sender.frame.origin.y + sender.frame.size.height);
    NSArray *titles = @[@"item1", @"选项2", @"选项3"];
    PopoverView *pop = [[PopoverView alloc] initWithPoint:point titles:titles images:nil];
    pop.selectRowAtIndex = ^(NSInteger index){
        NSLog(@"select index:%ld", index);
    };
    
    [pop show];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
   
}

@end
