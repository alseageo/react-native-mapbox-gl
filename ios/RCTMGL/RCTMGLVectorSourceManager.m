//
//  RCTMGLVectorSourceManager.m
//  RCTMGL
//
//  Created by Nick Italiano on 9/8/17.
//  Copyright © 2017 Mapbox Inc. All rights reserved.
//

#import "RCTMGLVectorSourceManager.h"
#import "RCTMGLVectorSource.h"

@implementation RCTMGLVectorSourceManager

RCT_EXPORT_MODULE();

RCT_EXPORT_VIEW_PROPERTY(id, NSString);
RCT_EXPORT_VIEW_PROPERTY(url, NSString);
RCT_EXPORT_VIEW_PROPERTY(tiles, NSArray);

RCT_EXPORT_VIEW_PROPERTY(maxZoomLevel, NSNumber);
RCT_EXPORT_VIEW_PROPERTY(minZoomLevel, NSNumber);
RCT_EXPORT_VIEW_PROPERTY(attribution, NSString);

- (UIView*)view
{
    return [RCTMGLVectorSource new];
}

@end
