//
//  GroupNews.h
//  ZhiHuDemo
//
//  Created by administrator on 14-2-10.
//  Copyright (c) 2014年 GSX. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class News;

@interface GroupNews : NSManagedObject

@property (nonatomic, retain) NSString * date;
@property (nonatomic, retain) NSString * display_date;
@property (nonatomic, retain) NSSet *news;
@end

@interface GroupNews (CoreDataGeneratedAccessors)

- (void)addNewsObject:(News *)value;
- (void)removeNewsObject:(News *)value;
- (void)addNews:(NSSet *)values;
- (void)removeNews:(NSSet *)values;

@end
