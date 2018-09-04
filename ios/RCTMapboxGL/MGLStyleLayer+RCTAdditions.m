//
// Copyright (c) 2016 Mapbox. All rights reserved.
//
// This file is generated. See scripts/generate-layer-factory.js

#import "MGLStyleLayer+RCTAdditions.h"
#import "UIColor+RCTAdditions.h"
#import <CoreGraphics/CGGeometry.h>
#import <Mapbox/MGLFillStyleLayer.h>
#import <Mapbox/MGLLineStyleLayer.h>
#import <Mapbox/MGLSymbolStyleLayer.h>
#import <Mapbox/MGLCircleStyleLayer.h>
#import <Mapbox/MGLRasterStyleLayer.h>
#import <Mapbox/MGLBackgroundStyleLayer.h>

NSString *const RCTMapboxGLErrorDomain = @"com.mapbox.reactnativemapboxgl.ErrorDomain";


@implementation MGLStyleLayer (RCTAdditions)

+ (MGLStyleLayer *)styleLayerWithJson:(nonnull NSDictionary *)layerJson
                   mapView:(RCTMapboxGL *)mapView
                   error:(NSError **)errorPtr
{
    NSString *idString = layerJson[@"id"];
    NSString *typeString = layerJson[@"type"];

    NSString *ref = layerJson[@"ref"];
    if (ref) {
        if (errorPtr) {
            *errorPtr = [NSError errorWithDomain:RCTMapboxGLErrorDomain
                                 code:1002
                                 userInfo:@{NSLocalizedDescriptionKey:[NSString stringWithFormat:@"addLayer(): cannot use property 'ref' in layer '%@'", idString]}
            ];
        }
        return nil;
    }

    if([typeString isEqualToString:@"fill"]) {
        NSDictionary *paintProperties = layerJson[@"paint"];
        NSString *sourceString = layerJson[@"source"];
        if (!sourceString) {
            if (errorPtr) {
                *errorPtr = [NSError errorWithDomain:RCTMapboxGLErrorDomain
                                     code:1003
                                     userInfo:@{NSLocalizedDescriptionKey:[NSString stringWithFormat:@"addLayer(): layer of type '%@' must have a 'source' attribute", typeString]}
                ];
            }
            return nil;
        }
        MGLSource *source = [mapView styleSourceWithIdentifier:sourceString];
        if (!source) {
            if (errorPtr) {
                *errorPtr = [NSError errorWithDomain:RCTMapboxGLErrorDomain
                                     code:1004
                                     userInfo:@{NSLocalizedDescriptionKey:[NSString stringWithFormat:@"addLayer(): source '%@' for layer '%@' is nil", sourceString, idString]}
                ];
            }
            return nil;
        }
        MGLFillStyleLayer *layer = [[MGLFillStyleLayer alloc] initWithIdentifier:idString source:source];
        if ([paintProperties valueForKey:@"fill-antialias"]) {
            NSExpression *exp;
            if ([[paintProperties valueForKey:@"fill-antialias"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"fill-antialias"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                //    // [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                    [stopsDict setObject:stop[1] forKey:stop[0]];
                }
                // MGLStyleValue *fillAntialiasValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeInterval cameraStops:stopsDict options:nil];
                //// exp = [NSExpression expressionForConstantValue:paintProperties[@"fill-antialias"]];
                // exp = [NSExpression expressionWithFormat: @"mgl_step:from:stops:(mag, nil, %@)", stopsDict];
                exp = [NSExpression
                       mgl_expressionForSteppingExpression:NSExpression.zoomLevelVariableExpression
                       fromExpression:[NSExpression expressionForConstantValue:stops[0][1]]
                       stops:[NSExpression expressionForConstantValue:stopsDict]];
                // [layer setFillAntialiased:fillAntialiasValue];
                [layer setFillAntialiased:exp];
            } else {
                // MGLStyleValue *fillAntialiasValue = [MGLStyleValue valueWithRawValue:paintProperties[@"fill-antialias"]];
                exp = [NSExpression expressionForConstantValue:paintProperties[@"fill-antialias"]];
                // [layer setFillAntialiased:fillAntialiasValue];
                [layer setFillAntialiased:exp];
            }
        }
        if ([paintProperties valueForKey:@"fill-opacity"]) {
            NSExpression *exp;
            if ([[paintProperties valueForKey:@"fill-opacity"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"fill-opacity"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                //    // [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                    [stopsDict setObject:stop[1] forKey:stop[0]];
                }
                NSMutableDictionary *optionsDict = [[NSMutableDictionary alloc] init];
                NSNumber *baseNumber = paintProperties[@"fill-opacity"][@"base"];
                if (baseNumber) {
                    // [optionsDict setObject:baseNumber forKey:MGLStyleFunctionOptionInterpolationBase];
                    exp = [NSExpression
                            mgl_expressionForInterpolatingExpression:NSExpression.zoomLevelVariableExpression
                            withCurveType:MGLExpressionInterpolationModeExponential
                            parameters:[NSExpression expressionForConstantValue:baseNumber]
                            stops:[NSExpression expressionForConstantValue:stopsDict]];
                } else {
                    // [optionsDict setObject:[NSNumber numberWithInt:1] forKey:MGLStyleFunctionOptionInterpolationBase];
                    // exp = [NSExpression expressionWithFormat: @"mgl_interpolate:withCurveType:parameters:stops:(mag, 'exponential', nil, %@)", stops];
                    exp = [NSExpression
                            mgl_expressionForInterpolatingExpression:NSExpression.zoomLevelVariableExpression
                            withCurveType:MGLExpressionInterpolationModeLinear
                            parameters:nil
                            stops:[NSExpression expressionForConstantValue:stopsDict]];
                }
                // MGLStyleValue *fillOpacityValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeExponential cameraStops:stopsDict options:optionsDict];
                // [layer setFillOpacity:fillOpacityValue];
                [layer setFillOpacity:exp];
            } else {
                // MGLStyleValue *fillOpacityValue = [MGLStyleValue valueWithRawValue:paintProperties[@"fill-opacity"]];
                exp = [NSExpression expressionForConstantValue:paintProperties[@"fill-opacity"]];
                // [layer setFillOpacity:fillOpacityValue];
                [layer setFillOpacity:exp];
            }
        }
        if ([paintProperties valueForKey:@"fill-color"]) {
            NSExpression *exp;
            if ([[paintProperties valueForKey:@"fill-color"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"fill-color"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[UIColor colorWithString:stop[1]] forKey:stop[0]];
                }
                NSMutableDictionary *optionsDict = [[NSMutableDictionary alloc] init];
                NSNumber *baseNumber = paintProperties[@"fill-color"][@"base"];
                if (baseNumber) {
                    // [optionsDict setObject:baseNumber forKey:MGLStyleFunctionOptionInterpolationBase];
                    exp = [NSExpression
                            mgl_expressionForInterpolatingExpression:NSExpression.zoomLevelVariableExpression
                            withCurveType:MGLExpressionInterpolationModeExponential
                            parameters:[NSExpression expressionForConstantValue:baseNumber]
                            stops:[NSExpression expressionForConstantValue:stopsDict]];
                } else {
                    // [optionsDict setObject:[NSNumber numberWithInt:1] forKey:MGLStyleFunctionOptionInterpolationBase];
                    // exp = [NSExpression expressionWithFormat: @"mgl_interpolate:withCurveType:parameters:stops:(mag, 'exponential', nil, %@)", stops];
                    exp = [NSExpression
                            mgl_expressionForInterpolatingExpression:NSExpression.zoomLevelVariableExpression
                            withCurveType:MGLExpressionInterpolationModeLinear
                            parameters:nil
                            stops:[NSExpression expressionForConstantValue:stopsDict]];
                }
                // MGLStyleValue *fillColorValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeExponential cameraStops:stopsDict options:optionsDict];
                // [layer setFillColor:fillColorValue];
                [layer setFillColor:exp];
            } else {
                UIColor *color = [UIColor colorWithString:paintProperties[@"fill-color"]];
                // MGLStyleValue *fillColorValue = [MGLStyleValue valueWithRawValue:color];
                exp = [NSExpression expressionForConstantValue:color];
                // [layer setFillColor:fillColorValue];
                [layer setFillColor:exp];
            }
        }
        if ([paintProperties valueForKey:@"fill-outline-color"]) {
            NSExpression *exp;
            if ([[paintProperties valueForKey:@"fill-outline-color"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"fill-outline-color"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[UIColor colorWithString:stop[1]] forKey:stop[0]];
                }
                NSMutableDictionary *optionsDict = [[NSMutableDictionary alloc] init];
                NSNumber *baseNumber = paintProperties[@"fill-outline-color"][@"base"];
                if (baseNumber) {
                    // [optionsDict setObject:baseNumber forKey:MGLStyleFunctionOptionInterpolationBase];
                    exp = [NSExpression
                            mgl_expressionForInterpolatingExpression:NSExpression.zoomLevelVariableExpression
                            withCurveType:MGLExpressionInterpolationModeExponential
                            parameters:[NSExpression expressionForConstantValue:baseNumber]
                            stops:[NSExpression expressionForConstantValue:stopsDict]];
                } else {
                    // [optionsDict setObject:[NSNumber numberWithInt:1] forKey:MGLStyleFunctionOptionInterpolationBase];
                    // exp = [NSExpression expressionWithFormat: @"mgl_interpolate:withCurveType:parameters:stops:(mag, 'exponential', nil, %@)", stops];
                    exp = [NSExpression
                            mgl_expressionForInterpolatingExpression:NSExpression.zoomLevelVariableExpression
                            withCurveType:MGLExpressionInterpolationModeLinear
                            parameters:nil
                            stops:[NSExpression expressionForConstantValue:stopsDict]];
                }
                // MGLStyleValue *fillOutlineColorValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeExponential cameraStops:stopsDict options:optionsDict];
                // [layer setFillOutlineColor:fillOutlineColorValue];
                [layer setFillOutlineColor:exp];
            } else {
                UIColor *color = [UIColor colorWithString:paintProperties[@"fill-outline-color"]];
                // MGLStyleValue *fillOutlineColorValue = [MGLStyleValue valueWithRawValue:color];
                exp = [NSExpression expressionForConstantValue:color];
                // [layer setFillOutlineColor:fillOutlineColorValue];
                [layer setFillOutlineColor:exp];
            }
        }
        if ([paintProperties valueForKey:@"fill-translate"]) {
            NSExpression *exp;
            if ([[paintProperties valueForKey:@"fill-translate"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"fill-translate"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    CGVector vector = CGVectorMake([stop[1][0] floatValue], [stop[1][1] floatValue]);
                //    [stopsDict setObject:[MGLStyleValue valueWithRawValue:[NSValue valueWithCGVector:vector]] forKey:stop[0]];
                    [stopsDict setObject:[NSValue valueWithCGVector:vector] forKey:stop[0]];
                }
                NSMutableDictionary *optionsDict = [[NSMutableDictionary alloc] init];
                NSNumber *baseNumber = paintProperties[@"fill-translate"][@"base"];
                if (baseNumber) {
                    // [optionsDict setObject:baseNumber forKey:MGLStyleFunctionOptionInterpolationBase];
                    exp = [NSExpression
                            mgl_expressionForInterpolatingExpression:NSExpression.zoomLevelVariableExpression
                            withCurveType:MGLExpressionInterpolationModeExponential
                            parameters:[NSExpression expressionForConstantValue:baseNumber]
                            stops:[NSExpression expressionForConstantValue:stopsDict]];
                } else {
                    // [optionsDict setObject:[NSNumber numberWithInt:1] forKey:MGLStyleFunctionOptionInterpolationBase];
                    // exp = [NSExpression expressionWithFormat: @"mgl_interpolate:withCurveType:parameters:stops:(mag, 'exponential', nil, %@)", stops];
                    exp = [NSExpression
                            mgl_expressionForInterpolatingExpression:NSExpression.zoomLevelVariableExpression
                            withCurveType:MGLExpressionInterpolationModeLinear
                            parameters:nil
                            stops:[NSExpression expressionForConstantValue:stopsDict]];
                }
                // MGLStyleValue *fillTranslateValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeExponential cameraStops:stopsDict options:optionsDict];
                // [layer setFillTranslation:fillTranslateValue];
                [layer setFillTranslation:exp];
            } else {
                // CGVector vector = CGVectorMake([paintProperties[@"fill-translate"][0] floatValue], [paintProperties[@"fill-translate"][1] floatValue]);
                // MGLStyleValue *fillTranslateValue = [MGLStyleValue valueWithRawValue:[NSValue valueWithCGVector:vector]];
                exp = [NSExpression expressionForConstantValue:paintProperties[@"fill-translate"]];
                // [layer setFillTranslation:fillTranslateValue];
                [layer setFillTranslation:exp];
            }
        }
        if ([paintProperties valueForKey:@"fill-translate-anchor"]) {
            // create the NSString -> enum dictionary for later use
            NSDictionary<NSString*, NSNumber *> *enumDictionary = @{
                @"map": @(MGLFillTranslationAnchorMap),
                @"viewport": @(MGLFillTranslationAnchorViewport),
            };
            NSExpression *exp;
            if ([[paintProperties valueForKey:@"fill-translate-anchor"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"fill-translate-anchor"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    NSValue *value = [NSValue valueWithMGLFillTranslationAnchor:enumDictionary[paintProperties[@"fill-translate-anchor"]].integerValue];
                    // // [stopsDict setObject:[MGLStyleValue valueWithRawValue:value] forKey:stop[0]];
                    [stopsDict setObject:value forKey:stop[0]];
                }
                // MGLStyleValue *fillTranslateAnchorValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeInterval cameraStops:stopsDict options:nil];
                //// exp = [NSExpression expressionForConstantValue:paintProperties[@"fill-translate-anchor"]];
                // exp = [NSExpression expressionWithFormat: @"mgl_step:from:stops:(mag, nil, %@)", stopsDict];
                exp = [NSExpression
                       mgl_expressionForSteppingExpression:NSExpression.zoomLevelVariableExpression
                       fromExpression:[NSExpression expressionForConstantValue:stops[0][1]]
                       stops:[NSExpression expressionForConstantValue:stopsDict]];
                // [layer setFillTranslationAnchor:fillTranslateAnchorValue];
                [layer setFillTranslationAnchor:exp];
            } else {
                NSValue *value = [NSValue valueWithMGLFillTranslationAnchor:enumDictionary[paintProperties[@"fill-translate-anchor"]].integerValue];
                // MGLStyleValue *fillTranslateAnchorValue = [MGLStyleValue valueWithRawValue:value];
                exp = [NSExpression expressionForConstantValue:value];
                // [layer setFillTranslationAnchor:fillTranslateAnchorValue];
                [layer setFillTranslationAnchor:exp];
            }
        }
        if ([paintProperties valueForKey:@"fill-pattern"]) {
            NSExpression *exp;
            if ([[paintProperties valueForKey:@"fill-pattern"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"fill-pattern"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                //    // [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                    [stopsDict setObject:stop[1] forKey:stop[0]];
                }
                // MGLStyleValue *fillPatternValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeInterval cameraStops:stopsDict options:nil];
                //// exp = [NSExpression expressionForConstantValue:paintProperties[@"fill-pattern"]];
                // exp = [NSExpression expressionWithFormat: @"mgl_step:from:stops:(mag, nil, %@)", stopsDict];
                exp = [NSExpression
                       mgl_expressionForSteppingExpression:NSExpression.zoomLevelVariableExpression
                       fromExpression:[NSExpression expressionForConstantValue:stops[0][1]]
                       stops:[NSExpression expressionForConstantValue:stopsDict]];
                // [layer setFillPattern:fillPatternValue];
                [layer setFillPattern:exp];
            } else {
                // MGLStyleValue *fillPatternValue = [MGLStyleValue valueWithRawValue:paintProperties[@"fill-pattern"]];
                exp = [NSExpression expressionForConstantValue:paintProperties[@"fill-pattern"]];
                // [layer setFillPattern:fillPatternValue];
                [layer setFillPattern:exp];
            }
        }
        NSString *sourceLayer = layerJson[@"source-layer"];
        NSArray *filter = layerJson[@"filter"];
        if (sourceLayer) {
            [layer setSourceLayerIdentifier:sourceLayer];
        }
        if (filter) {
            [layer setPredicate:[layer predicateWithJson:filter]];
        }

        NSNumber *minzoom = layerJson[@"minzoom"];
        NSNumber *maxzoom = layerJson[@"maxzoom"];
        if (minzoom) {
            [layer setMinimumZoomLevel:[minzoom floatValue]];
        }
        if (maxzoom) {
            [layer setMaximumZoomLevel:[maxzoom floatValue]];
        }
        return layer;
    }
    if([typeString isEqualToString:@"line"]) {
        NSDictionary *paintProperties = layerJson[@"paint"];
        NSDictionary *layoutProperties = layerJson[@"layout"];
        NSString *sourceString = layerJson[@"source"];
        if (!sourceString) {
            if (errorPtr) {
                *errorPtr = [NSError errorWithDomain:RCTMapboxGLErrorDomain
                                     code:1003
                                     userInfo:@{NSLocalizedDescriptionKey:[NSString stringWithFormat:@"addLayer(): layer of type '%@' must have a 'source' attribute", typeString]}
                ];
            }
            return nil;
        }
        MGLSource *source = [mapView styleSourceWithIdentifier:sourceString];
        if (!source) {
            if (errorPtr) {
                *errorPtr = [NSError errorWithDomain:RCTMapboxGLErrorDomain
                                     code:1004
                                     userInfo:@{NSLocalizedDescriptionKey:[NSString stringWithFormat:@"addLayer(): source '%@' for layer '%@' is nil", sourceString, idString]}
                ];
            }
            return nil;
        }
        MGLLineStyleLayer *layer = [[MGLLineStyleLayer alloc] initWithIdentifier:idString source:source];
        if ([layoutProperties valueForKey:@"line-cap"]) {
            // create the NSString -> enum dictionary for later use
            NSDictionary<NSString*, NSNumber *> *enumDictionary = @{
                @"butt": @(MGLLineCapButt),
                @"round": @(MGLLineCapRound),
                @"square": @(MGLLineCapSquare),
            };
            NSExpression *exp;
            if ([[layoutProperties valueForKey:@"line-cap"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = layoutProperties[@"line-cap"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    NSValue *value = [NSValue valueWithMGLLineCap:enumDictionary[layoutProperties[@"line-cap"]].integerValue];
                    // // [stopsDict setObject:[MGLStyleValue valueWithRawValue:value] forKey:stop[0]];
                    [stopsDict setObject:value forKey:stop[0]];
                }
                // MGLStyleValue *lineCapValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeInterval cameraStops:stopsDict options:nil];
                //// exp = [NSExpression expressionForConstantValue:layoutProperties[@"line-cap"]];
                // exp = [NSExpression expressionWithFormat: @"mgl_step:from:stops:(mag, nil, %@)", stopsDict];
                exp = [NSExpression
                       mgl_expressionForSteppingExpression:NSExpression.zoomLevelVariableExpression
                       fromExpression:[NSExpression expressionForConstantValue:stops[0][1]]
                       stops:[NSExpression expressionForConstantValue:stopsDict]];
                // [layer setLineCap:lineCapValue];
                [layer setLineCap:exp];
            } else {
                NSValue *value = [NSValue valueWithMGLLineCap:enumDictionary[layoutProperties[@"line-cap"]].integerValue];
                // MGLStyleValue *lineCapValue = [MGLStyleValue valueWithRawValue:value];
                exp = [NSExpression expressionForConstantValue:value];
                // [layer setLineCap:lineCapValue];
                [layer setLineCap:exp];
            }
        }
        if ([layoutProperties valueForKey:@"line-join"]) {
            // create the NSString -> enum dictionary for later use
            NSDictionary<NSString*, NSNumber *> *enumDictionary = @{
                @"bevel": @(MGLLineJoinBevel),
                @"round": @(MGLLineJoinRound),
                @"miter": @(MGLLineJoinMiter),
            };
            NSExpression *exp;
            if ([[layoutProperties valueForKey:@"line-join"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = layoutProperties[@"line-join"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    NSValue *value = [NSValue valueWithMGLLineJoin:enumDictionary[layoutProperties[@"line-join"]].integerValue];
                    // // [stopsDict setObject:[MGLStyleValue valueWithRawValue:value] forKey:stop[0]];
                    [stopsDict setObject:value forKey:stop[0]];
                }
                // MGLStyleValue *lineJoinValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeInterval cameraStops:stopsDict options:nil];
                //// exp = [NSExpression expressionForConstantValue:layoutProperties[@"line-join"]];
                // exp = [NSExpression expressionWithFormat: @"mgl_step:from:stops:(mag, nil, %@)", stopsDict];
                exp = [NSExpression
                       mgl_expressionForSteppingExpression:NSExpression.zoomLevelVariableExpression
                       fromExpression:[NSExpression expressionForConstantValue:stops[0][1]]
                       stops:[NSExpression expressionForConstantValue:stopsDict]];
                // [layer setLineJoin:lineJoinValue];
                [layer setLineJoin:exp];
            } else {
                NSValue *value = [NSValue valueWithMGLLineJoin:enumDictionary[layoutProperties[@"line-join"]].integerValue];
                // MGLStyleValue *lineJoinValue = [MGLStyleValue valueWithRawValue:value];
                exp = [NSExpression expressionForConstantValue:value];
                // [layer setLineJoin:lineJoinValue];
                [layer setLineJoin:exp];
            }
        }
        if ([layoutProperties valueForKey:@"line-miter-limit"]) {
            NSExpression *exp;
            if ([[layoutProperties valueForKey:@"line-miter-limit"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = layoutProperties[@"line-miter-limit"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                //    // [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                    [stopsDict setObject:stop[1] forKey:stop[0]];
                }
                NSMutableDictionary *optionsDict = [[NSMutableDictionary alloc] init];
                NSNumber *baseNumber = layoutProperties[@"line-miter-limit"][@"base"];
                if (baseNumber) {
                    // [optionsDict setObject:baseNumber forKey:MGLStyleFunctionOptionInterpolationBase];
                    exp = [NSExpression
                            mgl_expressionForInterpolatingExpression:NSExpression.zoomLevelVariableExpression
                            withCurveType:MGLExpressionInterpolationModeExponential
                            parameters:[NSExpression expressionForConstantValue:baseNumber]
                            stops:[NSExpression expressionForConstantValue:stopsDict]];
                } else {
                    // [optionsDict setObject:[NSNumber numberWithInt:1] forKey:MGLStyleFunctionOptionInterpolationBase];
                    // exp = [NSExpression expressionWithFormat: @"mgl_interpolate:withCurveType:parameters:stops:(mag, 'exponential', nil, %@)", stops];
                    exp = [NSExpression
                            mgl_expressionForInterpolatingExpression:NSExpression.zoomLevelVariableExpression
                            withCurveType:MGLExpressionInterpolationModeLinear
                            parameters:nil
                            stops:[NSExpression expressionForConstantValue:stopsDict]];
                }
                // MGLStyleValue *lineMiterLimitValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeExponential cameraStops:stopsDict options:optionsDict];
                // [layer setLineMiterLimit:lineMiterLimitValue];
                [layer setLineMiterLimit:exp];
            } else {
                // MGLStyleValue *lineMiterLimitValue = [MGLStyleValue valueWithRawValue:layoutProperties[@"line-miter-limit"]];
                exp = [NSExpression expressionForConstantValue:layoutProperties[@"line-miter-limit"]];
                // [layer setLineMiterLimit:lineMiterLimitValue];
                [layer setLineMiterLimit:exp];
            }
        }
        if ([layoutProperties valueForKey:@"line-round-limit"]) {
            NSExpression *exp;
            if ([[layoutProperties valueForKey:@"line-round-limit"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = layoutProperties[@"line-round-limit"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                //    // [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                    [stopsDict setObject:stop[1] forKey:stop[0]];
                }
                NSMutableDictionary *optionsDict = [[NSMutableDictionary alloc] init];
                NSNumber *baseNumber = layoutProperties[@"line-round-limit"][@"base"];
                if (baseNumber) {
                    // [optionsDict setObject:baseNumber forKey:MGLStyleFunctionOptionInterpolationBase];
                    exp = [NSExpression
                            mgl_expressionForInterpolatingExpression:NSExpression.zoomLevelVariableExpression
                            withCurveType:MGLExpressionInterpolationModeExponential
                            parameters:[NSExpression expressionForConstantValue:baseNumber]
                            stops:[NSExpression expressionForConstantValue:stopsDict]];
                } else {
                    // [optionsDict setObject:[NSNumber numberWithInt:1] forKey:MGLStyleFunctionOptionInterpolationBase];
                    // exp = [NSExpression expressionWithFormat: @"mgl_interpolate:withCurveType:parameters:stops:(mag, 'exponential', nil, %@)", stops];
                    exp = [NSExpression
                            mgl_expressionForInterpolatingExpression:NSExpression.zoomLevelVariableExpression
                            withCurveType:MGLExpressionInterpolationModeLinear
                            parameters:nil
                            stops:[NSExpression expressionForConstantValue:stopsDict]];
                }
                // MGLStyleValue *lineRoundLimitValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeExponential cameraStops:stopsDict options:optionsDict];
                // [layer setLineRoundLimit:lineRoundLimitValue];
                [layer setLineRoundLimit:exp];
            } else {
                // MGLStyleValue *lineRoundLimitValue = [MGLStyleValue valueWithRawValue:layoutProperties[@"line-round-limit"]];
                exp = [NSExpression expressionForConstantValue:layoutProperties[@"line-round-limit"]];
                // [layer setLineRoundLimit:lineRoundLimitValue];
                [layer setLineRoundLimit:exp];
            }
        }
        if ([paintProperties valueForKey:@"line-opacity"]) {
            NSExpression *exp;
            if ([[paintProperties valueForKey:@"line-opacity"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"line-opacity"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                //    // [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                    [stopsDict setObject:stop[1] forKey:stop[0]];
                }
                NSMutableDictionary *optionsDict = [[NSMutableDictionary alloc] init];
                NSNumber *baseNumber = paintProperties[@"line-opacity"][@"base"];
                if (baseNumber) {
                    // [optionsDict setObject:baseNumber forKey:MGLStyleFunctionOptionInterpolationBase];
                    exp = [NSExpression
                            mgl_expressionForInterpolatingExpression:NSExpression.zoomLevelVariableExpression
                            withCurveType:MGLExpressionInterpolationModeExponential
                            parameters:[NSExpression expressionForConstantValue:baseNumber]
                            stops:[NSExpression expressionForConstantValue:stopsDict]];
                } else {
                    // [optionsDict setObject:[NSNumber numberWithInt:1] forKey:MGLStyleFunctionOptionInterpolationBase];
                    // exp = [NSExpression expressionWithFormat: @"mgl_interpolate:withCurveType:parameters:stops:(mag, 'exponential', nil, %@)", stops];
                    exp = [NSExpression
                            mgl_expressionForInterpolatingExpression:NSExpression.zoomLevelVariableExpression
                            withCurveType:MGLExpressionInterpolationModeLinear
                            parameters:nil
                            stops:[NSExpression expressionForConstantValue:stopsDict]];
                }
                // MGLStyleValue *lineOpacityValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeExponential cameraStops:stopsDict options:optionsDict];
                // [layer setLineOpacity:lineOpacityValue];
                [layer setLineOpacity:exp];
            } else {
                // MGLStyleValue *lineOpacityValue = [MGLStyleValue valueWithRawValue:paintProperties[@"line-opacity"]];
                exp = [NSExpression expressionForConstantValue:paintProperties[@"line-opacity"]];
                // [layer setLineOpacity:lineOpacityValue];
                [layer setLineOpacity:exp];
            }
        }
        if ([paintProperties valueForKey:@"line-color"]) {
            NSExpression *exp;
            if ([[paintProperties valueForKey:@"line-color"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"line-color"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[UIColor colorWithString:stop[1]] forKey:stop[0]];
                }
                NSMutableDictionary *optionsDict = [[NSMutableDictionary alloc] init];
                NSNumber *baseNumber = paintProperties[@"line-color"][@"base"];
                if (baseNumber) {
                    // [optionsDict setObject:baseNumber forKey:MGLStyleFunctionOptionInterpolationBase];
                    exp = [NSExpression
                            mgl_expressionForInterpolatingExpression:NSExpression.zoomLevelVariableExpression
                            withCurveType:MGLExpressionInterpolationModeExponential
                            parameters:[NSExpression expressionForConstantValue:baseNumber]
                            stops:[NSExpression expressionForConstantValue:stopsDict]];
                } else {
                    // [optionsDict setObject:[NSNumber numberWithInt:1] forKey:MGLStyleFunctionOptionInterpolationBase];
                    // exp = [NSExpression expressionWithFormat: @"mgl_interpolate:withCurveType:parameters:stops:(mag, 'exponential', nil, %@)", stops];
                    exp = [NSExpression
                            mgl_expressionForInterpolatingExpression:NSExpression.zoomLevelVariableExpression
                            withCurveType:MGLExpressionInterpolationModeLinear
                            parameters:nil
                            stops:[NSExpression expressionForConstantValue:stopsDict]];
                }
                // MGLStyleValue *lineColorValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeExponential cameraStops:stopsDict options:optionsDict];
                // [layer setLineColor:lineColorValue];
                [layer setLineColor:exp];
            } else {
                UIColor *color = [UIColor colorWithString:paintProperties[@"line-color"]];
                // MGLStyleValue *lineColorValue = [MGLStyleValue valueWithRawValue:color];
                exp = [NSExpression expressionForConstantValue:color];
                // [layer setLineColor:lineColorValue];
                [layer setLineColor:exp];
            }
        }
        if ([paintProperties valueForKey:@"line-translate"]) {
            NSExpression *exp;
            if ([[paintProperties valueForKey:@"line-translate"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"line-translate"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    CGVector vector = CGVectorMake([stop[1][0] floatValue], [stop[1][1] floatValue]);
                //    [stopsDict setObject:[MGLStyleValue valueWithRawValue:[NSValue valueWithCGVector:vector]] forKey:stop[0]];
                    [stopsDict setObject:[NSValue valueWithCGVector:vector] forKey:stop[0]];
                }
                NSMutableDictionary *optionsDict = [[NSMutableDictionary alloc] init];
                NSNumber *baseNumber = paintProperties[@"line-translate"][@"base"];
                if (baseNumber) {
                    // [optionsDict setObject:baseNumber forKey:MGLStyleFunctionOptionInterpolationBase];
                    exp = [NSExpression
                            mgl_expressionForInterpolatingExpression:NSExpression.zoomLevelVariableExpression
                            withCurveType:MGLExpressionInterpolationModeExponential
                            parameters:[NSExpression expressionForConstantValue:baseNumber]
                            stops:[NSExpression expressionForConstantValue:stopsDict]];
                } else {
                    // [optionsDict setObject:[NSNumber numberWithInt:1] forKey:MGLStyleFunctionOptionInterpolationBase];
                    // exp = [NSExpression expressionWithFormat: @"mgl_interpolate:withCurveType:parameters:stops:(mag, 'exponential', nil, %@)", stops];
                    exp = [NSExpression
                            mgl_expressionForInterpolatingExpression:NSExpression.zoomLevelVariableExpression
                            withCurveType:MGLExpressionInterpolationModeLinear
                            parameters:nil
                            stops:[NSExpression expressionForConstantValue:stopsDict]];
                }
                // MGLStyleValue *lineTranslateValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeExponential cameraStops:stopsDict options:optionsDict];
                // [layer setLineTranslation:lineTranslateValue];
                [layer setLineTranslation:exp];
            } else {
                // CGVector vector = CGVectorMake([paintProperties[@"line-translate"][0] floatValue], [paintProperties[@"line-translate"][1] floatValue]);
                // MGLStyleValue *lineTranslateValue = [MGLStyleValue valueWithRawValue:[NSValue valueWithCGVector:vector]];
                exp = [NSExpression expressionForConstantValue:paintProperties[@"line-translate"]];
                // [layer setLineTranslation:lineTranslateValue];
                [layer setLineTranslation:exp];
            }
        }
        if ([paintProperties valueForKey:@"line-translate-anchor"]) {
            // create the NSString -> enum dictionary for later use
            NSDictionary<NSString*, NSNumber *> *enumDictionary = @{
                @"map": @(MGLLineTranslationAnchorMap),
                @"viewport": @(MGLLineTranslationAnchorViewport),
            };
            NSExpression *exp;
            if ([[paintProperties valueForKey:@"line-translate-anchor"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"line-translate-anchor"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    NSValue *value = [NSValue valueWithMGLLineTranslationAnchor:enumDictionary[paintProperties[@"line-translate-anchor"]].integerValue];
                    // // [stopsDict setObject:[MGLStyleValue valueWithRawValue:value] forKey:stop[0]];
                    [stopsDict setObject:value forKey:stop[0]];
                }
                // MGLStyleValue *lineTranslateAnchorValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeInterval cameraStops:stopsDict options:nil];
                //// exp = [NSExpression expressionForConstantValue:paintProperties[@"line-translate-anchor"]];
                // exp = [NSExpression expressionWithFormat: @"mgl_step:from:stops:(mag, nil, %@)", stopsDict];
                exp = [NSExpression
                       mgl_expressionForSteppingExpression:NSExpression.zoomLevelVariableExpression
                       fromExpression:[NSExpression expressionForConstantValue:stops[0][1]]
                       stops:[NSExpression expressionForConstantValue:stopsDict]];
                // [layer setLineTranslationAnchor:lineTranslateAnchorValue];
                [layer setLineTranslationAnchor:exp];
            } else {
                NSValue *value = [NSValue valueWithMGLLineTranslationAnchor:enumDictionary[paintProperties[@"line-translate-anchor"]].integerValue];
                // MGLStyleValue *lineTranslateAnchorValue = [MGLStyleValue valueWithRawValue:value];
                exp = [NSExpression expressionForConstantValue:value];
                // [layer setLineTranslationAnchor:lineTranslateAnchorValue];
                [layer setLineTranslationAnchor:exp];
            }
        }
        if ([paintProperties valueForKey:@"line-width"]) {
            NSExpression *exp;
            if ([[paintProperties valueForKey:@"line-width"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"line-width"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                //    // [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                    [stopsDict setObject:stop[1] forKey:stop[0]];
                }
                NSMutableDictionary *optionsDict = [[NSMutableDictionary alloc] init];
                NSNumber *baseNumber = paintProperties[@"line-width"][@"base"];
                if (baseNumber) {
                    // [optionsDict setObject:baseNumber forKey:MGLStyleFunctionOptionInterpolationBase];
                    exp = [NSExpression
                            mgl_expressionForInterpolatingExpression:NSExpression.zoomLevelVariableExpression
                            withCurveType:MGLExpressionInterpolationModeExponential
                            parameters:[NSExpression expressionForConstantValue:baseNumber]
                            stops:[NSExpression expressionForConstantValue:stopsDict]];
                } else {
                    // [optionsDict setObject:[NSNumber numberWithInt:1] forKey:MGLStyleFunctionOptionInterpolationBase];
                    // exp = [NSExpression expressionWithFormat: @"mgl_interpolate:withCurveType:parameters:stops:(mag, 'exponential', nil, %@)", stops];
                    exp = [NSExpression
                            mgl_expressionForInterpolatingExpression:NSExpression.zoomLevelVariableExpression
                            withCurveType:MGLExpressionInterpolationModeLinear
                            parameters:nil
                            stops:[NSExpression expressionForConstantValue:stopsDict]];
                }
                // MGLStyleValue *lineWidthValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeExponential cameraStops:stopsDict options:optionsDict];
                // [layer setLineWidth:lineWidthValue];
                [layer setLineWidth:exp];
            } else {
                // MGLStyleValue *lineWidthValue = [MGLStyleValue valueWithRawValue:paintProperties[@"line-width"]];
                exp = [NSExpression expressionForConstantValue:paintProperties[@"line-width"]];
                // [layer setLineWidth:lineWidthValue];
                [layer setLineWidth:exp];
            }
        }
        if ([paintProperties valueForKey:@"line-gap-width"]) {
            NSExpression *exp;
            if ([[paintProperties valueForKey:@"line-gap-width"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"line-gap-width"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                //    // [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                    [stopsDict setObject:stop[1] forKey:stop[0]];
                }
                NSMutableDictionary *optionsDict = [[NSMutableDictionary alloc] init];
                NSNumber *baseNumber = paintProperties[@"line-gap-width"][@"base"];
                if (baseNumber) {
                    // [optionsDict setObject:baseNumber forKey:MGLStyleFunctionOptionInterpolationBase];
                    exp = [NSExpression
                            mgl_expressionForInterpolatingExpression:NSExpression.zoomLevelVariableExpression
                            withCurveType:MGLExpressionInterpolationModeExponential
                            parameters:[NSExpression expressionForConstantValue:baseNumber]
                            stops:[NSExpression expressionForConstantValue:stopsDict]];
                } else {
                    // [optionsDict setObject:[NSNumber numberWithInt:1] forKey:MGLStyleFunctionOptionInterpolationBase];
                    // exp = [NSExpression expressionWithFormat: @"mgl_interpolate:withCurveType:parameters:stops:(mag, 'exponential', nil, %@)", stops];
                    exp = [NSExpression
                            mgl_expressionForInterpolatingExpression:NSExpression.zoomLevelVariableExpression
                            withCurveType:MGLExpressionInterpolationModeLinear
                            parameters:nil
                            stops:[NSExpression expressionForConstantValue:stopsDict]];
                }
                // MGLStyleValue *lineGapWidthValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeExponential cameraStops:stopsDict options:optionsDict];
                // [layer setLineGapWidth:lineGapWidthValue];
                [layer setLineGapWidth:exp];
            } else {
                // MGLStyleValue *lineGapWidthValue = [MGLStyleValue valueWithRawValue:paintProperties[@"line-gap-width"]];
                exp = [NSExpression expressionForConstantValue:paintProperties[@"line-gap-width"]];
                // [layer setLineGapWidth:lineGapWidthValue];
                [layer setLineGapWidth:exp];
            }
        }
        if ([paintProperties valueForKey:@"line-offset"]) {
            NSExpression *exp;
            if ([[paintProperties valueForKey:@"line-offset"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"line-offset"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                //    // [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                    [stopsDict setObject:stop[1] forKey:stop[0]];
                }
                NSMutableDictionary *optionsDict = [[NSMutableDictionary alloc] init];
                NSNumber *baseNumber = paintProperties[@"line-offset"][@"base"];
                if (baseNumber) {
                    // [optionsDict setObject:baseNumber forKey:MGLStyleFunctionOptionInterpolationBase];
                    exp = [NSExpression
                            mgl_expressionForInterpolatingExpression:NSExpression.zoomLevelVariableExpression
                            withCurveType:MGLExpressionInterpolationModeExponential
                            parameters:[NSExpression expressionForConstantValue:baseNumber]
                            stops:[NSExpression expressionForConstantValue:stopsDict]];
                } else {
                    // [optionsDict setObject:[NSNumber numberWithInt:1] forKey:MGLStyleFunctionOptionInterpolationBase];
                    // exp = [NSExpression expressionWithFormat: @"mgl_interpolate:withCurveType:parameters:stops:(mag, 'exponential', nil, %@)", stops];
                    exp = [NSExpression
                            mgl_expressionForInterpolatingExpression:NSExpression.zoomLevelVariableExpression
                            withCurveType:MGLExpressionInterpolationModeLinear
                            parameters:nil
                            stops:[NSExpression expressionForConstantValue:stopsDict]];
                }
                // MGLStyleValue *lineOffsetValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeExponential cameraStops:stopsDict options:optionsDict];
                // [layer setLineOffset:lineOffsetValue];
                [layer setLineOffset:exp];
            } else {
                // MGLStyleValue *lineOffsetValue = [MGLStyleValue valueWithRawValue:paintProperties[@"line-offset"]];
                exp = [NSExpression expressionForConstantValue:paintProperties[@"line-offset"]];
                // [layer setLineOffset:lineOffsetValue];
                [layer setLineOffset:exp];
            }
        }
        if ([paintProperties valueForKey:@"line-blur"]) {
            NSExpression *exp;
            if ([[paintProperties valueForKey:@"line-blur"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"line-blur"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                //    // [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                    [stopsDict setObject:stop[1] forKey:stop[0]];
                }
                NSMutableDictionary *optionsDict = [[NSMutableDictionary alloc] init];
                NSNumber *baseNumber = paintProperties[@"line-blur"][@"base"];
                if (baseNumber) {
                    // [optionsDict setObject:baseNumber forKey:MGLStyleFunctionOptionInterpolationBase];
                    exp = [NSExpression
                            mgl_expressionForInterpolatingExpression:NSExpression.zoomLevelVariableExpression
                            withCurveType:MGLExpressionInterpolationModeExponential
                            parameters:[NSExpression expressionForConstantValue:baseNumber]
                            stops:[NSExpression expressionForConstantValue:stopsDict]];
                } else {
                    // [optionsDict setObject:[NSNumber numberWithInt:1] forKey:MGLStyleFunctionOptionInterpolationBase];
                    // exp = [NSExpression expressionWithFormat: @"mgl_interpolate:withCurveType:parameters:stops:(mag, 'exponential', nil, %@)", stops];
                    exp = [NSExpression
                            mgl_expressionForInterpolatingExpression:NSExpression.zoomLevelVariableExpression
                            withCurveType:MGLExpressionInterpolationModeLinear
                            parameters:nil
                            stops:[NSExpression expressionForConstantValue:stopsDict]];
                }
                // MGLStyleValue *lineBlurValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeExponential cameraStops:stopsDict options:optionsDict];
                // [layer setLineBlur:lineBlurValue];
                [layer setLineBlur:exp];
            } else {
                // MGLStyleValue *lineBlurValue = [MGLStyleValue valueWithRawValue:paintProperties[@"line-blur"]];
                exp = [NSExpression expressionForConstantValue:paintProperties[@"line-blur"]];
                // [layer setLineBlur:lineBlurValue];
                [layer setLineBlur:exp];
            }
        }
        if ([paintProperties valueForKey:@"line-dasharray"]) {
            NSExpression *exp;
            if ([[paintProperties valueForKey:@"line-dasharray"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"line-dasharray"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                //    // [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                    [stopsDict setObject:stop[1] forKey:stop[0]];
                }
                // MGLStyleValue *lineDasharrayValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeInterval cameraStops:stopsDict options:nil];
                //// exp = [NSExpression expressionForConstantValue:paintProperties[@"line-dasharray"]];
                // exp = [NSExpression expressionWithFormat: @"mgl_step:from:stops:(mag, nil, %@)", stopsDict];
                exp = [NSExpression
                       mgl_expressionForSteppingExpression:NSExpression.zoomLevelVariableExpression
                       fromExpression:[NSExpression expressionForConstantValue:stops[0][1]]
                       stops:[NSExpression expressionForConstantValue:stopsDict]];
                // [layer setLineDashPattern:lineDasharrayValue];
                [layer setLineDashPattern:exp];
            } else {
                // MGLStyleValue *lineDasharrayValue = [MGLStyleValue valueWithRawValue:paintProperties[@"line-dasharray"]];
                exp = [NSExpression expressionForConstantValue:paintProperties[@"line-dasharray"]];
                // [layer setLineDashPattern:lineDasharrayValue];
                [layer setLineDashPattern:exp];
            }
        }
        if ([paintProperties valueForKey:@"line-pattern"]) {
            NSExpression *exp;
            if ([[paintProperties valueForKey:@"line-pattern"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"line-pattern"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                //    // [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                    [stopsDict setObject:stop[1] forKey:stop[0]];
                }
                // MGLStyleValue *linePatternValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeInterval cameraStops:stopsDict options:nil];
                //// exp = [NSExpression expressionForConstantValue:paintProperties[@"line-pattern"]];
                // exp = [NSExpression expressionWithFormat: @"mgl_step:from:stops:(mag, nil, %@)", stopsDict];
                exp = [NSExpression
                       mgl_expressionForSteppingExpression:NSExpression.zoomLevelVariableExpression
                       fromExpression:[NSExpression expressionForConstantValue:stops[0][1]]
                       stops:[NSExpression expressionForConstantValue:stopsDict]];
                // [layer setLinePattern:linePatternValue];
                [layer setLinePattern:exp];
            } else {
                // MGLStyleValue *linePatternValue = [MGLStyleValue valueWithRawValue:paintProperties[@"line-pattern"]];
                exp = [NSExpression expressionForConstantValue:paintProperties[@"line-pattern"]];
                // [layer setLinePattern:linePatternValue];
                [layer setLinePattern:exp];
            }
        }
        NSString *sourceLayer = layerJson[@"source-layer"];
        NSArray *filter = layerJson[@"filter"];
        if (sourceLayer) {
            [layer setSourceLayerIdentifier:sourceLayer];
        }
        if (filter) {
            [layer setPredicate:[layer predicateWithJson:filter]];
        }

        NSNumber *minzoom = layerJson[@"minzoom"];
        NSNumber *maxzoom = layerJson[@"maxzoom"];
        if (minzoom) {
            [layer setMinimumZoomLevel:[minzoom floatValue]];
        }
        if (maxzoom) {
            [layer setMaximumZoomLevel:[maxzoom floatValue]];
        }
        return layer;
    }
    if([typeString isEqualToString:@"symbol"]) {
        NSDictionary *paintProperties = layerJson[@"paint"];
        NSDictionary *layoutProperties = layerJson[@"layout"];
        NSString *sourceString = layerJson[@"source"];
        if (!sourceString) {
            if (errorPtr) {
                *errorPtr = [NSError errorWithDomain:RCTMapboxGLErrorDomain
                                     code:1003
                                     userInfo:@{NSLocalizedDescriptionKey:[NSString stringWithFormat:@"addLayer(): layer of type '%@' must have a 'source' attribute", typeString]}
                ];
            }
            return nil;
        }
        MGLSource *source = [mapView styleSourceWithIdentifier:sourceString];
        if (!source) {
            if (errorPtr) {
                *errorPtr = [NSError errorWithDomain:RCTMapboxGLErrorDomain
                                     code:1004
                                     userInfo:@{NSLocalizedDescriptionKey:[NSString stringWithFormat:@"addLayer(): source '%@' for layer '%@' is nil", sourceString, idString]}
                ];
            }
            return nil;
        }
        MGLSymbolStyleLayer *layer = [[MGLSymbolStyleLayer alloc] initWithIdentifier:idString source:source];
        if ([layoutProperties valueForKey:@"symbol-placement"]) {
            // create the NSString -> enum dictionary for later use
            NSDictionary<NSString*, NSNumber *> *enumDictionary = @{
                @"point": @(MGLSymbolPlacementPoint),
                @"line": @(MGLSymbolPlacementLine),
            };
            NSExpression *exp;
            if ([[layoutProperties valueForKey:@"symbol-placement"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = layoutProperties[@"symbol-placement"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    NSValue *value = [NSValue valueWithMGLSymbolPlacement:enumDictionary[layoutProperties[@"symbol-placement"]].integerValue];
                    // // [stopsDict setObject:[MGLStyleValue valueWithRawValue:value] forKey:stop[0]];
                    [stopsDict setObject:value forKey:stop[0]];
                }
                // MGLStyleValue *symbolPlacementValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeInterval cameraStops:stopsDict options:nil];
                //// exp = [NSExpression expressionForConstantValue:layoutProperties[@"symbol-placement"]];
                // exp = [NSExpression expressionWithFormat: @"mgl_step:from:stops:(mag, nil, %@)", stopsDict];
                exp = [NSExpression
                       mgl_expressionForSteppingExpression:NSExpression.zoomLevelVariableExpression
                       fromExpression:[NSExpression expressionForConstantValue:stops[0][1]]
                       stops:[NSExpression expressionForConstantValue:stopsDict]];
                // [layer setSymbolPlacement:symbolPlacementValue];
                [layer setSymbolPlacement:exp];
            } else {
                NSValue *value = [NSValue valueWithMGLSymbolPlacement:enumDictionary[layoutProperties[@"symbol-placement"]].integerValue];
                // MGLStyleValue *symbolPlacementValue = [MGLStyleValue valueWithRawValue:value];
                exp = [NSExpression expressionForConstantValue:value];
                // [layer setSymbolPlacement:symbolPlacementValue];
                [layer setSymbolPlacement:exp];
            }
        }
        if ([layoutProperties valueForKey:@"symbol-spacing"]) {
            NSExpression *exp;
            if ([[layoutProperties valueForKey:@"symbol-spacing"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = layoutProperties[@"symbol-spacing"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                //    // [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                    [stopsDict setObject:stop[1] forKey:stop[0]];
                }
                NSMutableDictionary *optionsDict = [[NSMutableDictionary alloc] init];
                NSNumber *baseNumber = layoutProperties[@"symbol-spacing"][@"base"];
                if (baseNumber) {
                    // [optionsDict setObject:baseNumber forKey:MGLStyleFunctionOptionInterpolationBase];
                    exp = [NSExpression
                            mgl_expressionForInterpolatingExpression:NSExpression.zoomLevelVariableExpression
                            withCurveType:MGLExpressionInterpolationModeExponential
                            parameters:[NSExpression expressionForConstantValue:baseNumber]
                            stops:[NSExpression expressionForConstantValue:stopsDict]];
                } else {
                    // [optionsDict setObject:[NSNumber numberWithInt:1] forKey:MGLStyleFunctionOptionInterpolationBase];
                    // exp = [NSExpression expressionWithFormat: @"mgl_interpolate:withCurveType:parameters:stops:(mag, 'exponential', nil, %@)", stops];
                    exp = [NSExpression
                            mgl_expressionForInterpolatingExpression:NSExpression.zoomLevelVariableExpression
                            withCurveType:MGLExpressionInterpolationModeLinear
                            parameters:nil
                            stops:[NSExpression expressionForConstantValue:stopsDict]];
                }
                // MGLStyleValue *symbolSpacingValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeExponential cameraStops:stopsDict options:optionsDict];
                // [layer setSymbolSpacing:symbolSpacingValue];
                [layer setSymbolSpacing:exp];
            } else {
                // MGLStyleValue *symbolSpacingValue = [MGLStyleValue valueWithRawValue:layoutProperties[@"symbol-spacing"]];
                exp = [NSExpression expressionForConstantValue:layoutProperties[@"symbol-spacing"]];
                // [layer setSymbolSpacing:symbolSpacingValue];
                [layer setSymbolSpacing:exp];
            }
        }
        if ([layoutProperties valueForKey:@"symbol-avoid-edges"]) {
            NSExpression *exp;
            if ([[layoutProperties valueForKey:@"symbol-avoid-edges"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = layoutProperties[@"symbol-avoid-edges"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                //    // [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                    [stopsDict setObject:stop[1] forKey:stop[0]];
                }
                // MGLStyleValue *symbolAvoidEdgesValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeInterval cameraStops:stopsDict options:nil];
                //// exp = [NSExpression expressionForConstantValue:layoutProperties[@"symbol-avoid-edges"]];
                // exp = [NSExpression expressionWithFormat: @"mgl_step:from:stops:(mag, nil, %@)", stopsDict];
                exp = [NSExpression
                       mgl_expressionForSteppingExpression:NSExpression.zoomLevelVariableExpression
                       fromExpression:[NSExpression expressionForConstantValue:stops[0][1]]
                       stops:[NSExpression expressionForConstantValue:stopsDict]];
                // [layer setSymbolAvoidsEdges:symbolAvoidEdgesValue];
                [layer setSymbolAvoidsEdges:exp];
            } else {
                // MGLStyleValue *symbolAvoidEdgesValue = [MGLStyleValue valueWithRawValue:layoutProperties[@"symbol-avoid-edges"]];
                exp = [NSExpression expressionForConstantValue:layoutProperties[@"symbol-avoid-edges"]];
                // [layer setSymbolAvoidsEdges:symbolAvoidEdgesValue];
                [layer setSymbolAvoidsEdges:exp];
            }
        }
        if ([layoutProperties valueForKey:@"icon-allow-overlap"]) {
            NSExpression *exp;
            if ([[layoutProperties valueForKey:@"icon-allow-overlap"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = layoutProperties[@"icon-allow-overlap"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                //    // [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                    [stopsDict setObject:stop[1] forKey:stop[0]];
                }
                // MGLStyleValue *iconAllowOverlapValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeInterval cameraStops:stopsDict options:nil];
                //// exp = [NSExpression expressionForConstantValue:layoutProperties[@"icon-allow-overlap"]];
                // exp = [NSExpression expressionWithFormat: @"mgl_step:from:stops:(mag, nil, %@)", stopsDict];
                exp = [NSExpression
                       mgl_expressionForSteppingExpression:NSExpression.zoomLevelVariableExpression
                       fromExpression:[NSExpression expressionForConstantValue:stops[0][1]]
                       stops:[NSExpression expressionForConstantValue:stopsDict]];
                // [layer setIconAllowsOverlap:iconAllowOverlapValue];
                [layer setIconAllowsOverlap:exp];
            } else {
                // MGLStyleValue *iconAllowOverlapValue = [MGLStyleValue valueWithRawValue:layoutProperties[@"icon-allow-overlap"]];
                exp = [NSExpression expressionForConstantValue:layoutProperties[@"icon-allow-overlap"]];
                // [layer setIconAllowsOverlap:iconAllowOverlapValue];
                [layer setIconAllowsOverlap:exp];
            }
        }
        if ([layoutProperties valueForKey:@"icon-ignore-placement"]) {
            NSExpression *exp;
            if ([[layoutProperties valueForKey:@"icon-ignore-placement"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = layoutProperties[@"icon-ignore-placement"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                //    // [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                    [stopsDict setObject:stop[1] forKey:stop[0]];
                }
                // MGLStyleValue *iconIgnorePlacementValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeInterval cameraStops:stopsDict options:nil];
                //// exp = [NSExpression expressionForConstantValue:layoutProperties[@"icon-ignore-placement"]];
                // exp = [NSExpression expressionWithFormat: @"mgl_step:from:stops:(mag, nil, %@)", stopsDict];
                exp = [NSExpression
                       mgl_expressionForSteppingExpression:NSExpression.zoomLevelVariableExpression
                       fromExpression:[NSExpression expressionForConstantValue:stops[0][1]]
                       stops:[NSExpression expressionForConstantValue:stopsDict]];
                // [layer setIconIgnoresPlacement:iconIgnorePlacementValue];
                [layer setIconIgnoresPlacement:exp];
            } else {
                // MGLStyleValue *iconIgnorePlacementValue = [MGLStyleValue valueWithRawValue:layoutProperties[@"icon-ignore-placement"]];
                exp = [NSExpression expressionForConstantValue:layoutProperties[@"icon-ignore-placement"]];
                // [layer setIconIgnoresPlacement:iconIgnorePlacementValue];
                [layer setIconIgnoresPlacement:exp];
            }
        }
        if ([layoutProperties valueForKey:@"icon-optional"]) {
            NSExpression *exp;
            if ([[layoutProperties valueForKey:@"icon-optional"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = layoutProperties[@"icon-optional"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                //    // [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                    [stopsDict setObject:stop[1] forKey:stop[0]];
                }
                // MGLStyleValue *iconOptionalValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeInterval cameraStops:stopsDict options:nil];
                //// exp = [NSExpression expressionForConstantValue:layoutProperties[@"icon-optional"]];
                // exp = [NSExpression expressionWithFormat: @"mgl_step:from:stops:(mag, nil, %@)", stopsDict];
                exp = [NSExpression
                       mgl_expressionForSteppingExpression:NSExpression.zoomLevelVariableExpression
                       fromExpression:[NSExpression expressionForConstantValue:stops[0][1]]
                       stops:[NSExpression expressionForConstantValue:stopsDict]];
                // [layer setIconOptional:iconOptionalValue];
                [layer setIconOptional:exp];
            } else {
                // MGLStyleValue *iconOptionalValue = [MGLStyleValue valueWithRawValue:layoutProperties[@"icon-optional"]];
                exp = [NSExpression expressionForConstantValue:layoutProperties[@"icon-optional"]];
                // [layer setIconOptional:iconOptionalValue];
                [layer setIconOptional:exp];
            }
        }
        if ([layoutProperties valueForKey:@"icon-rotation-alignment"]) {
            // create the NSString -> enum dictionary for later use
            NSDictionary<NSString*, NSNumber *> *enumDictionary = @{
                @"map": @(MGLIconRotationAlignmentMap),
                @"viewport": @(MGLIconRotationAlignmentViewport),
                @"auto": @(MGLIconRotationAlignmentAuto),
            };
            NSExpression *exp;
            if ([[layoutProperties valueForKey:@"icon-rotation-alignment"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = layoutProperties[@"icon-rotation-alignment"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    NSValue *value = [NSValue valueWithMGLIconRotationAlignment:enumDictionary[layoutProperties[@"icon-rotation-alignment"]].integerValue];
                    // // [stopsDict setObject:[MGLStyleValue valueWithRawValue:value] forKey:stop[0]];
                    [stopsDict setObject:value forKey:stop[0]];
                }
                // MGLStyleValue *iconRotationAlignmentValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeInterval cameraStops:stopsDict options:nil];
                //// exp = [NSExpression expressionForConstantValue:layoutProperties[@"icon-rotation-alignment"]];
                // exp = [NSExpression expressionWithFormat: @"mgl_step:from:stops:(mag, nil, %@)", stopsDict];
                exp = [NSExpression
                       mgl_expressionForSteppingExpression:NSExpression.zoomLevelVariableExpression
                       fromExpression:[NSExpression expressionForConstantValue:stops[0][1]]
                       stops:[NSExpression expressionForConstantValue:stopsDict]];
                // [layer setIconRotationAlignment:iconRotationAlignmentValue];
                [layer setIconRotationAlignment:exp];
            } else {
                NSValue *value = [NSValue valueWithMGLIconRotationAlignment:enumDictionary[layoutProperties[@"icon-rotation-alignment"]].integerValue];
                // MGLStyleValue *iconRotationAlignmentValue = [MGLStyleValue valueWithRawValue:value];
                exp = [NSExpression expressionForConstantValue:value];
                // [layer setIconRotationAlignment:iconRotationAlignmentValue];
                [layer setIconRotationAlignment:exp];
            }
        }
        if ([layoutProperties valueForKey:@"icon-size"]) {
            NSExpression *exp;
            if ([[layoutProperties valueForKey:@"icon-size"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = layoutProperties[@"icon-size"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                //    // [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                    [stopsDict setObject:stop[1] forKey:stop[0]];
                }
                NSMutableDictionary *optionsDict = [[NSMutableDictionary alloc] init];
                NSNumber *baseNumber = layoutProperties[@"icon-size"][@"base"];
                if (baseNumber) {
                    // [optionsDict setObject:baseNumber forKey:MGLStyleFunctionOptionInterpolationBase];
                    exp = [NSExpression
                            mgl_expressionForInterpolatingExpression:NSExpression.zoomLevelVariableExpression
                            withCurveType:MGLExpressionInterpolationModeExponential
                            parameters:[NSExpression expressionForConstantValue:baseNumber]
                            stops:[NSExpression expressionForConstantValue:stopsDict]];
                } else {
                    // [optionsDict setObject:[NSNumber numberWithInt:1] forKey:MGLStyleFunctionOptionInterpolationBase];
                    // exp = [NSExpression expressionWithFormat: @"mgl_interpolate:withCurveType:parameters:stops:(mag, 'exponential', nil, %@)", stops];
                    exp = [NSExpression
                            mgl_expressionForInterpolatingExpression:NSExpression.zoomLevelVariableExpression
                            withCurveType:MGLExpressionInterpolationModeLinear
                            parameters:nil
                            stops:[NSExpression expressionForConstantValue:stopsDict]];
                }
                // MGLStyleValue *iconSizeValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeExponential cameraStops:stopsDict options:optionsDict];
                // [layer setIconScale:iconSizeValue];
                [layer setIconScale:exp];
            } else {
                // MGLStyleValue *iconSizeValue = [MGLStyleValue valueWithRawValue:layoutProperties[@"icon-size"]];
                exp = [NSExpression expressionForConstantValue:layoutProperties[@"icon-size"]];
                // [layer setIconScale:iconSizeValue];
                [layer setIconScale:exp];
            }
        }
        if ([layoutProperties valueForKey:@"icon-text-fit"]) {
            // create the NSString -> enum dictionary for later use
            NSDictionary<NSString*, NSNumber *> *enumDictionary = @{
                @"none": @(MGLIconTextFitNone),
                @"width": @(MGLIconTextFitWidth),
                @"height": @(MGLIconTextFitHeight),
                @"both": @(MGLIconTextFitBoth),
            };
            NSExpression *exp;
            if ([[layoutProperties valueForKey:@"icon-text-fit"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = layoutProperties[@"icon-text-fit"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    NSValue *value = [NSValue valueWithMGLIconTextFit:enumDictionary[layoutProperties[@"icon-text-fit"]].integerValue];
                    // // [stopsDict setObject:[MGLStyleValue valueWithRawValue:value] forKey:stop[0]];
                    [stopsDict setObject:value forKey:stop[0]];
                }
                // MGLStyleValue *iconTextFitValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeInterval cameraStops:stopsDict options:nil];
                //// exp = [NSExpression expressionForConstantValue:layoutProperties[@"icon-text-fit"]];
                // exp = [NSExpression expressionWithFormat: @"mgl_step:from:stops:(mag, nil, %@)", stopsDict];
                exp = [NSExpression
                       mgl_expressionForSteppingExpression:NSExpression.zoomLevelVariableExpression
                       fromExpression:[NSExpression expressionForConstantValue:stops[0][1]]
                       stops:[NSExpression expressionForConstantValue:stopsDict]];
                // [layer setIconTextFit:iconTextFitValue];
                [layer setIconTextFit:exp];
            } else {
                NSValue *value = [NSValue valueWithMGLIconTextFit:enumDictionary[layoutProperties[@"icon-text-fit"]].integerValue];
                // MGLStyleValue *iconTextFitValue = [MGLStyleValue valueWithRawValue:value];
                exp = [NSExpression expressionForConstantValue:value];
                // [layer setIconTextFit:iconTextFitValue];
                [layer setIconTextFit:exp];
            }
        }
        if ([layoutProperties valueForKey:@"icon-text-fit-padding"]) {
            NSExpression *exp;
            if ([[layoutProperties valueForKey:@"icon-text-fit-padding"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = layoutProperties[@"icon-text-fit-padding"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    NSArray *iconTextFitPaddingArray = stop[1];
                    UIEdgeInsets insets = UIEdgeInsetsMake([iconTextFitPaddingArray[0] floatValue], [iconTextFitPaddingArray[3] floatValue], [iconTextFitPaddingArray[2] floatValue], [iconTextFitPaddingArray[1] floatValue]);
                //    [stopsDict setObject:[MGLStyleValue valueWithRawValue:[NSValue valueWithUIEdgeInsets:insets]] forKey:stop[0]];
                    [stopsDict setObject:[NSValue valueWithUIEdgeInsets:insets] forKey:stop[0]];
                }
                NSMutableDictionary *optionsDict = [[NSMutableDictionary alloc] init];
                NSNumber *baseNumber = layoutProperties[@"icon-text-fit-padding"][@"base"];
                if (baseNumber) {
                    // [optionsDict setObject:baseNumber forKey:MGLStyleFunctionOptionInterpolationBase];
                    exp = [NSExpression
                            mgl_expressionForInterpolatingExpression:NSExpression.zoomLevelVariableExpression
                            withCurveType:MGLExpressionInterpolationModeExponential
                            parameters:[NSExpression expressionForConstantValue:baseNumber]
                            stops:[NSExpression expressionForConstantValue:stopsDict]];
                } else {
                    // [optionsDict setObject:[NSNumber numberWithInt:1] forKey:MGLStyleFunctionOptionInterpolationBase];
                    // exp = [NSExpression expressionWithFormat: @"mgl_interpolate:withCurveType:parameters:stops:(mag, 'exponential', nil, %@)", stops];
                    exp = [NSExpression
                            mgl_expressionForInterpolatingExpression:NSExpression.zoomLevelVariableExpression
                            withCurveType:MGLExpressionInterpolationModeLinear
                            parameters:nil
                            stops:[NSExpression expressionForConstantValue:stopsDict]];
                }
                // MGLStyleValue *iconTextFitPaddingValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeExponential cameraStops:stopsDict options:optionsDict];
                // [layer setIconTextFitPadding:iconTextFitPaddingValue];
                [layer setIconTextFitPadding:exp];
            } else {
                // NSArray *iconTextFitPaddingArray = layoutProperties[@"icon-text-fit-padding"];
                // UIEdgeInsets insets = UIEdgeInsetsMake([iconTextFitPaddingArray[0] floatValue], [iconTextFitPaddingArray[3] floatValue], [iconTextFitPaddingArray[2] floatValue], [iconTextFitPaddingArray[1] floatValue]);
                // MGLStyleValue *iconTextFitPaddingValue = [MGLStyleValue valueWithRawValue:[NSValue valueWithUIEdgeInsets:insets]];
                exp = [NSExpression expressionForConstantValue:layoutProperties[@"icon-text-fit-padding"]];
                // [layer setIconTextFitPadding:iconTextFitPaddingValue];
                [layer setIconTextFitPadding:exp];
            }
        }
        if ([layoutProperties valueForKey:@"icon-image"]) {
            NSExpression *exp;
            if ([[layoutProperties valueForKey:@"icon-image"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = layoutProperties[@"icon-image"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                //    // [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                    [stopsDict setObject:stop[1] forKey:stop[0]];
                }
                // MGLStyleValue *iconImageValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeInterval cameraStops:stopsDict options:nil];
                //// exp = [NSExpression expressionForConstantValue:layoutProperties[@"icon-image"]];
                // exp = [NSExpression expressionWithFormat: @"mgl_step:from:stops:(mag, nil, %@)", stopsDict];
                exp = [NSExpression
                       mgl_expressionForSteppingExpression:NSExpression.zoomLevelVariableExpression
                       fromExpression:[NSExpression expressionForConstantValue:stops[0][1]]
                       stops:[NSExpression expressionForConstantValue:stopsDict]];
                // [layer setIconImageName:iconImageValue];
                [layer setIconImageName:exp];
            } else {
                // MGLStyleValue *iconImageValue = [MGLStyleValue valueWithRawValue:layoutProperties[@"icon-image"]];
                exp = [NSExpression expressionForConstantValue:layoutProperties[@"icon-image"]];
                // [layer setIconImageName:iconImageValue];
                [layer setIconImageName:exp];
            }
        }
        if ([layoutProperties valueForKey:@"icon-rotate"]) {
            NSExpression *exp;
            if ([[layoutProperties valueForKey:@"icon-rotate"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = layoutProperties[@"icon-rotate"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                //    // [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                    [stopsDict setObject:stop[1] forKey:stop[0]];
                }
                NSMutableDictionary *optionsDict = [[NSMutableDictionary alloc] init];
                NSNumber *baseNumber = layoutProperties[@"icon-rotate"][@"base"];
                if (baseNumber) {
                    // [optionsDict setObject:baseNumber forKey:MGLStyleFunctionOptionInterpolationBase];
                    exp = [NSExpression
                            mgl_expressionForInterpolatingExpression:NSExpression.zoomLevelVariableExpression
                            withCurveType:MGLExpressionInterpolationModeExponential
                            parameters:[NSExpression expressionForConstantValue:baseNumber]
                            stops:[NSExpression expressionForConstantValue:stopsDict]];
                } else {
                    // [optionsDict setObject:[NSNumber numberWithInt:1] forKey:MGLStyleFunctionOptionInterpolationBase];
                    // exp = [NSExpression expressionWithFormat: @"mgl_interpolate:withCurveType:parameters:stops:(mag, 'exponential', nil, %@)", stops];
                    exp = [NSExpression
                            mgl_expressionForInterpolatingExpression:NSExpression.zoomLevelVariableExpression
                            withCurveType:MGLExpressionInterpolationModeLinear
                            parameters:nil
                            stops:[NSExpression expressionForConstantValue:stopsDict]];
                }
                // MGLStyleValue *iconRotateValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeExponential cameraStops:stopsDict options:optionsDict];
                // [layer setIconRotation:iconRotateValue];
                [layer setIconRotation:exp];
            } else {
                // MGLStyleValue *iconRotateValue = [MGLStyleValue valueWithRawValue:layoutProperties[@"icon-rotate"]];
                exp = [NSExpression expressionForConstantValue:layoutProperties[@"icon-rotate"]];
                // [layer setIconRotation:iconRotateValue];
                [layer setIconRotation:exp];
            }
        }
        if ([layoutProperties valueForKey:@"icon-padding"]) {
            NSExpression *exp;
            if ([[layoutProperties valueForKey:@"icon-padding"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = layoutProperties[@"icon-padding"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                //    // [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                    [stopsDict setObject:stop[1] forKey:stop[0]];
                }
                NSMutableDictionary *optionsDict = [[NSMutableDictionary alloc] init];
                NSNumber *baseNumber = layoutProperties[@"icon-padding"][@"base"];
                if (baseNumber) {
                    // [optionsDict setObject:baseNumber forKey:MGLStyleFunctionOptionInterpolationBase];
                    exp = [NSExpression
                            mgl_expressionForInterpolatingExpression:NSExpression.zoomLevelVariableExpression
                            withCurveType:MGLExpressionInterpolationModeExponential
                            parameters:[NSExpression expressionForConstantValue:baseNumber]
                            stops:[NSExpression expressionForConstantValue:stopsDict]];
                } else {
                    // [optionsDict setObject:[NSNumber numberWithInt:1] forKey:MGLStyleFunctionOptionInterpolationBase];
                    // exp = [NSExpression expressionWithFormat: @"mgl_interpolate:withCurveType:parameters:stops:(mag, 'exponential', nil, %@)", stops];
                    exp = [NSExpression
                            mgl_expressionForInterpolatingExpression:NSExpression.zoomLevelVariableExpression
                            withCurveType:MGLExpressionInterpolationModeLinear
                            parameters:nil
                            stops:[NSExpression expressionForConstantValue:stopsDict]];
                }
                // MGLStyleValue *iconPaddingValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeExponential cameraStops:stopsDict options:optionsDict];
                // [layer setIconPadding:iconPaddingValue];
                [layer setIconPadding:exp];
            } else {
                // MGLStyleValue *iconPaddingValue = [MGLStyleValue valueWithRawValue:layoutProperties[@"icon-padding"]];
                exp = [NSExpression expressionForConstantValue:layoutProperties[@"icon-padding"]];
                // [layer setIconPadding:iconPaddingValue];
                [layer setIconPadding:exp];
            }
        }
        if ([layoutProperties valueForKey:@"icon-keep-upright"]) {
            NSExpression *exp;
            if ([[layoutProperties valueForKey:@"icon-keep-upright"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = layoutProperties[@"icon-keep-upright"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                //    // [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                    [stopsDict setObject:stop[1] forKey:stop[0]];
                }
                // MGLStyleValue *iconKeepUprightValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeInterval cameraStops:stopsDict options:nil];
                //// exp = [NSExpression expressionForConstantValue:layoutProperties[@"icon-keep-upright"]];
                // exp = [NSExpression expressionWithFormat: @"mgl_step:from:stops:(mag, nil, %@)", stopsDict];
                exp = [NSExpression
                       mgl_expressionForSteppingExpression:NSExpression.zoomLevelVariableExpression
                       fromExpression:[NSExpression expressionForConstantValue:stops[0][1]]
                       stops:[NSExpression expressionForConstantValue:stopsDict]];
                // [layer setKeepsIconUpright:iconKeepUprightValue];
                [layer setKeepsIconUpright:exp];
            } else {
                // MGLStyleValue *iconKeepUprightValue = [MGLStyleValue valueWithRawValue:layoutProperties[@"icon-keep-upright"]];
                exp = [NSExpression expressionForConstantValue:layoutProperties[@"icon-keep-upright"]];
                // [layer setKeepsIconUpright:iconKeepUprightValue];
                [layer setKeepsIconUpright:exp];
            }
        }
        if ([layoutProperties valueForKey:@"icon-offset"]) {
            NSExpression *exp;
            if ([[layoutProperties valueForKey:@"icon-offset"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = layoutProperties[@"icon-offset"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    CGVector vector = CGVectorMake([stop[1][0] floatValue], [stop[1][1] floatValue]);
                //    [stopsDict setObject:[MGLStyleValue valueWithRawValue:[NSValue valueWithCGVector:vector]] forKey:stop[0]];
                    [stopsDict setObject:[NSValue valueWithCGVector:vector] forKey:stop[0]];
                }
                NSMutableDictionary *optionsDict = [[NSMutableDictionary alloc] init];
                NSNumber *baseNumber = layoutProperties[@"icon-offset"][@"base"];
                if (baseNumber) {
                    // [optionsDict setObject:baseNumber forKey:MGLStyleFunctionOptionInterpolationBase];
                    exp = [NSExpression
                            mgl_expressionForInterpolatingExpression:NSExpression.zoomLevelVariableExpression
                            withCurveType:MGLExpressionInterpolationModeExponential
                            parameters:[NSExpression expressionForConstantValue:baseNumber]
                            stops:[NSExpression expressionForConstantValue:stopsDict]];
                } else {
                    // [optionsDict setObject:[NSNumber numberWithInt:1] forKey:MGLStyleFunctionOptionInterpolationBase];
                    // exp = [NSExpression expressionWithFormat: @"mgl_interpolate:withCurveType:parameters:stops:(mag, 'exponential', nil, %@)", stops];
                    exp = [NSExpression
                            mgl_expressionForInterpolatingExpression:NSExpression.zoomLevelVariableExpression
                            withCurveType:MGLExpressionInterpolationModeLinear
                            parameters:nil
                            stops:[NSExpression expressionForConstantValue:stopsDict]];
                }
                // MGLStyleValue *iconOffsetValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeExponential cameraStops:stopsDict options:optionsDict];
                // [layer setIconOffset:iconOffsetValue];
                [layer setIconOffset:exp];
            } else {
                // CGVector vector = CGVectorMake([layoutProperties[@"icon-offset"][0] floatValue], [layoutProperties[@"icon-offset"][1] floatValue]);
                // MGLStyleValue *iconOffsetValue = [MGLStyleValue valueWithRawValue:[NSValue valueWithCGVector:vector]];
                exp = [NSExpression expressionForConstantValue:layoutProperties[@"icon-offset"]];
                // [layer setIconOffset:iconOffsetValue];
                [layer setIconOffset:exp];
            }
        }
        if ([layoutProperties valueForKey:@"text-pitch-alignment"]) {
            // create the NSString -> enum dictionary for later use
            NSDictionary<NSString*, NSNumber *> *enumDictionary = @{
                @"map": @(MGLTextPitchAlignmentMap),
                @"viewport": @(MGLTextPitchAlignmentViewport),
                @"auto": @(MGLTextPitchAlignmentAuto),
            };
            NSExpression *exp;
            if ([[layoutProperties valueForKey:@"text-pitch-alignment"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = layoutProperties[@"text-pitch-alignment"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    NSValue *value = [NSValue valueWithMGLTextPitchAlignment:enumDictionary[layoutProperties[@"text-pitch-alignment"]].integerValue];
                    // // [stopsDict setObject:[MGLStyleValue valueWithRawValue:value] forKey:stop[0]];
                    [stopsDict setObject:value forKey:stop[0]];
                }
                // MGLStyleValue *textPitchAlignmentValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeInterval cameraStops:stopsDict options:nil];
                //// exp = [NSExpression expressionForConstantValue:layoutProperties[@"text-pitch-alignment"]];
                // exp = [NSExpression expressionWithFormat: @"mgl_step:from:stops:(mag, nil, %@)", stopsDict];
                exp = [NSExpression
                       mgl_expressionForSteppingExpression:NSExpression.zoomLevelVariableExpression
                       fromExpression:[NSExpression expressionForConstantValue:stops[0][1]]
                       stops:[NSExpression expressionForConstantValue:stopsDict]];
                // [layer setTextPitchAlignment:textPitchAlignmentValue];
                [layer setTextPitchAlignment:exp];
            } else {
                NSValue *value = [NSValue valueWithMGLTextPitchAlignment:enumDictionary[layoutProperties[@"text-pitch-alignment"]].integerValue];
                // MGLStyleValue *textPitchAlignmentValue = [MGLStyleValue valueWithRawValue:value];
                exp = [NSExpression expressionForConstantValue:value];
                // [layer setTextPitchAlignment:textPitchAlignmentValue];
                [layer setTextPitchAlignment:exp];
            }
        }
        if ([layoutProperties valueForKey:@"text-rotation-alignment"]) {
            // create the NSString -> enum dictionary for later use
            NSDictionary<NSString*, NSNumber *> *enumDictionary = @{
                @"map": @(MGLTextRotationAlignmentMap),
                @"viewport": @(MGLTextRotationAlignmentViewport),
                @"auto": @(MGLTextRotationAlignmentAuto),
            };
            NSExpression *exp;
            if ([[layoutProperties valueForKey:@"text-rotation-alignment"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = layoutProperties[@"text-rotation-alignment"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    NSValue *value = [NSValue valueWithMGLTextRotationAlignment:enumDictionary[layoutProperties[@"text-rotation-alignment"]].integerValue];
                    // // [stopsDict setObject:[MGLStyleValue valueWithRawValue:value] forKey:stop[0]];
                    [stopsDict setObject:value forKey:stop[0]];
                }
                // MGLStyleValue *textRotationAlignmentValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeInterval cameraStops:stopsDict options:nil];
                //// exp = [NSExpression expressionForConstantValue:layoutProperties[@"text-rotation-alignment"]];
                // exp = [NSExpression expressionWithFormat: @"mgl_step:from:stops:(mag, nil, %@)", stopsDict];
                exp = [NSExpression
                       mgl_expressionForSteppingExpression:NSExpression.zoomLevelVariableExpression
                       fromExpression:[NSExpression expressionForConstantValue:stops[0][1]]
                       stops:[NSExpression expressionForConstantValue:stopsDict]];
                // [layer setTextRotationAlignment:textRotationAlignmentValue];
                [layer setTextRotationAlignment:exp];
            } else {
                NSValue *value = [NSValue valueWithMGLTextRotationAlignment:enumDictionary[layoutProperties[@"text-rotation-alignment"]].integerValue];
                // MGLStyleValue *textRotationAlignmentValue = [MGLStyleValue valueWithRawValue:value];
                exp = [NSExpression expressionForConstantValue:value];
                // [layer setTextRotationAlignment:textRotationAlignmentValue];
                [layer setTextRotationAlignment:exp];
            }
        }
        if ([layoutProperties valueForKey:@"text-field"]) {
            NSExpression *exp;
            if ([[layoutProperties valueForKey:@"text-field"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = layoutProperties[@"text-field"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                //    // [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                    [stopsDict setObject:stop[1] forKey:stop[0]];
                }
                // MGLStyleValue *textFieldValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeInterval cameraStops:stopsDict options:nil];
                //// exp = [NSExpression expressionForConstantValue:layoutProperties[@"text-field"]];
                // exp = [NSExpression expressionWithFormat: @"mgl_step:from:stops:(mag, nil, %@)", stopsDict];
                exp = [NSExpression
                       mgl_expressionForSteppingExpression:NSExpression.zoomLevelVariableExpression
                       fromExpression:[NSExpression expressionForConstantValue:stops[0][1]]
                       stops:[NSExpression expressionForConstantValue:stopsDict]];
                // [layer setText:textFieldValue];
                [layer setText:exp];
            } else {
                // MGLStyleValue *textFieldValue = [MGLStyleValue valueWithRawValue:layoutProperties[@"text-field"]];
                exp = [NSExpression expressionForConstantValue:layoutProperties[@"text-field"]];
                // [layer setText:textFieldValue];
                [layer setText:exp];
            }
        }
        if ([layoutProperties valueForKey:@"text-font"]) {
            NSExpression *exp;
            if ([[layoutProperties valueForKey:@"text-font"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = layoutProperties[@"text-font"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                //    // [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                    [stopsDict setObject:stop[1] forKey:stop[0]];
                }
                // MGLStyleValue *textFontValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeInterval cameraStops:stopsDict options:nil];
                //// exp = [NSExpression expressionForConstantValue:layoutProperties[@"text-font"]];
                // exp = [NSExpression expressionWithFormat: @"mgl_step:from:stops:(mag, nil, %@)", stopsDict];
                exp = [NSExpression
                       mgl_expressionForSteppingExpression:NSExpression.zoomLevelVariableExpression
                       fromExpression:[NSExpression expressionForConstantValue:stops[0][1]]
                       stops:[NSExpression expressionForConstantValue:stopsDict]];
                // [layer setTextFontNames:textFontValue];
                [layer setTextFontNames:exp];
            } else {
                // MGLStyleValue *textFontValue = [MGLStyleValue valueWithRawValue:layoutProperties[@"text-font"]];
                exp = [NSExpression expressionForConstantValue:layoutProperties[@"text-font"]];
                // [layer setTextFontNames:textFontValue];
                [layer setTextFontNames:exp];
            }
        }
        if ([layoutProperties valueForKey:@"text-size"]) {
            NSExpression *exp;
            if ([[layoutProperties valueForKey:@"text-size"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = layoutProperties[@"text-size"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                //    // [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                    [stopsDict setObject:stop[1] forKey:stop[0]];
                }
                NSMutableDictionary *optionsDict = [[NSMutableDictionary alloc] init];
                NSNumber *baseNumber = layoutProperties[@"text-size"][@"base"];
                if (baseNumber) {
                    // [optionsDict setObject:baseNumber forKey:MGLStyleFunctionOptionInterpolationBase];
                    exp = [NSExpression
                            mgl_expressionForInterpolatingExpression:NSExpression.zoomLevelVariableExpression
                            withCurveType:MGLExpressionInterpolationModeExponential
                            parameters:[NSExpression expressionForConstantValue:baseNumber]
                            stops:[NSExpression expressionForConstantValue:stopsDict]];
                } else {
                    // [optionsDict setObject:[NSNumber numberWithInt:1] forKey:MGLStyleFunctionOptionInterpolationBase];
                    // exp = [NSExpression expressionWithFormat: @"mgl_interpolate:withCurveType:parameters:stops:(mag, 'exponential', nil, %@)", stops];
                    exp = [NSExpression
                            mgl_expressionForInterpolatingExpression:NSExpression.zoomLevelVariableExpression
                            withCurveType:MGLExpressionInterpolationModeLinear
                            parameters:nil
                            stops:[NSExpression expressionForConstantValue:stopsDict]];
                }
                // MGLStyleValue *textSizeValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeExponential cameraStops:stopsDict options:optionsDict];
                // [layer setTextFontSize:textSizeValue];
                [layer setTextFontSize:exp];
            } else {
                // MGLStyleValue *textSizeValue = [MGLStyleValue valueWithRawValue:layoutProperties[@"text-size"]];
                exp = [NSExpression expressionForConstantValue:layoutProperties[@"text-size"]];
                // [layer setTextFontSize:textSizeValue];
                [layer setTextFontSize:exp];
            }
        }
        if ([layoutProperties valueForKey:@"text-max-width"]) {
            NSExpression *exp;
            if ([[layoutProperties valueForKey:@"text-max-width"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = layoutProperties[@"text-max-width"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                //    // [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                    [stopsDict setObject:stop[1] forKey:stop[0]];
                }
                NSMutableDictionary *optionsDict = [[NSMutableDictionary alloc] init];
                NSNumber *baseNumber = layoutProperties[@"text-max-width"][@"base"];
                if (baseNumber) {
                    // [optionsDict setObject:baseNumber forKey:MGLStyleFunctionOptionInterpolationBase];
                    exp = [NSExpression
                            mgl_expressionForInterpolatingExpression:NSExpression.zoomLevelVariableExpression
                            withCurveType:MGLExpressionInterpolationModeExponential
                            parameters:[NSExpression expressionForConstantValue:baseNumber]
                            stops:[NSExpression expressionForConstantValue:stopsDict]];
                } else {
                    // [optionsDict setObject:[NSNumber numberWithInt:1] forKey:MGLStyleFunctionOptionInterpolationBase];
                    // exp = [NSExpression expressionWithFormat: @"mgl_interpolate:withCurveType:parameters:stops:(mag, 'exponential', nil, %@)", stops];
                    exp = [NSExpression
                            mgl_expressionForInterpolatingExpression:NSExpression.zoomLevelVariableExpression
                            withCurveType:MGLExpressionInterpolationModeLinear
                            parameters:nil
                            stops:[NSExpression expressionForConstantValue:stopsDict]];
                }
                // MGLStyleValue *textMaxWidthValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeExponential cameraStops:stopsDict options:optionsDict];
                // [layer setMaximumTextWidth:textMaxWidthValue];
                [layer setMaximumTextWidth:exp];
            } else {
                // MGLStyleValue *textMaxWidthValue = [MGLStyleValue valueWithRawValue:layoutProperties[@"text-max-width"]];
                exp = [NSExpression expressionForConstantValue:layoutProperties[@"text-max-width"]];
                // [layer setMaximumTextWidth:textMaxWidthValue];
                [layer setMaximumTextWidth:exp];
            }
        }
        if ([layoutProperties valueForKey:@"text-line-height"]) {
            NSExpression *exp;
            if ([[layoutProperties valueForKey:@"text-line-height"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = layoutProperties[@"text-line-height"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                //    // [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                    [stopsDict setObject:stop[1] forKey:stop[0]];
                }
                NSMutableDictionary *optionsDict = [[NSMutableDictionary alloc] init];
                NSNumber *baseNumber = layoutProperties[@"text-line-height"][@"base"];
                if (baseNumber) {
                    // [optionsDict setObject:baseNumber forKey:MGLStyleFunctionOptionInterpolationBase];
                    exp = [NSExpression
                            mgl_expressionForInterpolatingExpression:NSExpression.zoomLevelVariableExpression
                            withCurveType:MGLExpressionInterpolationModeExponential
                            parameters:[NSExpression expressionForConstantValue:baseNumber]
                            stops:[NSExpression expressionForConstantValue:stopsDict]];
                } else {
                    // [optionsDict setObject:[NSNumber numberWithInt:1] forKey:MGLStyleFunctionOptionInterpolationBase];
                    // exp = [NSExpression expressionWithFormat: @"mgl_interpolate:withCurveType:parameters:stops:(mag, 'exponential', nil, %@)", stops];
                    exp = [NSExpression
                            mgl_expressionForInterpolatingExpression:NSExpression.zoomLevelVariableExpression
                            withCurveType:MGLExpressionInterpolationModeLinear
                            parameters:nil
                            stops:[NSExpression expressionForConstantValue:stopsDict]];
                }
                // MGLStyleValue *textLineHeightValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeExponential cameraStops:stopsDict options:optionsDict];
                // [layer setTextLineHeight:textLineHeightValue];
                [layer setTextLineHeight:exp];
            } else {
                // MGLStyleValue *textLineHeightValue = [MGLStyleValue valueWithRawValue:layoutProperties[@"text-line-height"]];
                exp = [NSExpression expressionForConstantValue:layoutProperties[@"text-line-height"]];
                // [layer setTextLineHeight:textLineHeightValue];
                [layer setTextLineHeight:exp];
            }
        }
        if ([layoutProperties valueForKey:@"text-letter-spacing"]) {
            NSExpression *exp;
            if ([[layoutProperties valueForKey:@"text-letter-spacing"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = layoutProperties[@"text-letter-spacing"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                //    // [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                    [stopsDict setObject:stop[1] forKey:stop[0]];
                }
                NSMutableDictionary *optionsDict = [[NSMutableDictionary alloc] init];
                NSNumber *baseNumber = layoutProperties[@"text-letter-spacing"][@"base"];
                if (baseNumber) {
                    // [optionsDict setObject:baseNumber forKey:MGLStyleFunctionOptionInterpolationBase];
                    exp = [NSExpression
                            mgl_expressionForInterpolatingExpression:NSExpression.zoomLevelVariableExpression
                            withCurveType:MGLExpressionInterpolationModeExponential
                            parameters:[NSExpression expressionForConstantValue:baseNumber]
                            stops:[NSExpression expressionForConstantValue:stopsDict]];
                } else {
                    // [optionsDict setObject:[NSNumber numberWithInt:1] forKey:MGLStyleFunctionOptionInterpolationBase];
                    // exp = [NSExpression expressionWithFormat: @"mgl_interpolate:withCurveType:parameters:stops:(mag, 'exponential', nil, %@)", stops];
                    exp = [NSExpression
                            mgl_expressionForInterpolatingExpression:NSExpression.zoomLevelVariableExpression
                            withCurveType:MGLExpressionInterpolationModeLinear
                            parameters:nil
                            stops:[NSExpression expressionForConstantValue:stopsDict]];
                }
                // MGLStyleValue *textLetterSpacingValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeExponential cameraStops:stopsDict options:optionsDict];
                // [layer setTextLetterSpacing:textLetterSpacingValue];
                [layer setTextLetterSpacing:exp];
            } else {
                // MGLStyleValue *textLetterSpacingValue = [MGLStyleValue valueWithRawValue:layoutProperties[@"text-letter-spacing"]];
                exp = [NSExpression expressionForConstantValue:layoutProperties[@"text-letter-spacing"]];
                // [layer setTextLetterSpacing:textLetterSpacingValue];
                [layer setTextLetterSpacing:exp];
            }
        }
        if ([layoutProperties valueForKey:@"text-justify"]) {
            // create the NSString -> enum dictionary for later use
            NSDictionary<NSString*, NSNumber *> *enumDictionary = @{
                @"left": @(MGLTextJustificationLeft),
                @"center": @(MGLTextJustificationCenter),
                @"right": @(MGLTextJustificationRight),
            };
            NSExpression *exp;
            if ([[layoutProperties valueForKey:@"text-justify"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = layoutProperties[@"text-justify"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    NSValue *value = [NSValue valueWithMGLTextJustification:enumDictionary[layoutProperties[@"text-justify"]].integerValue];
                    // // [stopsDict setObject:[MGLStyleValue valueWithRawValue:value] forKey:stop[0]];
                    [stopsDict setObject:value forKey:stop[0]];
                }
                // MGLStyleValue *textJustifyValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeInterval cameraStops:stopsDict options:nil];
                //// exp = [NSExpression expressionForConstantValue:layoutProperties[@"text-justify"]];
                // exp = [NSExpression expressionWithFormat: @"mgl_step:from:stops:(mag, nil, %@)", stopsDict];
                exp = [NSExpression
                       mgl_expressionForSteppingExpression:NSExpression.zoomLevelVariableExpression
                       fromExpression:[NSExpression expressionForConstantValue:stops[0][1]]
                       stops:[NSExpression expressionForConstantValue:stopsDict]];
                // [layer setTextJustification:textJustifyValue];
                [layer setTextJustification:exp];
            } else {
                NSValue *value = [NSValue valueWithMGLTextJustification:enumDictionary[layoutProperties[@"text-justify"]].integerValue];
                // MGLStyleValue *textJustifyValue = [MGLStyleValue valueWithRawValue:value];
                exp = [NSExpression expressionForConstantValue:value];
                // [layer setTextJustification:textJustifyValue];
                [layer setTextJustification:exp];
            }
        }
        if ([layoutProperties valueForKey:@"text-anchor"]) {
            // create the NSString -> enum dictionary for later use
            NSDictionary<NSString*, NSNumber *> *enumDictionary = @{
                @"center": @(MGLTextAnchorCenter),
                @"left": @(MGLTextAnchorLeft),
                @"right": @(MGLTextAnchorRight),
                @"top": @(MGLTextAnchorTop),
                @"bottom": @(MGLTextAnchorBottom),
                @"top-left": @(MGLTextAnchorTopLeft),
                @"top-right": @(MGLTextAnchorTopRight),
                @"bottom-left": @(MGLTextAnchorBottomLeft),
                @"bottom-right": @(MGLTextAnchorBottomRight),
            };
            NSExpression *exp;
            if ([[layoutProperties valueForKey:@"text-anchor"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = layoutProperties[@"text-anchor"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    NSValue *value = [NSValue valueWithMGLTextAnchor:enumDictionary[layoutProperties[@"text-anchor"]].integerValue];
                    // // [stopsDict setObject:[MGLStyleValue valueWithRawValue:value] forKey:stop[0]];
                    [stopsDict setObject:value forKey:stop[0]];
                }
                // MGLStyleValue *textAnchorValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeInterval cameraStops:stopsDict options:nil];
                //// exp = [NSExpression expressionForConstantValue:layoutProperties[@"text-anchor"]];
                // exp = [NSExpression expressionWithFormat: @"mgl_step:from:stops:(mag, nil, %@)", stopsDict];
                exp = [NSExpression
                       mgl_expressionForSteppingExpression:NSExpression.zoomLevelVariableExpression
                       fromExpression:[NSExpression expressionForConstantValue:stops[0][1]]
                       stops:[NSExpression expressionForConstantValue:stopsDict]];
                // [layer setTextAnchor:textAnchorValue];
                [layer setTextAnchor:exp];
            } else {
                NSValue *value = [NSValue valueWithMGLTextAnchor:enumDictionary[layoutProperties[@"text-anchor"]].integerValue];
                // MGLStyleValue *textAnchorValue = [MGLStyleValue valueWithRawValue:value];
                exp = [NSExpression expressionForConstantValue:value];
                // [layer setTextAnchor:textAnchorValue];
                [layer setTextAnchor:exp];
            }
        }
        if ([layoutProperties valueForKey:@"text-max-angle"]) {
            NSExpression *exp;
            if ([[layoutProperties valueForKey:@"text-max-angle"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = layoutProperties[@"text-max-angle"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                //    // [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                    [stopsDict setObject:stop[1] forKey:stop[0]];
                }
                NSMutableDictionary *optionsDict = [[NSMutableDictionary alloc] init];
                NSNumber *baseNumber = layoutProperties[@"text-max-angle"][@"base"];
                if (baseNumber) {
                    // [optionsDict setObject:baseNumber forKey:MGLStyleFunctionOptionInterpolationBase];
                    exp = [NSExpression
                            mgl_expressionForInterpolatingExpression:NSExpression.zoomLevelVariableExpression
                            withCurveType:MGLExpressionInterpolationModeExponential
                            parameters:[NSExpression expressionForConstantValue:baseNumber]
                            stops:[NSExpression expressionForConstantValue:stopsDict]];
                } else {
                    // [optionsDict setObject:[NSNumber numberWithInt:1] forKey:MGLStyleFunctionOptionInterpolationBase];
                    // exp = [NSExpression expressionWithFormat: @"mgl_interpolate:withCurveType:parameters:stops:(mag, 'exponential', nil, %@)", stops];
                    exp = [NSExpression
                            mgl_expressionForInterpolatingExpression:NSExpression.zoomLevelVariableExpression
                            withCurveType:MGLExpressionInterpolationModeLinear
                            parameters:nil
                            stops:[NSExpression expressionForConstantValue:stopsDict]];
                }
                // MGLStyleValue *textMaxAngleValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeExponential cameraStops:stopsDict options:optionsDict];
                // [layer setMaximumTextAngle:textMaxAngleValue];
                [layer setMaximumTextAngle:exp];
            } else {
                // MGLStyleValue *textMaxAngleValue = [MGLStyleValue valueWithRawValue:layoutProperties[@"text-max-angle"]];
                exp = [NSExpression expressionForConstantValue:layoutProperties[@"text-max-angle"]];
                // [layer setMaximumTextAngle:textMaxAngleValue];
                [layer setMaximumTextAngle:exp];
            }
        }
        if ([layoutProperties valueForKey:@"text-rotate"]) {
            NSExpression *exp;
            if ([[layoutProperties valueForKey:@"text-rotate"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = layoutProperties[@"text-rotate"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                //    // [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                    [stopsDict setObject:stop[1] forKey:stop[0]];
                }
                NSMutableDictionary *optionsDict = [[NSMutableDictionary alloc] init];
                NSNumber *baseNumber = layoutProperties[@"text-rotate"][@"base"];
                if (baseNumber) {
                    // [optionsDict setObject:baseNumber forKey:MGLStyleFunctionOptionInterpolationBase];
                    exp = [NSExpression
                            mgl_expressionForInterpolatingExpression:NSExpression.zoomLevelVariableExpression
                            withCurveType:MGLExpressionInterpolationModeExponential
                            parameters:[NSExpression expressionForConstantValue:baseNumber]
                            stops:[NSExpression expressionForConstantValue:stopsDict]];
                } else {
                    // [optionsDict setObject:[NSNumber numberWithInt:1] forKey:MGLStyleFunctionOptionInterpolationBase];
                    // exp = [NSExpression expressionWithFormat: @"mgl_interpolate:withCurveType:parameters:stops:(mag, 'exponential', nil, %@)", stops];
                    exp = [NSExpression
                            mgl_expressionForInterpolatingExpression:NSExpression.zoomLevelVariableExpression
                            withCurveType:MGLExpressionInterpolationModeLinear
                            parameters:nil
                            stops:[NSExpression expressionForConstantValue:stopsDict]];
                }
                // MGLStyleValue *textRotateValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeExponential cameraStops:stopsDict options:optionsDict];
                // [layer setTextRotation:textRotateValue];
                [layer setTextRotation:exp];
            } else {
                // MGLStyleValue *textRotateValue = [MGLStyleValue valueWithRawValue:layoutProperties[@"text-rotate"]];
                exp = [NSExpression expressionForConstantValue:layoutProperties[@"text-rotate"]];
                // [layer setTextRotation:textRotateValue];
                [layer setTextRotation:exp];
            }
        }
        if ([layoutProperties valueForKey:@"text-padding"]) {
            NSExpression *exp;
            if ([[layoutProperties valueForKey:@"text-padding"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = layoutProperties[@"text-padding"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                //    // [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                    [stopsDict setObject:stop[1] forKey:stop[0]];
                }
                NSMutableDictionary *optionsDict = [[NSMutableDictionary alloc] init];
                NSNumber *baseNumber = layoutProperties[@"text-padding"][@"base"];
                if (baseNumber) {
                    // [optionsDict setObject:baseNumber forKey:MGLStyleFunctionOptionInterpolationBase];
                    exp = [NSExpression
                            mgl_expressionForInterpolatingExpression:NSExpression.zoomLevelVariableExpression
                            withCurveType:MGLExpressionInterpolationModeExponential
                            parameters:[NSExpression expressionForConstantValue:baseNumber]
                            stops:[NSExpression expressionForConstantValue:stopsDict]];
                } else {
                    // [optionsDict setObject:[NSNumber numberWithInt:1] forKey:MGLStyleFunctionOptionInterpolationBase];
                    // exp = [NSExpression expressionWithFormat: @"mgl_interpolate:withCurveType:parameters:stops:(mag, 'exponential', nil, %@)", stops];
                    exp = [NSExpression
                            mgl_expressionForInterpolatingExpression:NSExpression.zoomLevelVariableExpression
                            withCurveType:MGLExpressionInterpolationModeLinear
                            parameters:nil
                            stops:[NSExpression expressionForConstantValue:stopsDict]];
                }
                // MGLStyleValue *textPaddingValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeExponential cameraStops:stopsDict options:optionsDict];
                // [layer setTextPadding:textPaddingValue];
                [layer setTextPadding:exp];
            } else {
                // MGLStyleValue *textPaddingValue = [MGLStyleValue valueWithRawValue:layoutProperties[@"text-padding"]];
                exp = [NSExpression expressionForConstantValue:layoutProperties[@"text-padding"]];
                // [layer setTextPadding:textPaddingValue];
                [layer setTextPadding:exp];
            }
        }
        if ([layoutProperties valueForKey:@"text-keep-upright"]) {
            NSExpression *exp;
            if ([[layoutProperties valueForKey:@"text-keep-upright"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = layoutProperties[@"text-keep-upright"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                //    // [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                    [stopsDict setObject:stop[1] forKey:stop[0]];
                }
                // MGLStyleValue *textKeepUprightValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeInterval cameraStops:stopsDict options:nil];
                //// exp = [NSExpression expressionForConstantValue:layoutProperties[@"text-keep-upright"]];
                // exp = [NSExpression expressionWithFormat: @"mgl_step:from:stops:(mag, nil, %@)", stopsDict];
                exp = [NSExpression
                       mgl_expressionForSteppingExpression:NSExpression.zoomLevelVariableExpression
                       fromExpression:[NSExpression expressionForConstantValue:stops[0][1]]
                       stops:[NSExpression expressionForConstantValue:stopsDict]];
                // [layer setKeepsTextUpright:textKeepUprightValue];
                [layer setKeepsTextUpright:exp];
            } else {
                // MGLStyleValue *textKeepUprightValue = [MGLStyleValue valueWithRawValue:layoutProperties[@"text-keep-upright"]];
                exp = [NSExpression expressionForConstantValue:layoutProperties[@"text-keep-upright"]];
                // [layer setKeepsTextUpright:textKeepUprightValue];
                [layer setKeepsTextUpright:exp];
            }
        }
        if ([layoutProperties valueForKey:@"text-transform"]) {
            // create the NSString -> enum dictionary for later use
            NSDictionary<NSString*, NSNumber *> *enumDictionary = @{
                @"none": @(MGLTextTransformNone),
                @"uppercase": @(MGLTextTransformUppercase),
                @"lowercase": @(MGLTextTransformLowercase),
            };
            NSExpression *exp;
            if ([[layoutProperties valueForKey:@"text-transform"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = layoutProperties[@"text-transform"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    NSValue *value = [NSValue valueWithMGLTextTransform:enumDictionary[layoutProperties[@"text-transform"]].integerValue];
                    // // [stopsDict setObject:[MGLStyleValue valueWithRawValue:value] forKey:stop[0]];
                    [stopsDict setObject:value forKey:stop[0]];
                }
                // MGLStyleValue *textTransformValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeInterval cameraStops:stopsDict options:nil];
                //// exp = [NSExpression expressionForConstantValue:layoutProperties[@"text-transform"]];
                // exp = [NSExpression expressionWithFormat: @"mgl_step:from:stops:(mag, nil, %@)", stopsDict];
                exp = [NSExpression
                       mgl_expressionForSteppingExpression:NSExpression.zoomLevelVariableExpression
                       fromExpression:[NSExpression expressionForConstantValue:stops[0][1]]
                       stops:[NSExpression expressionForConstantValue:stopsDict]];
                // [layer setTextTransform:textTransformValue];
                [layer setTextTransform:exp];
            } else {
                NSValue *value = [NSValue valueWithMGLTextTransform:enumDictionary[layoutProperties[@"text-transform"]].integerValue];
                // MGLStyleValue *textTransformValue = [MGLStyleValue valueWithRawValue:value];
                exp = [NSExpression expressionForConstantValue:value];
                // [layer setTextTransform:textTransformValue];
                [layer setTextTransform:exp];
            }
        }
        if ([layoutProperties valueForKey:@"text-offset"]) {
            NSExpression *exp;
            if ([[layoutProperties valueForKey:@"text-offset"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = layoutProperties[@"text-offset"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    CGVector vector = CGVectorMake([stop[1][0] floatValue], [stop[1][1] floatValue]);
                //    [stopsDict setObject:[MGLStyleValue valueWithRawValue:[NSValue valueWithCGVector:vector]] forKey:stop[0]];
                    [stopsDict setObject:[NSValue valueWithCGVector:vector] forKey:stop[0]];
                }
                NSMutableDictionary *optionsDict = [[NSMutableDictionary alloc] init];
                NSNumber *baseNumber = layoutProperties[@"text-offset"][@"base"];
                if (baseNumber) {
                    // [optionsDict setObject:baseNumber forKey:MGLStyleFunctionOptionInterpolationBase];
                    exp = [NSExpression
                            mgl_expressionForInterpolatingExpression:NSExpression.zoomLevelVariableExpression
                            withCurveType:MGLExpressionInterpolationModeExponential
                            parameters:[NSExpression expressionForConstantValue:baseNumber]
                            stops:[NSExpression expressionForConstantValue:stopsDict]];
                } else {
                    // [optionsDict setObject:[NSNumber numberWithInt:1] forKey:MGLStyleFunctionOptionInterpolationBase];
                    // exp = [NSExpression expressionWithFormat: @"mgl_interpolate:withCurveType:parameters:stops:(mag, 'exponential', nil, %@)", stops];
                    exp = [NSExpression
                            mgl_expressionForInterpolatingExpression:NSExpression.zoomLevelVariableExpression
                            withCurveType:MGLExpressionInterpolationModeLinear
                            parameters:nil
                            stops:[NSExpression expressionForConstantValue:stopsDict]];
                }
                // MGLStyleValue *textOffsetValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeExponential cameraStops:stopsDict options:optionsDict];
                // [layer setTextOffset:textOffsetValue];
                [layer setTextOffset:exp];
            } else {
                // CGVector vector = CGVectorMake([layoutProperties[@"text-offset"][0] floatValue], [layoutProperties[@"text-offset"][1] floatValue]);
                // MGLStyleValue *textOffsetValue = [MGLStyleValue valueWithRawValue:[NSValue valueWithCGVector:vector]];
                exp = [NSExpression expressionForConstantValue:layoutProperties[@"text-offset"]];
                // [layer setTextOffset:textOffsetValue];
                [layer setTextOffset:exp];
            }
        }
        if ([layoutProperties valueForKey:@"text-allow-overlap"]) {
            NSExpression *exp;
            if ([[layoutProperties valueForKey:@"text-allow-overlap"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = layoutProperties[@"text-allow-overlap"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                //    // [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                    [stopsDict setObject:stop[1] forKey:stop[0]];
                }
                // MGLStyleValue *textAllowOverlapValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeInterval cameraStops:stopsDict options:nil];
                //// exp = [NSExpression expressionForConstantValue:layoutProperties[@"text-allow-overlap"]];
                // exp = [NSExpression expressionWithFormat: @"mgl_step:from:stops:(mag, nil, %@)", stopsDict];
                exp = [NSExpression
                       mgl_expressionForSteppingExpression:NSExpression.zoomLevelVariableExpression
                       fromExpression:[NSExpression expressionForConstantValue:stops[0][1]]
                       stops:[NSExpression expressionForConstantValue:stopsDict]];
                // [layer setTextAllowsOverlap:textAllowOverlapValue];
                [layer setTextAllowsOverlap:exp];
            } else {
                // MGLStyleValue *textAllowOverlapValue = [MGLStyleValue valueWithRawValue:layoutProperties[@"text-allow-overlap"]];
                exp = [NSExpression expressionForConstantValue:layoutProperties[@"text-allow-overlap"]];
                // [layer setTextAllowsOverlap:textAllowOverlapValue];
                [layer setTextAllowsOverlap:exp];
            }
        }
        if ([layoutProperties valueForKey:@"text-ignore-placement"]) {
            NSExpression *exp;
            if ([[layoutProperties valueForKey:@"text-ignore-placement"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = layoutProperties[@"text-ignore-placement"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                //    // [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                    [stopsDict setObject:stop[1] forKey:stop[0]];
                }
                // MGLStyleValue *textIgnorePlacementValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeInterval cameraStops:stopsDict options:nil];
                //// exp = [NSExpression expressionForConstantValue:layoutProperties[@"text-ignore-placement"]];
                // exp = [NSExpression expressionWithFormat: @"mgl_step:from:stops:(mag, nil, %@)", stopsDict];
                exp = [NSExpression
                       mgl_expressionForSteppingExpression:NSExpression.zoomLevelVariableExpression
                       fromExpression:[NSExpression expressionForConstantValue:stops[0][1]]
                       stops:[NSExpression expressionForConstantValue:stopsDict]];
                // [layer setTextIgnoresPlacement:textIgnorePlacementValue];
                [layer setTextIgnoresPlacement:exp];
            } else {
                // MGLStyleValue *textIgnorePlacementValue = [MGLStyleValue valueWithRawValue:layoutProperties[@"text-ignore-placement"]];
                exp = [NSExpression expressionForConstantValue:layoutProperties[@"text-ignore-placement"]];
                // [layer setTextIgnoresPlacement:textIgnorePlacementValue];
                [layer setTextIgnoresPlacement:exp];
            }
        }
        if ([layoutProperties valueForKey:@"text-optional"]) {
            NSExpression *exp;
            if ([[layoutProperties valueForKey:@"text-optional"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = layoutProperties[@"text-optional"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                //    // [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                    [stopsDict setObject:stop[1] forKey:stop[0]];
                }
                // MGLStyleValue *textOptionalValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeInterval cameraStops:stopsDict options:nil];
                //// exp = [NSExpression expressionForConstantValue:layoutProperties[@"text-optional"]];
                // exp = [NSExpression expressionWithFormat: @"mgl_step:from:stops:(mag, nil, %@)", stopsDict];
                exp = [NSExpression
                       mgl_expressionForSteppingExpression:NSExpression.zoomLevelVariableExpression
                       fromExpression:[NSExpression expressionForConstantValue:stops[0][1]]
                       stops:[NSExpression expressionForConstantValue:stopsDict]];
                // [layer setTextOptional:textOptionalValue];
                [layer setTextOptional:exp];
            } else {
                // MGLStyleValue *textOptionalValue = [MGLStyleValue valueWithRawValue:layoutProperties[@"text-optional"]];
                exp = [NSExpression expressionForConstantValue:layoutProperties[@"text-optional"]];
                // [layer setTextOptional:textOptionalValue];
                [layer setTextOptional:exp];
            }
        }
        if ([paintProperties valueForKey:@"icon-opacity"]) {
            NSExpression *exp;
            if ([[paintProperties valueForKey:@"icon-opacity"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"icon-opacity"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                //    // [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                    [stopsDict setObject:stop[1] forKey:stop[0]];
                }
                NSMutableDictionary *optionsDict = [[NSMutableDictionary alloc] init];
                NSNumber *baseNumber = paintProperties[@"icon-opacity"][@"base"];
                if (baseNumber) {
                    // [optionsDict setObject:baseNumber forKey:MGLStyleFunctionOptionInterpolationBase];
                    exp = [NSExpression
                            mgl_expressionForInterpolatingExpression:NSExpression.zoomLevelVariableExpression
                            withCurveType:MGLExpressionInterpolationModeExponential
                            parameters:[NSExpression expressionForConstantValue:baseNumber]
                            stops:[NSExpression expressionForConstantValue:stopsDict]];
                } else {
                    // [optionsDict setObject:[NSNumber numberWithInt:1] forKey:MGLStyleFunctionOptionInterpolationBase];
                    // exp = [NSExpression expressionWithFormat: @"mgl_interpolate:withCurveType:parameters:stops:(mag, 'exponential', nil, %@)", stops];
                    exp = [NSExpression
                            mgl_expressionForInterpolatingExpression:NSExpression.zoomLevelVariableExpression
                            withCurveType:MGLExpressionInterpolationModeLinear
                            parameters:nil
                            stops:[NSExpression expressionForConstantValue:stopsDict]];
                }
                // MGLStyleValue *iconOpacityValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeExponential cameraStops:stopsDict options:optionsDict];
                // [layer setIconOpacity:iconOpacityValue];
                [layer setIconOpacity:exp];
            } else {
                // MGLStyleValue *iconOpacityValue = [MGLStyleValue valueWithRawValue:paintProperties[@"icon-opacity"]];
                exp = [NSExpression expressionForConstantValue:paintProperties[@"icon-opacity"]];
                // [layer setIconOpacity:iconOpacityValue];
                [layer setIconOpacity:exp];
            }
        }
        if ([paintProperties valueForKey:@"icon-color"]) {
            NSExpression *exp;
            if ([[paintProperties valueForKey:@"icon-color"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"icon-color"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[UIColor colorWithString:stop[1]] forKey:stop[0]];
                }
                NSMutableDictionary *optionsDict = [[NSMutableDictionary alloc] init];
                NSNumber *baseNumber = paintProperties[@"icon-color"][@"base"];
                if (baseNumber) {
                    // [optionsDict setObject:baseNumber forKey:MGLStyleFunctionOptionInterpolationBase];
                    exp = [NSExpression
                            mgl_expressionForInterpolatingExpression:NSExpression.zoomLevelVariableExpression
                            withCurveType:MGLExpressionInterpolationModeExponential
                            parameters:[NSExpression expressionForConstantValue:baseNumber]
                            stops:[NSExpression expressionForConstantValue:stopsDict]];
                } else {
                    // [optionsDict setObject:[NSNumber numberWithInt:1] forKey:MGLStyleFunctionOptionInterpolationBase];
                    // exp = [NSExpression expressionWithFormat: @"mgl_interpolate:withCurveType:parameters:stops:(mag, 'exponential', nil, %@)", stops];
                    exp = [NSExpression
                            mgl_expressionForInterpolatingExpression:NSExpression.zoomLevelVariableExpression
                            withCurveType:MGLExpressionInterpolationModeLinear
                            parameters:nil
                            stops:[NSExpression expressionForConstantValue:stopsDict]];
                }
                // MGLStyleValue *iconColorValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeExponential cameraStops:stopsDict options:optionsDict];
                // [layer setIconColor:iconColorValue];
                [layer setIconColor:exp];
            } else {
                UIColor *color = [UIColor colorWithString:paintProperties[@"icon-color"]];
                // MGLStyleValue *iconColorValue = [MGLStyleValue valueWithRawValue:color];
                exp = [NSExpression expressionForConstantValue:color];
                // [layer setIconColor:iconColorValue];
                [layer setIconColor:exp];
            }
        }
        if ([paintProperties valueForKey:@"icon-halo-color"]) {
            NSExpression *exp;
            if ([[paintProperties valueForKey:@"icon-halo-color"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"icon-halo-color"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[UIColor colorWithString:stop[1]] forKey:stop[0]];
                }
                NSMutableDictionary *optionsDict = [[NSMutableDictionary alloc] init];
                NSNumber *baseNumber = paintProperties[@"icon-halo-color"][@"base"];
                if (baseNumber) {
                    // [optionsDict setObject:baseNumber forKey:MGLStyleFunctionOptionInterpolationBase];
                    exp = [NSExpression
                            mgl_expressionForInterpolatingExpression:NSExpression.zoomLevelVariableExpression
                            withCurveType:MGLExpressionInterpolationModeExponential
                            parameters:[NSExpression expressionForConstantValue:baseNumber]
                            stops:[NSExpression expressionForConstantValue:stopsDict]];
                } else {
                    // [optionsDict setObject:[NSNumber numberWithInt:1] forKey:MGLStyleFunctionOptionInterpolationBase];
                    // exp = [NSExpression expressionWithFormat: @"mgl_interpolate:withCurveType:parameters:stops:(mag, 'exponential', nil, %@)", stops];
                    exp = [NSExpression
                            mgl_expressionForInterpolatingExpression:NSExpression.zoomLevelVariableExpression
                            withCurveType:MGLExpressionInterpolationModeLinear
                            parameters:nil
                            stops:[NSExpression expressionForConstantValue:stopsDict]];
                }
                // MGLStyleValue *iconHaloColorValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeExponential cameraStops:stopsDict options:optionsDict];
                // [layer setIconHaloColor:iconHaloColorValue];
                [layer setIconHaloColor:exp];
            } else {
                UIColor *color = [UIColor colorWithString:paintProperties[@"icon-halo-color"]];
                // MGLStyleValue *iconHaloColorValue = [MGLStyleValue valueWithRawValue:color];
                exp = [NSExpression expressionForConstantValue:color];
                // [layer setIconHaloColor:iconHaloColorValue];
                [layer setIconHaloColor:exp];
            }
        }
        if ([paintProperties valueForKey:@"icon-halo-width"]) {
            NSExpression *exp;
            if ([[paintProperties valueForKey:@"icon-halo-width"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"icon-halo-width"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                //    // [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                    [stopsDict setObject:stop[1] forKey:stop[0]];
                }
                NSMutableDictionary *optionsDict = [[NSMutableDictionary alloc] init];
                NSNumber *baseNumber = paintProperties[@"icon-halo-width"][@"base"];
                if (baseNumber) {
                    // [optionsDict setObject:baseNumber forKey:MGLStyleFunctionOptionInterpolationBase];
                    exp = [NSExpression
                            mgl_expressionForInterpolatingExpression:NSExpression.zoomLevelVariableExpression
                            withCurveType:MGLExpressionInterpolationModeExponential
                            parameters:[NSExpression expressionForConstantValue:baseNumber]
                            stops:[NSExpression expressionForConstantValue:stopsDict]];
                } else {
                    // [optionsDict setObject:[NSNumber numberWithInt:1] forKey:MGLStyleFunctionOptionInterpolationBase];
                    // exp = [NSExpression expressionWithFormat: @"mgl_interpolate:withCurveType:parameters:stops:(mag, 'exponential', nil, %@)", stops];
                    exp = [NSExpression
                            mgl_expressionForInterpolatingExpression:NSExpression.zoomLevelVariableExpression
                            withCurveType:MGLExpressionInterpolationModeLinear
                            parameters:nil
                            stops:[NSExpression expressionForConstantValue:stopsDict]];
                }
                // MGLStyleValue *iconHaloWidthValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeExponential cameraStops:stopsDict options:optionsDict];
                // [layer setIconHaloWidth:iconHaloWidthValue];
                [layer setIconHaloWidth:exp];
            } else {
                // MGLStyleValue *iconHaloWidthValue = [MGLStyleValue valueWithRawValue:paintProperties[@"icon-halo-width"]];
                exp = [NSExpression expressionForConstantValue:paintProperties[@"icon-halo-width"]];
                // [layer setIconHaloWidth:iconHaloWidthValue];
                [layer setIconHaloWidth:exp];
            }
        }
        if ([paintProperties valueForKey:@"icon-halo-blur"]) {
            NSExpression *exp;
            if ([[paintProperties valueForKey:@"icon-halo-blur"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"icon-halo-blur"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                //    // [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                    [stopsDict setObject:stop[1] forKey:stop[0]];
                }
                NSMutableDictionary *optionsDict = [[NSMutableDictionary alloc] init];
                NSNumber *baseNumber = paintProperties[@"icon-halo-blur"][@"base"];
                if (baseNumber) {
                    // [optionsDict setObject:baseNumber forKey:MGLStyleFunctionOptionInterpolationBase];
                    exp = [NSExpression
                            mgl_expressionForInterpolatingExpression:NSExpression.zoomLevelVariableExpression
                            withCurveType:MGLExpressionInterpolationModeExponential
                            parameters:[NSExpression expressionForConstantValue:baseNumber]
                            stops:[NSExpression expressionForConstantValue:stopsDict]];
                } else {
                    // [optionsDict setObject:[NSNumber numberWithInt:1] forKey:MGLStyleFunctionOptionInterpolationBase];
                    // exp = [NSExpression expressionWithFormat: @"mgl_interpolate:withCurveType:parameters:stops:(mag, 'exponential', nil, %@)", stops];
                    exp = [NSExpression
                            mgl_expressionForInterpolatingExpression:NSExpression.zoomLevelVariableExpression
                            withCurveType:MGLExpressionInterpolationModeLinear
                            parameters:nil
                            stops:[NSExpression expressionForConstantValue:stopsDict]];
                }
                // MGLStyleValue *iconHaloBlurValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeExponential cameraStops:stopsDict options:optionsDict];
                // [layer setIconHaloBlur:iconHaloBlurValue];
                [layer setIconHaloBlur:exp];
            } else {
                // MGLStyleValue *iconHaloBlurValue = [MGLStyleValue valueWithRawValue:paintProperties[@"icon-halo-blur"]];
                exp = [NSExpression expressionForConstantValue:paintProperties[@"icon-halo-blur"]];
                // [layer setIconHaloBlur:iconHaloBlurValue];
                [layer setIconHaloBlur:exp];
            }
        }
        if ([paintProperties valueForKey:@"icon-translate"]) {
            NSExpression *exp;
            if ([[paintProperties valueForKey:@"icon-translate"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"icon-translate"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    CGVector vector = CGVectorMake([stop[1][0] floatValue], [stop[1][1] floatValue]);
                //    [stopsDict setObject:[MGLStyleValue valueWithRawValue:[NSValue valueWithCGVector:vector]] forKey:stop[0]];
                    [stopsDict setObject:[NSValue valueWithCGVector:vector] forKey:stop[0]];
                }
                NSMutableDictionary *optionsDict = [[NSMutableDictionary alloc] init];
                NSNumber *baseNumber = paintProperties[@"icon-translate"][@"base"];
                if (baseNumber) {
                    // [optionsDict setObject:baseNumber forKey:MGLStyleFunctionOptionInterpolationBase];
                    exp = [NSExpression
                            mgl_expressionForInterpolatingExpression:NSExpression.zoomLevelVariableExpression
                            withCurveType:MGLExpressionInterpolationModeExponential
                            parameters:[NSExpression expressionForConstantValue:baseNumber]
                            stops:[NSExpression expressionForConstantValue:stopsDict]];
                } else {
                    // [optionsDict setObject:[NSNumber numberWithInt:1] forKey:MGLStyleFunctionOptionInterpolationBase];
                    // exp = [NSExpression expressionWithFormat: @"mgl_interpolate:withCurveType:parameters:stops:(mag, 'exponential', nil, %@)", stops];
                    exp = [NSExpression
                            mgl_expressionForInterpolatingExpression:NSExpression.zoomLevelVariableExpression
                            withCurveType:MGLExpressionInterpolationModeLinear
                            parameters:nil
                            stops:[NSExpression expressionForConstantValue:stopsDict]];
                }
                // MGLStyleValue *iconTranslateValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeExponential cameraStops:stopsDict options:optionsDict];
                // [layer setIconTranslation:iconTranslateValue];
                [layer setIconTranslation:exp];
            } else {
                // CGVector vector = CGVectorMake([paintProperties[@"icon-translate"][0] floatValue], [paintProperties[@"icon-translate"][1] floatValue]);
                // MGLStyleValue *iconTranslateValue = [MGLStyleValue valueWithRawValue:[NSValue valueWithCGVector:vector]];
                exp = [NSExpression expressionForConstantValue:paintProperties[@"icon-translate"]];
                // [layer setIconTranslation:iconTranslateValue];
                [layer setIconTranslation:exp];
            }
        }
        if ([paintProperties valueForKey:@"icon-translate-anchor"]) {
            // create the NSString -> enum dictionary for later use
            NSDictionary<NSString*, NSNumber *> *enumDictionary = @{
                @"map": @(MGLIconTranslationAnchorMap),
                @"viewport": @(MGLIconTranslationAnchorViewport),
            };
            NSExpression *exp;
            if ([[paintProperties valueForKey:@"icon-translate-anchor"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"icon-translate-anchor"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    NSValue *value = [NSValue valueWithMGLIconTranslationAnchor:enumDictionary[paintProperties[@"icon-translate-anchor"]].integerValue];
                    // // [stopsDict setObject:[MGLStyleValue valueWithRawValue:value] forKey:stop[0]];
                    [stopsDict setObject:value forKey:stop[0]];
                }
                // MGLStyleValue *iconTranslateAnchorValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeInterval cameraStops:stopsDict options:nil];
                //// exp = [NSExpression expressionForConstantValue:paintProperties[@"icon-translate-anchor"]];
                // exp = [NSExpression expressionWithFormat: @"mgl_step:from:stops:(mag, nil, %@)", stopsDict];
                exp = [NSExpression
                       mgl_expressionForSteppingExpression:NSExpression.zoomLevelVariableExpression
                       fromExpression:[NSExpression expressionForConstantValue:stops[0][1]]
                       stops:[NSExpression expressionForConstantValue:stopsDict]];
                // [layer setIconTranslationAnchor:iconTranslateAnchorValue];
                [layer setIconTranslationAnchor:exp];
            } else {
                NSValue *value = [NSValue valueWithMGLIconTranslationAnchor:enumDictionary[paintProperties[@"icon-translate-anchor"]].integerValue];
                // MGLStyleValue *iconTranslateAnchorValue = [MGLStyleValue valueWithRawValue:value];
                exp = [NSExpression expressionForConstantValue:value];
                // [layer setIconTranslationAnchor:iconTranslateAnchorValue];
                [layer setIconTranslationAnchor:exp];
            }
        }
        if ([paintProperties valueForKey:@"text-opacity"]) {
            NSExpression *exp;
            if ([[paintProperties valueForKey:@"text-opacity"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"text-opacity"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                //    // [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                    [stopsDict setObject:stop[1] forKey:stop[0]];
                }
                NSMutableDictionary *optionsDict = [[NSMutableDictionary alloc] init];
                NSNumber *baseNumber = paintProperties[@"text-opacity"][@"base"];
                if (baseNumber) {
                    // [optionsDict setObject:baseNumber forKey:MGLStyleFunctionOptionInterpolationBase];
                    exp = [NSExpression
                            mgl_expressionForInterpolatingExpression:NSExpression.zoomLevelVariableExpression
                            withCurveType:MGLExpressionInterpolationModeExponential
                            parameters:[NSExpression expressionForConstantValue:baseNumber]
                            stops:[NSExpression expressionForConstantValue:stopsDict]];
                } else {
                    // [optionsDict setObject:[NSNumber numberWithInt:1] forKey:MGLStyleFunctionOptionInterpolationBase];
                    // exp = [NSExpression expressionWithFormat: @"mgl_interpolate:withCurveType:parameters:stops:(mag, 'exponential', nil, %@)", stops];
                    exp = [NSExpression
                            mgl_expressionForInterpolatingExpression:NSExpression.zoomLevelVariableExpression
                            withCurveType:MGLExpressionInterpolationModeLinear
                            parameters:nil
                            stops:[NSExpression expressionForConstantValue:stopsDict]];
                }
                // MGLStyleValue *textOpacityValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeExponential cameraStops:stopsDict options:optionsDict];
                // [layer setTextOpacity:textOpacityValue];
                [layer setTextOpacity:exp];
            } else {
                // MGLStyleValue *textOpacityValue = [MGLStyleValue valueWithRawValue:paintProperties[@"text-opacity"]];
                exp = [NSExpression expressionForConstantValue:paintProperties[@"text-opacity"]];
                // [layer setTextOpacity:textOpacityValue];
                [layer setTextOpacity:exp];
            }
        }
        if ([paintProperties valueForKey:@"text-color"]) {
            NSExpression *exp;
            if ([[paintProperties valueForKey:@"text-color"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"text-color"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[UIColor colorWithString:stop[1]] forKey:stop[0]];
                }
                NSMutableDictionary *optionsDict = [[NSMutableDictionary alloc] init];
                NSNumber *baseNumber = paintProperties[@"text-color"][@"base"];
                if (baseNumber) {
                    // [optionsDict setObject:baseNumber forKey:MGLStyleFunctionOptionInterpolationBase];
                    exp = [NSExpression
                            mgl_expressionForInterpolatingExpression:NSExpression.zoomLevelVariableExpression
                            withCurveType:MGLExpressionInterpolationModeExponential
                            parameters:[NSExpression expressionForConstantValue:baseNumber]
                            stops:[NSExpression expressionForConstantValue:stopsDict]];
                } else {
                    // [optionsDict setObject:[NSNumber numberWithInt:1] forKey:MGLStyleFunctionOptionInterpolationBase];
                    // exp = [NSExpression expressionWithFormat: @"mgl_interpolate:withCurveType:parameters:stops:(mag, 'exponential', nil, %@)", stops];
                    exp = [NSExpression
                            mgl_expressionForInterpolatingExpression:NSExpression.zoomLevelVariableExpression
                            withCurveType:MGLExpressionInterpolationModeLinear
                            parameters:nil
                            stops:[NSExpression expressionForConstantValue:stopsDict]];
                }
                // MGLStyleValue *textColorValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeExponential cameraStops:stopsDict options:optionsDict];
                // [layer setTextColor:textColorValue];
                [layer setTextColor:exp];
            } else {
                UIColor *color = [UIColor colorWithString:paintProperties[@"text-color"]];
                // MGLStyleValue *textColorValue = [MGLStyleValue valueWithRawValue:color];
                exp = [NSExpression expressionForConstantValue:color];
                // [layer setTextColor:textColorValue];
                [layer setTextColor:exp];
            }
        }
        if ([paintProperties valueForKey:@"text-halo-color"]) {
            NSExpression *exp;
            if ([[paintProperties valueForKey:@"text-halo-color"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"text-halo-color"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[UIColor colorWithString:stop[1]] forKey:stop[0]];
                }
                NSMutableDictionary *optionsDict = [[NSMutableDictionary alloc] init];
                NSNumber *baseNumber = paintProperties[@"text-halo-color"][@"base"];
                if (baseNumber) {
                    // [optionsDict setObject:baseNumber forKey:MGLStyleFunctionOptionInterpolationBase];
                    exp = [NSExpression
                            mgl_expressionForInterpolatingExpression:NSExpression.zoomLevelVariableExpression
                            withCurveType:MGLExpressionInterpolationModeExponential
                            parameters:[NSExpression expressionForConstantValue:baseNumber]
                            stops:[NSExpression expressionForConstantValue:stopsDict]];
                } else {
                    // [optionsDict setObject:[NSNumber numberWithInt:1] forKey:MGLStyleFunctionOptionInterpolationBase];
                    // exp = [NSExpression expressionWithFormat: @"mgl_interpolate:withCurveType:parameters:stops:(mag, 'exponential', nil, %@)", stops];
                    exp = [NSExpression
                            mgl_expressionForInterpolatingExpression:NSExpression.zoomLevelVariableExpression
                            withCurveType:MGLExpressionInterpolationModeLinear
                            parameters:nil
                            stops:[NSExpression expressionForConstantValue:stopsDict]];
                }
                // MGLStyleValue *textHaloColorValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeExponential cameraStops:stopsDict options:optionsDict];
                // [layer setTextHaloColor:textHaloColorValue];
                [layer setTextHaloColor:exp];
            } else {
                UIColor *color = [UIColor colorWithString:paintProperties[@"text-halo-color"]];
                // MGLStyleValue *textHaloColorValue = [MGLStyleValue valueWithRawValue:color];
                exp = [NSExpression expressionForConstantValue:color];
                // [layer setTextHaloColor:textHaloColorValue];
                [layer setTextHaloColor:exp];
            }
        }
        if ([paintProperties valueForKey:@"text-halo-width"]) {
            NSExpression *exp;
            if ([[paintProperties valueForKey:@"text-halo-width"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"text-halo-width"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                //    // [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                    [stopsDict setObject:stop[1] forKey:stop[0]];
                }
                NSMutableDictionary *optionsDict = [[NSMutableDictionary alloc] init];
                NSNumber *baseNumber = paintProperties[@"text-halo-width"][@"base"];
                if (baseNumber) {
                    // [optionsDict setObject:baseNumber forKey:MGLStyleFunctionOptionInterpolationBase];
                    exp = [NSExpression
                            mgl_expressionForInterpolatingExpression:NSExpression.zoomLevelVariableExpression
                            withCurveType:MGLExpressionInterpolationModeExponential
                            parameters:[NSExpression expressionForConstantValue:baseNumber]
                            stops:[NSExpression expressionForConstantValue:stopsDict]];
                } else {
                    // [optionsDict setObject:[NSNumber numberWithInt:1] forKey:MGLStyleFunctionOptionInterpolationBase];
                    // exp = [NSExpression expressionWithFormat: @"mgl_interpolate:withCurveType:parameters:stops:(mag, 'exponential', nil, %@)", stops];
                    exp = [NSExpression
                            mgl_expressionForInterpolatingExpression:NSExpression.zoomLevelVariableExpression
                            withCurveType:MGLExpressionInterpolationModeLinear
                            parameters:nil
                            stops:[NSExpression expressionForConstantValue:stopsDict]];
                }
                // MGLStyleValue *textHaloWidthValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeExponential cameraStops:stopsDict options:optionsDict];
                // [layer setTextHaloWidth:textHaloWidthValue];
                [layer setTextHaloWidth:exp];
            } else {
                // MGLStyleValue *textHaloWidthValue = [MGLStyleValue valueWithRawValue:paintProperties[@"text-halo-width"]];
                exp = [NSExpression expressionForConstantValue:paintProperties[@"text-halo-width"]];
                // [layer setTextHaloWidth:textHaloWidthValue];
                [layer setTextHaloWidth:exp];
            }
        }
        if ([paintProperties valueForKey:@"text-halo-blur"]) {
            NSExpression *exp;
            if ([[paintProperties valueForKey:@"text-halo-blur"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"text-halo-blur"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                //    // [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                    [stopsDict setObject:stop[1] forKey:stop[0]];
                }
                NSMutableDictionary *optionsDict = [[NSMutableDictionary alloc] init];
                NSNumber *baseNumber = paintProperties[@"text-halo-blur"][@"base"];
                if (baseNumber) {
                    // [optionsDict setObject:baseNumber forKey:MGLStyleFunctionOptionInterpolationBase];
                    exp = [NSExpression
                            mgl_expressionForInterpolatingExpression:NSExpression.zoomLevelVariableExpression
                            withCurveType:MGLExpressionInterpolationModeExponential
                            parameters:[NSExpression expressionForConstantValue:baseNumber]
                            stops:[NSExpression expressionForConstantValue:stopsDict]];
                } else {
                    // [optionsDict setObject:[NSNumber numberWithInt:1] forKey:MGLStyleFunctionOptionInterpolationBase];
                    // exp = [NSExpression expressionWithFormat: @"mgl_interpolate:withCurveType:parameters:stops:(mag, 'exponential', nil, %@)", stops];
                    exp = [NSExpression
                            mgl_expressionForInterpolatingExpression:NSExpression.zoomLevelVariableExpression
                            withCurveType:MGLExpressionInterpolationModeLinear
                            parameters:nil
                            stops:[NSExpression expressionForConstantValue:stopsDict]];
                }
                // MGLStyleValue *textHaloBlurValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeExponential cameraStops:stopsDict options:optionsDict];
                // [layer setTextHaloBlur:textHaloBlurValue];
                [layer setTextHaloBlur:exp];
            } else {
                // MGLStyleValue *textHaloBlurValue = [MGLStyleValue valueWithRawValue:paintProperties[@"text-halo-blur"]];
                exp = [NSExpression expressionForConstantValue:paintProperties[@"text-halo-blur"]];
                // [layer setTextHaloBlur:textHaloBlurValue];
                [layer setTextHaloBlur:exp];
            }
        }
        if ([paintProperties valueForKey:@"text-translate"]) {
            NSExpression *exp;
            if ([[paintProperties valueForKey:@"text-translate"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"text-translate"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    CGVector vector = CGVectorMake([stop[1][0] floatValue], [stop[1][1] floatValue]);
                //    [stopsDict setObject:[MGLStyleValue valueWithRawValue:[NSValue valueWithCGVector:vector]] forKey:stop[0]];
                    [stopsDict setObject:[NSValue valueWithCGVector:vector] forKey:stop[0]];
                }
                NSMutableDictionary *optionsDict = [[NSMutableDictionary alloc] init];
                NSNumber *baseNumber = paintProperties[@"text-translate"][@"base"];
                if (baseNumber) {
                    // [optionsDict setObject:baseNumber forKey:MGLStyleFunctionOptionInterpolationBase];
                    exp = [NSExpression
                            mgl_expressionForInterpolatingExpression:NSExpression.zoomLevelVariableExpression
                            withCurveType:MGLExpressionInterpolationModeExponential
                            parameters:[NSExpression expressionForConstantValue:baseNumber]
                            stops:[NSExpression expressionForConstantValue:stopsDict]];
                } else {
                    // [optionsDict setObject:[NSNumber numberWithInt:1] forKey:MGLStyleFunctionOptionInterpolationBase];
                    // exp = [NSExpression expressionWithFormat: @"mgl_interpolate:withCurveType:parameters:stops:(mag, 'exponential', nil, %@)", stops];
                    exp = [NSExpression
                            mgl_expressionForInterpolatingExpression:NSExpression.zoomLevelVariableExpression
                            withCurveType:MGLExpressionInterpolationModeLinear
                            parameters:nil
                            stops:[NSExpression expressionForConstantValue:stopsDict]];
                }
                // MGLStyleValue *textTranslateValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeExponential cameraStops:stopsDict options:optionsDict];
                // [layer setTextTranslation:textTranslateValue];
                [layer setTextTranslation:exp];
            } else {
                // CGVector vector = CGVectorMake([paintProperties[@"text-translate"][0] floatValue], [paintProperties[@"text-translate"][1] floatValue]);
                // MGLStyleValue *textTranslateValue = [MGLStyleValue valueWithRawValue:[NSValue valueWithCGVector:vector]];
                exp = [NSExpression expressionForConstantValue:paintProperties[@"text-translate"]];
                // [layer setTextTranslation:textTranslateValue];
                [layer setTextTranslation:exp];
            }
        }
        if ([paintProperties valueForKey:@"text-translate-anchor"]) {
            // create the NSString -> enum dictionary for later use
            NSDictionary<NSString*, NSNumber *> *enumDictionary = @{
                @"map": @(MGLTextTranslationAnchorMap),
                @"viewport": @(MGLTextTranslationAnchorViewport),
            };
            NSExpression *exp;
            if ([[paintProperties valueForKey:@"text-translate-anchor"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"text-translate-anchor"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    NSValue *value = [NSValue valueWithMGLTextTranslationAnchor:enumDictionary[paintProperties[@"text-translate-anchor"]].integerValue];
                    // // [stopsDict setObject:[MGLStyleValue valueWithRawValue:value] forKey:stop[0]];
                    [stopsDict setObject:value forKey:stop[0]];
                }
                // MGLStyleValue *textTranslateAnchorValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeInterval cameraStops:stopsDict options:nil];
                //// exp = [NSExpression expressionForConstantValue:paintProperties[@"text-translate-anchor"]];
                // exp = [NSExpression expressionWithFormat: @"mgl_step:from:stops:(mag, nil, %@)", stopsDict];
                exp = [NSExpression
                       mgl_expressionForSteppingExpression:NSExpression.zoomLevelVariableExpression
                       fromExpression:[NSExpression expressionForConstantValue:stops[0][1]]
                       stops:[NSExpression expressionForConstantValue:stopsDict]];
                // [layer setTextTranslationAnchor:textTranslateAnchorValue];
                [layer setTextTranslationAnchor:exp];
            } else {
                NSValue *value = [NSValue valueWithMGLTextTranslationAnchor:enumDictionary[paintProperties[@"text-translate-anchor"]].integerValue];
                // MGLStyleValue *textTranslateAnchorValue = [MGLStyleValue valueWithRawValue:value];
                exp = [NSExpression expressionForConstantValue:value];
                // [layer setTextTranslationAnchor:textTranslateAnchorValue];
                [layer setTextTranslationAnchor:exp];
            }
        }
        NSString *sourceLayer = layerJson[@"source-layer"];
        NSArray *filter = layerJson[@"filter"];
        if (sourceLayer) {
            [layer setSourceLayerIdentifier:sourceLayer];
        }
        if (filter) {
            [layer setPredicate:[layer predicateWithJson:filter]];
        }

        NSNumber *minzoom = layerJson[@"minzoom"];
        NSNumber *maxzoom = layerJson[@"maxzoom"];
        if (minzoom) {
            [layer setMinimumZoomLevel:[minzoom floatValue]];
        }
        if (maxzoom) {
            [layer setMaximumZoomLevel:[maxzoom floatValue]];
        }
        return layer;
    }
    if([typeString isEqualToString:@"circle"]) {
        NSDictionary *paintProperties = layerJson[@"paint"];
        NSString *sourceString = layerJson[@"source"];
        if (!sourceString) {
            if (errorPtr) {
                *errorPtr = [NSError errorWithDomain:RCTMapboxGLErrorDomain
                                     code:1003
                                     userInfo:@{NSLocalizedDescriptionKey:[NSString stringWithFormat:@"addLayer(): layer of type '%@' must have a 'source' attribute", typeString]}
                ];
            }
            return nil;
        }
        MGLSource *source = [mapView styleSourceWithIdentifier:sourceString];
        if (!source) {
            if (errorPtr) {
                *errorPtr = [NSError errorWithDomain:RCTMapboxGLErrorDomain
                                     code:1004
                                     userInfo:@{NSLocalizedDescriptionKey:[NSString stringWithFormat:@"addLayer(): source '%@' for layer '%@' is nil", sourceString, idString]}
                ];
            }
            return nil;
        }
        MGLCircleStyleLayer *layer = [[MGLCircleStyleLayer alloc] initWithIdentifier:idString source:source];
        if ([paintProperties valueForKey:@"circle-radius"]) {
            NSExpression *exp;
            if ([[paintProperties valueForKey:@"circle-radius"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"circle-radius"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                //    // [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                    [stopsDict setObject:stop[1] forKey:stop[0]];
                }
                NSMutableDictionary *optionsDict = [[NSMutableDictionary alloc] init];
                NSNumber *baseNumber = paintProperties[@"circle-radius"][@"base"];
                if (baseNumber) {
                    // [optionsDict setObject:baseNumber forKey:MGLStyleFunctionOptionInterpolationBase];
                    exp = [NSExpression
                            mgl_expressionForInterpolatingExpression:NSExpression.zoomLevelVariableExpression
                            withCurveType:MGLExpressionInterpolationModeExponential
                            parameters:[NSExpression expressionForConstantValue:baseNumber]
                            stops:[NSExpression expressionForConstantValue:stopsDict]];
                } else {
                    // [optionsDict setObject:[NSNumber numberWithInt:1] forKey:MGLStyleFunctionOptionInterpolationBase];
                    // exp = [NSExpression expressionWithFormat: @"mgl_interpolate:withCurveType:parameters:stops:(mag, 'exponential', nil, %@)", stops];
                    exp = [NSExpression
                            mgl_expressionForInterpolatingExpression:NSExpression.zoomLevelVariableExpression
                            withCurveType:MGLExpressionInterpolationModeLinear
                            parameters:nil
                            stops:[NSExpression expressionForConstantValue:stopsDict]];
                }
                // MGLStyleValue *circleRadiusValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeExponential cameraStops:stopsDict options:optionsDict];
                // [layer setCircleRadius:circleRadiusValue];
                [layer setCircleRadius:exp];
            } else {
                // MGLStyleValue *circleRadiusValue = [MGLStyleValue valueWithRawValue:paintProperties[@"circle-radius"]];
                exp = [NSExpression expressionForConstantValue:paintProperties[@"circle-radius"]];
                // [layer setCircleRadius:circleRadiusValue];
                [layer setCircleRadius:exp];
            }
        }
        if ([paintProperties valueForKey:@"circle-color"]) {
            NSExpression *exp;
            if ([[paintProperties valueForKey:@"circle-color"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"circle-color"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[UIColor colorWithString:stop[1]] forKey:stop[0]];
                }
                NSMutableDictionary *optionsDict = [[NSMutableDictionary alloc] init];
                NSNumber *baseNumber = paintProperties[@"circle-color"][@"base"];
                if (baseNumber) {
                    // [optionsDict setObject:baseNumber forKey:MGLStyleFunctionOptionInterpolationBase];
                    exp = [NSExpression
                            mgl_expressionForInterpolatingExpression:NSExpression.zoomLevelVariableExpression
                            withCurveType:MGLExpressionInterpolationModeExponential
                            parameters:[NSExpression expressionForConstantValue:baseNumber]
                            stops:[NSExpression expressionForConstantValue:stopsDict]];
                } else {
                    // [optionsDict setObject:[NSNumber numberWithInt:1] forKey:MGLStyleFunctionOptionInterpolationBase];
                    // exp = [NSExpression expressionWithFormat: @"mgl_interpolate:withCurveType:parameters:stops:(mag, 'exponential', nil, %@)", stops];
                    exp = [NSExpression
                            mgl_expressionForInterpolatingExpression:NSExpression.zoomLevelVariableExpression
                            withCurveType:MGLExpressionInterpolationModeLinear
                            parameters:nil
                            stops:[NSExpression expressionForConstantValue:stopsDict]];
                }
                // MGLStyleValue *circleColorValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeExponential cameraStops:stopsDict options:optionsDict];
                // [layer setCircleColor:circleColorValue];
                [layer setCircleColor:exp];
            } else {
                UIColor *color = [UIColor colorWithString:paintProperties[@"circle-color"]];
                // MGLStyleValue *circleColorValue = [MGLStyleValue valueWithRawValue:color];
                exp = [NSExpression expressionForConstantValue:color];
                // [layer setCircleColor:circleColorValue];
                [layer setCircleColor:exp];
            }
        }
        if ([paintProperties valueForKey:@"circle-blur"]) {
            NSExpression *exp;
            if ([[paintProperties valueForKey:@"circle-blur"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"circle-blur"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                //    // [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                    [stopsDict setObject:stop[1] forKey:stop[0]];
                }
                NSMutableDictionary *optionsDict = [[NSMutableDictionary alloc] init];
                NSNumber *baseNumber = paintProperties[@"circle-blur"][@"base"];
                if (baseNumber) {
                    // [optionsDict setObject:baseNumber forKey:MGLStyleFunctionOptionInterpolationBase];
                    exp = [NSExpression
                            mgl_expressionForInterpolatingExpression:NSExpression.zoomLevelVariableExpression
                            withCurveType:MGLExpressionInterpolationModeExponential
                            parameters:[NSExpression expressionForConstantValue:baseNumber]
                            stops:[NSExpression expressionForConstantValue:stopsDict]];
                } else {
                    // [optionsDict setObject:[NSNumber numberWithInt:1] forKey:MGLStyleFunctionOptionInterpolationBase];
                    // exp = [NSExpression expressionWithFormat: @"mgl_interpolate:withCurveType:parameters:stops:(mag, 'exponential', nil, %@)", stops];
                    exp = [NSExpression
                            mgl_expressionForInterpolatingExpression:NSExpression.zoomLevelVariableExpression
                            withCurveType:MGLExpressionInterpolationModeLinear
                            parameters:nil
                            stops:[NSExpression expressionForConstantValue:stopsDict]];
                }
                // MGLStyleValue *circleBlurValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeExponential cameraStops:stopsDict options:optionsDict];
                // [layer setCircleBlur:circleBlurValue];
                [layer setCircleBlur:exp];
            } else {
                // MGLStyleValue *circleBlurValue = [MGLStyleValue valueWithRawValue:paintProperties[@"circle-blur"]];
                exp = [NSExpression expressionForConstantValue:paintProperties[@"circle-blur"]];
                // [layer setCircleBlur:circleBlurValue];
                [layer setCircleBlur:exp];
            }
        }
        if ([paintProperties valueForKey:@"circle-opacity"]) {
            NSExpression *exp;
            if ([[paintProperties valueForKey:@"circle-opacity"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"circle-opacity"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                //    // [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                    [stopsDict setObject:stop[1] forKey:stop[0]];
                }
                NSMutableDictionary *optionsDict = [[NSMutableDictionary alloc] init];
                NSNumber *baseNumber = paintProperties[@"circle-opacity"][@"base"];
                if (baseNumber) {
                    // [optionsDict setObject:baseNumber forKey:MGLStyleFunctionOptionInterpolationBase];
                    exp = [NSExpression
                            mgl_expressionForInterpolatingExpression:NSExpression.zoomLevelVariableExpression
                            withCurveType:MGLExpressionInterpolationModeExponential
                            parameters:[NSExpression expressionForConstantValue:baseNumber]
                            stops:[NSExpression expressionForConstantValue:stopsDict]];
                } else {
                    // [optionsDict setObject:[NSNumber numberWithInt:1] forKey:MGLStyleFunctionOptionInterpolationBase];
                    // exp = [NSExpression expressionWithFormat: @"mgl_interpolate:withCurveType:parameters:stops:(mag, 'exponential', nil, %@)", stops];
                    exp = [NSExpression
                            mgl_expressionForInterpolatingExpression:NSExpression.zoomLevelVariableExpression
                            withCurveType:MGLExpressionInterpolationModeLinear
                            parameters:nil
                            stops:[NSExpression expressionForConstantValue:stopsDict]];
                }
                // MGLStyleValue *circleOpacityValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeExponential cameraStops:stopsDict options:optionsDict];
                // [layer setCircleOpacity:circleOpacityValue];
                [layer setCircleOpacity:exp];
            } else {
                // MGLStyleValue *circleOpacityValue = [MGLStyleValue valueWithRawValue:paintProperties[@"circle-opacity"]];
                exp = [NSExpression expressionForConstantValue:paintProperties[@"circle-opacity"]];
                // [layer setCircleOpacity:circleOpacityValue];
                [layer setCircleOpacity:exp];
            }
        }
        if ([paintProperties valueForKey:@"circle-translate"]) {
            NSExpression *exp;
            if ([[paintProperties valueForKey:@"circle-translate"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"circle-translate"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    CGVector vector = CGVectorMake([stop[1][0] floatValue], [stop[1][1] floatValue]);
                //    [stopsDict setObject:[MGLStyleValue valueWithRawValue:[NSValue valueWithCGVector:vector]] forKey:stop[0]];
                    [stopsDict setObject:[NSValue valueWithCGVector:vector] forKey:stop[0]];
                }
                NSMutableDictionary *optionsDict = [[NSMutableDictionary alloc] init];
                NSNumber *baseNumber = paintProperties[@"circle-translate"][@"base"];
                if (baseNumber) {
                    // [optionsDict setObject:baseNumber forKey:MGLStyleFunctionOptionInterpolationBase];
                    exp = [NSExpression
                            mgl_expressionForInterpolatingExpression:NSExpression.zoomLevelVariableExpression
                            withCurveType:MGLExpressionInterpolationModeExponential
                            parameters:[NSExpression expressionForConstantValue:baseNumber]
                            stops:[NSExpression expressionForConstantValue:stopsDict]];
                } else {
                    // [optionsDict setObject:[NSNumber numberWithInt:1] forKey:MGLStyleFunctionOptionInterpolationBase];
                    // exp = [NSExpression expressionWithFormat: @"mgl_interpolate:withCurveType:parameters:stops:(mag, 'exponential', nil, %@)", stops];
                    exp = [NSExpression
                            mgl_expressionForInterpolatingExpression:NSExpression.zoomLevelVariableExpression
                            withCurveType:MGLExpressionInterpolationModeLinear
                            parameters:nil
                            stops:[NSExpression expressionForConstantValue:stopsDict]];
                }
                // MGLStyleValue *circleTranslateValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeExponential cameraStops:stopsDict options:optionsDict];
                // [layer setCircleTranslation:circleTranslateValue];
                [layer setCircleTranslation:exp];
            } else {
                // CGVector vector = CGVectorMake([paintProperties[@"circle-translate"][0] floatValue], [paintProperties[@"circle-translate"][1] floatValue]);
                // MGLStyleValue *circleTranslateValue = [MGLStyleValue valueWithRawValue:[NSValue valueWithCGVector:vector]];
                exp = [NSExpression expressionForConstantValue:paintProperties[@"circle-translate"]];
                // [layer setCircleTranslation:circleTranslateValue];
                [layer setCircleTranslation:exp];
            }
        }
        if ([paintProperties valueForKey:@"circle-translate-anchor"]) {
            // create the NSString -> enum dictionary for later use
            NSDictionary<NSString*, NSNumber *> *enumDictionary = @{
                @"map": @(MGLCircleTranslationAnchorMap),
                @"viewport": @(MGLCircleTranslationAnchorViewport),
            };
            NSExpression *exp;
            if ([[paintProperties valueForKey:@"circle-translate-anchor"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"circle-translate-anchor"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    NSValue *value = [NSValue valueWithMGLCircleTranslationAnchor:enumDictionary[paintProperties[@"circle-translate-anchor"]].integerValue];
                    // // [stopsDict setObject:[MGLStyleValue valueWithRawValue:value] forKey:stop[0]];
                    [stopsDict setObject:value forKey:stop[0]];
                }
                // MGLStyleValue *circleTranslateAnchorValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeInterval cameraStops:stopsDict options:nil];
                //// exp = [NSExpression expressionForConstantValue:paintProperties[@"circle-translate-anchor"]];
                // exp = [NSExpression expressionWithFormat: @"mgl_step:from:stops:(mag, nil, %@)", stopsDict];
                exp = [NSExpression
                       mgl_expressionForSteppingExpression:NSExpression.zoomLevelVariableExpression
                       fromExpression:[NSExpression expressionForConstantValue:stops[0][1]]
                       stops:[NSExpression expressionForConstantValue:stopsDict]];
                // [layer setCircleTranslationAnchor:circleTranslateAnchorValue];
                [layer setCircleTranslationAnchor:exp];
            } else {
                NSValue *value = [NSValue valueWithMGLCircleTranslationAnchor:enumDictionary[paintProperties[@"circle-translate-anchor"]].integerValue];
                // MGLStyleValue *circleTranslateAnchorValue = [MGLStyleValue valueWithRawValue:value];
                exp = [NSExpression expressionForConstantValue:value];
                // [layer setCircleTranslationAnchor:circleTranslateAnchorValue];
                [layer setCircleTranslationAnchor:exp];
            }
        }
        if ([paintProperties valueForKey:@"circle-pitch-scale"]) {
            // create the NSString -> enum dictionary for later use
            NSDictionary<NSString*, NSNumber *> *enumDictionary = @{
                @"map": @(MGLCircleScaleAlignmentMap),
                @"viewport": @(MGLCircleScaleAlignmentViewport),
            };
            NSExpression *exp;
            if ([[paintProperties valueForKey:@"circle-pitch-scale"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"circle-pitch-scale"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    NSValue *value = [NSValue valueWithMGLCircleScaleAlignment:enumDictionary[paintProperties[@"circle-pitch-scale"]].integerValue];
                    // // [stopsDict setObject:[MGLStyleValue valueWithRawValue:value] forKey:stop[0]];
                    [stopsDict setObject:value forKey:stop[0]];
                }
                // MGLStyleValue *circlePitchScaleValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeInterval cameraStops:stopsDict options:nil];
                //// exp = [NSExpression expressionForConstantValue:paintProperties[@"circle-pitch-scale"]];
                // exp = [NSExpression expressionWithFormat: @"mgl_step:from:stops:(mag, nil, %@)", stopsDict];
                exp = [NSExpression
                       mgl_expressionForSteppingExpression:NSExpression.zoomLevelVariableExpression
                       fromExpression:[NSExpression expressionForConstantValue:stops[0][1]]
                       stops:[NSExpression expressionForConstantValue:stopsDict]];
                // [layer setCircleScaleAlignment:circlePitchScaleValue];
                [layer setCircleScaleAlignment:exp];
            } else {
                NSValue *value = [NSValue valueWithMGLCircleScaleAlignment:enumDictionary[paintProperties[@"circle-pitch-scale"]].integerValue];
                // MGLStyleValue *circlePitchScaleValue = [MGLStyleValue valueWithRawValue:value];
                exp = [NSExpression expressionForConstantValue:value];
                // [layer setCircleScaleAlignment:circlePitchScaleValue];
                [layer setCircleScaleAlignment:exp];
            }
        }
        NSString *sourceLayer = layerJson[@"source-layer"];
        NSArray *filter = layerJson[@"filter"];
        if (sourceLayer) {
            [layer setSourceLayerIdentifier:sourceLayer];
        }
        if (filter) {
            [layer setPredicate:[layer predicateWithJson:filter]];
        }

        NSNumber *minzoom = layerJson[@"minzoom"];
        NSNumber *maxzoom = layerJson[@"maxzoom"];
        if (minzoom) {
            [layer setMinimumZoomLevel:[minzoom floatValue]];
        }
        if (maxzoom) {
            [layer setMaximumZoomLevel:[maxzoom floatValue]];
        }
        return layer;
    }
    if([typeString isEqualToString:@"raster"]) {
        NSDictionary *paintProperties = layerJson[@"paint"];
        NSString *sourceString = layerJson[@"source"];
        if (!sourceString) {
            if (errorPtr) {
                *errorPtr = [NSError errorWithDomain:RCTMapboxGLErrorDomain
                                     code:1003
                                     userInfo:@{NSLocalizedDescriptionKey:[NSString stringWithFormat:@"addLayer(): layer of type '%@' must have a 'source' attribute", typeString]}
                ];
            }
            return nil;
        }
        MGLSource *source = [mapView styleSourceWithIdentifier:sourceString];
        if (!source) {
            if (errorPtr) {
                *errorPtr = [NSError errorWithDomain:RCTMapboxGLErrorDomain
                                     code:1004
                                     userInfo:@{NSLocalizedDescriptionKey:[NSString stringWithFormat:@"addLayer(): source '%@' for layer '%@' is nil", sourceString, idString]}
                ];
            }
            return nil;
        }
        MGLRasterStyleLayer *layer = [[MGLRasterStyleLayer alloc] initWithIdentifier:idString source:source];
        if ([paintProperties valueForKey:@"raster-opacity"]) {
            NSExpression *exp;
            if ([[paintProperties valueForKey:@"raster-opacity"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"raster-opacity"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                //    // [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                    [stopsDict setObject:stop[1] forKey:stop[0]];
                }
                NSMutableDictionary *optionsDict = [[NSMutableDictionary alloc] init];
                NSNumber *baseNumber = paintProperties[@"raster-opacity"][@"base"];
                if (baseNumber) {
                    // [optionsDict setObject:baseNumber forKey:MGLStyleFunctionOptionInterpolationBase];
                    exp = [NSExpression
                            mgl_expressionForInterpolatingExpression:NSExpression.zoomLevelVariableExpression
                            withCurveType:MGLExpressionInterpolationModeExponential
                            parameters:[NSExpression expressionForConstantValue:baseNumber]
                            stops:[NSExpression expressionForConstantValue:stopsDict]];
                } else {
                    // [optionsDict setObject:[NSNumber numberWithInt:1] forKey:MGLStyleFunctionOptionInterpolationBase];
                    // exp = [NSExpression expressionWithFormat: @"mgl_interpolate:withCurveType:parameters:stops:(mag, 'exponential', nil, %@)", stops];
                    exp = [NSExpression
                            mgl_expressionForInterpolatingExpression:NSExpression.zoomLevelVariableExpression
                            withCurveType:MGLExpressionInterpolationModeLinear
                            parameters:nil
                            stops:[NSExpression expressionForConstantValue:stopsDict]];
                }
                // MGLStyleValue *rasterOpacityValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeExponential cameraStops:stopsDict options:optionsDict];
                // [layer setRasterOpacity:rasterOpacityValue];
                [layer setRasterOpacity:exp];
            } else {
                // MGLStyleValue *rasterOpacityValue = [MGLStyleValue valueWithRawValue:paintProperties[@"raster-opacity"]];
                exp = [NSExpression expressionForConstantValue:paintProperties[@"raster-opacity"]];
                // [layer setRasterOpacity:rasterOpacityValue];
                [layer setRasterOpacity:exp];
            }
        }
        if ([paintProperties valueForKey:@"raster-hue-rotate"]) {
            NSExpression *exp;
            if ([[paintProperties valueForKey:@"raster-hue-rotate"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"raster-hue-rotate"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                //    // [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                    [stopsDict setObject:stop[1] forKey:stop[0]];
                }
                NSMutableDictionary *optionsDict = [[NSMutableDictionary alloc] init];
                NSNumber *baseNumber = paintProperties[@"raster-hue-rotate"][@"base"];
                if (baseNumber) {
                    // [optionsDict setObject:baseNumber forKey:MGLStyleFunctionOptionInterpolationBase];
                    exp = [NSExpression
                            mgl_expressionForInterpolatingExpression:NSExpression.zoomLevelVariableExpression
                            withCurveType:MGLExpressionInterpolationModeExponential
                            parameters:[NSExpression expressionForConstantValue:baseNumber]
                            stops:[NSExpression expressionForConstantValue:stopsDict]];
                } else {
                    // [optionsDict setObject:[NSNumber numberWithInt:1] forKey:MGLStyleFunctionOptionInterpolationBase];
                    // exp = [NSExpression expressionWithFormat: @"mgl_interpolate:withCurveType:parameters:stops:(mag, 'exponential', nil, %@)", stops];
                    exp = [NSExpression
                            mgl_expressionForInterpolatingExpression:NSExpression.zoomLevelVariableExpression
                            withCurveType:MGLExpressionInterpolationModeLinear
                            parameters:nil
                            stops:[NSExpression expressionForConstantValue:stopsDict]];
                }
                // MGLStyleValue *rasterHueRotateValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeExponential cameraStops:stopsDict options:optionsDict];
                // [layer setRasterHueRotation:rasterHueRotateValue];
                [layer setRasterHueRotation:exp];
            } else {
                // MGLStyleValue *rasterHueRotateValue = [MGLStyleValue valueWithRawValue:paintProperties[@"raster-hue-rotate"]];
                exp = [NSExpression expressionForConstantValue:paintProperties[@"raster-hue-rotate"]];
                // [layer setRasterHueRotation:rasterHueRotateValue];
                [layer setRasterHueRotation:exp];
            }
        }
        if ([paintProperties valueForKey:@"raster-brightness-min"]) {
            NSExpression *exp;
            if ([[paintProperties valueForKey:@"raster-brightness-min"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"raster-brightness-min"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                //    // [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                    [stopsDict setObject:stop[1] forKey:stop[0]];
                }
                NSMutableDictionary *optionsDict = [[NSMutableDictionary alloc] init];
                NSNumber *baseNumber = paintProperties[@"raster-brightness-min"][@"base"];
                if (baseNumber) {
                    // [optionsDict setObject:baseNumber forKey:MGLStyleFunctionOptionInterpolationBase];
                    exp = [NSExpression
                            mgl_expressionForInterpolatingExpression:NSExpression.zoomLevelVariableExpression
                            withCurveType:MGLExpressionInterpolationModeExponential
                            parameters:[NSExpression expressionForConstantValue:baseNumber]
                            stops:[NSExpression expressionForConstantValue:stopsDict]];
                } else {
                    // [optionsDict setObject:[NSNumber numberWithInt:1] forKey:MGLStyleFunctionOptionInterpolationBase];
                    // exp = [NSExpression expressionWithFormat: @"mgl_interpolate:withCurveType:parameters:stops:(mag, 'exponential', nil, %@)", stops];
                    exp = [NSExpression
                            mgl_expressionForInterpolatingExpression:NSExpression.zoomLevelVariableExpression
                            withCurveType:MGLExpressionInterpolationModeLinear
                            parameters:nil
                            stops:[NSExpression expressionForConstantValue:stopsDict]];
                }
                // MGLStyleValue *rasterBrightnessMinValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeExponential cameraStops:stopsDict options:optionsDict];
                // [layer setMinimumRasterBrightness:rasterBrightnessMinValue];
                [layer setMinimumRasterBrightness:exp];
            } else {
                // MGLStyleValue *rasterBrightnessMinValue = [MGLStyleValue valueWithRawValue:paintProperties[@"raster-brightness-min"]];
                exp = [NSExpression expressionForConstantValue:paintProperties[@"raster-brightness-min"]];
                // [layer setMinimumRasterBrightness:rasterBrightnessMinValue];
                [layer setMinimumRasterBrightness:exp];
            }
        }
        if ([paintProperties valueForKey:@"raster-brightness-max"]) {
            NSExpression *exp;
            if ([[paintProperties valueForKey:@"raster-brightness-max"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"raster-brightness-max"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                //    // [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                    [stopsDict setObject:stop[1] forKey:stop[0]];
                }
                NSMutableDictionary *optionsDict = [[NSMutableDictionary alloc] init];
                NSNumber *baseNumber = paintProperties[@"raster-brightness-max"][@"base"];
                if (baseNumber) {
                    // [optionsDict setObject:baseNumber forKey:MGLStyleFunctionOptionInterpolationBase];
                    exp = [NSExpression
                            mgl_expressionForInterpolatingExpression:NSExpression.zoomLevelVariableExpression
                            withCurveType:MGLExpressionInterpolationModeExponential
                            parameters:[NSExpression expressionForConstantValue:baseNumber]
                            stops:[NSExpression expressionForConstantValue:stopsDict]];
                } else {
                    // [optionsDict setObject:[NSNumber numberWithInt:1] forKey:MGLStyleFunctionOptionInterpolationBase];
                    // exp = [NSExpression expressionWithFormat: @"mgl_interpolate:withCurveType:parameters:stops:(mag, 'exponential', nil, %@)", stops];
                    exp = [NSExpression
                            mgl_expressionForInterpolatingExpression:NSExpression.zoomLevelVariableExpression
                            withCurveType:MGLExpressionInterpolationModeLinear
                            parameters:nil
                            stops:[NSExpression expressionForConstantValue:stopsDict]];
                }
                // MGLStyleValue *rasterBrightnessMaxValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeExponential cameraStops:stopsDict options:optionsDict];
                // [layer setMaximumRasterBrightness:rasterBrightnessMaxValue];
                [layer setMaximumRasterBrightness:exp];
            } else {
                // MGLStyleValue *rasterBrightnessMaxValue = [MGLStyleValue valueWithRawValue:paintProperties[@"raster-brightness-max"]];
                exp = [NSExpression expressionForConstantValue:paintProperties[@"raster-brightness-max"]];
                // [layer setMaximumRasterBrightness:rasterBrightnessMaxValue];
                [layer setMaximumRasterBrightness:exp];
            }
        }
        if ([paintProperties valueForKey:@"raster-saturation"]) {
            NSExpression *exp;
            if ([[paintProperties valueForKey:@"raster-saturation"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"raster-saturation"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                //    // [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                    [stopsDict setObject:stop[1] forKey:stop[0]];
                }
                NSMutableDictionary *optionsDict = [[NSMutableDictionary alloc] init];
                NSNumber *baseNumber = paintProperties[@"raster-saturation"][@"base"];
                if (baseNumber) {
                    // [optionsDict setObject:baseNumber forKey:MGLStyleFunctionOptionInterpolationBase];
                    exp = [NSExpression
                            mgl_expressionForInterpolatingExpression:NSExpression.zoomLevelVariableExpression
                            withCurveType:MGLExpressionInterpolationModeExponential
                            parameters:[NSExpression expressionForConstantValue:baseNumber]
                            stops:[NSExpression expressionForConstantValue:stopsDict]];
                } else {
                    // [optionsDict setObject:[NSNumber numberWithInt:1] forKey:MGLStyleFunctionOptionInterpolationBase];
                    // exp = [NSExpression expressionWithFormat: @"mgl_interpolate:withCurveType:parameters:stops:(mag, 'exponential', nil, %@)", stops];
                    exp = [NSExpression
                            mgl_expressionForInterpolatingExpression:NSExpression.zoomLevelVariableExpression
                            withCurveType:MGLExpressionInterpolationModeLinear
                            parameters:nil
                            stops:[NSExpression expressionForConstantValue:stopsDict]];
                }
                // MGLStyleValue *rasterSaturationValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeExponential cameraStops:stopsDict options:optionsDict];
                // [layer setRasterSaturation:rasterSaturationValue];
                [layer setRasterSaturation:exp];
            } else {
                // MGLStyleValue *rasterSaturationValue = [MGLStyleValue valueWithRawValue:paintProperties[@"raster-saturation"]];
                exp = [NSExpression expressionForConstantValue:paintProperties[@"raster-saturation"]];
                // [layer setRasterSaturation:rasterSaturationValue];
                [layer setRasterSaturation:exp];
            }
        }
        if ([paintProperties valueForKey:@"raster-contrast"]) {
            NSExpression *exp;
            if ([[paintProperties valueForKey:@"raster-contrast"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"raster-contrast"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                //    // [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                    [stopsDict setObject:stop[1] forKey:stop[0]];
                }
                NSMutableDictionary *optionsDict = [[NSMutableDictionary alloc] init];
                NSNumber *baseNumber = paintProperties[@"raster-contrast"][@"base"];
                if (baseNumber) {
                    // [optionsDict setObject:baseNumber forKey:MGLStyleFunctionOptionInterpolationBase];
                    exp = [NSExpression
                            mgl_expressionForInterpolatingExpression:NSExpression.zoomLevelVariableExpression
                            withCurveType:MGLExpressionInterpolationModeExponential
                            parameters:[NSExpression expressionForConstantValue:baseNumber]
                            stops:[NSExpression expressionForConstantValue:stopsDict]];
                } else {
                    // [optionsDict setObject:[NSNumber numberWithInt:1] forKey:MGLStyleFunctionOptionInterpolationBase];
                    // exp = [NSExpression expressionWithFormat: @"mgl_interpolate:withCurveType:parameters:stops:(mag, 'exponential', nil, %@)", stops];
                    exp = [NSExpression
                            mgl_expressionForInterpolatingExpression:NSExpression.zoomLevelVariableExpression
                            withCurveType:MGLExpressionInterpolationModeLinear
                            parameters:nil
                            stops:[NSExpression expressionForConstantValue:stopsDict]];
                }
                // MGLStyleValue *rasterContrastValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeExponential cameraStops:stopsDict options:optionsDict];
                // [layer setRasterContrast:rasterContrastValue];
                [layer setRasterContrast:exp];
            } else {
                // MGLStyleValue *rasterContrastValue = [MGLStyleValue valueWithRawValue:paintProperties[@"raster-contrast"]];
                exp = [NSExpression expressionForConstantValue:paintProperties[@"raster-contrast"]];
                // [layer setRasterContrast:rasterContrastValue];
                [layer setRasterContrast:exp];
            }
        }
        if ([paintProperties valueForKey:@"raster-fade-duration"]) {
            NSExpression *exp;
            if ([[paintProperties valueForKey:@"raster-fade-duration"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"raster-fade-duration"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                //    // [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                    [stopsDict setObject:stop[1] forKey:stop[0]];
                }
                NSMutableDictionary *optionsDict = [[NSMutableDictionary alloc] init];
                NSNumber *baseNumber = paintProperties[@"raster-fade-duration"][@"base"];
                if (baseNumber) {
                    // [optionsDict setObject:baseNumber forKey:MGLStyleFunctionOptionInterpolationBase];
                    exp = [NSExpression
                            mgl_expressionForInterpolatingExpression:NSExpression.zoomLevelVariableExpression
                            withCurveType:MGLExpressionInterpolationModeExponential
                            parameters:[NSExpression expressionForConstantValue:baseNumber]
                            stops:[NSExpression expressionForConstantValue:stopsDict]];
                } else {
                    // [optionsDict setObject:[NSNumber numberWithInt:1] forKey:MGLStyleFunctionOptionInterpolationBase];
                    // exp = [NSExpression expressionWithFormat: @"mgl_interpolate:withCurveType:parameters:stops:(mag, 'exponential', nil, %@)", stops];
                    exp = [NSExpression
                            mgl_expressionForInterpolatingExpression:NSExpression.zoomLevelVariableExpression
                            withCurveType:MGLExpressionInterpolationModeLinear
                            parameters:nil
                            stops:[NSExpression expressionForConstantValue:stopsDict]];
                }
                // MGLStyleValue *rasterFadeDurationValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeExponential cameraStops:stopsDict options:optionsDict];
                // [layer setRasterFadeDuration:rasterFadeDurationValue];
                [layer setRasterFadeDuration:exp];
            } else {
                // MGLStyleValue *rasterFadeDurationValue = [MGLStyleValue valueWithRawValue:paintProperties[@"raster-fade-duration"]];
                exp = [NSExpression expressionForConstantValue:paintProperties[@"raster-fade-duration"]];
                // [layer setRasterFadeDuration:rasterFadeDurationValue];
                [layer setRasterFadeDuration:exp];
            }
        }

        NSNumber *minzoom = layerJson[@"minzoom"];
        NSNumber *maxzoom = layerJson[@"maxzoom"];
        if (minzoom) {
            [layer setMinimumZoomLevel:[minzoom floatValue]];
        }
        if (maxzoom) {
            [layer setMaximumZoomLevel:[maxzoom floatValue]];
        }
        return layer;
    }
    if([typeString isEqualToString:@"background"]) {
        NSDictionary *paintProperties = layerJson[@"paint"];
        MGLBackgroundStyleLayer *layer = [[MGLBackgroundStyleLayer alloc] initWithIdentifier:idString];
        if ([paintProperties valueForKey:@"background-color"]) {
            NSExpression *exp;
            if ([[paintProperties valueForKey:@"background-color"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"background-color"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[UIColor colorWithString:stop[1]] forKey:stop[0]];
                }
                NSMutableDictionary *optionsDict = [[NSMutableDictionary alloc] init];
                NSNumber *baseNumber = paintProperties[@"background-color"][@"base"];
                if (baseNumber) {
                    // [optionsDict setObject:baseNumber forKey:MGLStyleFunctionOptionInterpolationBase];
                    exp = [NSExpression
                            mgl_expressionForInterpolatingExpression:NSExpression.zoomLevelVariableExpression
                            withCurveType:MGLExpressionInterpolationModeExponential
                            parameters:[NSExpression expressionForConstantValue:baseNumber]
                            stops:[NSExpression expressionForConstantValue:stopsDict]];
                } else {
                    // [optionsDict setObject:[NSNumber numberWithInt:1] forKey:MGLStyleFunctionOptionInterpolationBase];
                    // exp = [NSExpression expressionWithFormat: @"mgl_interpolate:withCurveType:parameters:stops:(mag, 'exponential', nil, %@)", stops];
                    exp = [NSExpression
                            mgl_expressionForInterpolatingExpression:NSExpression.zoomLevelVariableExpression
                            withCurveType:MGLExpressionInterpolationModeLinear
                            parameters:nil
                            stops:[NSExpression expressionForConstantValue:stopsDict]];
                }
                // MGLStyleValue *backgroundColorValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeExponential cameraStops:stopsDict options:optionsDict];
                // [layer setBackgroundColor:backgroundColorValue];
                [layer setBackgroundColor:exp];
            } else {
                UIColor *color = [UIColor colorWithString:paintProperties[@"background-color"]];
                // MGLStyleValue *backgroundColorValue = [MGLStyleValue valueWithRawValue:color];
                exp = [NSExpression expressionForConstantValue:color];
                // [layer setBackgroundColor:backgroundColorValue];
                [layer setBackgroundColor:exp];
            }
        }
        if ([paintProperties valueForKey:@"background-pattern"]) {
            NSExpression *exp;
            if ([[paintProperties valueForKey:@"background-pattern"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"background-pattern"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                //    // [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                    [stopsDict setObject:stop[1] forKey:stop[0]];
                }
                // MGLStyleValue *backgroundPatternValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeInterval cameraStops:stopsDict options:nil];
                //// exp = [NSExpression expressionForConstantValue:paintProperties[@"background-pattern"]];
                // exp = [NSExpression expressionWithFormat: @"mgl_step:from:stops:(mag, nil, %@)", stopsDict];
                exp = [NSExpression
                       mgl_expressionForSteppingExpression:NSExpression.zoomLevelVariableExpression
                       fromExpression:[NSExpression expressionForConstantValue:stops[0][1]]
                       stops:[NSExpression expressionForConstantValue:stopsDict]];
                // [layer setBackgroundPattern:backgroundPatternValue];
                [layer setBackgroundPattern:exp];
            } else {
                // MGLStyleValue *backgroundPatternValue = [MGLStyleValue valueWithRawValue:paintProperties[@"background-pattern"]];
                exp = [NSExpression expressionForConstantValue:paintProperties[@"background-pattern"]];
                // [layer setBackgroundPattern:backgroundPatternValue];
                [layer setBackgroundPattern:exp];
            }
        }
        if ([paintProperties valueForKey:@"background-opacity"]) {
            NSExpression *exp;
            if ([[paintProperties valueForKey:@"background-opacity"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"background-opacity"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                //    // [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                    [stopsDict setObject:stop[1] forKey:stop[0]];
                }
                NSMutableDictionary *optionsDict = [[NSMutableDictionary alloc] init];
                NSNumber *baseNumber = paintProperties[@"background-opacity"][@"base"];
                if (baseNumber) {
                    // [optionsDict setObject:baseNumber forKey:MGLStyleFunctionOptionInterpolationBase];
                    exp = [NSExpression
                            mgl_expressionForInterpolatingExpression:NSExpression.zoomLevelVariableExpression
                            withCurveType:MGLExpressionInterpolationModeExponential
                            parameters:[NSExpression expressionForConstantValue:baseNumber]
                            stops:[NSExpression expressionForConstantValue:stopsDict]];
                } else {
                    // [optionsDict setObject:[NSNumber numberWithInt:1] forKey:MGLStyleFunctionOptionInterpolationBase];
                    // exp = [NSExpression expressionWithFormat: @"mgl_interpolate:withCurveType:parameters:stops:(mag, 'exponential', nil, %@)", stops];
                    exp = [NSExpression
                            mgl_expressionForInterpolatingExpression:NSExpression.zoomLevelVariableExpression
                            withCurveType:MGLExpressionInterpolationModeLinear
                            parameters:nil
                            stops:[NSExpression expressionForConstantValue:stopsDict]];
                }
                // MGLStyleValue *backgroundOpacityValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeExponential cameraStops:stopsDict options:optionsDict];
                // [layer setBackgroundOpacity:backgroundOpacityValue];
                [layer setBackgroundOpacity:exp];
            } else {
                // MGLStyleValue *backgroundOpacityValue = [MGLStyleValue valueWithRawValue:paintProperties[@"background-opacity"]];
                exp = [NSExpression expressionForConstantValue:paintProperties[@"background-opacity"]];
                // [layer setBackgroundOpacity:backgroundOpacityValue];
                [layer setBackgroundOpacity:exp];
            }
        }

        NSNumber *minzoom = layerJson[@"minzoom"];
        NSNumber *maxzoom = layerJson[@"maxzoom"];
        if (minzoom) {
            [layer setMinimumZoomLevel:[minzoom floatValue]];
        }
        if (maxzoom) {
            [layer setMaximumZoomLevel:[maxzoom floatValue]];
        }
        return layer;
    }
    if (errorPtr) {
        *errorPtr = [NSError errorWithDomain:RCTMapboxGLErrorDomain
                             code:1001
                             userInfo:@{NSLocalizedDescriptionKey:[NSString stringWithFormat:@"addLayer(): cannot add layer of type '%@'", typeString]}
        ];
    }
    return nil;
}

- (NSPredicate *)predicateWithJson:(nonnull NSArray *)filterJson
{
    NSString *filterType = filterJson[0];
    if ([filterType isEqualToString:@"=="]) {
        return [NSPredicate predicateWithFormat:@"%K == %@", filterJson[1], filterJson[2]];
    }
    if ([filterType isEqualToString:@"!="]) {
        return [NSPredicate predicateWithFormat:@"%K != %@", filterJson[1], filterJson[2]];
    }
    if ([filterType isEqualToString:@"<"]) {
        return [NSPredicate predicateWithFormat:@"%K < %@", filterJson[1], filterJson[2]];
    }
    if ([filterType isEqualToString:@"<="]) {
        return [NSPredicate predicateWithFormat:@"%K <= %@", filterJson[1], filterJson[2]];
    }
    if ([filterType isEqualToString:@">"]) {
        return [NSPredicate predicateWithFormat:@"%K > %@", filterJson[1], filterJson[2]];
    }
    if ([filterType isEqualToString:@">="]) {
        return [NSPredicate predicateWithFormat:@"%K >= %@", filterJson[1], filterJson[2]];
    }
    if ([filterType isEqualToString:@"has"]) {
        return [NSPredicate predicateWithFormat:@"%K != %@", filterJson[1], nil];
    }
    if ([filterType isEqualToString:@"!has"]) {
        return [NSPredicate predicateWithFormat:@"%K == %@", filterJson[1], nil];
    }
    if ([filterType isEqualToString:@"in"]) {
        NSMutableArray *elementsArray = [NSMutableArray arrayWithArray:filterJson];
        [elementsArray removeObjectAtIndex:0];
        [elementsArray removeObjectAtIndex:0];
        return [NSPredicate predicateWithFormat:@"%K IN %@", filterJson[1], elementsArray];
    }
    if ([filterType isEqualToString:@"!in"]) {
        NSMutableArray *elementsArray = [NSMutableArray arrayWithArray:filterJson];
        [elementsArray removeObjectAtIndex:0];
        [elementsArray removeObjectAtIndex:0];
        return [NSPredicate predicateWithFormat:@"!(%K IN %@)", filterJson[1], elementsArray];
    }
    if ([filterType isEqualToString:@"all"]) {
        NSMutableArray *filters = [NSMutableArray arrayWithArray:filterJson];
        [filters removeObjectAtIndex:0];
        NSMutableArray *predicates = [NSMutableArray arrayWithCapacity:[filters count]];
        for (id filter in filters) {
            [predicates addObject:[self predicateWithJson:filter]];
        }
        return [NSCompoundPredicate andPredicateWithSubpredicates:predicates];
    }
    if ([filterType isEqualToString:@"any"]) {
        NSMutableArray *filters = [NSMutableArray arrayWithArray:filterJson];
        [filters removeObjectAtIndex:0];
        NSMutableArray *predicates = [NSMutableArray arrayWithCapacity:[filters count]];
        for (id filter in filters) {
            [predicates addObject:[self predicateWithJson:filter]];
        }
        return [NSCompoundPredicate orPredicateWithSubpredicates:predicates];
    }
    if ([filterType isEqualToString:@"none"]) {
        NSMutableArray *filters = [NSMutableArray arrayWithArray:filterJson];
        [filters removeObjectAtIndex:0];
        NSMutableArray *predicates = [NSMutableArray arrayWithCapacity:[filters count]];
        for (id filter in filters) {
            [predicates addObject:[NSCompoundPredicate notPredicateWithSubpredicate:[self predicateWithJson:filter]]];
        }
        return [NSCompoundPredicate andPredicateWithSubpredicates:predicates];
    }
    return nil;
}

@end
