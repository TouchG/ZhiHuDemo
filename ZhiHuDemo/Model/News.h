//
//  News.h
//  ZhiHuDemo
//
//  Created by administrator on 14-2-8.
//  Copyright (c) 2014年 GSX. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface News : NSManagedObject

@property (nonatomic, retain) NSString * thumbnail;
@property (nonatomic, retain) NSString * share_url;
@property (nonatomic, retain) NSString * image;
@property (nonatomic, retain) NSString * url;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSString * image_source;
@property (nonatomic, retain) NSString * ga_prefix;
@property (nonatomic, retain) NSNumber * id;
@property (nonatomic, retain) NSManagedObject *relationship;

@end
