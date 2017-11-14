//
//  RCTMGLVectorSource.h
//  RCTMGL
//
//  Created by Nick Italiano on 9/8/17.
//  Copyright © 2017 Mapbox Inc. All rights reserved.
//

#import "RCTMGLSource.h"
@import Mapbox;

@interface RCTMGLVectorSource : RCTMGLSource

@property (nonatomic, copy) NSString *url;
@property (nonatomic, copy) NSString *attribution;
@property (nonatomic, strong) NSArray<NSString *> *tiles;

@property (nonatomic, assign) NSNumber *maxZoomLevel;
@property (nonatomic, assign) NSNumber *minZoomLevel;

@end
