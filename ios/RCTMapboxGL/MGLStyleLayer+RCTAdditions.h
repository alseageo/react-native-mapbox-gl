//
// Copyright (c) 2016 Mapbox. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mapbox/Mapbox.h>
#import "RCTMapboxGL.h"
#import "RCTMapboxGLErrorDomain.h"

@interface MGLStyleLayer (RCTAdditions)
+ (MGLStyleLayer *)styleLayerWithJson:(nonnull NSDictionary *)layerJson mapView:(RCTMapboxGL *)mapView error:(NSError **)errorPtr;
- (NSPredicate *)predicateWithJson:(nonnull NSArray *)filter;
@end