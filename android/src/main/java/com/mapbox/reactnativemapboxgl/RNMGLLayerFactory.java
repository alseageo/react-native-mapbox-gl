// This file is generated. See scripts/generate-layer-factory.js
package com.mapbox.reactnativemapboxgl;

import com.facebook.react.bridge.ReadableArray;
import com.facebook.react.bridge.ReadableMap;
import com.facebook.react.bridge.ReadableType;
import com.mapbox.mapboxsdk.style.functions.*;
import com.mapbox.mapboxsdk.style.layers.*;
import com.mapbox.mapboxsdk.style.sources.*;

import java.lang.Float;
import java.util.ArrayList;

public class RNMGLLayerFactory {

    public static Layer layerFromJson(ReadableMap layerJson) throws InvalidLayerException {
        if (layerJson.hasKey("ref")) {
            throw new InvalidLayerException(String.format("addLayer(): cannot add layer '%s' with 'ref' attribute", layerJson.getString("id")));
        }
        if (!layerJson.hasKey("type")) {
            throw new InvalidLayerException(String.format("addLayer(): layer '%s' must have a valid 'type' attribute", layerJson.getString("id")));
        }

        String layerType = layerJson.getString("type");

        if (layerType.equals("fill")) {
            return fillLayerFromJson(layerJson);
        }
        if (layerType.equals("line")) {
            return lineLayerFromJson(layerJson);
        }
        if (layerType.equals("symbol")) {
            return symbolLayerFromJson(layerJson);
        }
        if (layerType.equals("circle")) {
            return circleLayerFromJson(layerJson);
        }
        if (layerType.equals("raster")) {
            return rasterLayerFromJson(layerJson);
        }
        if (layerType.equals("background")) {
            return backgroundLayerFromJson(layerJson);
        }
        throw new InvalidLayerException(String.format("addLayer(): invalid type '%s' on layer '%s'", layerType, layerJson.getString("id")));
    }

    static Float[] ReadableArrToNumberArr(ReadableArray readArr, int startValue) {
        int arrSize = readArr.size() - startValue;
        Float[] arr = new Float[arrSize];
        for (int i = 0; i < arrSize; i++) {
            arr[i] = (float)readArr.getDouble(i+startValue);
        }
        return arr;
    }

    static String[] ReadableArrToStringArr(ReadableArray readArr, int startValue) {
        int arrSize = readArr.size() - startValue;
        String[] arr = new String[arrSize];
        for (int i = 0; i < arrSize; i++) {
            arr[i] = readArr.getString(i+startValue);
        }
        return arr;
    }

    static Boolean[] ReadableArrToBooleanArr(ReadableArray readArr, int startValue) {
        int arrSize = readArr.size() - startValue;
        Boolean[] arr = new Boolean[arrSize];
        for (int i = 0; i < arrSize; i++) {
            arr[i] = readArr.getBoolean(i+startValue);
        }
        return arr;
    }

    static Filter.Statement filterJsonToFilter(ReadableArray filterJson) {
        String filterType = filterJson.getString(0);
        if (filterType.equals("all")) {
            int arrSize = filterJson.size() - 1;
            Filter.Statement[] filters = new Filter.Statement[arrSize];
            for (int i = 0; i < arrSize; i++) {
                filters[i] = filterJsonToFilter(filterJson.getArray(i+1));
            }
            return Filter.all(filters);
        }
        if (filterType.equals("any")) {
            int arrSize = filterJson.size() - 1;
            Filter.Statement[] filters = new Filter.Statement[arrSize];
            for (int i = 0; i < arrSize; i++) {
                filters[i] = filterJsonToFilter(filterJson.getArray(i+1));
            }
            return Filter.any(filters);
        }
        if (filterType.equals("none")) {
            int arrSize = filterJson.size() - 1;
            Filter.Statement[] filters = new Filter.Statement[arrSize];
            for (int i = 0; i < arrSize; i++) {
                filters[i] = filterJsonToFilter(filterJson.getArray(i+1));
            }
            return Filter.none(filters);
        }
        if (filterType.equals("has")) {
            return Filter.has(filterJson.getString(1));
        }
        if (filterType.equals("!has")) {
            return Filter.notHas(filterJson.getString(1));
        }
        if (filterType.equals("in")) {
            if (filterJson.getType(2) == ReadableType.Number) {
                return Filter.in(filterJson.getString(1), (Object[])ReadableArrToNumberArr(filterJson, 2));
            }
            if (filterJson.getType(2) == ReadableType.String) {
                return Filter.in(filterJson.getString(1), (Object[])ReadableArrToStringArr(filterJson, 2));
            }
            if (filterJson.getType(2) == ReadableType.Boolean) {
                return Filter.in(filterJson.getString(1), (Object[])ReadableArrToBooleanArr(filterJson, 2));
            }
        }
        if (filterType.equals("!in")) {
            if (filterJson.getType(2) == ReadableType.Number) {
                return Filter.notIn(filterJson.getString(1), (Object[])ReadableArrToNumberArr(filterJson, 2));
            }
            if (filterJson.getType(2) == ReadableType.String) {
                return Filter.notIn(filterJson.getString(1), (Object[])ReadableArrToStringArr(filterJson, 2));
            }
            if (filterJson.getType(2) == ReadableType.Boolean) {
                return Filter.notIn(filterJson.getString(1), (Object[])ReadableArrToBooleanArr(filterJson, 2));
            }
        }
        if (filterType.equals("==")) {
            if (filterJson.getType(2) == ReadableType.Number) {
                return Filter.eq(filterJson.getString(1), (float)filterJson.getDouble(2));
            }
            if (filterJson.getType(2) == ReadableType.String) {
                return Filter.eq(filterJson.getString(1), filterJson.getString(2));
            }
            if (filterJson.getType(2) == ReadableType.Boolean) {
                return Filter.eq(filterJson.getString(1), filterJson.getBoolean(2));
            }
        }
        if (filterType.equals("!=")) {
            if (filterJson.getType(2) == ReadableType.Number) {
                return Filter.neq(filterJson.getString(1), (float)filterJson.getDouble(2));
            }
            if (filterJson.getType(2) == ReadableType.String) {
                return Filter.neq(filterJson.getString(1), filterJson.getString(2));
            }
            if (filterJson.getType(2) == ReadableType.Boolean) {
                return Filter.neq(filterJson.getString(1), filterJson.getBoolean(2));
            }
        }
        if (filterType.equals(">")) {
            if (filterJson.getType(2) == ReadableType.Number) {
                return Filter.gt(filterJson.getString(1), (float)filterJson.getDouble(2));
            }
            if (filterJson.getType(2) == ReadableType.String) {
                return Filter.gt(filterJson.getString(1), filterJson.getString(2));
            }
            if (filterJson.getType(2) == ReadableType.Boolean) {
                return Filter.gt(filterJson.getString(1), filterJson.getBoolean(2));
            }
        }
        if (filterType.equals(">=")) {
            if (filterJson.getType(2) == ReadableType.Number) {
                return Filter.gte(filterJson.getString(1), (float)filterJson.getDouble(2));
            }
            if (filterJson.getType(2) == ReadableType.String) {
                return Filter.gte(filterJson.getString(1), filterJson.getString(2));
            }
            if (filterJson.getType(2) == ReadableType.Boolean) {
                return Filter.gte(filterJson.getString(1), filterJson.getBoolean(2));
            }
        }
        if (filterType.equals("<")) {
            if (filterJson.getType(2) == ReadableType.Number) {
                return Filter.lt(filterJson.getString(1), (float)filterJson.getDouble(2));
            }
            if (filterJson.getType(2) == ReadableType.String) {
                return Filter.lt(filterJson.getString(1), filterJson.getString(2));
            }
            if (filterJson.getType(2) == ReadableType.Boolean) {
                return Filter.lt(filterJson.getString(1), filterJson.getBoolean(2));
            }
        }
        if (filterType.equals("<=")) {
            if (filterJson.getType(2) == ReadableType.Number) {
                return Filter.lte(filterJson.getString(1), (float)filterJson.getDouble(2));
            }
            if (filterJson.getType(2) == ReadableType.String) {
                return Filter.lte(filterJson.getString(1), filterJson.getString(2));
            }
            if (filterJson.getType(2) == ReadableType.Boolean) {
                return Filter.lte(filterJson.getString(1), filterJson.getBoolean(2));
            }
        }
        return null;
    }

    static FillLayer fillLayerFromJson(ReadableMap layerJson) {
        ArrayList<PropertyValue> properties = new ArrayList<PropertyValue>();

        if (layerJson.hasKey("paint")) {
            ReadableMap paintProperties = layerJson.getMap("paint");
            if (paintProperties.hasKey("fill-antialias")) {
                if (paintProperties.getType("fill-antialias") == ReadableType.Boolean) {
                    properties.add(PropertyFactory.fillAntialias(
                        paintProperties.getBoolean("fill-antialias")
                    ));
                }
                else if (paintProperties.getType("fill-antialias") == ReadableType.Map) {
                    ReadableMap map = paintProperties.getMap("fill-antialias");
                    ReadableArray stops = map.getArray("stops");
                    Stop[] stopsArray = new Stop[stops.size()];
                    for (int i = 0; i < stops.size(); i++) {
                        stopsArray[i] = Stop.stop(
                            (float)stops.getArray(i).getDouble(0),
                            PropertyFactory.fillAntialias(
                                stops.getArray(i).getBoolean(1)
                            )
                        );
                    }
                    properties.add(PropertyFactory.fillAntialias(Function.zoom(new IntervalStops(stopsArray))));
                }
            }
            if (paintProperties.hasKey("fill-opacity")) {
                if (paintProperties.getType("fill-opacity") == ReadableType.Number) {
                    properties.add(PropertyFactory.fillOpacity(
                        (float)paintProperties.getDouble("fill-opacity")
                    ));
                }
                else if (paintProperties.getType("fill-opacity") == ReadableType.Map) {
                    ReadableMap map = paintProperties.getMap("fill-opacity");
                    ReadableArray stops = map.getArray("stops");
                    Stop[] stopsArray = new Stop[stops.size()];
                    for (int i = 0; i < stops.size(); i++) {
                        stopsArray[i] = Stop.stop(
                            (float)stops.getArray(i).getDouble(0),
                            PropertyFactory.fillOpacity(
                                (float)stops.getArray(i).getDouble(1)
                            )
                        );
                    }
                    if (map.hasKey("base")) {
                        properties.add(PropertyFactory.fillOpacity(Function.zoom(new ExponentialStops((float)map.getDouble("base"), stopsArray))));
                    }
                    else {
                        properties.add(PropertyFactory.fillOpacity(Function.zoom(new ExponentialStops(stopsArray))));
                    }
                }
            }
            if (paintProperties.hasKey("fill-color")) {
                if (paintProperties.getType("fill-color") == ReadableType.String) {
                    properties.add(PropertyFactory.fillColor(
                        paintProperties.getString("fill-color")
                    ));
                }
                else if (paintProperties.getType("fill-color") == ReadableType.Map) {
                    ReadableMap map = paintProperties.getMap("fill-color");
                    ReadableArray stops = map.getArray("stops");
                    Stop[] stopsArray = new Stop[stops.size()];
                    for (int i = 0; i < stops.size(); i++) {
                        stopsArray[i] = Stop.stop(
                            (float)stops.getArray(i).getDouble(0),
                            PropertyFactory.fillColor(
                                stops.getArray(i).getString(1)
                            )
                        );
                    }
                    if (map.hasKey("base")) {
                        properties.add(PropertyFactory.fillColor(Function.zoom(new ExponentialStops((float)map.getDouble("base"), stopsArray))));
                    }
                    else {
                        properties.add(PropertyFactory.fillColor(Function.zoom(new ExponentialStops(stopsArray))));
                    }
                }
            }
            if (paintProperties.hasKey("fill-outline-color")) {
                if (paintProperties.getType("fill-outline-color") == ReadableType.String) {
                    properties.add(PropertyFactory.fillOutlineColor(
                        paintProperties.getString("fill-outline-color")
                    ));
                }
                else if (paintProperties.getType("fill-outline-color") == ReadableType.Map) {
                    ReadableMap map = paintProperties.getMap("fill-outline-color");
                    ReadableArray stops = map.getArray("stops");
                    Stop[] stopsArray = new Stop[stops.size()];
                    for (int i = 0; i < stops.size(); i++) {
                        stopsArray[i] = Stop.stop(
                            (float)stops.getArray(i).getDouble(0),
                            PropertyFactory.fillOutlineColor(
                                stops.getArray(i).getString(1)
                            )
                        );
                    }
                    if (map.hasKey("base")) {
                        properties.add(PropertyFactory.fillOutlineColor(Function.zoom(new ExponentialStops((float)map.getDouble("base"), stopsArray))));
                    }
                    else {
                        properties.add(PropertyFactory.fillOutlineColor(Function.zoom(new ExponentialStops(stopsArray))));
                    }
                }
            }
            if (paintProperties.hasKey("fill-translate")) {
                if (paintProperties.getType("fill-translate") == ReadableType.Array) {
                    properties.add(PropertyFactory.fillTranslate(
                        ReadableArrToNumberArr(paintProperties.getArray("fill-translate"), 0)
                    ));
                }
                else if (paintProperties.getType("fill-translate") == ReadableType.Map) {
                    ReadableMap map = paintProperties.getMap("fill-translate");
                    ReadableArray stops = map.getArray("stops");
                    Stop[] stopsArray = new Stop[stops.size()];
                    for (int i = 0; i < stops.size(); i++) {
                        stopsArray[i] = Stop.stop(
                            (float)stops.getArray(i).getDouble(0),
                            PropertyFactory.fillTranslate(
                                ReadableArrToNumberArr(stops.getArray(i).getArray(1), 0)
                            )
                        );
                    }
                    if (map.hasKey("base")) {
                        properties.add(PropertyFactory.fillTranslate(Function.zoom(new ExponentialStops((float)map.getDouble("base"), stopsArray))));
                    }
                    else {
                        properties.add(PropertyFactory.fillTranslate(Function.zoom(new ExponentialStops(stopsArray))));
                    }
                }
            }
            if (paintProperties.hasKey("fill-translate-anchor")) {
                if (paintProperties.getType("fill-translate-anchor") == ReadableType.String) {
                    properties.add(PropertyFactory.fillTranslateAnchor(
                        paintProperties.getString("fill-translate-anchor")
                    ));
                }
                else if (paintProperties.getType("fill-translate-anchor") == ReadableType.Map) {
                    ReadableMap map = paintProperties.getMap("fill-translate-anchor");
                    ReadableArray stops = map.getArray("stops");
                    Stop[] stopsArray = new Stop[stops.size()];
                    for (int i = 0; i < stops.size(); i++) {
                        stopsArray[i] = Stop.stop(
                            (float)stops.getArray(i).getDouble(0),
                            PropertyFactory.fillTranslateAnchor(
                                stops.getArray(i).getString(1)
                            )
                        );
                    }
                    properties.add(PropertyFactory.fillTranslateAnchor(Function.zoom(new IntervalStops(stopsArray))));
                }
            }
            if (paintProperties.hasKey("fill-pattern")) {
                if (paintProperties.getType("fill-pattern") == ReadableType.String) {
                    properties.add(PropertyFactory.fillPattern(
                        paintProperties.getString("fill-pattern")
                    ));
                }
                else if (paintProperties.getType("fill-pattern") == ReadableType.Map) {
                    ReadableMap map = paintProperties.getMap("fill-pattern");
                    ReadableArray stops = map.getArray("stops");
                    Stop[] stopsArray = new Stop[stops.size()];
                    for (int i = 0; i < stops.size(); i++) {
                        stopsArray[i] = Stop.stop(
                            (float)stops.getArray(i).getDouble(0),
                            PropertyFactory.fillPattern(
                                stops.getArray(i).getString(1)
                            )
                        );
                    }
                    properties.add(PropertyFactory.fillPattern(Function.zoom(new IntervalStops(stopsArray))));
                }
            }
        }

        if (!layerJson.hasKey("source")) {
            throw new InvalidLayerException(String.format("addLayer(): layer '%s' must have a valid 'source' attribute", layerJson.getString("id")));
        }
        FillLayer layer = new FillLayer(layerJson.getString("id"), layerJson.getString("source"))
            .withProperties(properties.toArray(new Property[0]));

        if (layerJson.hasKey("source-layer")) {
            layer.setSourceLayer(layerJson.getString("source-layer"));
        }
        if (layerJson.hasKey("filter")) {
            ReadableArray filterJson = layerJson.getArray("filter");
            layer.setFilter(filterJsonToFilter(filterJson));
        }
        if (layerJson.hasKey("minzoom")) {
            layer.setMinZoom((float)layerJson.getDouble("minzoom"));
        }
        if (layerJson.hasKey("maxzoom")) {
            layer.setMaxZoom((float)layerJson.getDouble("maxzoom"));
        }

        return layer;
    }

