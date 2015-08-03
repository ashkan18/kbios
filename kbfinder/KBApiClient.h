//
//  KBApiClient.h
//  kbfinder
//
//  Created by Ashkan Nasseri  on 8/3/15.
//  Copyright (c) 2015 ashkan. All rights reserved.
//

#import "AFNetworking.h"

@interface KBApiClient : AFHTTPSessionManager

- (void)getDegreeWithArtistName:(NSString *)artistName
                   successBlock:(void(^)(id responseObject))successBlock
                     errorBlock:(void(^)(NSError *error))errorBlock;

@end
