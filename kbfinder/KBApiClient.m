//
//  KBApiClient.m
//  kbfinder
//
//  Created by Ashkan Nasseri  on 8/3/15.
//  Copyright (c) 2015 ashkan. All rights reserved.
//

#import "KBApiClient.h"

@implementation KBApiClient

- (void)getDegreeWithArtistName:(NSString *)artistName
                   successBlock:(void(^)(id responseObject))successBlock
                     errorBlock:(void(^)(NSError *error))errorBlock
{
    NSString *path = [NSString stringWithFormat:@"api/artists/%@", artistName];
    [self GET:path
   parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
       successBlock(responseObject);
       
   } failure:^(NSURLSessionDataTask *task, NSError *error) {
       errorBlock(error);
   }];
}

@end