    static LineLayer lineLayerFromJson(ReadableMap layerJson) {
        ArrayList<PropertyValue> properties = new ArrayList<PropertyValue>();

        if (layerJson.hasKey("paint")) {
            ReadableMap paintProperties = layerJson.getMap("paint");
            if (paintProperties.hasKey("line-opacity")) {
                if (paintProperties.getType("line-opacity") == ReadableType.Number) {
                    properties.add(PropertyFactory.lineOpacity(
                        (float)paintProperties.getDouble("line-opacity")
                    ));
                }
                else if (paintProperties.getType("line-opacity") == ReadableType.Map) {
                    ReadableMap map = paintProperties.getMap("line-opacity");
                    ReadableArray stops = map.getArray("stops");
                    Stop[] stopsArray = new Stop[stops.size()];
                    for (int i = 0; i < stops.size(); i++) {
                        stopsArray[i] = Stop.stop(
                            (float)stops.getArray(i).getDouble(0),
                            PropertyFactory.lineOpacity(
                                (float)stops.getArray(i).getDouble(1)
                            )
                        );
                    }
                    if (map.hasKey("base")) {
                        properties.add(PropertyFactory.lineOpacity(Function.zoom(new ExponentialStops((float)map.getDouble("base"), stopsArray))));
                    }
                    else {
                        properties.add(PropertyFactory.lineOpacity(Function.zoom(new ExponentialStops(stopsArray))));
                    }
                }
            }
            if (paintProperties.hasKey("line-color")) {
                if (paintProperties.getType("line-color") == ReadableType.String) {
                    properties.add(PropertyFactory.lineColor(
                        paintProperties.getString("line-color")
                    ));
                }
                else if (paintProperties.getType("line-color") == ReadableType.Map) {
                    ReadableMap map = paintProperties.getMap("line-color");
                    ReadableArray stops = map.getArray("stops");
                    Stop[] stopsArray = new Stop[stops.size()];
                    for (int i = 0; i < stops.size(); i++) {
                        stopsArray[i] = Stop.stop(
                            (float)stops.getArray(i).getDouble(0),
                            PropertyFactory.lineColor(
                                stops.getArray(i).getString(1)
                            )
                        );
                    }
                    if (map.hasKey("base")) {
                        properties.add(PropertyFactory.lineColor(Function.zoom(new ExponentialStops((float)map.getDouble("base"), stopsArray))));
                    }
                    else {
                        properties.add(PropertyFactory.lineColor(Function.zoom(new ExponentialStops(stopsArray))));
                    }
                }
            }
            if (paintProperties.hasKey("line-translate")) {
                if (paintProperties.getType("line-translate") == ReadableType.Array) {
                    properties.add(PropertyFactory.lineTranslate(
                        ReadableArrToNumberArr(paintProperties.getArray("line-translate"), 0)
                    ));
                }
                else if (paintProperties.getType("line-translate") == ReadableType.Map) {
                    ReadableMap map = paintProperties.getMap("line-translate");
                    ReadableArray stops = map.getArray("stops");
                    Stop[] stopsArray = new Stop[stops.size()];
                    for (int i = 0; i < stops.size(); i++) {
                        stopsArray[i] = Stop.stop(
                            (float)stops.getArray(i).getDouble(0),
                            PropertyFactory.lineTranslate(
                                ReadableArrToNumberArr(stops.getArray(i).getArray(1), 0)
                            )
                        );
                    }
                    if (map.hasKey("base")) {
                        properties.add(PropertyFactory.lineTranslate(Function.zoom(new ExponentialStops((float)map.getDouble("base"), stopsArray))));
                    }
                    else {
                        properties.add(PropertyFactory.lineTranslate(Function.zoom(new ExponentialStops(stopsArray))));
                    }
                }
            }
            if (paintProperties.hasKey("line-translate-anchor")) {
                if (paintProperties.getType("line-translate-anchor") == ReadableType.String) {
                    properties.add(PropertyFactory.lineTranslateAnchor(
                        paintProperties.getString("line-translate-anchor")
                    ));
                }
                else if (paintProperties.getType("line-translate-anchor") == ReadableType.Map) {
                    ReadableMap map = paintProperties.getMap("line-translate-anchor");
                    ReadableArray stops = map.getArray("stops");
                    Stop[] stopsArray = new Stop[stops.size()];
                    for (int i = 0; i < stops.size(); i++) {
                        stopsArray[i] = Stop.stop(
                            (float)stops.getArray(i).getDouble(0),
                            PropertyFactory.lineTranslateAnchor(
                                stops.getArray(i).getString(1)
                            )
                        );
                    }
                    properties.add(PropertyFactory.lineTranslateAnchor(Function.zoom(new IntervalStops(stopsArray))));
                }
            }
            if (paintProperties.hasKey("line-width")) {
                if (paintProperties.getType("line-width") == ReadableType.Number) {
                    properties.add(PropertyFactory.lineWidth(
                        (float)paintProperties.getDouble("line-width")
                    ));
                }
                else if (paintProperties.getType("line-width") == ReadableType.Map) {
                    ReadableMap map = paintProperties.getMap("line-width");
                    ReadableArray stops = map.getArray("stops");
                    Stop[] stopsArray = new Stop[stops.size()];
                    for (int i = 0; i < stops.size(); i++) {
                        stopsArray[i] = Stop.stop(
                            (float)stops.getArray(i).getDouble(0),
                            PropertyFactory.lineWidth(
                                (float)stops.getArray(i).getDouble(1)
                            )
                        );
                    }
                    if (map.hasKey("base")) {
                        properties.add(PropertyFactory.lineWidth(Function.zoom(new ExponentialStops((float)map.getDouble("base"), stopsArray))));
                    }
                    else {
                        properties.add(PropertyFactory.lineWidth(Function.zoom(new ExponentialStops(stopsArray))));
                    }
                }
            }
            if (paintProperties.hasKey("line-gap-width")) {
                if (paintProperties.getType("line-gap-width") == ReadableType.Number) {
                    properties.add(PropertyFactory.lineGapWidth(
                        (float)paintProperties.getDouble("line-gap-width")
                    ));
                }
                else if (paintProperties.getType("line-gap-width") == ReadableType.Map) {
                    ReadableMap map = paintProperties.getMap("line-gap-width");
                    ReadableArray stops = map.getArray("stops");
                    Stop[] stopsArray = new Stop[stops.size()];
                    for (int i = 0; i < stops.size(); i++) {
                        stopsArray[i] = Stop.stop(
                            (float)stops.getArray(i).getDouble(0),
                            PropertyFactory.lineGapWidth(
                                (float)stops.getArray(i).getDouble(1)
                            )
                        );
                    }
                    if (map.hasKey("base")) {
                        properties.add(PropertyFactory.lineGapWidth(Function.zoom(new ExponentialStops((float)map.getDouble("base"), stopsArray))));
                    }
                    else {
                        properties.add(PropertyFactory.lineGapWidth(Function.zoom(new ExponentialStops(stopsArray))));
                    }
                }
            }
            if (paintProperties.hasKey("line-offset")) {
                if (paintProperties.getType("line-offset") == ReadableType.Number) {
                    properties.add(PropertyFactory.lineOffset(
                        (float)paintProperties.getDouble("line-offset")
                    ));
                }
                else if (paintProperties.getType("line-offset") == ReadableType.Map) {
                    ReadableMap map = paintProperties.getMap("line-offset");
                    ReadableArray stops = map.getArray("stops");
                    Stop[] stopsArray = new Stop[stops.size()];
                    for (int i = 0; i < stops.size(); i++) {
                        stopsArray[i] = Stop.stop(
                            (float)stops.getArray(i).getDouble(0),
                            PropertyFactory.lineOffset(
                                (float)stops.getArray(i).getDouble(1)
                            )
                        );
                    }
                    if (map.hasKey("base")) {
                        properties.add(PropertyFactory.lineOffset(Function.zoom(new ExponentialStops((float)map.getDouble("base"), stopsArray))));
                    }
                    else {
                        properties.add(PropertyFactory.lineOffset(Function.zoom(new ExponentialStops(stopsArray))));
                    }
                }
            }
            if (paintProperties.hasKey("line-blur")) {
                if (paintProperties.getType("line-blur") == ReadableType.Number) {
                    properties.add(PropertyFactory.lineBlur(
                        (float)paintProperties.getDouble("line-blur")
                    ));
                }
                else if (paintProperties.getType("line-blur") == ReadableType.Map) {
                    ReadableMap map = paintProperties.getMap("line-blur");
                    ReadableArray stops = map.getArray("stops");
                    Stop[] stopsArray = new Stop[stops.size()];
                    for (int i = 0; i < stops.size(); i++) {
                        stopsArray[i] = Stop.stop(
                            (float)stops.getArray(i).getDouble(0),
                            PropertyFactory.lineBlur(
                                (float)stops.getArray(i).getDouble(1)
                            )
                        );
                    }
                    if (map.hasKey("base")) {
                        properties.add(PropertyFactory.lineBlur(Function.zoom(new ExponentialStops((float)map.getDouble("base"), stopsArray))));
                    }
                    else {
                        properties.add(PropertyFactory.lineBlur(Function.zoom(new ExponentialStops(stopsArray))));
                    }
                }
            }
            if (paintProperties.hasKey("line-dasharray")) {
                if (paintProperties.getType("line-dasharray") == ReadableType.Array) {
                    properties.add(PropertyFactory.lineDasharray(
                        ReadableArrToNumberArr(paintProperties.getArray("line-dasharray"), 0)
                    ));
                }
                else if (paintProperties.getType("line-dasharray") == ReadableType.Map) {
                    ReadableMap map = paintProperties.getMap("line-dasharray");
                    ReadableArray stops = map.getArray("stops");
                    Stop[] stopsArray = new Stop[stops.size()];
                    for (int i = 0; i < stops.size(); i++) {
                        stopsArray[i] = Stop.stop(
                            (float)stops.getArray(i).getDouble(0),
                            PropertyFactory.lineDasharray(
                                ReadableArrToNumberArr(stops.getArray(i).getArray(1), 0)
                            )
                        );
                    }
                    properties.add(PropertyFactory.lineDasharray(Function.zoom(new IntervalStops(stopsArray))));
                }
            }
            if (paintProperties.hasKey("line-pattern")) {
                if (paintProperties.getType("line-pattern") == ReadableType.String) {
                    properties.add(PropertyFactory.linePattern(
                        paintProperties.getString("line-pattern")
                    ));
                }
                else if (paintProperties.getType("line-pattern") == ReadableType.Map) {
                    ReadableMap map = paintProperties.getMap("line-pattern");
                    ReadableArray stops = map.getArray("stops");
                    Stop[] stopsArray = new Stop[stops.size()];
                    for (int i = 0; i < stops.size(); i++) {
                        stopsArray[i] = Stop.stop(
                            (float)stops.getArray(i).getDouble(0),
                            PropertyFactory.linePattern(
                                stops.getArray(i).getString(1)
                            )
                        );
                    }
                    properties.add(PropertyFactory.linePattern(Function.zoom(new IntervalStops(stopsArray))));
                }
            }
        }
        if (layerJson.hasKey("layout")) {
            ReadableMap layoutProperties = layerJson.getMap("layout");
            if (layoutProperties.hasKey("line-cap")) {
                if (layoutProperties.getType("line-cap") == ReadableType.String) {
                    properties.add(PropertyFactory.lineCap(
                        layoutProperties.getString("line-cap")
                    ));
                }
                else if (layoutProperties.getType("line-cap") == ReadableType.Map) {
                    ReadableMap map = layoutProperties.getMap("line-cap");
                    ReadableArray stops = map.getArray("stops");
                    Stop[] stopsArray = new Stop[stops.size()];
                    for (int i = 0; i < stops.size(); i++) {
                        stopsArray[i] = Stop.stop(
                            (float)stops.getArray(i).getDouble(0),
                            PropertyFactory.lineCap(
                                stops.getArray(i).getString(1)
                            )
                        );
                    }
                    properties.add(PropertyFactory.lineCap(Function.zoom(new IntervalStops(stopsArray))));
                }
            }
            if (layoutProperties.hasKey("line-join")) {
                if (layoutProperties.getType("line-join") == ReadableType.String) {
                    properties.add(PropertyFactory.lineJoin(
                        layoutProperties.getString("line-join")
                    ));
                }
                else if (layoutProperties.getType("line-join") == ReadableType.Map) {
                    ReadableMap map = layoutProperties.getMap("line-join");
                    ReadableArray stops = map.getArray("stops");
                    Stop[] stopsArray = new Stop[stops.size()];
                    for (int i = 0; i < stops.size(); i++) {
                        stopsArray[i] = Stop.stop(
                            (float)stops.getArray(i).getDouble(0),
                            PropertyFactory.lineJoin(
                                stops.getArray(i).getString(1)
                            )
                        );
                    }
                    properties.add(PropertyFactory.lineJoin(Function.zoom(new IntervalStops(stopsArray))));
                }
            }
            if (layoutProperties.hasKey("line-miter-limit")) {
                if (layoutProperties.getType("line-miter-limit") == ReadableType.Number) {
                    properties.add(PropertyFactory.lineMiterLimit(
                        (float)layoutProperties.getDouble("line-miter-limit")
                    ));
                }
                else if (layoutProperties.getType("line-miter-limit") == ReadableType.Map) {
                    ReadableMap map = layoutProperties.getMap("line-miter-limit");
                    ReadableArray stops = map.getArray("stops");
                    Stop[] stopsArray = new Stop[stops.size()];
                    for (int i = 0; i < stops.size(); i++) {
                        stopsArray[i] = Stop.stop(
                            (float)stops.getArray(i).getDouble(0),
                            PropertyFactory.lineMiterLimit(
                                (float)stops.getArray(i).getDouble(1)
                            )
                        );
                    }
                    if (map.hasKey("base")) {
                        properties.add(PropertyFactory.lineMiterLimit(Function.zoom(new ExponentialStops((float)map.getDouble("base"), stopsArray))));
                    }
                    else {
                        properties.add(PropertyFactory.lineMiterLimit(Function.zoom(new ExponentialStops(stopsArray))));
                    }
                }
            }
            if (layoutProperties.hasKey("line-round-limit")) {
                if (layoutProperties.getType("line-round-limit") == ReadableType.Number) {
                    properties.add(PropertyFactory.lineRoundLimit(
                        (float)layoutProperties.getDouble("line-round-limit")
                    ));
                }
                else if (layoutProperties.getType("line-round-limit") == ReadableType.Map) {
                    ReadableMap map = layoutProperties.getMap("line-round-limit");
                    ReadableArray stops = map.getArray("stops");
                    Stop[] stopsArray = new Stop[stops.size()];
                    for (int i = 0; i < stops.size(); i++) {
                        stopsArray[i] = Stop.stop(
                            (float)stops.getArray(i).getDouble(0),
                            PropertyFactory.lineRoundLimit(
                                (float)stops.getArray(i).getDouble(1)
                            )
                        );
                    }
                    if (map.hasKey("base")) {
                        properties.add(PropertyFactory.lineRoundLimit(Function.zoom(new ExponentialStops((float)map.getDouble("base"), stopsArray))));
                    }
                    else {
                        properties.add(PropertyFactory.lineRoundLimit(Function.zoom(new ExponentialStops(stopsArray))));
                    }
                }
            }
        }

        if (!layerJson.hasKey("source")) {
            throw new InvalidLayerException(String.format("addLayer(): layer '%s' must have a valid 'source' attribute", layerJson.getString("id")));
        }
        LineLayer layer = new LineLayer(layerJson.getString("id"), layerJson.getString("source"))
            .withProperties(properties.toArray(new Property[0]));

        if (layerJson.hasKey("source-layer")) {
            layer.setSourceLayer(layerJson.getString("source-layer"));
        }
        if (layerJson.hasKey("filter")) {
            ReadableArray filterJson = layerJson.getArray("filter");
            layer.setFilter(filterJsonToFilter(filterJson));
        }
        if (layerJson.hasKey("minzoom")) {
            layer.setMinZoom((float)layerJson.getDouble("minzoom"));
        }
        if (layerJson.hasKey("maxzoom")) {
            layer.setMaxZoom((float)layerJson.getDouble("maxzoom"));
        }

        return layer;
    }

