//
//  Abstract.h
//  ZhiHuDemo
//
//  Created by administrator on 14-2-8.
//  Copyright (c) 2014年 GSX. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Abstract : NSManagedObject

@property (nonatomic, retain) NSString * date;
@property (nonatomic, retain) NSData * news;
@property (nonatomic, retain) NSString * display_date;

@end
