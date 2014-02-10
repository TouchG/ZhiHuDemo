//
//  News+Zhihu.h
//  ZhiHuDemo
//
//  Created by administrator on 14-2-10.
//  Copyright (c) 2014年 GSX. All rights reserved.
//

#import "News.h"

@interface News (Zhihu)

+ (News *)newsWithInfo:(NSDictionary *)dictionary inManagedObjectContext:(NSManagedObjectContext *)context;

+ (void)loadNewsFromNewsArray:(NSArray *)news
         intoManagedObjectContext:(NSManagedObjectContext *)context;
@end
