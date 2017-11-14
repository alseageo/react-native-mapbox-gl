//
//  RCTMGLVectorSource.m
//  RCTMGL
//
//  Created by Nick Italiano on 9/8/17.
//  Copyright © 2017 Mapbox Inc. All rights reserved.
//

#import "RCTMGLVectorSource.h"

@implementation RCTMGLVectorSource

- (MGLSource*)makeSource
{
    if (_tiles != nil) {
        NSDictionary<MGLTileSourceOption, id> *options = [self _getOptions];
        return [[MGLVectorSource alloc] initWithIdentifier:self.id tileURLTemplates:_tiles options:options];
    }

    return [[MGLVectorSource alloc] initWithIdentifier:self.id configurationURL:[NSURL URLWithString:_url]];
}

- (NSDictionary<MGLShapeSourceOption, id>*)_getOptions
{
    NSMutableDictionary<MGLTileSourceOption, id> *options = [[NSMutableDictionary alloc] init];

    if (_maxZoomLevel != nil) {
        options[MGLTileSourceOptionMaximumZoomLevel] = _maxZoomLevel;
    }

    if (_minZoomLevel != nil) {
        options[MGLTileSourceOptionMinimumZoomLevel] = _minZoomLevel;
    }

    if (_attribution != nil) {
        options[MGLTileSourceOptionAttributionHTMLString] = _attribution;
    }

    return options;
}

@end
