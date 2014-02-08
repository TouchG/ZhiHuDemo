//
//  QFServerConnection.h
//  ZhiHuDemo
//
//  Created by administrator on 14-1-22.
//  Copyright (c) 2014年 GSX. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QFServerConnection : NSObject
{
    BOOL    _isAllowedDownLoadImages;
}

- (NSDictionary *)getNewsAtDate:(NSString *)date;

@end
