//
//  QFViewController.m
//  ZhiHuDemo
//
//  Created by administrator on 14-1-21.
//  Copyright (c) 2014年 GSX. All rights reserved.
//

#import "QFViewController.h"

@interface QFViewController ()<UITableViewDataSource, UITableViewDelegate>
{
    UITableView     *_mainTable;
    NSMutableArray  *_newsArray;
}

@end

@implementation QFViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    _mainTable = [[UITableView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:_mainTable];
    
    _mainTable.dataSource = self;
    _mainTable.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark- 
#pragma mark UITableView DataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    
}

@end
