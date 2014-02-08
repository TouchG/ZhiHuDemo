//
//  QFViewController.m
//  ZhiHuDemo
//
//  Created by administrator on 14-1-21.
//  Copyright (c) 2014年 GSX. All rights reserved.
//

#import "QFViewController.h"
#import "QFDetailViewController.h"

@interface QFViewController ()<UITableViewDataSource, UITableViewDelegate, NSURLConnectionDataDelegate>
{
    UITableView     *_mainTable;
    NSMutableArray  *_newsArray;
    NSMutableData   *_receivedData;
}

@end

@implementation QFViewController


-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        
        _newsArray = [[NSMutableArray alloc] init];
        _receivedData = [[NSMutableData alloc] init];
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
//    self.navigationController.navigationBarHidden = TRUE;
    
    if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0")) {
        
        [self setAutomaticallyAdjustsScrollViewInsets:NO];
        [self setEdgesForExtendedLayout:UIRectEdgeNone];
    }
    
    _mainTable = [[UITableView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:_mainTable];
    
    _mainTable.dataSource = self;
    _mainTable.delegate = self;
    
    
    [self loadDataFormServer];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
- (void)loadDataFormServer
{
    NSURL *url = [NSURL URLWithString:@"http://news-at.zhihu.com/api/2/news/latest?client=0"];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url
                                                  cachePolicy:NSURLRequestReloadIgnoringLocalCacheData
                                              timeoutInterval:60];
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request
                                                                  delegate:self
                                                          startImmediately:YES];
    [connection start];
}

#pragma mark -
#pragma mark NSURLConnetion Delegate

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    [_receivedData setLength:0];
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [_receivedData appendData:data];
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSError *outError = nil;
    NSDictionary *newsAtLatestDict = [NSJSONSerialization JSONObjectWithData:_receivedData
                                                                     options:NSJSONReadingAllowFragments | NSJSONWritingPrettyPrinted
                                                                       error:&outError];
    if (!outError) {
        
        [_newsArray addObject:newsAtLatestDict];
        [_mainTable reloadData];
    }
}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"请求出错----------%@",error.localizedDescription);
}


#pragma mark- 
#pragma mark UITableView DataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [_newsArray count];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSDictionary *newsDict = [_newsArray objectAtIndex:section];
    NSArray *newsListArr = [newsDict objectForKey:@"news"];
    
    return [newsListArr count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"NEWS_CELL";
    
    UITableViewCell *newsCell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!newsCell) {
        
        newsCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        
        newsCell.textLabel.numberOfLines = 0;
        newsCell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
        newsCell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    NSDictionary *newsDict = [_newsArray objectAtIndex:indexPath.section];
    NSArray *newsListArr = [newsDict objectForKey:@"news"];
    NSDictionary *newsContent = [newsListArr objectAtIndex:indexPath.row];
    
    newsCell.textLabel.text = [newsContent objectForKey:@"title"];
    
    
    
//    NSString *thumbNail = [newsContent objectForKey:@"thumbnail"];
//    NSURL *imageURL = [NSURL URLWithString:thumbNail];
//    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:imageURL
//                                                  cachePolicy:NSURLRequestReturnCacheDataElseLoad
//                                              timeoutInterval:60];
//    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request
//                                                                  delegate:self
//                                                          startImmediately:YES];
//    [connection start];
    newsCell.imageView.image = [UIImage imageNamed:@"Image_Preview"];
    
    return newsCell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 84;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *newsDict = [_newsArray objectAtIndex:indexPath.section];
    NSArray *newsListArr = [newsDict objectForKey:@"news"];
    NSDictionary *newsContent = [newsListArr objectAtIndex:indexPath.row];
    
    QFDetailViewController *detailViewController = [[QFDetailViewController alloc] init];
    [detailViewController setLoadURL:[newsContent objectForKey:@"url"]];
    
    [self.navigationController pushViewController:detailViewController animated:YES];
}


-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *sectionHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 38)];
    sectionHeaderView.backgroundColor = [UIColor colorWithRed:0.115 green:0.511 blue:0.796 alpha:1.000];
    
    UILabel *headerTitleLabel = [[UILabel alloc] initWithFrame:sectionHeaderView.frame];
    headerTitleLabel.backgroundColor = [UIColor clearColor];
    headerTitleLabel.textAlignment = NSTextAlignmentCenter;
    headerTitleLabel.textColor = [UIColor whiteColor];
    
    NSString *title = nil;
    
    if (section == 0) {
        
        title = @"今日热闻";
    }
    else {
        
        
        NSDictionary *newsDict = [_newsArray objectAtIndex:section];
        title = [newsDict objectForKey:@"display_date"];
    }
    
    headerTitleLabel.text = title;
    [sectionHeaderView addSubview:headerTitleLabel];
    
    return sectionHeaderView;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 38;
}

@end
