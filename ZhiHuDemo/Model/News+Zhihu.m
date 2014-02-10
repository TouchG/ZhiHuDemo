//
//  News+Zhihu.m
//  ZhiHuDemo
//
//  Created by administrator on 14-2-10.
//  Copyright (c) 2014年 GSX. All rights reserved.
//

#import "News+Zhihu.h"

@implementation News (Zhihu)

+ (News *)newsWithInfo:(NSDictionary *)dictionary inManagedObjectContext:(NSManagedObjectContext *)context
{
    News *aNews = nil;
    
    NSString  *unique = dictionary[@"id"];
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"News"];
    request.predicate = [NSPredicate predicateWithFormat:@"qa_id = %@",unique];
    
    NSError *outError = nil;
    NSArray *matches = [context executeFetchRequest:request error:&outError];
    if (outError || !matches || [matches count] > 1) {
        // handle error!
    } else if ([matches count]) {
        aNews = [matches firstObject];
    } else {
        aNews = [NSEntityDescription insertNewObjectForEntityForName:@"News"
                                              inManagedObjectContext:context];
        aNews.gaPrefix = dictionary[@"ga_prefix"];
        aNews.qaID = dictionary[@"qa_id"];
        aNews.image = dictionary[@"image"];
        aNews.imageSource = dictionary[@"image_source"];
        aNews.shareURL = dictionary[@"share_url"];
        aNews.thumbnail = dictionary[@"thumbnail"];
        aNews.title = dictionary[@"title"];
        aNews.url = dictionary[@"url"];
        aNews.dateGroup = dictionary[@"group"];
    }
    
    return aNews;
}

+ (void)loadNewsFromNewsArray:(NSArray *)news
     intoManagedObjectContext:(NSManagedObjectContext *)context
{
    
}

@end
