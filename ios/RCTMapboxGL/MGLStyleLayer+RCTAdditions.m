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
            if ([[paintProperties valueForKey:@"fill-antialias"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"fill-antialias"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                }
                MGLStyleValue *fillAntialiasValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeInterval cameraStops:stopsDict options:nil];
                [layer setFillAntialiased:fillAntialiasValue];
            } else {
                MGLStyleValue *fillAntialiasValue = [MGLStyleValue valueWithRawValue:paintProperties[@"fill-antialias"]];
                [layer setFillAntialiased:fillAntialiasValue];
            }
        }
        if ([paintProperties valueForKey:@"fill-opacity"]) {
            if ([[paintProperties valueForKey:@"fill-opacity"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"fill-opacity"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                }
                NSMutableDictionary *optionsDict = [[NSMutableDictionary alloc] init];
                NSNumber *baseNumber = paintProperties[@"fill-opacity"][@"base"];
                if (baseNumber) {
                    [optionsDict setObject:baseNumber forKey:MGLStyleFunctionOptionInterpolationBase];
                } else {
                    [optionsDict setObject:[NSNumber numberWithInt:1] forKey:MGLStyleFunctionOptionInterpolationBase];
                }
                MGLStyleValue *fillOpacityValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeExponential cameraStops:stopsDict options:optionsDict];
                [layer setFillOpacity:fillOpacityValue];
            } else {
                MGLStyleValue *fillOpacityValue = [MGLStyleValue valueWithRawValue:paintProperties[@"fill-opacity"]];
                [layer setFillOpacity:fillOpacityValue];
            }
        }
        if ([paintProperties valueForKey:@"fill-color"]) {
            if ([[paintProperties valueForKey:@"fill-color"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"fill-color"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:[UIColor colorWithString:stop[1]]] forKey:stop[0]];
                }
                NSMutableDictionary *optionsDict = [[NSMutableDictionary alloc] init];
                NSNumber *baseNumber = paintProperties[@"fill-color"][@"base"];
                if (baseNumber) {
                    [optionsDict setObject:baseNumber forKey:MGLStyleFunctionOptionInterpolationBase];
                } else {
                    [optionsDict setObject:[NSNumber numberWithInt:1] forKey:MGLStyleFunctionOptionInterpolationBase];
                }
                MGLStyleValue *fillColorValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeExponential cameraStops:stopsDict options:optionsDict];
                [layer setFillColor:fillColorValue];
            } else {
                UIColor *color = [UIColor colorWithString:paintProperties[@"fill-color"]];
                MGLStyleValue *fillColorValue = [MGLStyleValue valueWithRawValue:color];
                [layer setFillColor:fillColorValue];
            }
        }
        if ([paintProperties valueForKey:@"fill-outline-color"]) {
            if ([[paintProperties valueForKey:@"fill-outline-color"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"fill-outline-color"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:[UIColor colorWithString:stop[1]]] forKey:stop[0]];
                }
                NSMutableDictionary *optionsDict = [[NSMutableDictionary alloc] init];
                NSNumber *baseNumber = paintProperties[@"fill-outline-color"][@"base"];
                if (baseNumber) {
                    [optionsDict setObject:baseNumber forKey:MGLStyleFunctionOptionInterpolationBase];
                } else {
                    [optionsDict setObject:[NSNumber numberWithInt:1] forKey:MGLStyleFunctionOptionInterpolationBase];
                }
                MGLStyleValue *fillOutlineColorValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeExponential cameraStops:stopsDict options:optionsDict];
                [layer setFillOutlineColor:fillOutlineColorValue];
            } else {
                UIColor *color = [UIColor colorWithString:paintProperties[@"fill-outline-color"]];
                MGLStyleValue *fillOutlineColorValue = [MGLStyleValue valueWithRawValue:color];
                [layer setFillOutlineColor:fillOutlineColorValue];
            }
        }
        if ([paintProperties valueForKey:@"fill-translate"]) {
            if ([[paintProperties valueForKey:@"fill-translate"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"fill-translate"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    CGVector vector = CGVectorMake([stop[1][0] floatValue], [stop[1][1] floatValue]);
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:[NSValue valueWithCGVector:vector]] forKey:stop[0]];
                }
                NSMutableDictionary *optionsDict = [[NSMutableDictionary alloc] init];
                NSNumber *baseNumber = paintProperties[@"fill-translate"][@"base"];
                if (baseNumber) {
                    [optionsDict setObject:baseNumber forKey:MGLStyleFunctionOptionInterpolationBase];
                } else {
                    [optionsDict setObject:[NSNumber numberWithInt:1] forKey:MGLStyleFunctionOptionInterpolationBase];
                }
                MGLStyleValue *fillTranslateValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeExponential cameraStops:stopsDict options:optionsDict];
                [layer setFillTranslation:fillTranslateValue];
            } else {
                CGVector vector = CGVectorMake([paintProperties[@"fill-translate"][0] floatValue], [paintProperties[@"fill-translate"][1] floatValue]);
                MGLStyleValue *fillTranslateValue = [MGLStyleValue valueWithRawValue:[NSValue valueWithCGVector:vector]];
                [layer setFillTranslation:fillTranslateValue];
            }
        }
        if ([paintProperties valueForKey:@"fill-translate-anchor"]) {
            // create the NSString -> enum dictionary for later use
            NSDictionary<NSString*, NSNumber *> *enumDictionary = @{
                @"map": @(MGLFillTranslationAnchorMap),
                @"viewport": @(MGLFillTranslationAnchorViewport),
            };
            if ([[paintProperties valueForKey:@"fill-translate-anchor"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"fill-translate-anchor"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    NSValue *value = [NSValue valueWithMGLFillTranslationAnchor:enumDictionary[paintProperties[@"fill-translate-anchor"]].integerValue];
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:value] forKey:stop[0]];
                }
                MGLStyleValue *fillTranslateAnchorValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeInterval cameraStops:stopsDict options:nil];
                [layer setFillTranslationAnchor:fillTranslateAnchorValue];
            } else {
                NSValue *value = [NSValue valueWithMGLFillTranslationAnchor:enumDictionary[paintProperties[@"fill-translate-anchor"]].integerValue];
                MGLStyleValue *fillTranslateAnchorValue = [MGLStyleValue valueWithRawValue:value];
                [layer setFillTranslationAnchor:fillTranslateAnchorValue];
            }
        }
        if ([paintProperties valueForKey:@"fill-pattern"]) {
            if ([[paintProperties valueForKey:@"fill-pattern"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"fill-pattern"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                }
                MGLStyleValue *fillPatternValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeInterval cameraStops:stopsDict options:nil];
                [layer setFillPattern:fillPatternValue];
            } else {
                MGLStyleValue *fillPatternValue = [MGLStyleValue valueWithRawValue:paintProperties[@"fill-pattern"]];
                [layer setFillPattern:fillPatternValue];
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
            if ([[layoutProperties valueForKey:@"line-cap"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = layoutProperties[@"line-cap"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    NSValue *value = [NSValue valueWithMGLLineCap:enumDictionary[layoutProperties[@"line-cap"]].integerValue];
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:value] forKey:stop[0]];
                }
                MGLStyleValue *lineCapValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeInterval cameraStops:stopsDict options:nil];
                [layer setLineCap:lineCapValue];
            } else {
                NSValue *value = [NSValue valueWithMGLLineCap:enumDictionary[layoutProperties[@"line-cap"]].integerValue];
                MGLStyleValue *lineCapValue = [MGLStyleValue valueWithRawValue:value];
                [layer setLineCap:lineCapValue];
            }
        }
        if ([layoutProperties valueForKey:@"line-join"]) {
            // create the NSString -> enum dictionary for later use
            NSDictionary<NSString*, NSNumber *> *enumDictionary = @{
                @"bevel": @(MGLLineJoinBevel),
                @"round": @(MGLLineJoinRound),
                @"miter": @(MGLLineJoinMiter),
            };
            if ([[layoutProperties valueForKey:@"line-join"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = layoutProperties[@"line-join"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    NSValue *value = [NSValue valueWithMGLLineJoin:enumDictionary[layoutProperties[@"line-join"]].integerValue];
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:value] forKey:stop[0]];
                }
                MGLStyleValue *lineJoinValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeInterval cameraStops:stopsDict options:nil];
                [layer setLineJoin:lineJoinValue];
            } else {
                NSValue *value = [NSValue valueWithMGLLineJoin:enumDictionary[layoutProperties[@"line-join"]].integerValue];
                MGLStyleValue *lineJoinValue = [MGLStyleValue valueWithRawValue:value];
                [layer setLineJoin:lineJoinValue];
            }
        }
        if ([layoutProperties valueForKey:@"line-miter-limit"]) {
            if ([[layoutProperties valueForKey:@"line-miter-limit"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = layoutProperties[@"line-miter-limit"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                }
                NSMutableDictionary *optionsDict = [[NSMutableDictionary alloc] init];
                NSNumber *baseNumber = layoutProperties[@"line-miter-limit"][@"base"];
                if (baseNumber) {
                    [optionsDict setObject:baseNumber forKey:MGLStyleFunctionOptionInterpolationBase];
                } else {
                    [optionsDict setObject:[NSNumber numberWithInt:1] forKey:MGLStyleFunctionOptionInterpolationBase];
                }
                MGLStyleValue *lineMiterLimitValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeExponential cameraStops:stopsDict options:optionsDict];
                [layer setLineMiterLimit:lineMiterLimitValue];
            } else {
                MGLStyleValue *lineMiterLimitValue = [MGLStyleValue valueWithRawValue:layoutProperties[@"line-miter-limit"]];
                [layer setLineMiterLimit:lineMiterLimitValue];
            }
        }
        if ([layoutProperties valueForKey:@"line-round-limit"]) {
            if ([[layoutProperties valueForKey:@"line-round-limit"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = layoutProperties[@"line-round-limit"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                }
                NSMutableDictionary *optionsDict = [[NSMutableDictionary alloc] init];
                NSNumber *baseNumber = layoutProperties[@"line-round-limit"][@"base"];
                if (baseNumber) {
                    [optionsDict setObject:baseNumber forKey:MGLStyleFunctionOptionInterpolationBase];
                } else {
                    [optionsDict setObject:[NSNumber numberWithInt:1] forKey:MGLStyleFunctionOptionInterpolationBase];
                }
                MGLStyleValue *lineRoundLimitValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeExponential cameraStops:stopsDict options:optionsDict];
                [layer setLineRoundLimit:lineRoundLimitValue];
            } else {
                MGLStyleValue *lineRoundLimitValue = [MGLStyleValue valueWithRawValue:layoutProperties[@"line-round-limit"]];
                [layer setLineRoundLimit:lineRoundLimitValue];
            }
        }
        if ([paintProperties valueForKey:@"line-opacity"]) {
            if ([[paintProperties valueForKey:@"line-opacity"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"line-opacity"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                }
                NSMutableDictionary *optionsDict = [[NSMutableDictionary alloc] init];
                NSNumber *baseNumber = paintProperties[@"line-opacity"][@"base"];
                if (baseNumber) {
                    [optionsDict setObject:baseNumber forKey:MGLStyleFunctionOptionInterpolationBase];
                } else {
                    [optionsDict setObject:[NSNumber numberWithInt:1] forKey:MGLStyleFunctionOptionInterpolationBase];
                }
                MGLStyleValue *lineOpacityValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeExponential cameraStops:stopsDict options:optionsDict];
                [layer setLineOpacity:lineOpacityValue];
            } else {
                MGLStyleValue *lineOpacityValue = [MGLStyleValue valueWithRawValue:paintProperties[@"line-opacity"]];
                [layer setLineOpacity:lineOpacityValue];
            }
        }
        if ([paintProperties valueForKey:@"line-color"]) {
            if ([[paintProperties valueForKey:@"line-color"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"line-color"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:[UIColor colorWithString:stop[1]]] forKey:stop[0]];
                }
                NSMutableDictionary *optionsDict = [[NSMutableDictionary alloc] init];
                NSNumber *baseNumber = paintProperties[@"line-color"][@"base"];
                if (baseNumber) {
                    [optionsDict setObject:baseNumber forKey:MGLStyleFunctionOptionInterpolationBase];
                } else {
                    [optionsDict setObject:[NSNumber numberWithInt:1] forKey:MGLStyleFunctionOptionInterpolationBase];
                }
                MGLStyleValue *lineColorValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeExponential cameraStops:stopsDict options:optionsDict];
                [layer setLineColor:lineColorValue];
            } else {
                UIColor *color = [UIColor colorWithString:paintProperties[@"line-color"]];
                MGLStyleValue *lineColorValue = [MGLStyleValue valueWithRawValue:color];
                [layer setLineColor:lineColorValue];
            }
        }
        if ([paintProperties valueForKey:@"line-translate"]) {
            if ([[paintProperties valueForKey:@"line-translate"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"line-translate"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    CGVector vector = CGVectorMake([stop[1][0] floatValue], [stop[1][1] floatValue]);
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:[NSValue valueWithCGVector:vector]] forKey:stop[0]];
                }
                NSMutableDictionary *optionsDict = [[NSMutableDictionary alloc] init];
                NSNumber *baseNumber = paintProperties[@"line-translate"][@"base"];
                if (baseNumber) {
                    [optionsDict setObject:baseNumber forKey:MGLStyleFunctionOptionInterpolationBase];
                } else {
                    [optionsDict setObject:[NSNumber numberWithInt:1] forKey:MGLStyleFunctionOptionInterpolationBase];
                }
                MGLStyleValue *lineTranslateValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeExponential cameraStops:stopsDict options:optionsDict];
                [layer setLineTranslation:lineTranslateValue];
            } else {
                CGVector vector = CGVectorMake([paintProperties[@"line-translate"][0] floatValue], [paintProperties[@"line-translate"][1] floatValue]);
                MGLStyleValue *lineTranslateValue = [MGLStyleValue valueWithRawValue:[NSValue valueWithCGVector:vector]];
                [layer setLineTranslation:lineTranslateValue];
            }
        }
        if ([paintProperties valueForKey:@"line-translate-anchor"]) {
            // create the NSString -> enum dictionary for later use
            NSDictionary<NSString*, NSNumber *> *enumDictionary = @{
                @"map": @(MGLLineTranslationAnchorMap),
                @"viewport": @(MGLLineTranslationAnchorViewport),
            };
            if ([[paintProperties valueForKey:@"line-translate-anchor"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"line-translate-anchor"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    NSValue *value = [NSValue valueWithMGLLineTranslationAnchor:enumDictionary[paintProperties[@"line-translate-anchor"]].integerValue];
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:value] forKey:stop[0]];
                }
                MGLStyleValue *lineTranslateAnchorValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeInterval cameraStops:stopsDict options:nil];
                [layer setLineTranslationAnchor:lineTranslateAnchorValue];
            } else {
                NSValue *value = [NSValue valueWithMGLLineTranslationAnchor:enumDictionary[paintProperties[@"line-translate-anchor"]].integerValue];
                MGLStyleValue *lineTranslateAnchorValue = [MGLStyleValue valueWithRawValue:value];
                [layer setLineTranslationAnchor:lineTranslateAnchorValue];
            }
        }
        if ([paintProperties valueForKey:@"line-width"]) {
            if ([[paintProperties valueForKey:@"line-width"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"line-width"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                }
                NSMutableDictionary *optionsDict = [[NSMutableDictionary alloc] init];
                NSNumber *baseNumber = paintProperties[@"line-width"][@"base"];
                if (baseNumber) {
                    [optionsDict setObject:baseNumber forKey:MGLStyleFunctionOptionInterpolationBase];
                } else {
                    [optionsDict setObject:[NSNumber numberWithInt:1] forKey:MGLStyleFunctionOptionInterpolationBase];
                }
                MGLStyleValue *lineWidthValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeExponential cameraStops:stopsDict options:optionsDict];
                [layer setLineWidth:lineWidthValue];
            } else {
                MGLStyleValue *lineWidthValue = [MGLStyleValue valueWithRawValue:paintProperties[@"line-width"]];
                [layer setLineWidth:lineWidthValue];
            }
        }
        if ([paintProperties valueForKey:@"line-gap-width"]) {
            if ([[paintProperties valueForKey:@"line-gap-width"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"line-gap-width"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                }
                NSMutableDictionary *optionsDict = [[NSMutableDictionary alloc] init];
                NSNumber *baseNumber = paintProperties[@"line-gap-width"][@"base"];
                if (baseNumber) {
                    [optionsDict setObject:baseNumber forKey:MGLStyleFunctionOptionInterpolationBase];
                } else {
                    [optionsDict setObject:[NSNumber numberWithInt:1] forKey:MGLStyleFunctionOptionInterpolationBase];
                }
                MGLStyleValue *lineGapWidthValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeExponential cameraStops:stopsDict options:optionsDict];
                [layer setLineGapWidth:lineGapWidthValue];
            } else {
                MGLStyleValue *lineGapWidthValue = [MGLStyleValue valueWithRawValue:paintProperties[@"line-gap-width"]];
                [layer setLineGapWidth:lineGapWidthValue];
            }
        }
        if ([paintProperties valueForKey:@"line-offset"]) {
            if ([[paintProperties valueForKey:@"line-offset"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"line-offset"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                }
                NSMutableDictionary *optionsDict = [[NSMutableDictionary alloc] init];
                NSNumber *baseNumber = paintProperties[@"line-offset"][@"base"];
                if (baseNumber) {
                    [optionsDict setObject:baseNumber forKey:MGLStyleFunctionOptionInterpolationBase];
                } else {
                    [optionsDict setObject:[NSNumber numberWithInt:1] forKey:MGLStyleFunctionOptionInterpolationBase];
                }
                MGLStyleValue *lineOffsetValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeExponential cameraStops:stopsDict options:optionsDict];
                [layer setLineOffset:lineOffsetValue];
            } else {
                MGLStyleValue *lineOffsetValue = [MGLStyleValue valueWithRawValue:paintProperties[@"line-offset"]];
                [layer setLineOffset:lineOffsetValue];
            }
        }
        if ([paintProperties valueForKey:@"line-blur"]) {
            if ([[paintProperties valueForKey:@"line-blur"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"line-blur"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                }
                NSMutableDictionary *optionsDict = [[NSMutableDictionary alloc] init];
                NSNumber *baseNumber = paintProperties[@"line-blur"][@"base"];
                if (baseNumber) {
                    [optionsDict setObject:baseNumber forKey:MGLStyleFunctionOptionInterpolationBase];
                } else {
                    [optionsDict setObject:[NSNumber numberWithInt:1] forKey:MGLStyleFunctionOptionInterpolationBase];
                }
                MGLStyleValue *lineBlurValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeExponential cameraStops:stopsDict options:optionsDict];
                [layer setLineBlur:lineBlurValue];
            } else {
                MGLStyleValue *lineBlurValue = [MGLStyleValue valueWithRawValue:paintProperties[@"line-blur"]];
                [layer setLineBlur:lineBlurValue];
            }
        }
        if ([paintProperties valueForKey:@"line-dasharray"]) {
            if ([[paintProperties valueForKey:@"line-dasharray"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"line-dasharray"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                }
                MGLStyleValue *lineDasharrayValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeInterval cameraStops:stopsDict options:nil];
                [layer setLineDashPattern:lineDasharrayValue];
            } else {
                MGLStyleValue *lineDasharrayValue = [MGLStyleValue valueWithRawValue:paintProperties[@"line-dasharray"]];
                [layer setLineDashPattern:lineDasharrayValue];
            }
        }
        if ([paintProperties valueForKey:@"line-pattern"]) {
            if ([[paintProperties valueForKey:@"line-pattern"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"line-pattern"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                }
                MGLStyleValue *linePatternValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeInterval cameraStops:stopsDict options:nil];
                [layer setLinePattern:linePatternValue];
            } else {
                MGLStyleValue *linePatternValue = [MGLStyleValue valueWithRawValue:paintProperties[@"line-pattern"]];
                [layer setLinePattern:linePatternValue];
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
            if ([[layoutProperties valueForKey:@"symbol-placement"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = layoutProperties[@"symbol-placement"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    NSValue *value = [NSValue valueWithMGLSymbolPlacement:enumDictionary[layoutProperties[@"symbol-placement"]].integerValue];
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:value] forKey:stop[0]];
                }
                MGLStyleValue *symbolPlacementValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeInterval cameraStops:stopsDict options:nil];
                [layer setSymbolPlacement:symbolPlacementValue];
            } else {
                NSValue *value = [NSValue valueWithMGLSymbolPlacement:enumDictionary[layoutProperties[@"symbol-placement"]].integerValue];
                MGLStyleValue *symbolPlacementValue = [MGLStyleValue valueWithRawValue:value];
                [layer setSymbolPlacement:symbolPlacementValue];
            }
        }
        if ([layoutProperties valueForKey:@"symbol-spacing"]) {
            if ([[layoutProperties valueForKey:@"symbol-spacing"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = layoutProperties[@"symbol-spacing"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                }
                NSMutableDictionary *optionsDict = [[NSMutableDictionary alloc] init];
                NSNumber *baseNumber = layoutProperties[@"symbol-spacing"][@"base"];
                if (baseNumber) {
                    [optionsDict setObject:baseNumber forKey:MGLStyleFunctionOptionInterpolationBase];
                } else {
                    [optionsDict setObject:[NSNumber numberWithInt:1] forKey:MGLStyleFunctionOptionInterpolationBase];
                }
                MGLStyleValue *symbolSpacingValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeExponential cameraStops:stopsDict options:optionsDict];
                [layer setSymbolSpacing:symbolSpacingValue];
            } else {
                MGLStyleValue *symbolSpacingValue = [MGLStyleValue valueWithRawValue:layoutProperties[@"symbol-spacing"]];
                [layer setSymbolSpacing:symbolSpacingValue];
            }
        }
        if ([layoutProperties valueForKey:@"symbol-avoid-edges"]) {
            if ([[layoutProperties valueForKey:@"symbol-avoid-edges"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = layoutProperties[@"symbol-avoid-edges"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                }
                MGLStyleValue *symbolAvoidEdgesValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeInterval cameraStops:stopsDict options:nil];
                [layer setSymbolAvoidsEdges:symbolAvoidEdgesValue];
            } else {
                MGLStyleValue *symbolAvoidEdgesValue = [MGLStyleValue valueWithRawValue:layoutProperties[@"symbol-avoid-edges"]];
                [layer setSymbolAvoidsEdges:symbolAvoidEdgesValue];
            }
        }
        if ([layoutProperties valueForKey:@"icon-allow-overlap"]) {
            if ([[layoutProperties valueForKey:@"icon-allow-overlap"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = layoutProperties[@"icon-allow-overlap"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                }
                MGLStyleValue *iconAllowOverlapValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeInterval cameraStops:stopsDict options:nil];
                [layer setIconAllowsOverlap:iconAllowOverlapValue];
            } else {
                MGLStyleValue *iconAllowOverlapValue = [MGLStyleValue valueWithRawValue:layoutProperties[@"icon-allow-overlap"]];
                [layer setIconAllowsOverlap:iconAllowOverlapValue];
            }
        }
        if ([layoutProperties valueForKey:@"icon-ignore-placement"]) {
            if ([[layoutProperties valueForKey:@"icon-ignore-placement"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = layoutProperties[@"icon-ignore-placement"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                }
                MGLStyleValue *iconIgnorePlacementValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeInterval cameraStops:stopsDict options:nil];
                [layer setIconIgnoresPlacement:iconIgnorePlacementValue];
            } else {
                MGLStyleValue *iconIgnorePlacementValue = [MGLStyleValue valueWithRawValue:layoutProperties[@"icon-ignore-placement"]];
                [layer setIconIgnoresPlacement:iconIgnorePlacementValue];
            }
        }
        if ([layoutProperties valueForKey:@"icon-optional"]) {
            if ([[layoutProperties valueForKey:@"icon-optional"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = layoutProperties[@"icon-optional"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                }
                MGLStyleValue *iconOptionalValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeInterval cameraStops:stopsDict options:nil];
                [layer setIconOptional:iconOptionalValue];
            } else {
                MGLStyleValue *iconOptionalValue = [MGLStyleValue valueWithRawValue:layoutProperties[@"icon-optional"]];
                [layer setIconOptional:iconOptionalValue];
            }
        }
        if ([layoutProperties valueForKey:@"icon-rotation-alignment"]) {
            // create the NSString -> enum dictionary for later use
            NSDictionary<NSString*, NSNumber *> *enumDictionary = @{
                @"map": @(MGLIconRotationAlignmentMap),
                @"viewport": @(MGLIconRotationAlignmentViewport),
                @"auto": @(MGLIconRotationAlignmentAuto),
            };
            if ([[layoutProperties valueForKey:@"icon-rotation-alignment"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = layoutProperties[@"icon-rotation-alignment"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    NSValue *value = [NSValue valueWithMGLIconRotationAlignment:enumDictionary[layoutProperties[@"icon-rotation-alignment"]].integerValue];
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:value] forKey:stop[0]];
                }
                MGLStyleValue *iconRotationAlignmentValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeInterval cameraStops:stopsDict options:nil];
                [layer setIconRotationAlignment:iconRotationAlignmentValue];
            } else {
                NSValue *value = [NSValue valueWithMGLIconRotationAlignment:enumDictionary[layoutProperties[@"icon-rotation-alignment"]].integerValue];
                MGLStyleValue *iconRotationAlignmentValue = [MGLStyleValue valueWithRawValue:value];
                [layer setIconRotationAlignment:iconRotationAlignmentValue];
            }
        }
        if ([layoutProperties valueForKey:@"icon-size"]) {
            if ([[layoutProperties valueForKey:@"icon-size"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = layoutProperties[@"icon-size"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                }
                NSMutableDictionary *optionsDict = [[NSMutableDictionary alloc] init];
                NSNumber *baseNumber = layoutProperties[@"icon-size"][@"base"];
                if (baseNumber) {
                    [optionsDict setObject:baseNumber forKey:MGLStyleFunctionOptionInterpolationBase];
                } else {
                    [optionsDict setObject:[NSNumber numberWithInt:1] forKey:MGLStyleFunctionOptionInterpolationBase];
                }
                MGLStyleValue *iconSizeValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeExponential cameraStops:stopsDict options:optionsDict];
                [layer setIconScale:iconSizeValue];
            } else {
                MGLStyleValue *iconSizeValue = [MGLStyleValue valueWithRawValue:layoutProperties[@"icon-size"]];
                [layer setIconScale:iconSizeValue];
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
            if ([[layoutProperties valueForKey:@"icon-text-fit"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = layoutProperties[@"icon-text-fit"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    NSValue *value = [NSValue valueWithMGLIconTextFit:enumDictionary[layoutProperties[@"icon-text-fit"]].integerValue];
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:value] forKey:stop[0]];
                }
                MGLStyleValue *iconTextFitValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeInterval cameraStops:stopsDict options:nil];
                [layer setIconTextFit:iconTextFitValue];
            } else {
                NSValue *value = [NSValue valueWithMGLIconTextFit:enumDictionary[layoutProperties[@"icon-text-fit"]].integerValue];
                MGLStyleValue *iconTextFitValue = [MGLStyleValue valueWithRawValue:value];
                [layer setIconTextFit:iconTextFitValue];
            }
        }
        if ([layoutProperties valueForKey:@"icon-text-fit-padding"]) {
            if ([[layoutProperties valueForKey:@"icon-text-fit-padding"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = layoutProperties[@"icon-text-fit-padding"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    NSArray *iconTextFitPaddingArray = stop[1];
                    UIEdgeInsets insets = UIEdgeInsetsMake([iconTextFitPaddingArray[0] floatValue], [iconTextFitPaddingArray[3] floatValue], [iconTextFitPaddingArray[2] floatValue], [iconTextFitPaddingArray[1] floatValue]);
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:[NSValue valueWithUIEdgeInsets:insets]] forKey:stop[0]];
                }
                NSMutableDictionary *optionsDict = [[NSMutableDictionary alloc] init];
                NSNumber *baseNumber = layoutProperties[@"icon-text-fit-padding"][@"base"];
                if (baseNumber) {
                    [optionsDict setObject:baseNumber forKey:MGLStyleFunctionOptionInterpolationBase];
                } else {
                    [optionsDict setObject:[NSNumber numberWithInt:1] forKey:MGLStyleFunctionOptionInterpolationBase];
                }
                MGLStyleValue *iconTextFitPaddingValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeExponential cameraStops:stopsDict options:optionsDict];
                [layer setIconTextFitPadding:iconTextFitPaddingValue];
            } else {
                NSArray *iconTextFitPaddingArray = layoutProperties[@"icon-text-fit-padding"];
                UIEdgeInsets insets = UIEdgeInsetsMake([iconTextFitPaddingArray[0] floatValue], [iconTextFitPaddingArray[3] floatValue], [iconTextFitPaddingArray[2] floatValue], [iconTextFitPaddingArray[1] floatValue]);
                MGLStyleValue *iconTextFitPaddingValue = [MGLStyleValue valueWithRawValue:[NSValue valueWithUIEdgeInsets:insets]];
                [layer setIconTextFitPadding:iconTextFitPaddingValue];
            }
        }
        if ([layoutProperties valueForKey:@"icon-image"]) {
            if ([[layoutProperties valueForKey:@"icon-image"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = layoutProperties[@"icon-image"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                }
                MGLStyleValue *iconImageValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeInterval cameraStops:stopsDict options:nil];
                [layer setIconImageName:iconImageValue];
            } else {
                MGLStyleValue *iconImageValue = [MGLStyleValue valueWithRawValue:layoutProperties[@"icon-image"]];
                [layer setIconImageName:iconImageValue];
            }
        }
        if ([layoutProperties valueForKey:@"icon-rotate"]) {
            if ([[layoutProperties valueForKey:@"icon-rotate"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = layoutProperties[@"icon-rotate"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                }
                NSMutableDictionary *optionsDict = [[NSMutableDictionary alloc] init];
                NSNumber *baseNumber = layoutProperties[@"icon-rotate"][@"base"];
                if (baseNumber) {
                    [optionsDict setObject:baseNumber forKey:MGLStyleFunctionOptionInterpolationBase];
                } else {
                    [optionsDict setObject:[NSNumber numberWithInt:1] forKey:MGLStyleFunctionOptionInterpolationBase];
                }
                MGLStyleValue *iconRotateValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeExponential cameraStops:stopsDict options:optionsDict];
                [layer setIconRotation:iconRotateValue];
            } else {
                MGLStyleValue *iconRotateValue = [MGLStyleValue valueWithRawValue:layoutProperties[@"icon-rotate"]];
                [layer setIconRotation:iconRotateValue];
            }
        }
        if ([layoutProperties valueForKey:@"icon-padding"]) {
            if ([[layoutProperties valueForKey:@"icon-padding"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = layoutProperties[@"icon-padding"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                }
                NSMutableDictionary *optionsDict = [[NSMutableDictionary alloc] init];
                NSNumber *baseNumber = layoutProperties[@"icon-padding"][@"base"];
                if (baseNumber) {
                    [optionsDict setObject:baseNumber forKey:MGLStyleFunctionOptionInterpolationBase];
                } else {
                    [optionsDict setObject:[NSNumber numberWithInt:1] forKey:MGLStyleFunctionOptionInterpolationBase];
                }
                MGLStyleValue *iconPaddingValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeExponential cameraStops:stopsDict options:optionsDict];
                [layer setIconPadding:iconPaddingValue];
            } else {
                MGLStyleValue *iconPaddingValue = [MGLStyleValue valueWithRawValue:layoutProperties[@"icon-padding"]];
                [layer setIconPadding:iconPaddingValue];
            }
        }
        if ([layoutProperties valueForKey:@"icon-keep-upright"]) {
            if ([[layoutProperties valueForKey:@"icon-keep-upright"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = layoutProperties[@"icon-keep-upright"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                }
                MGLStyleValue *iconKeepUprightValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeInterval cameraStops:stopsDict options:nil];
                [layer setKeepsIconUpright:iconKeepUprightValue];
            } else {
                MGLStyleValue *iconKeepUprightValue = [MGLStyleValue valueWithRawValue:layoutProperties[@"icon-keep-upright"]];
                [layer setKeepsIconUpright:iconKeepUprightValue];
            }
        }
        if ([layoutProperties valueForKey:@"icon-offset"]) {
            if ([[layoutProperties valueForKey:@"icon-offset"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = layoutProperties[@"icon-offset"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    CGVector vector = CGVectorMake([stop[1][0] floatValue], [stop[1][1] floatValue]);
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:[NSValue valueWithCGVector:vector]] forKey:stop[0]];
                }
                NSMutableDictionary *optionsDict = [[NSMutableDictionary alloc] init];
                NSNumber *baseNumber = layoutProperties[@"icon-offset"][@"base"];
                if (baseNumber) {
                    [optionsDict setObject:baseNumber forKey:MGLStyleFunctionOptionInterpolationBase];
                } else {
                    [optionsDict setObject:[NSNumber numberWithInt:1] forKey:MGLStyleFunctionOptionInterpolationBase];
                }
                MGLStyleValue *iconOffsetValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeExponential cameraStops:stopsDict options:optionsDict];
                [layer setIconOffset:iconOffsetValue];
            } else {
                CGVector vector = CGVectorMake([layoutProperties[@"icon-offset"][0] floatValue], [layoutProperties[@"icon-offset"][1] floatValue]);
                MGLStyleValue *iconOffsetValue = [MGLStyleValue valueWithRawValue:[NSValue valueWithCGVector:vector]];
                [layer setIconOffset:iconOffsetValue];
            }
        }
        if ([layoutProperties valueForKey:@"text-pitch-alignment"]) {
            // create the NSString -> enum dictionary for later use
            NSDictionary<NSString*, NSNumber *> *enumDictionary = @{
                @"map": @(MGLTextPitchAlignmentMap),
                @"viewport": @(MGLTextPitchAlignmentViewport),
                @"auto": @(MGLTextPitchAlignmentAuto),
            };
            if ([[layoutProperties valueForKey:@"text-pitch-alignment"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = layoutProperties[@"text-pitch-alignment"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    NSValue *value = [NSValue valueWithMGLTextPitchAlignment:enumDictionary[layoutProperties[@"text-pitch-alignment"]].integerValue];
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:value] forKey:stop[0]];
                }
                MGLStyleValue *textPitchAlignmentValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeInterval cameraStops:stopsDict options:nil];
                [layer setTextPitchAlignment:textPitchAlignmentValue];
            } else {
                NSValue *value = [NSValue valueWithMGLTextPitchAlignment:enumDictionary[layoutProperties[@"text-pitch-alignment"]].integerValue];
                MGLStyleValue *textPitchAlignmentValue = [MGLStyleValue valueWithRawValue:value];
                [layer setTextPitchAlignment:textPitchAlignmentValue];
            }
        }
        if ([layoutProperties valueForKey:@"text-rotation-alignment"]) {
            // create the NSString -> enum dictionary for later use
            NSDictionary<NSString*, NSNumber *> *enumDictionary = @{
                @"map": @(MGLTextRotationAlignmentMap),
                @"viewport": @(MGLTextRotationAlignmentViewport),
                @"auto": @(MGLTextRotationAlignmentAuto),
            };
            if ([[layoutProperties valueForKey:@"text-rotation-alignment"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = layoutProperties[@"text-rotation-alignment"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    NSValue *value = [NSValue valueWithMGLTextRotationAlignment:enumDictionary[layoutProperties[@"text-rotation-alignment"]].integerValue];
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:value] forKey:stop[0]];
                }
                MGLStyleValue *textRotationAlignmentValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeInterval cameraStops:stopsDict options:nil];
                [layer setTextRotationAlignment:textRotationAlignmentValue];
            } else {
                NSValue *value = [NSValue valueWithMGLTextRotationAlignment:enumDictionary[layoutProperties[@"text-rotation-alignment"]].integerValue];
                MGLStyleValue *textRotationAlignmentValue = [MGLStyleValue valueWithRawValue:value];
                [layer setTextRotationAlignment:textRotationAlignmentValue];
            }
        }
        if ([layoutProperties valueForKey:@"text-field"]) {
            if ([[layoutProperties valueForKey:@"text-field"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = layoutProperties[@"text-field"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                }
                MGLStyleValue *textFieldValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeInterval cameraStops:stopsDict options:nil];
                [layer setText:textFieldValue];
            } else {
                MGLStyleValue *textFieldValue = [MGLStyleValue valueWithRawValue:layoutProperties[@"text-field"]];
                [layer setText:textFieldValue];
            }
        }
        if ([layoutProperties valueForKey:@"text-font"]) {
            if ([[layoutProperties valueForKey:@"text-font"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = layoutProperties[@"text-font"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                }
                MGLStyleValue *textFontValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeInterval cameraStops:stopsDict options:nil];
                [layer setTextFontNames:textFontValue];
            } else {
                MGLStyleValue *textFontValue = [MGLStyleValue valueWithRawValue:layoutProperties[@"text-font"]];
                [layer setTextFontNames:textFontValue];
            }
        }
        if ([layoutProperties valueForKey:@"text-size"]) {
            if ([[layoutProperties valueForKey:@"text-size"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = layoutProperties[@"text-size"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                }
                NSMutableDictionary *optionsDict = [[NSMutableDictionary alloc] init];
                NSNumber *baseNumber = layoutProperties[@"text-size"][@"base"];
                if (baseNumber) {
                    [optionsDict setObject:baseNumber forKey:MGLStyleFunctionOptionInterpolationBase];
                } else {
                    [optionsDict setObject:[NSNumber numberWithInt:1] forKey:MGLStyleFunctionOptionInterpolationBase];
                }
                MGLStyleValue *textSizeValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeExponential cameraStops:stopsDict options:optionsDict];
                [layer setTextFontSize:textSizeValue];
            } else {
                MGLStyleValue *textSizeValue = [MGLStyleValue valueWithRawValue:layoutProperties[@"text-size"]];
                [layer setTextFontSize:textSizeValue];
            }
        }
        if ([layoutProperties valueForKey:@"text-max-width"]) {
            if ([[layoutProperties valueForKey:@"text-max-width"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = layoutProperties[@"text-max-width"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                }
                NSMutableDictionary *optionsDict = [[NSMutableDictionary alloc] init];
                NSNumber *baseNumber = layoutProperties[@"text-max-width"][@"base"];
                if (baseNumber) {
                    [optionsDict setObject:baseNumber forKey:MGLStyleFunctionOptionInterpolationBase];
                } else {
                    [optionsDict setObject:[NSNumber numberWithInt:1] forKey:MGLStyleFunctionOptionInterpolationBase];
                }
                MGLStyleValue *textMaxWidthValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeExponential cameraStops:stopsDict options:optionsDict];
                [layer setMaximumTextWidth:textMaxWidthValue];
            } else {
                MGLStyleValue *textMaxWidthValue = [MGLStyleValue valueWithRawValue:layoutProperties[@"text-max-width"]];
                [layer setMaximumTextWidth:textMaxWidthValue];
            }
        }
        if ([layoutProperties valueForKey:@"text-line-height"]) {
            if ([[layoutProperties valueForKey:@"text-line-height"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = layoutProperties[@"text-line-height"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                }
                NSMutableDictionary *optionsDict = [[NSMutableDictionary alloc] init];
                NSNumber *baseNumber = layoutProperties[@"text-line-height"][@"base"];
                if (baseNumber) {
                    [optionsDict setObject:baseNumber forKey:MGLStyleFunctionOptionInterpolationBase];
                } else {
                    [optionsDict setObject:[NSNumber numberWithInt:1] forKey:MGLStyleFunctionOptionInterpolationBase];
                }
                MGLStyleValue *textLineHeightValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeExponential cameraStops:stopsDict options:optionsDict];
                [layer setTextLineHeight:textLineHeightValue];
            } else {
                MGLStyleValue *textLineHeightValue = [MGLStyleValue valueWithRawValue:layoutProperties[@"text-line-height"]];
                [layer setTextLineHeight:textLineHeightValue];
            }
        }
        if ([layoutProperties valueForKey:@"text-letter-spacing"]) {
            if ([[layoutProperties valueForKey:@"text-letter-spacing"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = layoutProperties[@"text-letter-spacing"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                }
                NSMutableDictionary *optionsDict = [[NSMutableDictionary alloc] init];
                NSNumber *baseNumber = layoutProperties[@"text-letter-spacing"][@"base"];
                if (baseNumber) {
                    [optionsDict setObject:baseNumber forKey:MGLStyleFunctionOptionInterpolationBase];
                } else {
                    [optionsDict setObject:[NSNumber numberWithInt:1] forKey:MGLStyleFunctionOptionInterpolationBase];
                }
                MGLStyleValue *textLetterSpacingValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeExponential cameraStops:stopsDict options:optionsDict];
                [layer setTextLetterSpacing:textLetterSpacingValue];
            } else {
                MGLStyleValue *textLetterSpacingValue = [MGLStyleValue valueWithRawValue:layoutProperties[@"text-letter-spacing"]];
                [layer setTextLetterSpacing:textLetterSpacingValue];
            }
        }
        if ([layoutProperties valueForKey:@"text-justify"]) {
            // create the NSString -> enum dictionary for later use
            NSDictionary<NSString*, NSNumber *> *enumDictionary = @{
                @"left": @(MGLTextJustificationLeft),
                @"center": @(MGLTextJustificationCenter),
                @"right": @(MGLTextJustificationRight),
            };
            if ([[layoutProperties valueForKey:@"text-justify"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = layoutProperties[@"text-justify"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    NSValue *value = [NSValue valueWithMGLTextJustification:enumDictionary[layoutProperties[@"text-justify"]].integerValue];
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:value] forKey:stop[0]];
                }
                MGLStyleValue *textJustifyValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeInterval cameraStops:stopsDict options:nil];
                [layer setTextJustification:textJustifyValue];
            } else {
                NSValue *value = [NSValue valueWithMGLTextJustification:enumDictionary[layoutProperties[@"text-justify"]].integerValue];
                MGLStyleValue *textJustifyValue = [MGLStyleValue valueWithRawValue:value];
                [layer setTextJustification:textJustifyValue];
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
            if ([[layoutProperties valueForKey:@"text-anchor"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = layoutProperties[@"text-anchor"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    NSValue *value = [NSValue valueWithMGLTextAnchor:enumDictionary[layoutProperties[@"text-anchor"]].integerValue];
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:value] forKey:stop[0]];
                }
                MGLStyleValue *textAnchorValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeInterval cameraStops:stopsDict options:nil];
                [layer setTextAnchor:textAnchorValue];
            } else {
                NSValue *value = [NSValue valueWithMGLTextAnchor:enumDictionary[layoutProperties[@"text-anchor"]].integerValue];
                MGLStyleValue *textAnchorValue = [MGLStyleValue valueWithRawValue:value];
                [layer setTextAnchor:textAnchorValue];
            }
        }
        if ([layoutProperties valueForKey:@"text-max-angle"]) {
            if ([[layoutProperties valueForKey:@"text-max-angle"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = layoutProperties[@"text-max-angle"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                }
                NSMutableDictionary *optionsDict = [[NSMutableDictionary alloc] init];
                NSNumber *baseNumber = layoutProperties[@"text-max-angle"][@"base"];
                if (baseNumber) {
                    [optionsDict setObject:baseNumber forKey:MGLStyleFunctionOptionInterpolationBase];
                } else {
                    [optionsDict setObject:[NSNumber numberWithInt:1] forKey:MGLStyleFunctionOptionInterpolationBase];
                }
                MGLStyleValue *textMaxAngleValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeExponential cameraStops:stopsDict options:optionsDict];
                [layer setMaximumTextAngle:textMaxAngleValue];
            } else {
                MGLStyleValue *textMaxAngleValue = [MGLStyleValue valueWithRawValue:layoutProperties[@"text-max-angle"]];
                [layer setMaximumTextAngle:textMaxAngleValue];
            }
        }
        if ([layoutProperties valueForKey:@"text-rotate"]) {
            if ([[layoutProperties valueForKey:@"text-rotate"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = layoutProperties[@"text-rotate"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                }
                NSMutableDictionary *optionsDict = [[NSMutableDictionary alloc] init];
                NSNumber *baseNumber = layoutProperties[@"text-rotate"][@"base"];
                if (baseNumber) {
                    [optionsDict setObject:baseNumber forKey:MGLStyleFunctionOptionInterpolationBase];
                } else {
                    [optionsDict setObject:[NSNumber numberWithInt:1] forKey:MGLStyleFunctionOptionInterpolationBase];
                }
                MGLStyleValue *textRotateValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeExponential cameraStops:stopsDict options:optionsDict];
                [layer setTextRotation:textRotateValue];
            } else {
                MGLStyleValue *textRotateValue = [MGLStyleValue valueWithRawValue:layoutProperties[@"text-rotate"]];
                [layer setTextRotation:textRotateValue];
            }
        }
        if ([layoutProperties valueForKey:@"text-padding"]) {
            if ([[layoutProperties valueForKey:@"text-padding"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = layoutProperties[@"text-padding"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                }
                NSMutableDictionary *optionsDict = [[NSMutableDictionary alloc] init];
                NSNumber *baseNumber = layoutProperties[@"text-padding"][@"base"];
                if (baseNumber) {
                    [optionsDict setObject:baseNumber forKey:MGLStyleFunctionOptionInterpolationBase];
                } else {
                    [optionsDict setObject:[NSNumber numberWithInt:1] forKey:MGLStyleFunctionOptionInterpolationBase];
                }
                MGLStyleValue *textPaddingValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeExponential cameraStops:stopsDict options:optionsDict];
                [layer setTextPadding:textPaddingValue];
            } else {
                MGLStyleValue *textPaddingValue = [MGLStyleValue valueWithRawValue:layoutProperties[@"text-padding"]];
                [layer setTextPadding:textPaddingValue];
            }
        }
        if ([layoutProperties valueForKey:@"text-keep-upright"]) {
            if ([[layoutProperties valueForKey:@"text-keep-upright"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = layoutProperties[@"text-keep-upright"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                }
                MGLStyleValue *textKeepUprightValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeInterval cameraStops:stopsDict options:nil];
                [layer setKeepsTextUpright:textKeepUprightValue];
            } else {
                MGLStyleValue *textKeepUprightValue = [MGLStyleValue valueWithRawValue:layoutProperties[@"text-keep-upright"]];
                [layer setKeepsTextUpright:textKeepUprightValue];
            }
        }
        if ([layoutProperties valueForKey:@"text-transform"]) {
            // create the NSString -> enum dictionary for later use
            NSDictionary<NSString*, NSNumber *> *enumDictionary = @{
                @"none": @(MGLTextTransformNone),
                @"uppercase": @(MGLTextTransformUppercase),
                @"lowercase": @(MGLTextTransformLowercase),
            };
            if ([[layoutProperties valueForKey:@"text-transform"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = layoutProperties[@"text-transform"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    NSValue *value = [NSValue valueWithMGLTextTransform:enumDictionary[layoutProperties[@"text-transform"]].integerValue];
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:value] forKey:stop[0]];
                }
                MGLStyleValue *textTransformValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeInterval cameraStops:stopsDict options:nil];
                [layer setTextTransform:textTransformValue];
            } else {
                NSValue *value = [NSValue valueWithMGLTextTransform:enumDictionary[layoutProperties[@"text-transform"]].integerValue];
                MGLStyleValue *textTransformValue = [MGLStyleValue valueWithRawValue:value];
                [layer setTextTransform:textTransformValue];
            }
        }
        if ([layoutProperties valueForKey:@"text-offset"]) {
            if ([[layoutProperties valueForKey:@"text-offset"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = layoutProperties[@"text-offset"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    CGVector vector = CGVectorMake([stop[1][0] floatValue], [stop[1][1] floatValue]);
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:[NSValue valueWithCGVector:vector]] forKey:stop[0]];
                }
                NSMutableDictionary *optionsDict = [[NSMutableDictionary alloc] init];
                NSNumber *baseNumber = layoutProperties[@"text-offset"][@"base"];
                if (baseNumber) {
                    [optionsDict setObject:baseNumber forKey:MGLStyleFunctionOptionInterpolationBase];
                } else {
                    [optionsDict setObject:[NSNumber numberWithInt:1] forKey:MGLStyleFunctionOptionInterpolationBase];
                }
                MGLStyleValue *textOffsetValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeExponential cameraStops:stopsDict options:optionsDict];
                [layer setTextOffset:textOffsetValue];
            } else {
                CGVector vector = CGVectorMake([layoutProperties[@"text-offset"][0] floatValue], [layoutProperties[@"text-offset"][1] floatValue]);
                MGLStyleValue *textOffsetValue = [MGLStyleValue valueWithRawValue:[NSValue valueWithCGVector:vector]];
                [layer setTextOffset:textOffsetValue];
            }
        }
        if ([layoutProperties valueForKey:@"text-allow-overlap"]) {
            if ([[layoutProperties valueForKey:@"text-allow-overlap"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = layoutProperties[@"text-allow-overlap"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                }
                MGLStyleValue *textAllowOverlapValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeInterval cameraStops:stopsDict options:nil];
                [layer setTextAllowsOverlap:textAllowOverlapValue];
            } else {
                MGLStyleValue *textAllowOverlapValue = [MGLStyleValue valueWithRawValue:layoutProperties[@"text-allow-overlap"]];
                [layer setTextAllowsOverlap:textAllowOverlapValue];
            }
        }
        if ([layoutProperties valueForKey:@"text-ignore-placement"]) {
            if ([[layoutProperties valueForKey:@"text-ignore-placement"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = layoutProperties[@"text-ignore-placement"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                }
                MGLStyleValue *textIgnorePlacementValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeInterval cameraStops:stopsDict options:nil];
                [layer setTextIgnoresPlacement:textIgnorePlacementValue];
            } else {
                MGLStyleValue *textIgnorePlacementValue = [MGLStyleValue valueWithRawValue:layoutProperties[@"text-ignore-placement"]];
                [layer setTextIgnoresPlacement:textIgnorePlacementValue];
            }
        }
        if ([layoutProperties valueForKey:@"text-optional"]) {
            if ([[layoutProperties valueForKey:@"text-optional"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = layoutProperties[@"text-optional"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                }
                MGLStyleValue *textOptionalValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeInterval cameraStops:stopsDict options:nil];
                [layer setTextOptional:textOptionalValue];
            } else {
                MGLStyleValue *textOptionalValue = [MGLStyleValue valueWithRawValue:layoutProperties[@"text-optional"]];
                [layer setTextOptional:textOptionalValue];
            }
        }
        if ([paintProperties valueForKey:@"icon-opacity"]) {
            if ([[paintProperties valueForKey:@"icon-opacity"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"icon-opacity"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                }
                NSMutableDictionary *optionsDict = [[NSMutableDictionary alloc] init];
                NSNumber *baseNumber = paintProperties[@"icon-opacity"][@"base"];
                if (baseNumber) {
                    [optionsDict setObject:baseNumber forKey:MGLStyleFunctionOptionInterpolationBase];
                } else {
                    [optionsDict setObject:[NSNumber numberWithInt:1] forKey:MGLStyleFunctionOptionInterpolationBase];
                }
                MGLStyleValue *iconOpacityValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeExponential cameraStops:stopsDict options:optionsDict];
                [layer setIconOpacity:iconOpacityValue];
            } else {
                MGLStyleValue *iconOpacityValue = [MGLStyleValue valueWithRawValue:paintProperties[@"icon-opacity"]];
                [layer setIconOpacity:iconOpacityValue];
            }
        }
        if ([paintProperties valueForKey:@"icon-color"]) {
            if ([[paintProperties valueForKey:@"icon-color"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"icon-color"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:[UIColor colorWithString:stop[1]]] forKey:stop[0]];
                }
                NSMutableDictionary *optionsDict = [[NSMutableDictionary alloc] init];
                NSNumber *baseNumber = paintProperties[@"icon-color"][@"base"];
                if (baseNumber) {
                    [optionsDict setObject:baseNumber forKey:MGLStyleFunctionOptionInterpolationBase];
                } else {
                    [optionsDict setObject:[NSNumber numberWithInt:1] forKey:MGLStyleFunctionOptionInterpolationBase];
                }
                MGLStyleValue *iconColorValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeExponential cameraStops:stopsDict options:optionsDict];
                [layer setIconColor:iconColorValue];
            } else {
                UIColor *color = [UIColor colorWithString:paintProperties[@"icon-color"]];
                MGLStyleValue *iconColorValue = [MGLStyleValue valueWithRawValue:color];
                [layer setIconColor:iconColorValue];
            }
        }
        if ([paintProperties valueForKey:@"icon-halo-color"]) {
            if ([[paintProperties valueForKey:@"icon-halo-color"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"icon-halo-color"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:[UIColor colorWithString:stop[1]]] forKey:stop[0]];
                }
                NSMutableDictionary *optionsDict = [[NSMutableDictionary alloc] init];
                NSNumber *baseNumber = paintProperties[@"icon-halo-color"][@"base"];
                if (baseNumber) {
                    [optionsDict setObject:baseNumber forKey:MGLStyleFunctionOptionInterpolationBase];
                } else {
                    [optionsDict setObject:[NSNumber numberWithInt:1] forKey:MGLStyleFunctionOptionInterpolationBase];
                }
                MGLStyleValue *iconHaloColorValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeExponential cameraStops:stopsDict options:optionsDict];
                [layer setIconHaloColor:iconHaloColorValue];
            } else {
                UIColor *color = [UIColor colorWithString:paintProperties[@"icon-halo-color"]];
                MGLStyleValue *iconHaloColorValue = [MGLStyleValue valueWithRawValue:color];
                [layer setIconHaloColor:iconHaloColorValue];
            }
        }
        if ([paintProperties valueForKey:@"icon-halo-width"]) {
            if ([[paintProperties valueForKey:@"icon-halo-width"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"icon-halo-width"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                }
                NSMutableDictionary *optionsDict = [[NSMutableDictionary alloc] init];
                NSNumber *baseNumber = paintProperties[@"icon-halo-width"][@"base"];
                if (baseNumber) {
                    [optionsDict setObject:baseNumber forKey:MGLStyleFunctionOptionInterpolationBase];
                } else {
                    [optionsDict setObject:[NSNumber numberWithInt:1] forKey:MGLStyleFunctionOptionInterpolationBase];
                }
                MGLStyleValue *iconHaloWidthValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeExponential cameraStops:stopsDict options:optionsDict];
                [layer setIconHaloWidth:iconHaloWidthValue];
            } else {
                MGLStyleValue *iconHaloWidthValue = [MGLStyleValue valueWithRawValue:paintProperties[@"icon-halo-width"]];
                [layer setIconHaloWidth:iconHaloWidthValue];
            }
        }
        if ([paintProperties valueForKey:@"icon-halo-blur"]) {
            if ([[paintProperties valueForKey:@"icon-halo-blur"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"icon-halo-blur"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                }
                NSMutableDictionary *optionsDict = [[NSMutableDictionary alloc] init];
                NSNumber *baseNumber = paintProperties[@"icon-halo-blur"][@"base"];
                if (baseNumber) {
                    [optionsDict setObject:baseNumber forKey:MGLStyleFunctionOptionInterpolationBase];
                } else {
                    [optionsDict setObject:[NSNumber numberWithInt:1] forKey:MGLStyleFunctionOptionInterpolationBase];
                }
                MGLStyleValue *iconHaloBlurValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeExponential cameraStops:stopsDict options:optionsDict];
                [layer setIconHaloBlur:iconHaloBlurValue];
            } else {
                MGLStyleValue *iconHaloBlurValue = [MGLStyleValue valueWithRawValue:paintProperties[@"icon-halo-blur"]];
                [layer setIconHaloBlur:iconHaloBlurValue];
            }
        }
        if ([paintProperties valueForKey:@"icon-translate"]) {
            if ([[paintProperties valueForKey:@"icon-translate"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"icon-translate"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    CGVector vector = CGVectorMake([stop[1][0] floatValue], [stop[1][1] floatValue]);
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:[NSValue valueWithCGVector:vector]] forKey:stop[0]];
                }
                NSMutableDictionary *optionsDict = [[NSMutableDictionary alloc] init];
                NSNumber *baseNumber = paintProperties[@"icon-translate"][@"base"];
                if (baseNumber) {
                    [optionsDict setObject:baseNumber forKey:MGLStyleFunctionOptionInterpolationBase];
                } else {
                    [optionsDict setObject:[NSNumber numberWithInt:1] forKey:MGLStyleFunctionOptionInterpolationBase];
                }
                MGLStyleValue *iconTranslateValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeExponential cameraStops:stopsDict options:optionsDict];
                [layer setIconTranslation:iconTranslateValue];
            } else {
                CGVector vector = CGVectorMake([paintProperties[@"icon-translate"][0] floatValue], [paintProperties[@"icon-translate"][1] floatValue]);
                MGLStyleValue *iconTranslateValue = [MGLStyleValue valueWithRawValue:[NSValue valueWithCGVector:vector]];
                [layer setIconTranslation:iconTranslateValue];
            }
        }
        if ([paintProperties valueForKey:@"icon-translate-anchor"]) {
            // create the NSString -> enum dictionary for later use
            NSDictionary<NSString*, NSNumber *> *enumDictionary = @{
                @"map": @(MGLIconTranslationAnchorMap),
                @"viewport": @(MGLIconTranslationAnchorViewport),
            };
            if ([[paintProperties valueForKey:@"icon-translate-anchor"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"icon-translate-anchor"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    NSValue *value = [NSValue valueWithMGLIconTranslationAnchor:enumDictionary[paintProperties[@"icon-translate-anchor"]].integerValue];
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:value] forKey:stop[0]];
                }
                MGLStyleValue *iconTranslateAnchorValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeInterval cameraStops:stopsDict options:nil];
                [layer setIconTranslationAnchor:iconTranslateAnchorValue];
            } else {
                NSValue *value = [NSValue valueWithMGLIconTranslationAnchor:enumDictionary[paintProperties[@"icon-translate-anchor"]].integerValue];
                MGLStyleValue *iconTranslateAnchorValue = [MGLStyleValue valueWithRawValue:value];
                [layer setIconTranslationAnchor:iconTranslateAnchorValue];
            }
        }
        if ([paintProperties valueForKey:@"text-opacity"]) {
            if ([[paintProperties valueForKey:@"text-opacity"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"text-opacity"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                }
                NSMutableDictionary *optionsDict = [[NSMutableDictionary alloc] init];
                NSNumber *baseNumber = paintProperties[@"text-opacity"][@"base"];
                if (baseNumber) {
                    [optionsDict setObject:baseNumber forKey:MGLStyleFunctionOptionInterpolationBase];
                } else {
                    [optionsDict setObject:[NSNumber numberWithInt:1] forKey:MGLStyleFunctionOptionInterpolationBase];
                }
                MGLStyleValue *textOpacityValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeExponential cameraStops:stopsDict options:optionsDict];
                [layer setTextOpacity:textOpacityValue];
            } else {
                MGLStyleValue *textOpacityValue = [MGLStyleValue valueWithRawValue:paintProperties[@"text-opacity"]];
                [layer setTextOpacity:textOpacityValue];
            }
        }
        if ([paintProperties valueForKey:@"text-color"]) {
            if ([[paintProperties valueForKey:@"text-color"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"text-color"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:[UIColor colorWithString:stop[1]]] forKey:stop[0]];
                }
                NSMutableDictionary *optionsDict = [[NSMutableDictionary alloc] init];
                NSNumber *baseNumber = paintProperties[@"text-color"][@"base"];
                if (baseNumber) {
                    [optionsDict setObject:baseNumber forKey:MGLStyleFunctionOptionInterpolationBase];
                } else {
                    [optionsDict setObject:[NSNumber numberWithInt:1] forKey:MGLStyleFunctionOptionInterpolationBase];
                }
                MGLStyleValue *textColorValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeExponential cameraStops:stopsDict options:optionsDict];
                [layer setTextColor:textColorValue];
            } else {
                UIColor *color = [UIColor colorWithString:paintProperties[@"text-color"]];
                MGLStyleValue *textColorValue = [MGLStyleValue valueWithRawValue:color];
                [layer setTextColor:textColorValue];
            }
        }
        if ([paintProperties valueForKey:@"text-halo-color"]) {
            if ([[paintProperties valueForKey:@"text-halo-color"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"text-halo-color"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:[UIColor colorWithString:stop[1]]] forKey:stop[0]];
                }
                NSMutableDictionary *optionsDict = [[NSMutableDictionary alloc] init];
                NSNumber *baseNumber = paintProperties[@"text-halo-color"][@"base"];
                if (baseNumber) {
                    [optionsDict setObject:baseNumber forKey:MGLStyleFunctionOptionInterpolationBase];
                } else {
                    [optionsDict setObject:[NSNumber numberWithInt:1] forKey:MGLStyleFunctionOptionInterpolationBase];
                }
                MGLStyleValue *textHaloColorValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeExponential cameraStops:stopsDict options:optionsDict];
                [layer setTextHaloColor:textHaloColorValue];
            } else {
                UIColor *color = [UIColor colorWithString:paintProperties[@"text-halo-color"]];
                MGLStyleValue *textHaloColorValue = [MGLStyleValue valueWithRawValue:color];
                [layer setTextHaloColor:textHaloColorValue];
            }
        }
        if ([paintProperties valueForKey:@"text-halo-width"]) {
            if ([[paintProperties valueForKey:@"text-halo-width"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"text-halo-width"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                }
                NSMutableDictionary *optionsDict = [[NSMutableDictionary alloc] init];
                NSNumber *baseNumber = paintProperties[@"text-halo-width"][@"base"];
                if (baseNumber) {
                    [optionsDict setObject:baseNumber forKey:MGLStyleFunctionOptionInterpolationBase];
                } else {
                    [optionsDict setObject:[NSNumber numberWithInt:1] forKey:MGLStyleFunctionOptionInterpolationBase];
                }
                MGLStyleValue *textHaloWidthValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeExponential cameraStops:stopsDict options:optionsDict];
                [layer setTextHaloWidth:textHaloWidthValue];
            } else {
                MGLStyleValue *textHaloWidthValue = [MGLStyleValue valueWithRawValue:paintProperties[@"text-halo-width"]];
                [layer setTextHaloWidth:textHaloWidthValue];
            }
        }
        if ([paintProperties valueForKey:@"text-halo-blur"]) {
            if ([[paintProperties valueForKey:@"text-halo-blur"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"text-halo-blur"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                }
                NSMutableDictionary *optionsDict = [[NSMutableDictionary alloc] init];
                NSNumber *baseNumber = paintProperties[@"text-halo-blur"][@"base"];
                if (baseNumber) {
                    [optionsDict setObject:baseNumber forKey:MGLStyleFunctionOptionInterpolationBase];
                } else {
                    [optionsDict setObject:[NSNumber numberWithInt:1] forKey:MGLStyleFunctionOptionInterpolationBase];
                }
                MGLStyleValue *textHaloBlurValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeExponential cameraStops:stopsDict options:optionsDict];
                [layer setTextHaloBlur:textHaloBlurValue];
            } else {
                MGLStyleValue *textHaloBlurValue = [MGLStyleValue valueWithRawValue:paintProperties[@"text-halo-blur"]];
                [layer setTextHaloBlur:textHaloBlurValue];
            }
        }
        if ([paintProperties valueForKey:@"text-translate"]) {
            if ([[paintProperties valueForKey:@"text-translate"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"text-translate"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    CGVector vector = CGVectorMake([stop[1][0] floatValue], [stop[1][1] floatValue]);
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:[NSValue valueWithCGVector:vector]] forKey:stop[0]];
                }
                NSMutableDictionary *optionsDict = [[NSMutableDictionary alloc] init];
                NSNumber *baseNumber = paintProperties[@"text-translate"][@"base"];
                if (baseNumber) {
                    [optionsDict setObject:baseNumber forKey:MGLStyleFunctionOptionInterpolationBase];
                } else {
                    [optionsDict setObject:[NSNumber numberWithInt:1] forKey:MGLStyleFunctionOptionInterpolationBase];
                }
                MGLStyleValue *textTranslateValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeExponential cameraStops:stopsDict options:optionsDict];
                [layer setTextTranslation:textTranslateValue];
            } else {
                CGVector vector = CGVectorMake([paintProperties[@"text-translate"][0] floatValue], [paintProperties[@"text-translate"][1] floatValue]);
                MGLStyleValue *textTranslateValue = [MGLStyleValue valueWithRawValue:[NSValue valueWithCGVector:vector]];
                [layer setTextTranslation:textTranslateValue];
            }
        }
        if ([paintProperties valueForKey:@"text-translate-anchor"]) {
            // create the NSString -> enum dictionary for later use
            NSDictionary<NSString*, NSNumber *> *enumDictionary = @{
                @"map": @(MGLTextTranslationAnchorMap),
                @"viewport": @(MGLTextTranslationAnchorViewport),
            };
            if ([[paintProperties valueForKey:@"text-translate-anchor"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"text-translate-anchor"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    NSValue *value = [NSValue valueWithMGLTextTranslationAnchor:enumDictionary[paintProperties[@"text-translate-anchor"]].integerValue];
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:value] forKey:stop[0]];
                }
                MGLStyleValue *textTranslateAnchorValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeInterval cameraStops:stopsDict options:nil];
                [layer setTextTranslationAnchor:textTranslateAnchorValue];
            } else {
                NSValue *value = [NSValue valueWithMGLTextTranslationAnchor:enumDictionary[paintProperties[@"text-translate-anchor"]].integerValue];
                MGLStyleValue *textTranslateAnchorValue = [MGLStyleValue valueWithRawValue:value];
                [layer setTextTranslationAnchor:textTranslateAnchorValue];
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
            if ([[paintProperties valueForKey:@"circle-radius"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"circle-radius"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                }
                NSMutableDictionary *optionsDict = [[NSMutableDictionary alloc] init];
                NSNumber *baseNumber = paintProperties[@"circle-radius"][@"base"];
                if (baseNumber) {
                    [optionsDict setObject:baseNumber forKey:MGLStyleFunctionOptionInterpolationBase];
                } else {
                    [optionsDict setObject:[NSNumber numberWithInt:1] forKey:MGLStyleFunctionOptionInterpolationBase];
                }
                MGLStyleValue *circleRadiusValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeExponential cameraStops:stopsDict options:optionsDict];
                [layer setCircleRadius:circleRadiusValue];
            } else {
                MGLStyleValue *circleRadiusValue = [MGLStyleValue valueWithRawValue:paintProperties[@"circle-radius"]];
                [layer setCircleRadius:circleRadiusValue];
            }
        }
        if ([paintProperties valueForKey:@"circle-color"]) {
            if ([[paintProperties valueForKey:@"circle-color"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"circle-color"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:[UIColor colorWithString:stop[1]]] forKey:stop[0]];
                }
                NSMutableDictionary *optionsDict = [[NSMutableDictionary alloc] init];
                NSNumber *baseNumber = paintProperties[@"circle-color"][@"base"];
                if (baseNumber) {
                    [optionsDict setObject:baseNumber forKey:MGLStyleFunctionOptionInterpolationBase];
                } else {
                    [optionsDict setObject:[NSNumber numberWithInt:1] forKey:MGLStyleFunctionOptionInterpolationBase];
                }
                MGLStyleValue *circleColorValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeExponential cameraStops:stopsDict options:optionsDict];
                [layer setCircleColor:circleColorValue];
            } else {
                UIColor *color = [UIColor colorWithString:paintProperties[@"circle-color"]];
                MGLStyleValue *circleColorValue = [MGLStyleValue valueWithRawValue:color];
                [layer setCircleColor:circleColorValue];
            }
        }
        if ([paintProperties valueForKey:@"circle-blur"]) {
            if ([[paintProperties valueForKey:@"circle-blur"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"circle-blur"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                }
                NSMutableDictionary *optionsDict = [[NSMutableDictionary alloc] init];
                NSNumber *baseNumber = paintProperties[@"circle-blur"][@"base"];
                if (baseNumber) {
                    [optionsDict setObject:baseNumber forKey:MGLStyleFunctionOptionInterpolationBase];
                } else {
                    [optionsDict setObject:[NSNumber numberWithInt:1] forKey:MGLStyleFunctionOptionInterpolationBase];
                }
                MGLStyleValue *circleBlurValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeExponential cameraStops:stopsDict options:optionsDict];
                [layer setCircleBlur:circleBlurValue];
            } else {
                MGLStyleValue *circleBlurValue = [MGLStyleValue valueWithRawValue:paintProperties[@"circle-blur"]];
                [layer setCircleBlur:circleBlurValue];
            }
        }
        if ([paintProperties valueForKey:@"circle-opacity"]) {
            if ([[paintProperties valueForKey:@"circle-opacity"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"circle-opacity"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                }
                NSMutableDictionary *optionsDict = [[NSMutableDictionary alloc] init];
                NSNumber *baseNumber = paintProperties[@"circle-opacity"][@"base"];
                if (baseNumber) {
                    [optionsDict setObject:baseNumber forKey:MGLStyleFunctionOptionInterpolationBase];
                } else {
                    [optionsDict setObject:[NSNumber numberWithInt:1] forKey:MGLStyleFunctionOptionInterpolationBase];
                }
                MGLStyleValue *circleOpacityValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeExponential cameraStops:stopsDict options:optionsDict];
                [layer setCircleOpacity:circleOpacityValue];
            } else {
                MGLStyleValue *circleOpacityValue = [MGLStyleValue valueWithRawValue:paintProperties[@"circle-opacity"]];
                [layer setCircleOpacity:circleOpacityValue];
            }
        }
        if ([paintProperties valueForKey:@"circle-translate"]) {
            if ([[paintProperties valueForKey:@"circle-translate"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"circle-translate"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    CGVector vector = CGVectorMake([stop[1][0] floatValue], [stop[1][1] floatValue]);
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:[NSValue valueWithCGVector:vector]] forKey:stop[0]];
                }
                NSMutableDictionary *optionsDict = [[NSMutableDictionary alloc] init];
                NSNumber *baseNumber = paintProperties[@"circle-translate"][@"base"];
                if (baseNumber) {
                    [optionsDict setObject:baseNumber forKey:MGLStyleFunctionOptionInterpolationBase];
                } else {
                    [optionsDict setObject:[NSNumber numberWithInt:1] forKey:MGLStyleFunctionOptionInterpolationBase];
                }
                MGLStyleValue *circleTranslateValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeExponential cameraStops:stopsDict options:optionsDict];
                [layer setCircleTranslation:circleTranslateValue];
            } else {
                CGVector vector = CGVectorMake([paintProperties[@"circle-translate"][0] floatValue], [paintProperties[@"circle-translate"][1] floatValue]);
                MGLStyleValue *circleTranslateValue = [MGLStyleValue valueWithRawValue:[NSValue valueWithCGVector:vector]];
                [layer setCircleTranslation:circleTranslateValue];
            }
        }
        if ([paintProperties valueForKey:@"circle-translate-anchor"]) {
            // create the NSString -> enum dictionary for later use
            NSDictionary<NSString*, NSNumber *> *enumDictionary = @{
                @"map": @(MGLCircleTranslationAnchorMap),
                @"viewport": @(MGLCircleTranslationAnchorViewport),
            };
            if ([[paintProperties valueForKey:@"circle-translate-anchor"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"circle-translate-anchor"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    NSValue *value = [NSValue valueWithMGLCircleTranslationAnchor:enumDictionary[paintProperties[@"circle-translate-anchor"]].integerValue];
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:value] forKey:stop[0]];
                }
                MGLStyleValue *circleTranslateAnchorValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeInterval cameraStops:stopsDict options:nil];
                [layer setCircleTranslationAnchor:circleTranslateAnchorValue];
            } else {
                NSValue *value = [NSValue valueWithMGLCircleTranslationAnchor:enumDictionary[paintProperties[@"circle-translate-anchor"]].integerValue];
                MGLStyleValue *circleTranslateAnchorValue = [MGLStyleValue valueWithRawValue:value];
                [layer setCircleTranslationAnchor:circleTranslateAnchorValue];
            }
        }
        if ([paintProperties valueForKey:@"circle-pitch-scale"]) {
            // create the NSString -> enum dictionary for later use
            NSDictionary<NSString*, NSNumber *> *enumDictionary = @{
                @"map": @(MGLCircleScaleAlignmentMap),
                @"viewport": @(MGLCircleScaleAlignmentViewport),
            };
            if ([[paintProperties valueForKey:@"circle-pitch-scale"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"circle-pitch-scale"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    NSValue *value = [NSValue valueWithMGLCircleScaleAlignment:enumDictionary[paintProperties[@"circle-pitch-scale"]].integerValue];
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:value] forKey:stop[0]];
                }
                MGLStyleValue *circlePitchScaleValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeInterval cameraStops:stopsDict options:nil];
                [layer setCircleScaleAlignment:circlePitchScaleValue];
            } else {
                NSValue *value = [NSValue valueWithMGLCircleScaleAlignment:enumDictionary[paintProperties[@"circle-pitch-scale"]].integerValue];
                MGLStyleValue *circlePitchScaleValue = [MGLStyleValue valueWithRawValue:value];
                [layer setCircleScaleAlignment:circlePitchScaleValue];
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
            if ([[paintProperties valueForKey:@"raster-opacity"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"raster-opacity"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                }
                NSMutableDictionary *optionsDict = [[NSMutableDictionary alloc] init];
                NSNumber *baseNumber = paintProperties[@"raster-opacity"][@"base"];
                if (baseNumber) {
                    [optionsDict setObject:baseNumber forKey:MGLStyleFunctionOptionInterpolationBase];
                } else {
                    [optionsDict setObject:[NSNumber numberWithInt:1] forKey:MGLStyleFunctionOptionInterpolationBase];
                }
                MGLStyleValue *rasterOpacityValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeExponential cameraStops:stopsDict options:optionsDict];
                [layer setRasterOpacity:rasterOpacityValue];
            } else {
                MGLStyleValue *rasterOpacityValue = [MGLStyleValue valueWithRawValue:paintProperties[@"raster-opacity"]];
                [layer setRasterOpacity:rasterOpacityValue];
            }
        }
        if ([paintProperties valueForKey:@"raster-hue-rotate"]) {
            if ([[paintProperties valueForKey:@"raster-hue-rotate"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"raster-hue-rotate"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                }
                NSMutableDictionary *optionsDict = [[NSMutableDictionary alloc] init];
                NSNumber *baseNumber = paintProperties[@"raster-hue-rotate"][@"base"];
                if (baseNumber) {
                    [optionsDict setObject:baseNumber forKey:MGLStyleFunctionOptionInterpolationBase];
                } else {
                    [optionsDict setObject:[NSNumber numberWithInt:1] forKey:MGLStyleFunctionOptionInterpolationBase];
                }
                MGLStyleValue *rasterHueRotateValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeExponential cameraStops:stopsDict options:optionsDict];
                [layer setRasterHueRotation:rasterHueRotateValue];
            } else {
                MGLStyleValue *rasterHueRotateValue = [MGLStyleValue valueWithRawValue:paintProperties[@"raster-hue-rotate"]];
                [layer setRasterHueRotation:rasterHueRotateValue];
            }
        }
        if ([paintProperties valueForKey:@"raster-brightness-min"]) {
            if ([[paintProperties valueForKey:@"raster-brightness-min"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"raster-brightness-min"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                }
                NSMutableDictionary *optionsDict = [[NSMutableDictionary alloc] init];
                NSNumber *baseNumber = paintProperties[@"raster-brightness-min"][@"base"];
                if (baseNumber) {
                    [optionsDict setObject:baseNumber forKey:MGLStyleFunctionOptionInterpolationBase];
                } else {
                    [optionsDict setObject:[NSNumber numberWithInt:1] forKey:MGLStyleFunctionOptionInterpolationBase];
                }
                MGLStyleValue *rasterBrightnessMinValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeExponential cameraStops:stopsDict options:optionsDict];
                [layer setMinimumRasterBrightness:rasterBrightnessMinValue];
            } else {
                MGLStyleValue *rasterBrightnessMinValue = [MGLStyleValue valueWithRawValue:paintProperties[@"raster-brightness-min"]];
                [layer setMinimumRasterBrightness:rasterBrightnessMinValue];
            }
        }
        if ([paintProperties valueForKey:@"raster-brightness-max"]) {
            if ([[paintProperties valueForKey:@"raster-brightness-max"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"raster-brightness-max"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                }
                NSMutableDictionary *optionsDict = [[NSMutableDictionary alloc] init];
                NSNumber *baseNumber = paintProperties[@"raster-brightness-max"][@"base"];
                if (baseNumber) {
                    [optionsDict setObject:baseNumber forKey:MGLStyleFunctionOptionInterpolationBase];
                } else {
                    [optionsDict setObject:[NSNumber numberWithInt:1] forKey:MGLStyleFunctionOptionInterpolationBase];
                }
                MGLStyleValue *rasterBrightnessMaxValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeExponential cameraStops:stopsDict options:optionsDict];
                [layer setMaximumRasterBrightness:rasterBrightnessMaxValue];
            } else {
                MGLStyleValue *rasterBrightnessMaxValue = [MGLStyleValue valueWithRawValue:paintProperties[@"raster-brightness-max"]];
                [layer setMaximumRasterBrightness:rasterBrightnessMaxValue];
            }
        }
        if ([paintProperties valueForKey:@"raster-saturation"]) {
            if ([[paintProperties valueForKey:@"raster-saturation"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"raster-saturation"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                }
                NSMutableDictionary *optionsDict = [[NSMutableDictionary alloc] init];
                NSNumber *baseNumber = paintProperties[@"raster-saturation"][@"base"];
                if (baseNumber) {
                    [optionsDict setObject:baseNumber forKey:MGLStyleFunctionOptionInterpolationBase];
                } else {
                    [optionsDict setObject:[NSNumber numberWithInt:1] forKey:MGLStyleFunctionOptionInterpolationBase];
                }
                MGLStyleValue *rasterSaturationValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeExponential cameraStops:stopsDict options:optionsDict];
                [layer setRasterSaturation:rasterSaturationValue];
            } else {
                MGLStyleValue *rasterSaturationValue = [MGLStyleValue valueWithRawValue:paintProperties[@"raster-saturation"]];
                [layer setRasterSaturation:rasterSaturationValue];
            }
        }
        if ([paintProperties valueForKey:@"raster-contrast"]) {
            if ([[paintProperties valueForKey:@"raster-contrast"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"raster-contrast"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                }
                NSMutableDictionary *optionsDict = [[NSMutableDictionary alloc] init];
                NSNumber *baseNumber = paintProperties[@"raster-contrast"][@"base"];
                if (baseNumber) {
                    [optionsDict setObject:baseNumber forKey:MGLStyleFunctionOptionInterpolationBase];
                } else {
                    [optionsDict setObject:[NSNumber numberWithInt:1] forKey:MGLStyleFunctionOptionInterpolationBase];
                }
                MGLStyleValue *rasterContrastValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeExponential cameraStops:stopsDict options:optionsDict];
                [layer setRasterContrast:rasterContrastValue];
            } else {
                MGLStyleValue *rasterContrastValue = [MGLStyleValue valueWithRawValue:paintProperties[@"raster-contrast"]];
                [layer setRasterContrast:rasterContrastValue];
            }
        }
        if ([paintProperties valueForKey:@"raster-fade-duration"]) {
            if ([[paintProperties valueForKey:@"raster-fade-duration"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"raster-fade-duration"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                }
                NSMutableDictionary *optionsDict = [[NSMutableDictionary alloc] init];
                NSNumber *baseNumber = paintProperties[@"raster-fade-duration"][@"base"];
                if (baseNumber) {
                    [optionsDict setObject:baseNumber forKey:MGLStyleFunctionOptionInterpolationBase];
                } else {
                    [optionsDict setObject:[NSNumber numberWithInt:1] forKey:MGLStyleFunctionOptionInterpolationBase];
                }
                MGLStyleValue *rasterFadeDurationValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeExponential cameraStops:stopsDict options:optionsDict];
                [layer setRasterFadeDuration:rasterFadeDurationValue];
            } else {
                MGLStyleValue *rasterFadeDurationValue = [MGLStyleValue valueWithRawValue:paintProperties[@"raster-fade-duration"]];
                [layer setRasterFadeDuration:rasterFadeDurationValue];
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
            if ([[paintProperties valueForKey:@"background-color"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"background-color"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:[UIColor colorWithString:stop[1]]] forKey:stop[0]];
                }
                NSMutableDictionary *optionsDict = [[NSMutableDictionary alloc] init];
                NSNumber *baseNumber = paintProperties[@"background-color"][@"base"];
                if (baseNumber) {
                    [optionsDict setObject:baseNumber forKey:MGLStyleFunctionOptionInterpolationBase];
                } else {
                    [optionsDict setObject:[NSNumber numberWithInt:1] forKey:MGLStyleFunctionOptionInterpolationBase];
                }
                MGLStyleValue *backgroundColorValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeExponential cameraStops:stopsDict options:optionsDict];
                [layer setBackgroundColor:backgroundColorValue];
            } else {
                UIColor *color = [UIColor colorWithString:paintProperties[@"background-color"]];
                MGLStyleValue *backgroundColorValue = [MGLStyleValue valueWithRawValue:color];
                [layer setBackgroundColor:backgroundColorValue];
            }
        }
        if ([paintProperties valueForKey:@"background-pattern"]) {
            if ([[paintProperties valueForKey:@"background-pattern"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"background-pattern"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                }
                MGLStyleValue *backgroundPatternValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeInterval cameraStops:stopsDict options:nil];
                [layer setBackgroundPattern:backgroundPatternValue];
            } else {
                MGLStyleValue *backgroundPatternValue = [MGLStyleValue valueWithRawValue:paintProperties[@"background-pattern"]];
                [layer setBackgroundPattern:backgroundPatternValue];
            }
        }
        if ([paintProperties valueForKey:@"background-opacity"]) {
            if ([[paintProperties valueForKey:@"background-opacity"] isKindOfClass:[NSDictionary class]]) {
                NSArray *stops = paintProperties[@"background-opacity"][@"stops"];
                NSMutableDictionary *stopsDict = [[NSMutableDictionary alloc] init];
                for (id stop in stops) {
                    [stopsDict setObject:[MGLStyleValue valueWithRawValue:stop[1]] forKey:stop[0]];
                }
                NSMutableDictionary *optionsDict = [[NSMutableDictionary alloc] init];
                NSNumber *baseNumber = paintProperties[@"background-opacity"][@"base"];
                if (baseNumber) {
                    [optionsDict setObject:baseNumber forKey:MGLStyleFunctionOptionInterpolationBase];
                } else {
                    [optionsDict setObject:[NSNumber numberWithInt:1] forKey:MGLStyleFunctionOptionInterpolationBase];
                }
                MGLStyleValue *backgroundOpacityValue = [MGLStyleValue valueWithInterpolationMode:MGLInterpolationModeExponential cameraStops:stopsDict options:optionsDict];
                [layer setBackgroundOpacity:backgroundOpacityValue];
            } else {
                MGLStyleValue *backgroundOpacityValue = [MGLStyleValue valueWithRawValue:paintProperties[@"background-opacity"]];
                [layer setBackgroundOpacity:backgroundOpacityValue];
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