    static SymbolLayer symbolLayerFromJson(ReadableMap layerJson) {
        ArrayList<PropertyValue> properties = new ArrayList<PropertyValue>();

        if (layerJson.hasKey("paint")) {
            ReadableMap paintProperties = layerJson.getMap("paint");
            if (paintProperties.hasKey("icon-opacity")) {
                if (paintProperties.getType("icon-opacity") == ReadableType.Number) {
                    properties.add(PropertyFactory.iconOpacity(
                        (float)paintProperties.getDouble("icon-opacity")
                    ));
                }
                else if (paintProperties.getType("icon-opacity") == ReadableType.Map) {
                    ReadableMap map = paintProperties.getMap("icon-opacity");
                    ReadableArray stops = map.getArray("stops");
                    Stop[] stopsArray = new Stop[stops.size()];
                    for (int i = 0; i < stops.size(); i++) {
                        stopsArray[i] = Stop.stop(
                            (float)stops.getArray(i).getDouble(0),
                            PropertyFactory.iconOpacity(
                                (float)stops.getArray(i).getDouble(1)
                            )
                        );
                    }
                    if (map.hasKey("base")) {
                        properties.add(PropertyFactory.iconOpacity(Function.zoom(new ExponentialStops((float)map.getDouble("base"), stopsArray))));
                    }
                    else {
                        properties.add(PropertyFactory.iconOpacity(Function.zoom(new ExponentialStops(stopsArray))));
                    }
                }
            }
            if (paintProperties.hasKey("icon-color")) {
                if (paintProperties.getType("icon-color") == ReadableType.String) {
                    properties.add(PropertyFactory.iconColor(
                        paintProperties.getString("icon-color")
                    ));
                }
                else if (paintProperties.getType("icon-color") == ReadableType.Map) {
                    ReadableMap map = paintProperties.getMap("icon-color");
                    ReadableArray stops = map.getArray("stops");
                    Stop[] stopsArray = new Stop[stops.size()];
                    for (int i = 0; i < stops.size(); i++) {
                        stopsArray[i] = Stop.stop(
                            (float)stops.getArray(i).getDouble(0),
                            PropertyFactory.iconColor(
                                stops.getArray(i).getString(1)
                            )
                        );
                    }
                    if (map.hasKey("base")) {
                        properties.add(PropertyFactory.iconColor(Function.zoom(new ExponentialStops((float)map.getDouble("base"), stopsArray))));
                    }
                    else {
                        properties.add(PropertyFactory.iconColor(Function.zoom(new ExponentialStops(stopsArray))));
                    }
                }
            }
            if (paintProperties.hasKey("icon-halo-color")) {
                if (paintProperties.getType("icon-halo-color") == ReadableType.String) {
                    properties.add(PropertyFactory.iconHaloColor(
                        paintProperties.getString("icon-halo-color")
                    ));
                }
                else if (paintProperties.getType("icon-halo-color") == ReadableType.Map) {
                    ReadableMap map = paintProperties.getMap("icon-halo-color");
                    ReadableArray stops = map.getArray("stops");
                    Stop[] stopsArray = new Stop[stops.size()];
                    for (int i = 0; i < stops.size(); i++) {
                        stopsArray[i] = Stop.stop(
                            (float)stops.getArray(i).getDouble(0),
                            PropertyFactory.iconHaloColor(
                                stops.getArray(i).getString(1)
                            )
                        );
                    }
                    if (map.hasKey("base")) {
                        properties.add(PropertyFactory.iconHaloColor(Function.zoom(new ExponentialStops((float)map.getDouble("base"), stopsArray))));
                    }
                    else {
                        properties.add(PropertyFactory.iconHaloColor(Function.zoom(new ExponentialStops(stopsArray))));
                    }
                }
            }
            if (paintProperties.hasKey("icon-halo-width")) {
                if (paintProperties.getType("icon-halo-width") == ReadableType.Number) {
                    properties.add(PropertyFactory.iconHaloWidth(
                        (float)paintProperties.getDouble("icon-halo-width")
                    ));
                }
                else if (paintProperties.getType("icon-halo-width") == ReadableType.Map) {
                    ReadableMap map = paintProperties.getMap("icon-halo-width");
                    ReadableArray stops = map.getArray("stops");
                    Stop[] stopsArray = new Stop[stops.size()];
                    for (int i = 0; i < stops.size(); i++) {
                        stopsArray[i] = Stop.stop(
                            (float)stops.getArray(i).getDouble(0),
                            PropertyFactory.iconHaloWidth(
                                (float)stops.getArray(i).getDouble(1)
                            )
                        );
                    }
                    if (map.hasKey("base")) {
                        properties.add(PropertyFactory.iconHaloWidth(Function.zoom(new ExponentialStops((float)map.getDouble("base"), stopsArray))));
                    }
                    else {
                        properties.add(PropertyFactory.iconHaloWidth(Function.zoom(new ExponentialStops(stopsArray))));
                    }
                }
            }
            if (paintProperties.hasKey("icon-halo-blur")) {
                if (paintProperties.getType("icon-halo-blur") == ReadableType.Number) {
                    properties.add(PropertyFactory.iconHaloBlur(
                        (float)paintProperties.getDouble("icon-halo-blur")
                    ));
                }
                else if (paintProperties.getType("icon-halo-blur") == ReadableType.Map) {
                    ReadableMap map = paintProperties.getMap("icon-halo-blur");
                    ReadableArray stops = map.getArray("stops");
                    Stop[] stopsArray = new Stop[stops.size()];
                    for (int i = 0; i < stops.size(); i++) {
                        stopsArray[i] = Stop.stop(
                            (float)stops.getArray(i).getDouble(0),
                            PropertyFactory.iconHaloBlur(
                                (float)stops.getArray(i).getDouble(1)
                            )
                        );
                    }
                    if (map.hasKey("base")) {
                        properties.add(PropertyFactory.iconHaloBlur(Function.zoom(new ExponentialStops((float)map.getDouble("base"), stopsArray))));
                    }
                    else {
                        properties.add(PropertyFactory.iconHaloBlur(Function.zoom(new ExponentialStops(stopsArray))));
                    }
                }
            }
            if (paintProperties.hasKey("icon-translate")) {
                if (paintProperties.getType("icon-translate") == ReadableType.Array) {
                    properties.add(PropertyFactory.iconTranslate(
                        ReadableArrToNumberArr(paintProperties.getArray("icon-translate"), 0)
                    ));
                }
                else if (paintProperties.getType("icon-translate") == ReadableType.Map) {
                    ReadableMap map = paintProperties.getMap("icon-translate");
                    ReadableArray stops = map.getArray("stops");
                    Stop[] stopsArray = new Stop[stops.size()];
                    for (int i = 0; i < stops.size(); i++) {
                        stopsArray[i] = Stop.stop(
                            (float)stops.getArray(i).getDouble(0),
                            PropertyFactory.iconTranslate(
                                ReadableArrToNumberArr(stops.getArray(i).getArray(1), 0)
                            )
                        );
                    }
                    if (map.hasKey("base")) {
                        properties.add(PropertyFactory.iconTranslate(Function.zoom(new ExponentialStops((float)map.getDouble("base"), stopsArray))));
                    }
                    else {
                        properties.add(PropertyFactory.iconTranslate(Function.zoom(new ExponentialStops(stopsArray))));
                    }
                }
            }
            if (paintProperties.hasKey("icon-translate-anchor")) {
                if (paintProperties.getType("icon-translate-anchor") == ReadableType.String) {
                    properties.add(PropertyFactory.iconTranslateAnchor(
                        paintProperties.getString("icon-translate-anchor")
                    ));
                }
                else if (paintProperties.getType("icon-translate-anchor") == ReadableType.Map) {
                    ReadableMap map = paintProperties.getMap("icon-translate-anchor");
                    ReadableArray stops = map.getArray("stops");
                    Stop[] stopsArray = new Stop[stops.size()];
                    for (int i = 0; i < stops.size(); i++) {
                        stopsArray[i] = Stop.stop(
                            (float)stops.getArray(i).getDouble(0),
                            PropertyFactory.iconTranslateAnchor(
                                stops.getArray(i).getString(1)
                            )
                        );
                    }
                    properties.add(PropertyFactory.iconTranslateAnchor(Function.zoom(new IntervalStops(stopsArray))));
                }
            }
            if (paintProperties.hasKey("text-opacity")) {
                if (paintProperties.getType("text-opacity") == ReadableType.Number) {
                    properties.add(PropertyFactory.textOpacity(
                        (float)paintProperties.getDouble("text-opacity")
                    ));
                }
                else if (paintProperties.getType("text-opacity") == ReadableType.Map) {
                    ReadableMap map = paintProperties.getMap("text-opacity");
                    ReadableArray stops = map.getArray("stops");
                    Stop[] stopsArray = new Stop[stops.size()];
                    for (int i = 0; i < stops.size(); i++) {
                        stopsArray[i] = Stop.stop(
                            (float)stops.getArray(i).getDouble(0),
                            PropertyFactory.textOpacity(
                                (float)stops.getArray(i).getDouble(1)
                            )
                        );
                    }
                    if (map.hasKey("base")) {
                        properties.add(PropertyFactory.textOpacity(Function.zoom(new ExponentialStops((float)map.getDouble("base"), stopsArray))));
                    }
                    else {
                        properties.add(PropertyFactory.textOpacity(Function.zoom(new ExponentialStops(stopsArray))));
                    }
                }
            }
            if (paintProperties.hasKey("text-color")) {
                if (paintProperties.getType("text-color") == ReadableType.String) {
                    properties.add(PropertyFactory.textColor(
                        paintProperties.getString("text-color")
                    ));
                }
                else if (paintProperties.getType("text-color") == ReadableType.Map) {
                    ReadableMap map = paintProperties.getMap("text-color");
                    ReadableArray stops = map.getArray("stops");
                    Stop[] stopsArray = new Stop[stops.size()];
                    for (int i = 0; i < stops.size(); i++) {
                        stopsArray[i] = Stop.stop(
                            (float)stops.getArray(i).getDouble(0),
                            PropertyFactory.textColor(
                                stops.getArray(i).getString(1)
                            )
                        );
                    }
                    if (map.hasKey("base")) {
                        properties.add(PropertyFactory.textColor(Function.zoom(new ExponentialStops((float)map.getDouble("base"), stopsArray))));
                    }
                    else {
                        properties.add(PropertyFactory.textColor(Function.zoom(new ExponentialStops(stopsArray))));
                    }
                }
            }
            if (paintProperties.hasKey("text-halo-color")) {
                if (paintProperties.getType("text-halo-color") == ReadableType.String) {
                    properties.add(PropertyFactory.textHaloColor(
                        paintProperties.getString("text-halo-color")
                    ));
                }
                else if (paintProperties.getType("text-halo-color") == ReadableType.Map) {
                    ReadableMap map = paintProperties.getMap("text-halo-color");
                    ReadableArray stops = map.getArray("stops");
                    Stop[] stopsArray = new Stop[stops.size()];
                    for (int i = 0; i < stops.size(); i++) {
                        stopsArray[i] = Stop.stop(
                            (float)stops.getArray(i).getDouble(0),
                            PropertyFactory.textHaloColor(
                                stops.getArray(i).getString(1)
                            )
                        );
                    }
                    if (map.hasKey("base")) {
                        properties.add(PropertyFactory.textHaloColor(Function.zoom(new ExponentialStops((float)map.getDouble("base"), stopsArray))));
                    }
                    else {
                        properties.add(PropertyFactory.textHaloColor(Function.zoom(new ExponentialStops(stopsArray))));
                    }
                }
            }
            if (paintProperties.hasKey("text-halo-width")) {
                if (paintProperties.getType("text-halo-width") == ReadableType.Number) {
                    properties.add(PropertyFactory.textHaloWidth(
                        (float)paintProperties.getDouble("text-halo-width")
                    ));
                }
                else if (paintProperties.getType("text-halo-width") == ReadableType.Map) {
                    ReadableMap map = paintProperties.getMap("text-halo-width");
                    ReadableArray stops = map.getArray("stops");
                    Stop[] stopsArray = new Stop[stops.size()];
                    for (int i = 0; i < stops.size(); i++) {
                        stopsArray[i] = Stop.stop(
                            (float)stops.getArray(i).getDouble(0),
                            PropertyFactory.textHaloWidth(
                                (float)stops.getArray(i).getDouble(1)
                            )
                        );
                    }
                    if (map.hasKey("base")) {
                        properties.add(PropertyFactory.textHaloWidth(Function.zoom(new ExponentialStops((float)map.getDouble("base"), stopsArray))));
                    }
                    else {
                        properties.add(PropertyFactory.textHaloWidth(Function.zoom(new ExponentialStops(stopsArray))));
                    }
                }
            }
            if (paintProperties.hasKey("text-halo-blur")) {
                if (paintProperties.getType("text-halo-blur") == ReadableType.Number) {
                    properties.add(PropertyFactory.textHaloBlur(
                        (float)paintProperties.getDouble("text-halo-blur")
                    ));
                }
                else if (paintProperties.getType("text-halo-blur") == ReadableType.Map) {
                    ReadableMap map = paintProperties.getMap("text-halo-blur");
                    ReadableArray stops = map.getArray("stops");
                    Stop[] stopsArray = new Stop[stops.size()];
                    for (int i = 0; i < stops.size(); i++) {
                        stopsArray[i] = Stop.stop(
                            (float)stops.getArray(i).getDouble(0),
                            PropertyFactory.textHaloBlur(
                                (float)stops.getArray(i).getDouble(1)
                            )
                        );
                    }
                    if (map.hasKey("base")) {
                        properties.add(PropertyFactory.textHaloBlur(Function.zoom(new ExponentialStops((float)map.getDouble("base"), stopsArray))));
                    }
                    else {
                        properties.add(PropertyFactory.textHaloBlur(Function.zoom(new ExponentialStops(stopsArray))));
                    }
                }
            }
            if (paintProperties.hasKey("text-translate")) {
                if (paintProperties.getType("text-translate") == ReadableType.Array) {
                    properties.add(PropertyFactory.textTranslate(
                        ReadableArrToNumberArr(paintProperties.getArray("text-translate"), 0)
                    ));
                }
                else if (paintProperties.getType("text-translate") == ReadableType.Map) {
                    ReadableMap map = paintProperties.getMap("text-translate");
                    ReadableArray stops = map.getArray("stops");
                    Stop[] stopsArray = new Stop[stops.size()];
                    for (int i = 0; i < stops.size(); i++) {
                        stopsArray[i] = Stop.stop(
                            (float)stops.getArray(i).getDouble(0),
                            PropertyFactory.textTranslate(
                                ReadableArrToNumberArr(stops.getArray(i).getArray(1), 0)
                            )
                        );
                    }
                    if (map.hasKey("base")) {
                        properties.add(PropertyFactory.textTranslate(Function.zoom(new ExponentialStops((float)map.getDouble("base"), stopsArray))));
                    }
                    else {
                        properties.add(PropertyFactory.textTranslate(Function.zoom(new ExponentialStops(stopsArray))));
                    }
                }
            }
            if (paintProperties.hasKey("text-translate-anchor")) {
                if (paintProperties.getType("text-translate-anchor") == ReadableType.String) {
                    properties.add(PropertyFactory.textTranslateAnchor(
                        paintProperties.getString("text-translate-anchor")
                    ));
                }
                else if (paintProperties.getType("text-translate-anchor") == ReadableType.Map) {
                    ReadableMap map = paintProperties.getMap("text-translate-anchor");
                    ReadableArray stops = map.getArray("stops");
                    Stop[] stopsArray = new Stop[stops.size()];
                    for (int i = 0; i < stops.size(); i++) {
                        stopsArray[i] = Stop.stop(
                            (float)stops.getArray(i).getDouble(0),
                            PropertyFactory.textTranslateAnchor(
                                stops.getArray(i).getString(1)
                            )
                        );
                    }
                    properties.add(PropertyFactory.textTranslateAnchor(Function.zoom(new IntervalStops(stopsArray))));
                }
            }
        }
        if (layerJson.hasKey("layout")) {
            ReadableMap layoutProperties = layerJson.getMap("layout");
            if (layoutProperties.hasKey("symbol-placement")) {
                if (layoutProperties.getType("symbol-placement") == ReadableType.String) {
                    properties.add(PropertyFactory.symbolPlacement(
                        layoutProperties.getString("symbol-placement")
                    ));
                }
                else if (layoutProperties.getType("symbol-placement") == ReadableType.Map) {
                    ReadableMap map = layoutProperties.getMap("symbol-placement");
                    ReadableArray stops = map.getArray("stops");
                    Stop[] stopsArray = new Stop[stops.size()];
                    for (int i = 0; i < stops.size(); i++) {
                        stopsArray[i] = Stop.stop(
                            (float)stops.getArray(i).getDouble(0),
                            PropertyFactory.symbolPlacement(
                                stops.getArray(i).getString(1)
                            )
                        );
                    }
                    properties.add(PropertyFactory.symbolPlacement(Function.zoom(new IntervalStops(stopsArray))));
                }
            }
            if (layoutProperties.hasKey("symbol-spacing")) {
                if (layoutProperties.getType("symbol-spacing") == ReadableType.Number) {
                    properties.add(PropertyFactory.symbolSpacing(
                        (float)layoutProperties.getDouble("symbol-spacing")
                    ));
                }
                else if (layoutProperties.getType("symbol-spacing") == ReadableType.Map) {
                    ReadableMap map = layoutProperties.getMap("symbol-spacing");
                    ReadableArray stops = map.getArray("stops");
                    Stop[] stopsArray = new Stop[stops.size()];
                    for (int i = 0; i < stops.size(); i++) {
                        stopsArray[i] = Stop.stop(
                            (float)stops.getArray(i).getDouble(0),
                            PropertyFactory.symbolSpacing(
                                (float)stops.getArray(i).getDouble(1)
                            )
                        );
                    }
                    if (map.hasKey("base")) {
                        properties.add(PropertyFactory.symbolSpacing(Function.zoom(new ExponentialStops((float)map.getDouble("base"), stopsArray))));
                    }
                    else {
                        properties.add(PropertyFactory.symbolSpacing(Function.zoom(new ExponentialStops(stopsArray))));
                    }
                }
            }
            if (layoutProperties.hasKey("symbol-avoid-edges")) {
                if (layoutProperties.getType("symbol-avoid-edges") == ReadableType.Boolean) {
                    properties.add(PropertyFactory.symbolAvoidEdges(
                        layoutProperties.getBoolean("symbol-avoid-edges")
                    ));
                }
                else if (layoutProperties.getType("symbol-avoid-edges") == ReadableType.Map) {
                    ReadableMap map = layoutProperties.getMap("symbol-avoid-edges");
                    ReadableArray stops = map.getArray("stops");
                    Stop[] stopsArray = new Stop[stops.size()];
                    for (int i = 0; i < stops.size(); i++) {
                        stopsArray[i] = Stop.stop(
                            (float)stops.getArray(i).getDouble(0),
                            PropertyFactory.symbolAvoidEdges(
                                stops.getArray(i).getBoolean(1)
                            )
                        );
                    }
                    properties.add(PropertyFactory.symbolAvoidEdges(Function.zoom(new IntervalStops(stopsArray))));
                }
            }
            if (layoutProperties.hasKey("icon-allow-overlap")) {
                if (layoutProperties.getType("icon-allow-overlap") == ReadableType.Boolean) {
                    properties.add(PropertyFactory.iconAllowOverlap(
                        layoutProperties.getBoolean("icon-allow-overlap")
                    ));
                }
                else if (layoutProperties.getType("icon-allow-overlap") == ReadableType.Map) {
                    ReadableMap map = layoutProperties.getMap("icon-allow-overlap");
                    ReadableArray stops = map.getArray("stops");
                    Stop[] stopsArray = new Stop[stops.size()];
                    for (int i = 0; i < stops.size(); i++) {
                        stopsArray[i] = Stop.stop(
                            (float)stops.getArray(i).getDouble(0),
                            PropertyFactory.iconAllowOverlap(
                                stops.getArray(i).getBoolean(1)
                            )
                        );
                    }
                    properties.add(PropertyFactory.iconAllowOverlap(Function.zoom(new IntervalStops(stopsArray))));
                }
            }
            if (layoutProperties.hasKey("icon-ignore-placement")) {
                if (layoutProperties.getType("icon-ignore-placement") == ReadableType.Boolean) {
                    properties.add(PropertyFactory.iconIgnorePlacement(
                        layoutProperties.getBoolean("icon-ignore-placement")
                    ));
                }
                else if (layoutProperties.getType("icon-ignore-placement") == ReadableType.Map) {
                    ReadableMap map = layoutProperties.getMap("icon-ignore-placement");
                    ReadableArray stops = map.getArray("stops");
                    Stop[] stopsArray = new Stop[stops.size()];
                    for (int i = 0; i < stops.size(); i++) {
                        stopsArray[i] = Stop.stop(
                            (float)stops.getArray(i).getDouble(0),
                            PropertyFactory.iconIgnorePlacement(
                                stops.getArray(i).getBoolean(1)
                            )
                        );
                    }
                    properties.add(PropertyFactory.iconIgnorePlacement(Function.zoom(new IntervalStops(stopsArray))));
                }
            }
            if (layoutProperties.hasKey("icon-optional")) {
                if (layoutProperties.getType("icon-optional") == ReadableType.Boolean) {
                    properties.add(PropertyFactory.iconOptional(
                        layoutProperties.getBoolean("icon-optional")
                    ));
                }
                else if (layoutProperties.getType("icon-optional") == ReadableType.Map) {
                    ReadableMap map = layoutProperties.getMap("icon-optional");
                    ReadableArray stops = map.getArray("stops");
                    Stop[] stopsArray = new Stop[stops.size()];
                    for (int i = 0; i < stops.size(); i++) {
                        stopsArray[i] = Stop.stop(
                            (float)stops.getArray(i).getDouble(0),
                            PropertyFactory.iconOptional(
                                stops.getArray(i).getBoolean(1)
                            )
                        );
                    }
                    properties.add(PropertyFactory.iconOptional(Function.zoom(new IntervalStops(stopsArray))));
                }
            }
            if (layoutProperties.hasKey("icon-rotation-alignment")) {
                if (layoutProperties.getType("icon-rotation-alignment") == ReadableType.String) {
                    properties.add(PropertyFactory.iconRotationAlignment(
                        layoutProperties.getString("icon-rotation-alignment")
                    ));
                }
                else if (layoutProperties.getType("icon-rotation-alignment") == ReadableType.Map) {
                    ReadableMap map = layoutProperties.getMap("icon-rotation-alignment");
                    ReadableArray stops = map.getArray("stops");
                    Stop[] stopsArray = new Stop[stops.size()];
                    for (int i = 0; i < stops.size(); i++) {
                        stopsArray[i] = Stop.stop(
                            (float)stops.getArray(i).getDouble(0),
                            PropertyFactory.iconRotationAlignment(
                                stops.getArray(i).getString(1)
                            )
                        );
                    }
                    properties.add(PropertyFactory.iconRotationAlignment(Function.zoom(new IntervalStops(stopsArray))));
                }
            }
            if (layoutProperties.hasKey("icon-size")) {
                if (layoutProperties.getType("icon-size") == ReadableType.Number) {
                    properties.add(PropertyFactory.iconSize(
                        (float)layoutProperties.getDouble("icon-size")
                    ));
                }
                else if (layoutProperties.getType("icon-size") == ReadableType.Map) {
                    ReadableMap map = layoutProperties.getMap("icon-size");
                    ReadableArray stops = map.getArray("stops");
                    Stop[] stopsArray = new Stop[stops.size()];
                    for (int i = 0; i < stops.size(); i++) {
                        stopsArray[i] = Stop.stop(
                            (float)stops.getArray(i).getDouble(0),
                            PropertyFactory.iconSize(
                                (float)stops.getArray(i).getDouble(1)
                            )
                        );
                    }
                    if (map.hasKey("base")) {
                        properties.add(PropertyFactory.iconSize(Function.zoom(new ExponentialStops((float)map.getDouble("base"), stopsArray))));
                    }
                    else {
                        properties.add(PropertyFactory.iconSize(Function.zoom(new ExponentialStops(stopsArray))));
                    }
                }
            }
            if (layoutProperties.hasKey("icon-text-fit")) {
                if (layoutProperties.getType("icon-text-fit") == ReadableType.String) {
                    properties.add(PropertyFactory.iconTextFit(
                        layoutProperties.getString("icon-text-fit")
                    ));
                }
                else if (layoutProperties.getType("icon-text-fit") == ReadableType.Map) {
                    ReadableMap map = layoutProperties.getMap("icon-text-fit");
                    ReadableArray stops = map.getArray("stops");
                    Stop[] stopsArray = new Stop[stops.size()];
                    for (int i = 0; i < stops.size(); i++) {
                        stopsArray[i] = Stop.stop(
                            (float)stops.getArray(i).getDouble(0),
                            PropertyFactory.iconTextFit(
                                stops.getArray(i).getString(1)
                            )
                        );
                    }
                    properties.add(PropertyFactory.iconTextFit(Function.zoom(new IntervalStops(stopsArray))));
                }
            }
            if (layoutProperties.hasKey("icon-text-fit-padding")) {
                if (layoutProperties.getType("icon-text-fit-padding") == ReadableType.Array) {
                    properties.add(PropertyFactory.iconTextFitPadding(
                        ReadableArrToNumberArr(layoutProperties.getArray("icon-text-fit-padding"), 0)
                    ));
                }
                else if (layoutProperties.getType("icon-text-fit-padding") == ReadableType.Map) {
                    ReadableMap map = layoutProperties.getMap("icon-text-fit-padding");
                    ReadableArray stops = map.getArray("stops");
                    Stop[] stopsArray = new Stop[stops.size()];
                    for (int i = 0; i < stops.size(); i++) {
                        stopsArray[i] = Stop.stop(
                            (float)stops.getArray(i).getDouble(0),
                            PropertyFactory.iconTextFitPadding(
                                ReadableArrToNumberArr(stops.getArray(i).getArray(1), 0)
                            )
                        );
                    }
                    if (map.hasKey("base")) {
                        properties.add(PropertyFactory.iconTextFitPadding(Function.zoom(new ExponentialStops((float)map.getDouble("base"), stopsArray))));
                    }
                    else {
                        properties.add(PropertyFactory.iconTextFitPadding(Function.zoom(new ExponentialStops(stopsArray))));
                    }
                }
            }
            if (layoutProperties.hasKey("icon-image")) {
                if (layoutProperties.getType("icon-image") == ReadableType.String) {
                    properties.add(PropertyFactory.iconImage(
                        layoutProperties.getString("icon-image")
                    ));
                }
                else if (layoutProperties.getType("icon-image") == ReadableType.Map) {
                    ReadableMap map = layoutProperties.getMap("icon-image");
                    ReadableArray stops = map.getArray("stops");
                    Stop[] stopsArray = new Stop[stops.size()];
                    for (int i = 0; i < stops.size(); i++) {
                        stopsArray[i] = Stop.stop(
                            (float)stops.getArray(i).getDouble(0),
                            PropertyFactory.iconImage(
                                stops.getArray(i).getString(1)
                            )
                        );
                    }
                    properties.add(PropertyFactory.iconImage(Function.zoom(new IntervalStops(stopsArray))));
                }
            }
            if (layoutProperties.hasKey("icon-rotate")) {
                if (layoutProperties.getType("icon-rotate") == ReadableType.Number) {
                    properties.add(PropertyFactory.iconRotate(
                        (float)layoutProperties.getDouble("icon-rotate")
                    ));
                }
                else if (layoutProperties.getType("icon-rotate") == ReadableType.Map) {
                    ReadableMap map = layoutProperties.getMap("icon-rotate");
                    ReadableArray stops = map.getArray("stops");
                    Stop[] stopsArray = new Stop[stops.size()];
                    for (int i = 0; i < stops.size(); i++) {
                        stopsArray[i] = Stop.stop(
                            (float)stops.getArray(i).getDouble(0),
                            PropertyFactory.iconRotate(
                                (float)stops.getArray(i).getDouble(1)
                            )
                        );
                    }
                    if (map.hasKey("base")) {
                        properties.add(PropertyFactory.iconRotate(Function.zoom(new ExponentialStops((float)map.getDouble("base"), stopsArray))));
                    }
                    else {
                        properties.add(PropertyFactory.iconRotate(Function.zoom(new ExponentialStops(stopsArray))));
                    }
                }
            }
            if (layoutProperties.hasKey("icon-padding")) {
                if (layoutProperties.getType("icon-padding") == ReadableType.Number) {
                    properties.add(PropertyFactory.iconPadding(
                        (float)layoutProperties.getDouble("icon-padding")
                    ));
                }
                else if (layoutProperties.getType("icon-padding") == ReadableType.Map) {
                    ReadableMap map = layoutProperties.getMap("icon-padding");
                    ReadableArray stops = map.getArray("stops");
                    Stop[] stopsArray = new Stop[stops.size()];
                    for (int i = 0; i < stops.size(); i++) {
                        stopsArray[i] = Stop.stop(
                            (float)stops.getArray(i).getDouble(0),
                            PropertyFactory.iconPadding(
                                (float)stops.getArray(i).getDouble(1)
                            )
                        );
                    }
                    if (map.hasKey("base")) {
                        properties.add(PropertyFactory.iconPadding(Function.zoom(new ExponentialStops((float)map.getDouble("base"), stopsArray))));
                    }
                    else {
                        properties.add(PropertyFactory.iconPadding(Function.zoom(new ExponentialStops(stopsArray))));
                    }
                }
            }
            if (layoutProperties.hasKey("icon-keep-upright")) {
                if (layoutProperties.getType("icon-keep-upright") == ReadableType.Boolean) {
                    properties.add(PropertyFactory.iconKeepUpright(
                        layoutProperties.getBoolean("icon-keep-upright")
                    ));
                }
                else if (layoutProperties.getType("icon-keep-upright") == ReadableType.Map) {
                    ReadableMap map = layoutProperties.getMap("icon-keep-upright");
                    ReadableArray stops = map.getArray("stops");
                    Stop[] stopsArray = new Stop[stops.size()];
                    for (int i = 0; i < stops.size(); i++) {
                        stopsArray[i] = Stop.stop(
                            (float)stops.getArray(i).getDouble(0),
                            PropertyFactory.iconKeepUpright(
                                stops.getArray(i).getBoolean(1)
                            )
                        );
                    }
                    properties.add(PropertyFactory.iconKeepUpright(Function.zoom(new IntervalStops(stopsArray))));
                }
            }
            if (layoutProperties.hasKey("icon-offset")) {
                if (layoutProperties.getType("icon-offset") == ReadableType.Array) {
                    properties.add(PropertyFactory.iconOffset(
                        ReadableArrToNumberArr(layoutProperties.getArray("icon-offset"), 0)
                    ));
                }
                else if (layoutProperties.getType("icon-offset") == ReadableType.Map) {
                    ReadableMap map = layoutProperties.getMap("icon-offset");
                    ReadableArray stops = map.getArray("stops");
                    Stop[] stopsArray = new Stop[stops.size()];
                    for (int i = 0; i < stops.size(); i++) {
                        stopsArray[i] = Stop.stop(
                            (float)stops.getArray(i).getDouble(0),
                            PropertyFactory.iconOffset(
                                ReadableArrToNumberArr(stops.getArray(i).getArray(1), 0)
                            )
                        );
                    }
                    if (map.hasKey("base")) {
                        properties.add(PropertyFactory.iconOffset(Function.zoom(new ExponentialStops((float)map.getDouble("base"), stopsArray))));
                    }
                    else {
                        properties.add(PropertyFactory.iconOffset(Function.zoom(new ExponentialStops(stopsArray))));
                    }
                }
            }
            if (layoutProperties.hasKey("text-pitch-alignment")) {
                if (layoutProperties.getType("text-pitch-alignment") == ReadableType.String) {
                    properties.add(PropertyFactory.textPitchAlignment(
                        layoutProperties.getString("text-pitch-alignment")
                    ));
                }
                else if (layoutProperties.getType("text-pitch-alignment") == ReadableType.Map) {
                    ReadableMap map = layoutProperties.getMap("text-pitch-alignment");
                    ReadableArray stops = map.getArray("stops");
                    Stop[] stopsArray = new Stop[stops.size()];
                    for (int i = 0; i < stops.size(); i++) {
                        stopsArray[i] = Stop.stop(
                            (float)stops.getArray(i).getDouble(0),
                            PropertyFactory.textPitchAlignment(
                                stops.getArray(i).getString(1)
                            )
                        );
                    }
                    properties.add(PropertyFactory.textPitchAlignment(Function.zoom(new IntervalStops(stopsArray))));
                }
            }
            if (layoutProperties.hasKey("text-rotation-alignment")) {
                if (layoutProperties.getType("text-rotation-alignment") == ReadableType.String) {
                    properties.add(PropertyFactory.textRotationAlignment(
                        layoutProperties.getString("text-rotation-alignment")
                    ));
                }
                else if (layoutProperties.getType("text-rotation-alignment") == ReadableType.Map) {
                    ReadableMap map = layoutProperties.getMap("text-rotation-alignment");
                    ReadableArray stops = map.getArray("stops");
                    Stop[] stopsArray = new Stop[stops.size()];
                    for (int i = 0; i < stops.size(); i++) {
                        stopsArray[i] = Stop.stop(
                            (float)stops.getArray(i).getDouble(0),
                            PropertyFactory.textRotationAlignment(
                                stops.getArray(i).getString(1)
                            )
                        );
                    }
                    properties.add(PropertyFactory.textRotationAlignment(Function.zoom(new IntervalStops(stopsArray))));
                }
            }
            if (layoutProperties.hasKey("text-field")) {
                if (layoutProperties.getType("text-field") == ReadableType.String) {
                    properties.add(PropertyFactory.textField(
                        layoutProperties.getString("text-field")
                    ));
                }
                else if (layoutProperties.getType("text-field") == ReadableType.Map) {
                    ReadableMap map = layoutProperties.getMap("text-field");
                    ReadableArray stops = map.getArray("stops");
                    Stop[] stopsArray = new Stop[stops.size()];
                    for (int i = 0; i < stops.size(); i++) {
                        stopsArray[i] = Stop.stop(
                            (float)stops.getArray(i).getDouble(0),
                            PropertyFactory.textField(
                                stops.getArray(i).getString(1)
                            )
                        );
                    }
                    properties.add(PropertyFactory.textField(Function.zoom(new IntervalStops(stopsArray))));
                }
            }
            if (layoutProperties.hasKey("text-font")) {
                if (layoutProperties.getType("text-font") == ReadableType.Array) {
                    properties.add(PropertyFactory.textFont(
                        ReadableArrToStringArr(layoutProperties.getArray("text-font"), 0)
                    ));
                }
                else if (layoutProperties.getType("text-font") == ReadableType.Map) {
                    ReadableMap map = layoutProperties.getMap("text-font");
                    ReadableArray stops = map.getArray("stops");
                    Stop[] stopsArray = new Stop[stops.size()];
                    for (int i = 0; i < stops.size(); i++) {
                        stopsArray[i] = Stop.stop(
                            (float)stops.getArray(i).getDouble(0),
                            PropertyFactory.textFont(
                                ReadableArrToStringArr(stops.getArray(i).getArray(1), 0)
                            )
                        );
                    }
                    properties.add(PropertyFactory.textFont(Function.zoom(new IntervalStops(stopsArray))));
                }
            }
            if (layoutProperties.hasKey("text-size")) {
                if (layoutProperties.getType("text-size") == ReadableType.Number) {
                    properties.add(PropertyFactory.textSize(
                        (float)layoutProperties.getDouble("text-size")
                    ));
                }
                else if (layoutProperties.getType("text-size") == ReadableType.Map) {
                    ReadableMap map = layoutProperties.getMap("text-size");
                    ReadableArray stops = map.getArray("stops");
                    Stop[] stopsArray = new Stop[stops.size()];
                    for (int i = 0; i < stops.size(); i++) {
                        stopsArray[i] = Stop.stop(
                            (float)stops.getArray(i).getDouble(0),
                            PropertyFactory.textSize(
                                (float)stops.getArray(i).getDouble(1)
                            )
                        );
                    }
                    if (map.hasKey("base")) {
                        properties.add(PropertyFactory.textSize(Function.zoom(new ExponentialStops((float)map.getDouble("base"), stopsArray))));
                    }
                    else {
                        properties.add(PropertyFactory.textSize(Function.zoom(new ExponentialStops(stopsArray))));
                    }
                }
            }
            if (layoutProperties.hasKey("text-max-width")) {
                if (layoutProperties.getType("text-max-width") == ReadableType.Number) {
                    properties.add(PropertyFactory.textMaxWidth(
                        (float)layoutProperties.getDouble("text-max-width")
                    ));
                }
                else if (layoutProperties.getType("text-max-width") == ReadableType.Map) {
                    ReadableMap map = layoutProperties.getMap("text-max-width");
                    ReadableArray stops = map.getArray("stops");
                    Stop[] stopsArray = new Stop[stops.size()];
                    for (int i = 0; i < stops.size(); i++) {
                        stopsArray[i] = Stop.stop(
                            (float)stops.getArray(i).getDouble(0),
                            PropertyFactory.textMaxWidth(
                                (float)stops.getArray(i).getDouble(1)
                            )
                        );
                    }
                    if (map.hasKey("base")) {
                        properties.add(PropertyFactory.textMaxWidth(Function.zoom(new ExponentialStops((float)map.getDouble("base"), stopsArray))));
                    }
                    else {
                        properties.add(PropertyFactory.textMaxWidth(Function.zoom(new ExponentialStops(stopsArray))));
                    }
                }
            }
            if (layoutProperties.hasKey("text-line-height")) {
                if (layoutProperties.getType("text-line-height") == ReadableType.Number) {
                    properties.add(PropertyFactory.textLineHeight(
                        (float)layoutProperties.getDouble("text-line-height")
                    ));
                }
                else if (layoutProperties.getType("text-line-height") == ReadableType.Map) {
                    ReadableMap map = layoutProperties.getMap("text-line-height");
                    ReadableArray stops = map.getArray("stops");
                    Stop[] stopsArray = new Stop[stops.size()];
                    for (int i = 0; i < stops.size(); i++) {
                        stopsArray[i] = Stop.stop(
                            (float)stops.getArray(i).getDouble(0),
                            PropertyFactory.textLineHeight(
                                (float)stops.getArray(i).getDouble(1)
                            )
                        );
                    }
                    if (map.hasKey("base")) {
                        properties.add(PropertyFactory.textLineHeight(Function.zoom(new ExponentialStops((float)map.getDouble("base"), stopsArray))));
                    }
                    else {
                        properties.add(PropertyFactory.textLineHeight(Function.zoom(new ExponentialStops(stopsArray))));
                    }
                }
            }
            if (layoutProperties.hasKey("text-letter-spacing")) {
                if (layoutProperties.getType("text-letter-spacing") == ReadableType.Number) {
                    properties.add(PropertyFactory.textLetterSpacing(
                        (float)layoutProperties.getDouble("text-letter-spacing")
                    ));
                }
                else if (layoutProperties.getType("text-letter-spacing") == ReadableType.Map) {
                    ReadableMap map = layoutProperties.getMap("text-letter-spacing");
                    ReadableArray stops = map.getArray("stops");
                    Stop[] stopsArray = new Stop[stops.size()];
                    for (int i = 0; i < stops.size(); i++) {
                        stopsArray[i] = Stop.stop(
                            (float)stops.getArray(i).getDouble(0),
                            PropertyFactory.textLetterSpacing(
                                (float)stops.getArray(i).getDouble(1)
                            )
                        );
                    }
                    if (map.hasKey("base")) {
                        properties.add(PropertyFactory.textLetterSpacing(Function.zoom(new ExponentialStops((float)map.getDouble("base"), stopsArray))));
                    }
                    else {
                        properties.add(PropertyFactory.textLetterSpacing(Function.zoom(new ExponentialStops(stopsArray))));
                    }
                }
            }
            if (layoutProperties.hasKey("text-justify")) {
                if (layoutProperties.getType("text-justify") == ReadableType.String) {
                    properties.add(PropertyFactory.textJustify(
                        layoutProperties.getString("text-justify")
                    ));
                }
                else if (layoutProperties.getType("text-justify") == ReadableType.Map) {
                    ReadableMap map = layoutProperties.getMap("text-justify");
                    ReadableArray stops = map.getArray("stops");
                    Stop[] stopsArray = new Stop[stops.size()];
                    for (int i = 0; i < stops.size(); i++) {
                        stopsArray[i] = Stop.stop(
                            (float)stops.getArray(i).getDouble(0),
                            PropertyFactory.textJustify(
                                stops.getArray(i).getString(1)
                            )
                        );
                    }
                    properties.add(PropertyFactory.textJustify(Function.zoom(new IntervalStops(stopsArray))));
                }
            }
            if (layoutProperties.hasKey("text-anchor")) {
                if (layoutProperties.getType("text-anchor") == ReadableType.String) {
                    properties.add(PropertyFactory.textAnchor(
                        layoutProperties.getString("text-anchor")
                    ));
                }
                else if (layoutProperties.getType("text-anchor") == ReadableType.Map) {
                    ReadableMap map = layoutProperties.getMap("text-anchor");
                    ReadableArray stops = map.getArray("stops");
                    Stop[] stopsArray = new Stop[stops.size()];
                    for (int i = 0; i < stops.size(); i++) {
                        stopsArray[i] = Stop.stop(
                            (float)stops.getArray(i).getDouble(0),
                            PropertyFactory.textAnchor(
                                stops.getArray(i).getString(1)
                            )
                        );
                    }
                    properties.add(PropertyFactory.textAnchor(Function.zoom(new IntervalStops(stopsArray))));
                }
            }
            if (layoutProperties.hasKey("text-max-angle")) {
                if (layoutProperties.getType("text-max-angle") == ReadableType.Number) {
                    properties.add(PropertyFactory.textMaxAngle(
                        (float)layoutProperties.getDouble("text-max-angle")
                    ));
                }
                else if (layoutProperties.getType("text-max-angle") == ReadableType.Map) {
                    ReadableMap map = layoutProperties.getMap("text-max-angle");
                    ReadableArray stops = map.getArray("stops");
                    Stop[] stopsArray = new Stop[stops.size()];
                    for (int i = 0; i < stops.size(); i++) {
                        stopsArray[i] = Stop.stop(
                            (float)stops.getArray(i).getDouble(0),
                            PropertyFactory.textMaxAngle(
                                (float)stops.getArray(i).getDouble(1)
                            )
                        );
                    }
                    if (map.hasKey("base")) {
                        properties.add(PropertyFactory.textMaxAngle(Function.zoom(new ExponentialStops((float)map.getDouble("base"), stopsArray))));
                    }
                    else {
                        properties.add(PropertyFactory.textMaxAngle(Function.zoom(new ExponentialStops(stopsArray))));
                    }
                }
            }
            if (layoutProperties.hasKey("text-rotate")) {
                if (layoutProperties.getType("text-rotate") == ReadableType.Number) {
                    properties.add(PropertyFactory.textRotate(
                        (float)layoutProperties.getDouble("text-rotate")
                    ));
                }
                else if (layoutProperties.getType("text-rotate") == ReadableType.Map) {
                    ReadableMap map = layoutProperties.getMap("text-rotate");
                    ReadableArray stops = map.getArray("stops");
                    Stop[] stopsArray = new Stop[stops.size()];
                    for (int i = 0; i < stops.size(); i++) {
                        stopsArray[i] = Stop.stop(
                            (float)stops.getArray(i).getDouble(0),
                            PropertyFactory.textRotate(
                                (float)stops.getArray(i).getDouble(1)
                            )
                        );
                    }
                    if (map.hasKey("base")) {
                        properties.add(PropertyFactory.textRotate(Function.zoom(new ExponentialStops((float)map.getDouble("base"), stopsArray))));
                    }
                    else {
                        properties.add(PropertyFactory.textRotate(Function.zoom(new ExponentialStops(stopsArray))));
                    }
                }
            }
            if (layoutProperties.hasKey("text-padding")) {
                if (layoutProperties.getType("text-padding") == ReadableType.Number) {
                    properties.add(PropertyFactory.textPadding(
                        (float)layoutProperties.getDouble("text-padding")
                    ));
                }
                else if (layoutProperties.getType("text-padding") == ReadableType.Map) {
                    ReadableMap map = layoutProperties.getMap("text-padding");
                    ReadableArray stops = map.getArray("stops");
                    Stop[] stopsArray = new Stop[stops.size()];
                    for (int i = 0; i < stops.size(); i++) {
                        stopsArray[i] = Stop.stop(
                            (float)stops.getArray(i).getDouble(0),
                            PropertyFactory.textPadding(
                                (float)stops.getArray(i).getDouble(1)
                            )
                        );
                    }
                    if (map.hasKey("base")) {
                        properties.add(PropertyFactory.textPadding(Function.zoom(new ExponentialStops((float)map.getDouble("base"), stopsArray))));
                    }
                    else {
                        properties.add(PropertyFactory.textPadding(Function.zoom(new ExponentialStops(stopsArray))));
                    }
                }
            }
            if (layoutProperties.hasKey("text-keep-upright")) {
                if (layoutProperties.getType("text-keep-upright") == ReadableType.Boolean) {
                    properties.add(PropertyFactory.textKeepUpright(
                        layoutProperties.getBoolean("text-keep-upright")
                    ));
                }
                else if (layoutProperties.getType("text-keep-upright") == ReadableType.Map) {
                    ReadableMap map = layoutProperties.getMap("text-keep-upright");
                    ReadableArray stops = map.getArray("stops");
                    Stop[] stopsArray = new Stop[stops.size()];
                    for (int i = 0; i < stops.size(); i++) {
                        stopsArray[i] = Stop.stop(
                            (float)stops.getArray(i).getDouble(0),
                            PropertyFactory.textKeepUpright(
                                stops.getArray(i).getBoolean(1)
                            )
                        );
                    }
                    properties.add(PropertyFactory.textKeepUpright(Function.zoom(new IntervalStops(stopsArray))));
                }
            }
            if (layoutProperties.hasKey("text-transform")) {
                if (layoutProperties.getType("text-transform") == ReadableType.String) {
                    properties.add(PropertyFactory.textTransform(
                        layoutProperties.getString("text-transform")
                    ));
                }
                else if (layoutProperties.getType("text-transform") == ReadableType.Map) {
                    ReadableMap map = layoutProperties.getMap("text-transform");
                    ReadableArray stops = map.getArray("stops");
                    Stop[] stopsArray = new Stop[stops.size()];
                    for (int i = 0; i < stops.size(); i++) {
                        stopsArray[i] = Stop.stop(
                            (float)stops.getArray(i).getDouble(0),
                            PropertyFactory.textTransform(
                                stops.getArray(i).getString(1)
                            )
                        );
                    }
                    properties.add(PropertyFactory.textTransform(Function.zoom(new IntervalStops(stopsArray))));
                }
            }
            if (layoutProperties.hasKey("text-offset")) {
                if (layoutProperties.getType("text-offset") == ReadableType.Array) {
                    properties.add(PropertyFactory.textOffset(
                        ReadableArrToNumberArr(layoutProperties.getArray("text-offset"), 0)
                    ));
                }
                else if (layoutProperties.getType("text-offset") == ReadableType.Map) {
                    ReadableMap map = layoutProperties.getMap("text-offset");
                    ReadableArray stops = map.getArray("stops");
                    Stop[] stopsArray = new Stop[stops.size()];
                    for (int i = 0; i < stops.size(); i++) {
                        stopsArray[i] = Stop.stop(
                            (float)stops.getArray(i).getDouble(0),
                            PropertyFactory.textOffset(
                                ReadableArrToNumberArr(stops.getArray(i).getArray(1), 0)
                            )
                        );
                    }
                    if (map.hasKey("base")) {
                        properties.add(PropertyFactory.textOffset(Function.zoom(new ExponentialStops((float)map.getDouble("base"), stopsArray))));
                    }
                    else {
                        properties.add(PropertyFactory.textOffset(Function.zoom(new ExponentialStops(stopsArray))));
                    }
                }
            }
            if (layoutProperties.hasKey("text-allow-overlap")) {
                if (layoutProperties.getType("text-allow-overlap") == ReadableType.Boolean) {
                    properties.add(PropertyFactory.textAllowOverlap(
                        layoutProperties.getBoolean("text-allow-overlap")
                    ));
                }
                else if (layoutProperties.getType("text-allow-overlap") == ReadableType.Map) {
                    ReadableMap map = layoutProperties.getMap("text-allow-overlap");
                    ReadableArray stops = map.getArray("stops");
                    Stop[] stopsArray = new Stop[stops.size()];
                    for (int i = 0; i < stops.size(); i++) {
                        stopsArray[i] = Stop.stop(
                            (float)stops.getArray(i).getDouble(0),
                            PropertyFactory.textAllowOverlap(
                                stops.getArray(i).getBoolean(1)
                            )
                        );
                    }
                    properties.add(PropertyFactory.textAllowOverlap(Function.zoom(new IntervalStops(stopsArray))));
                }
            }
            if (layoutProperties.hasKey("text-ignore-placement")) {
                if (layoutProperties.getType("text-ignore-placement") == ReadableType.Boolean) {
                    properties.add(PropertyFactory.textIgnorePlacement(
                        layoutProperties.getBoolean("text-ignore-placement")
                    ));
                }
                else if (layoutProperties.getType("text-ignore-placement") == ReadableType.Map) {
                    ReadableMap map = layoutProperties.getMap("text-ignore-placement");
                    ReadableArray stops = map.getArray("stops");
                    Stop[] stopsArray = new Stop[stops.size()];
                    for (int i = 0; i < stops.size(); i++) {
                        stopsArray[i] = Stop.stop(
                            (float)stops.getArray(i).getDouble(0),
                            PropertyFactory.textIgnorePlacement(
                                stops.getArray(i).getBoolean(1)
                            )
                        );
                    }
                    properties.add(PropertyFactory.textIgnorePlacement(Function.zoom(new IntervalStops(stopsArray))));
                }
            }
            if (layoutProperties.hasKey("text-optional")) {
                if (layoutProperties.getType("text-optional") == ReadableType.Boolean) {
                    properties.add(PropertyFactory.textOptional(
                        layoutProperties.getBoolean("text-optional")
                    ));
                }
                else if (layoutProperties.getType("text-optional") == ReadableType.Map) {
                    ReadableMap map = layoutProperties.getMap("text-optional");
                    ReadableArray stops = map.getArray("stops");
                    Stop[] stopsArray = new Stop[stops.size()];
                    for (int i = 0; i < stops.size(); i++) {
                        stopsArray[i] = Stop.stop(
                            (float)stops.getArray(i).getDouble(0),
                            PropertyFactory.textOptional(
                                stops.getArray(i).getBoolean(1)
                            )
                        );
                    }
                    properties.add(PropertyFactory.textOptional(Function.zoom(new IntervalStops(stopsArray))));
                }
            }
        }

        if (!layerJson.hasKey("source")) {
            throw new InvalidLayerException(String.format("addLayer(): layer '%s' must have a valid 'source' attribute", layerJson.getString("id")));
        }
        SymbolLayer layer = new SymbolLayer(layerJson.getString("id"), layerJson.getString("source"))
            .withProperties(properties.toArray(new Property[0]));

        if (layerJson.hasKey("source-layer")) {
            layer.setSourceLayer(layerJson.getString("source-layer"));
        }
        if (layerJson.hasKey("filter")) {
            ReadableArray filterJson = layerJson.getArray("filter");
            layer.setFilter(filterJsonToFilter(filterJson));
        }
        if (layerJson.hasKey("minzoom")) {
            layer.setMinZoom((float)layerJson.getDouble("minzoom"));
        }
        if (layerJson.hasKey("maxzoom")) {
            layer.setMaxZoom((float)layerJson.getDouble("maxzoom"));
        }

        return layer;
    }

