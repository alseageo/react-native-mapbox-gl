package com.mapbox.rctmgl.components.styles.sources;

import android.view.View;

import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReadableArray;
import com.facebook.react.uimanager.ThemedReactContext;
import com.facebook.react.uimanager.annotations.ReactProp;
import com.mapbox.rctmgl.components.AbstractEventEmitter;
import com.mapbox.rctmgl.components.mapview.RCTMGLMapView;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by nickitaliano on 9/8/17.
 */

public class RCTMGLVectorSourceManager extends AbstractEventEmitter<RCTMGLVectorSource> {
    public static final String REACT_CLASS = RCTMGLVectorSource.class.getSimpleName();

    public RCTMGLVectorSourceManager(ReactApplicationContext reactApplicationContext) {
        super(reactApplicationContext);
    }

    @Override
    public Map<String, String> customEvents() {
        return new HashMap<>();
    }

    @Override
    public String getName() {
        return REACT_CLASS;
    }

    @Override
    protected RCTMGLVectorSource createViewInstance(ThemedReactContext reactContext) {
        return new RCTMGLVectorSource(reactContext);
    }

    @Override
    public View getChildAt(RCTMGLVectorSource source, int childPosition) {
        return source.getLayerAt(childPosition);
    }

    @Override
    public int getChildCount(RCTMGLVectorSource source) {
        return source.getLayerCount();
    }

    @Override
    public void addView(RCTMGLVectorSource source, View childView, int childPosition) {
        source.addLayer(childView, childPosition);
    }

    @Override
    public void removeViewAt(RCTMGLVectorSource source, int childPosition) {
        source.removeLayer(childPosition);
    }

    @ReactProp(name="id")
    public void setId(RCTMGLVectorSource source, String id) {
        source.setID(id);
    }

    @ReactProp(name="url")
    public void setUrl(RCTMGLVectorSource source, String url) {
        source.setURL(url);
    }

    @ReactProp(name="tiles")
    public void setTiles(RCTMGLVectorSource source, ReadableArray arr) {
        String[] tiles = new String[arr.size()];

        for (int i = 0; i < arr.size(); i++) {
            String tileURL = arr.getString(i);
            tiles[i] = tileURL;
        }

        source.setTiles(tiles);
    }

    @ReactProp(name="bounds")
    public void setBounds(RCTMGLVectorSource source, ReadableArray arr) {
        Float[] bounds = new Float[arr.size()];

        for (int i = 0; i < arr.size(); i++) {
            Float coord = (float)arr.getDouble(i);
            bounds[i] = coord;
        }

        source.setBounds(bounds);
    }

    @ReactProp(name="maxZoomLevel")
    public void setMaxZoomLevel(RCTMGLVectorSource source, float maxZoomLevel) {
        source.setMaxZoom(maxZoomLevel);
    }

    @ReactProp(name="minZoomLevel")
    public void setMinZoomLevel(RCTMGLVectorSource source, float minZoomLevel) {
        source.setMinZoom(minZoomLevel);
    }

    @ReactProp(name="attribution")
    public void setAttribution(RCTMGLVectorSource source, String attribution) {
        source.setAttribution(attribution);
    }
}
