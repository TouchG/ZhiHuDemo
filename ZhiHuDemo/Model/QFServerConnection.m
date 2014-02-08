//
//  QFServerConnection.m
//  ZhiHuDemo
//
//  Created by administrator on 14-1-22.
//  Copyright (c) 2014年 GSX. All rights reserved.
//

#import "QFServerConnection.h"
#import <ASIHTTPRequest.h>

#define NEWS_URL    @"http://news-at.zhihu.com/api/2/news/"

@interface QFServerConnection ()

@property (nonatomic, strong) NSOperationQueue *serverQueue;

@end

@implementation QFServerConnection

-(NSOperationQueue *)serverQueue
{
    if (!_serverQueue) {
        
        _serverQueue = [[NSOperationQueue alloc] init];
    }
    
    return _serverQueue;
}

/*
- (void)grabURLInTheBackground:(id)sender
{
    NSURL *url = [NSURL URLWithString:@"http://allseeing-i.com"];
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
    [request setDelegate:self];
    [request setDidFinishSelector:@selector(requestDone:)];
    [request setDidFailSelector:@selector(requestWentWrong:)];
    [self.serverQueue addOperation:request]; //queue is an NSOperationQueue
}
 */

- (NSDictionary *)getLatestNews
{
    NSURL *url = [NSURL URLWithString:@"http://news-at.zhihu.com/api/2/news/latest?client=0"];
    
    NSData *data = [NSData dataWithContentsOfURL:url];
    
    NSError *outError;
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data
                                                         options:NSJSONReadingMutableContainers | NSJSONReadingMutableLeaves | NSJSONReadingAllowFragments error:&outError];
    if (!outError) {
        
        NSLog(@"-----%@", dict);
    }
    
    return dict;
}
- (NSDictionary *)getBeforeNews
{
    return nil;
}
- (NSDictionary *)getNewsAtDate:(NSString *)date
{
    return nil;
}

@end