    static CircleLayer circleLayerFromJson(ReadableMap layerJson) {
        ArrayList<PropertyValue> properties = new ArrayList<PropertyValue>();

        if (layerJson.hasKey("paint")) {
            ReadableMap paintProperties = layerJson.getMap("paint");
            if (paintProperties.hasKey("circle-radius")) {
                if (paintProperties.getType("circle-radius") == ReadableType.Number) {
                    properties.add(PropertyFactory.circleRadius(
                        (float)paintProperties.getDouble("circle-radius")
                    ));
                }
                else if (paintProperties.getType("circle-radius") == ReadableType.Map) {
                    ReadableMap map = paintProperties.getMap("circle-radius");
                    ReadableArray stops = map.getArray("stops");
                    Stop[] stopsArray = new Stop[stops.size()];
                    for (int i = 0; i < stops.size(); i++) {
                        stopsArray[i] = Stop.stop(
                            (float)stops.getArray(i).getDouble(0),
                            PropertyFactory.circleRadius(
                                (float)stops.getArray(i).getDouble(1)
                            )
                        );
                    }
                    if (map.hasKey("base")) {
                        properties.add(PropertyFactory.circleRadius(Function.zoom(new ExponentialStops((float)map.getDouble("base"), stopsArray))));
                    }
                    else {
                        properties.add(PropertyFactory.circleRadius(Function.zoom(new ExponentialStops(stopsArray))));
                    }
                }
            }
            if (paintProperties.hasKey("circle-color")) {
                if (paintProperties.getType("circle-color") == ReadableType.String) {
                    properties.add(PropertyFactory.circleColor(
                        paintProperties.getString("circle-color")
                    ));
                }
                else if (paintProperties.getType("circle-color") == ReadableType.Map) {
                    ReadableMap map = paintProperties.getMap("circle-color");
                    ReadableArray stops = map.getArray("stops");
                    Stop[] stopsArray = new Stop[stops.size()];
                    for (int i = 0; i < stops.size(); i++) {
                        stopsArray[i] = Stop.stop(
                            (float)stops.getArray(i).getDouble(0),
                            PropertyFactory.circleColor(
                                stops.getArray(i).getString(1)
                            )
                        );
                    }
                    if (map.hasKey("base")) {
                        properties.add(PropertyFactory.circleColor(Function.zoom(new ExponentialStops((float)map.getDouble("base"), stopsArray))));
                    }
                    else {
                        properties.add(PropertyFactory.circleColor(Function.zoom(new ExponentialStops(stopsArray))));
                    }
                }
            }
            if (paintProperties.hasKey("circle-blur")) {
                if (paintProperties.getType("circle-blur") == ReadableType.Number) {
                    properties.add(PropertyFactory.circleBlur(
                        (float)paintProperties.getDouble("circle-blur")
                    ));
                }
                else if (paintProperties.getType("circle-blur") == ReadableType.Map) {
                    ReadableMap map = paintProperties.getMap("circle-blur");
                    ReadableArray stops = map.getArray("stops");
                    Stop[] stopsArray = new Stop[stops.size()];
                    for (int i = 0; i < stops.size(); i++) {
                        stopsArray[i] = Stop.stop(
                            (float)stops.getArray(i).getDouble(0),
                            PropertyFactory.circleBlur(
                                (float)stops.getArray(i).getDouble(1)
                            )
                        );
                    }
                    if (map.hasKey("base")) {
                        properties.add(PropertyFactory.circleBlur(Function.zoom(new ExponentialStops((float)map.getDouble("base"), stopsArray))));
                    }
                    else {
                        properties.add(PropertyFactory.circleBlur(Function.zoom(new ExponentialStops(stopsArray))));
                    }
                }
            }
            if (paintProperties.hasKey("circle-opacity")) {
                if (paintProperties.getType("circle-opacity") == ReadableType.Number) {
                    properties.add(PropertyFactory.circleOpacity(
                        (float)paintProperties.getDouble("circle-opacity")
                    ));
                }
                else if (paintProperties.getType("circle-opacity") == ReadableType.Map) {
                    ReadableMap map = paintProperties.getMap("circle-opacity");
                    ReadableArray stops = map.getArray("stops");
                    Stop[] stopsArray = new Stop[stops.size()];
                    for (int i = 0; i < stops.size(); i++) {
                        stopsArray[i] = Stop.stop(
                            (float)stops.getArray(i).getDouble(0),
                            PropertyFactory.circleOpacity(
                                (float)stops.getArray(i).getDouble(1)
                            )
                        );
                    }
                    if (map.hasKey("base")) {
                        properties.add(PropertyFactory.circleOpacity(Function.zoom(new ExponentialStops((float)map.getDouble("base"), stopsArray))));
                    }
                    else {
                        properties.add(PropertyFactory.circleOpacity(Function.zoom(new ExponentialStops(stopsArray))));
                    }
                }
            }
            if (paintProperties.hasKey("circle-translate")) {
                if (paintProperties.getType("circle-translate") == ReadableType.Array) {
                    properties.add(PropertyFactory.circleTranslate(
                        ReadableArrToNumberArr(paintProperties.getArray("circle-translate"), 0)
                    ));
                }
                else if (paintProperties.getType("circle-translate") == ReadableType.Map) {
                    ReadableMap map = paintProperties.getMap("circle-translate");
                    ReadableArray stops = map.getArray("stops");
                    Stop[] stopsArray = new Stop[stops.size()];
                    for (int i = 0; i < stops.size(); i++) {
                        stopsArray[i] = Stop.stop(
                            (float)stops.getArray(i).getDouble(0),
                            PropertyFactory.circleTranslate(
                                ReadableArrToNumberArr(stops.getArray(i).getArray(1), 0)
                            )
                        );
                    }
                    if (map.hasKey("base")) {
                        properties.add(PropertyFactory.circleTranslate(Function.zoom(new ExponentialStops((float)map.getDouble("base"), stopsArray))));
                    }
                    else {
                        properties.add(PropertyFactory.circleTranslate(Function.zoom(new ExponentialStops(stopsArray))));
                    }
                }
            }
            if (paintProperties.hasKey("circle-translate-anchor")) {
                if (paintProperties.getType("circle-translate-anchor") == ReadableType.String) {
                    properties.add(PropertyFactory.circleTranslateAnchor(
                        paintProperties.getString("circle-translate-anchor")
                    ));
                }
                else if (paintProperties.getType("circle-translate-anchor") == ReadableType.Map) {
                    ReadableMap map = paintProperties.getMap("circle-translate-anchor");
                    ReadableArray stops = map.getArray("stops");
                    Stop[] stopsArray = new Stop[stops.size()];
                    for (int i = 0; i < stops.size(); i++) {
                        stopsArray[i] = Stop.stop(
                            (float)stops.getArray(i).getDouble(0),
                            PropertyFactory.circleTranslateAnchor(
                                stops.getArray(i).getString(1)
                            )
                        );
                    }
                    properties.add(PropertyFactory.circleTranslateAnchor(Function.zoom(new IntervalStops(stopsArray))));
                }
            }
            if (paintProperties.hasKey("circle-pitch-scale")) {
                if (paintProperties.getType("circle-pitch-scale") == ReadableType.String) {
                    properties.add(PropertyFactory.circlePitchScale(
                        paintProperties.getString("circle-pitch-scale")
                    ));
                }
                else if (paintProperties.getType("circle-pitch-scale") == ReadableType.Map) {
                    ReadableMap map = paintProperties.getMap("circle-pitch-scale");
                    ReadableArray stops = map.getArray("stops");
                    Stop[] stopsArray = new Stop[stops.size()];
                    for (int i = 0; i < stops.size(); i++) {
                        stopsArray[i] = Stop.stop(
                            (float)stops.getArray(i).getDouble(0),
                            PropertyFactory.circlePitchScale(
                                stops.getArray(i).getString(1)
                            )
                        );
                    }
                    properties.add(PropertyFactory.circlePitchScale(Function.zoom(new IntervalStops(stopsArray))));
                }
            }
        }

        if (!layerJson.hasKey("source")) {
            throw new InvalidLayerException(String.format("addLayer(): layer '%s' must have a valid 'source' attribute", layerJson.getString("id")));
        }
        CircleLayer layer = new CircleLayer(layerJson.getString("id"), layerJson.getString("source"))
            .withProperties(properties.toArray(new Property[0]));

        if (layerJson.hasKey("source-layer")) {
            layer.setSourceLayer(layerJson.getString("source-layer"));
        }
        if (layerJson.hasKey("filter")) {
            ReadableArray filterJson = layerJson.getArray("filter");
            layer.setFilter(filterJsonToFilter(filterJson));
        }
        if (layerJson.hasKey("minzoom")) {
            layer.setMinZoom((float)layerJson.getDouble("minzoom"));
        }
        if (layerJson.hasKey("maxzoom")) {
            layer.setMaxZoom((float)layerJson.getDouble("maxzoom"));
        }

        return layer;
    }

