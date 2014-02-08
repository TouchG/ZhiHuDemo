//
//  QFDetailViewController.m
//  ZhiHuDemo
//
//  Created by administrator on 14-1-23.
//  Copyright (c) 2014年 GSX. All rights reserved.
//

#import "QFDetailViewController.h"

@interface QFDetailViewController ()<NSURLConnectionDataDelegate>
{
    UIWebView *_webView;
    
    NSMutableData *_receiveData;
}

@end

@implementation QFDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        _receiveData = [[NSMutableData alloc] init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    _webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:_webView];
    
    
    if (self.loadURL) {
        
        NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:_loadURL]];
        NSURLConnection *connetion = [[NSURLConnection alloc] initWithRequest:request
                                                                     delegate:self
                                                             startImmediately:YES];
        [connetion start];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark NSURLConnnetion Delegate

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    [_receiveData setLength:0];
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [_receiveData appendData:data];
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSError *outError = nil;
    NSDictionary *detailContent = [NSJSONSerialization JSONObjectWithData:_receiveData
                                                                   options:NSJSONReadingAllowFragments
                                                                     error:&outError];
    if (!outError) {
        
        NSString *htmlContent = [detailContent objectForKey:@"body"];
        NSString *path = [[NSBundle mainBundle] pathForResource:@"default" ofType:@"css"];
        [_webView loadHTMLString:htmlContent baseURL:[NSURL URLWithString:path]];
    }
}


@end
