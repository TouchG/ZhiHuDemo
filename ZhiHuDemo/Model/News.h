//
//  News.h
//  ZhiHuDemo
//
//  Created by administrator on 14-2-10.
//  Copyright (c) 2014年 GSX. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class GroupNews;

@interface News : NSManagedObject

@property (nonatomic, retain) NSString * gaPrefix;
@property (nonatomic, retain) NSNumber * qaID;
@property (nonatomic, retain) NSString * image;
@property (nonatomic, retain) NSString * imageSource;
@property (nonatomic, retain) NSString * shareURL;
@property (nonatomic, retain) NSString * thumbnail;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSString * url;
@property (nonatomic, retain) GroupNews *dateGroup;

@end