    static RasterLayer rasterLayerFromJson(ReadableMap layerJson) {
        ArrayList<PropertyValue> properties = new ArrayList<PropertyValue>();

        if (layerJson.hasKey("paint")) {
            ReadableMap paintProperties = layerJson.getMap("paint");
            if (paintProperties.hasKey("raster-opacity")) {
                if (paintProperties.getType("raster-opacity") == ReadableType.Number) {
                    properties.add(PropertyFactory.rasterOpacity(
                        (float)paintProperties.getDouble("raster-opacity")
                    ));
                }
                else if (paintProperties.getType("raster-opacity") == ReadableType.Map) {
                    ReadableMap map = paintProperties.getMap("raster-opacity");
                    ReadableArray stops = map.getArray("stops");
                    Stop[] stopsArray = new Stop[stops.size()];
                    for (int i = 0; i < stops.size(); i++) {
                        stopsArray[i] = Stop.stop(
                            (float)stops.getArray(i).getDouble(0),
                            PropertyFactory.rasterOpacity(
                                (float)stops.getArray(i).getDouble(1)
                            )
                        );
                    }
                    if (map.hasKey("base")) {
                        properties.add(PropertyFactory.rasterOpacity(Function.zoom(new ExponentialStops((float)map.getDouble("base"), stopsArray))));
                    }
                    else {
                        properties.add(PropertyFactory.rasterOpacity(Function.zoom(new ExponentialStops(stopsArray))));
                    }
                }
            }
            if (paintProperties.hasKey("raster-hue-rotate")) {
                if (paintProperties.getType("raster-hue-rotate") == ReadableType.Number) {
                    properties.add(PropertyFactory.rasterHueRotate(
                        (float)paintProperties.getDouble("raster-hue-rotate")
                    ));
                }
                else if (paintProperties.getType("raster-hue-rotate") == ReadableType.Map) {
                    ReadableMap map = paintProperties.getMap("raster-hue-rotate");
                    ReadableArray stops = map.getArray("stops");
                    Stop[] stopsArray = new Stop[stops.size()];
                    for (int i = 0; i < stops.size(); i++) {
                        stopsArray[i] = Stop.stop(
                            (float)stops.getArray(i).getDouble(0),
                            PropertyFactory.rasterHueRotate(
                                (float)stops.getArray(i).getDouble(1)
                            )
                        );
                    }
                    if (map.hasKey("base")) {
                        properties.add(PropertyFactory.rasterHueRotate(Function.zoom(new ExponentialStops((float)map.getDouble("base"), stopsArray))));
                    }
                    else {
                        properties.add(PropertyFactory.rasterHueRotate(Function.zoom(new ExponentialStops(stopsArray))));
                    }
                }
            }
            if (paintProperties.hasKey("raster-brightness-min")) {
                if (paintProperties.getType("raster-brightness-min") == ReadableType.Number) {
                    properties.add(PropertyFactory.rasterBrightnessMin(
                        (float)paintProperties.getDouble("raster-brightness-min")
                    ));
                }
                else if (paintProperties.getType("raster-brightness-min") == ReadableType.Map) {
                    ReadableMap map = paintProperties.getMap("raster-brightness-min");
                    ReadableArray stops = map.getArray("stops");
                    Stop[] stopsArray = new Stop[stops.size()];
                    for (int i = 0; i < stops.size(); i++) {
                        stopsArray[i] = Stop.stop(
                            (float)stops.getArray(i).getDouble(0),
                            PropertyFactory.rasterBrightnessMin(
                                (float)stops.getArray(i).getDouble(1)
                            )
                        );
                    }
                    if (map.hasKey("base")) {
                        properties.add(PropertyFactory.rasterBrightnessMin(Function.zoom(new ExponentialStops((float)map.getDouble("base"), stopsArray))));
                    }
                    else {
                        properties.add(PropertyFactory.rasterBrightnessMin(Function.zoom(new ExponentialStops(stopsArray))));
                    }
                }
            }
            if (paintProperties.hasKey("raster-brightness-max")) {
                if (paintProperties.getType("raster-brightness-max") == ReadableType.Number) {
                    properties.add(PropertyFactory.rasterBrightnessMax(
                        (float)paintProperties.getDouble("raster-brightness-max")
                    ));
                }
                else if (paintProperties.getType("raster-brightness-max") == ReadableType.Map) {
                    ReadableMap map = paintProperties.getMap("raster-brightness-max");
                    ReadableArray stops = map.getArray("stops");
                    Stop[] stopsArray = new Stop[stops.size()];
                    for (int i = 0; i < stops.size(); i++) {
                        stopsArray[i] = Stop.stop(
                            (float)stops.getArray(i).getDouble(0),
                            PropertyFactory.rasterBrightnessMax(
                                (float)stops.getArray(i).getDouble(1)
                            )
                        );
                    }
                    if (map.hasKey("base")) {
                        properties.add(PropertyFactory.rasterBrightnessMax(Function.zoom(new ExponentialStops((float)map.getDouble("base"), stopsArray))));
                    }
                    else {
                        properties.add(PropertyFactory.rasterBrightnessMax(Function.zoom(new ExponentialStops(stopsArray))));
                    }
                }
            }
            if (paintProperties.hasKey("raster-saturation")) {
                if (paintProperties.getType("raster-saturation") == ReadableType.Number) {
                    properties.add(PropertyFactory.rasterSaturation(
                        (float)paintProperties.getDouble("raster-saturation")
                    ));
                }
                else if (paintProperties.getType("raster-saturation") == ReadableType.Map) {
                    ReadableMap map = paintProperties.getMap("raster-saturation");
                    ReadableArray stops = map.getArray("stops");
                    Stop[] stopsArray = new Stop[stops.size()];
                    for (int i = 0; i < stops.size(); i++) {
                        stopsArray[i] = Stop.stop(
                            (float)stops.getArray(i).getDouble(0),
                            PropertyFactory.rasterSaturation(
                                (float)stops.getArray(i).getDouble(1)
                            )
                        );
                    }
                    if (map.hasKey("base")) {
                        properties.add(PropertyFactory.rasterSaturation(Function.zoom(new ExponentialStops((float)map.getDouble("base"), stopsArray))));
                    }
                    else {
                        properties.add(PropertyFactory.rasterSaturation(Function.zoom(new ExponentialStops(stopsArray))));
                    }
                }
            }
            if (paintProperties.hasKey("raster-contrast")) {
                if (paintProperties.getType("raster-contrast") == ReadableType.Number) {
                    properties.add(PropertyFactory.rasterContrast(
                        (float)paintProperties.getDouble("raster-contrast")
                    ));
                }
                else if (paintProperties.getType("raster-contrast") == ReadableType.Map) {
                    ReadableMap map = paintProperties.getMap("raster-contrast");
                    ReadableArray stops = map.getArray("stops");
                    Stop[] stopsArray = new Stop[stops.size()];
                    for (int i = 0; i < stops.size(); i++) {
                        stopsArray[i] = Stop.stop(
                            (float)stops.getArray(i).getDouble(0),
                            PropertyFactory.rasterContrast(
                                (float)stops.getArray(i).getDouble(1)
                            )
                        );
                    }
                    if (map.hasKey("base")) {
                        properties.add(PropertyFactory.rasterContrast(Function.zoom(new ExponentialStops((float)map.getDouble("base"), stopsArray))));
                    }
                    else {
                        properties.add(PropertyFactory.rasterContrast(Function.zoom(new ExponentialStops(stopsArray))));
                    }
                }
            }
            if (paintProperties.hasKey("raster-fade-duration")) {
                if (paintProperties.getType("raster-fade-duration") == ReadableType.Number) {
                    properties.add(PropertyFactory.rasterFadeDuration(
                        (float)paintProperties.getDouble("raster-fade-duration")
                    ));
                }
                else if (paintProperties.getType("raster-fade-duration") == ReadableType.Map) {
                    ReadableMap map = paintProperties.getMap("raster-fade-duration");
                    ReadableArray stops = map.getArray("stops");
                    Stop[] stopsArray = new Stop[stops.size()];
                    for (int i = 0; i < stops.size(); i++) {
                        stopsArray[i] = Stop.stop(
                            (float)stops.getArray(i).getDouble(0),
                            PropertyFactory.rasterFadeDuration(
                                (float)stops.getArray(i).getDouble(1)
                            )
                        );
                    }
                    if (map.hasKey("base")) {
                        properties.add(PropertyFactory.rasterFadeDuration(Function.zoom(new ExponentialStops((float)map.getDouble("base"), stopsArray))));
                    }
                    else {
                        properties.add(PropertyFactory.rasterFadeDuration(Function.zoom(new ExponentialStops(stopsArray))));
                    }
                }
            }
        }

        if (!layerJson.hasKey("source")) {
            throw new InvalidLayerException(String.format("addLayer(): layer '%s' must have a valid 'source' attribute", layerJson.getString("id")));
        }
        RasterLayer layer = new RasterLayer(layerJson.getString("id"), layerJson.getString("source"))
            .withProperties(properties.toArray(new Property[0]));

        if (layerJson.hasKey("source-layer")) {
            layer.setSourceLayer(layerJson.getString("source-layer"));
        }
        if (layerJson.hasKey("minzoom")) {
            layer.setMinZoom((float)layerJson.getDouble("minzoom"));
        }
        if (layerJson.hasKey("maxzoom")) {
            layer.setMaxZoom((float)layerJson.getDouble("maxzoom"));
        }

        return layer;
    }

    static BackgroundLayer backgroundLayerFromJson(ReadableMap layerJson) {
        ArrayList<PropertyValue> properties = new ArrayList<PropertyValue>();

        if (layerJson.hasKey("paint")) {
            ReadableMap paintProperties = layerJson.getMap("paint");
            if (paintProperties.hasKey("background-color")) {
                if (paintProperties.getType("background-color") == ReadableType.String) {
                    properties.add(PropertyFactory.backgroundColor(
                        paintProperties.getString("background-color")
                    ));
                }
                else if (paintProperties.getType("background-color") == ReadableType.Map) {
                    ReadableMap map = paintProperties.getMap("background-color");
                    ReadableArray stops = map.getArray("stops");
                    Stop[] stopsArray = new Stop[stops.size()];
                    for (int i = 0; i < stops.size(); i++) {
                        stopsArray[i] = Stop.stop(
                            (float)stops.getArray(i).getDouble(0),
                            PropertyFactory.backgroundColor(
                                stops.getArray(i).getString(1)
                            )
                        );
                    }
                    if (map.hasKey("base")) {
                        properties.add(PropertyFactory.backgroundColor(Function.zoom(new ExponentialStops((float)map.getDouble("base"), stopsArray))));
                    }
                    else {
                        properties.add(PropertyFactory.backgroundColor(Function.zoom(new ExponentialStops(stopsArray))));
                    }
                }
            }
            if (paintProperties.hasKey("background-pattern")) {
                if (paintProperties.getType("background-pattern") == ReadableType.String) {
                    properties.add(PropertyFactory.backgroundPattern(
                        paintProperties.getString("background-pattern")
                    ));
                }
                else if (paintProperties.getType("background-pattern") == ReadableType.Map) {
                    ReadableMap map = paintProperties.getMap("background-pattern");
                    ReadableArray stops = map.getArray("stops");
                    Stop[] stopsArray = new Stop[stops.size()];
                    for (int i = 0; i < stops.size(); i++) {
                        stopsArray[i] = Stop.stop(
                            (float)stops.getArray(i).getDouble(0),
                            PropertyFactory.backgroundPattern(
                                stops.getArray(i).getString(1)
                            )
                        );
                    }
                    properties.add(PropertyFactory.backgroundPattern(Function.zoom(new IntervalStops(stopsArray))));
                }
            }
            if (paintProperties.hasKey("background-opacity")) {
                if (paintProperties.getType("background-opacity") == ReadableType.Number) {
                    properties.add(PropertyFactory.backgroundOpacity(
                        (float)paintProperties.getDouble("background-opacity")
                    ));
                }
                else if (paintProperties.getType("background-opacity") == ReadableType.Map) {
                    ReadableMap map = paintProperties.getMap("background-opacity");
                    ReadableArray stops = map.getArray("stops");
                    Stop[] stopsArray = new Stop[stops.size()];
                    for (int i = 0; i < stops.size(); i++) {
                        stopsArray[i] = Stop.stop(
                            (float)stops.getArray(i).getDouble(0),
                            PropertyFactory.backgroundOpacity(
                                (float)stops.getArray(i).getDouble(1)
                            )
                        );
                    }
                    if (map.hasKey("base")) {
                        properties.add(PropertyFactory.backgroundOpacity(Function.zoom(new ExponentialStops((float)map.getDouble("base"), stopsArray))));
                    }
                    else {
                        properties.add(PropertyFactory.backgroundOpacity(Function.zoom(new ExponentialStops(stopsArray))));
                    }
                }
            }
        }

        BackgroundLayer layer = new BackgroundLayer(layerJson.getString("id"))
            .withProperties(properties.toArray(new Property[0]));
        if (layerJson.hasKey("minzoom")) {
            layer.setMinZoom((float)layerJson.getDouble("minzoom"));
        }
        if (layerJson.hasKey("maxzoom")) {
            layer.setMaxZoom((float)layerJson.getDouble("maxzoom"));
        }

        return layer;
    }


}
