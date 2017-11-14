package com.mapbox.rctmgl.components.styles.sources;

import android.content.Context;

import com.mapbox.mapboxsdk.style.sources.TileSet;
import com.mapbox.mapboxsdk.style.sources.VectorSource;

import java.util.List;

/**
 * Created by nickitaliano on 9/8/17.
 */

public class RCTMGLVectorSource extends RCTSource<VectorSource> {
    private String mURL;
    private String[] mTiles;
    private Float[] mBounds;
    private Float mMaxZoom;
    private Float mMinZoom;
    private String mAttribution;

    public RCTMGLVectorSource(Context context) {
        super(context);
    }

    public void setURL(String url) {
        mURL = url;
    }

    public void setTiles(String[] tiles) {
        mTiles = tiles;
    }

    public void setBounds(Float[] bounds) {
        mBounds = bounds;
    }

    public void setMaxZoom(Float maxZoom) {
        mMaxZoom = maxZoom;
    }

    public void setMinZoom(Float minZoom) {
        mMinZoom = minZoom;
    }

    public void setAttribution(String attribution) {
        mAttribution = attribution;
    }

    @Override
    public VectorSource makeSource() {
        if (isDefaultSource(mID)) {
            return (VectorSource)mMap.getSource(DEFAULT_ID);
        }
        if (mTiles != null) {
            TileSet tiles = new TileSet("2.1.0", mTiles);
            
            if (mBounds != null) {
                tiles.setBounds(mBounds);
            }

            if (mMaxZoom != null) {
                tiles.setMaxZoom(mMaxZoom);
            }

            if (mMinZoom != null) {
                tiles.setMinZoom(mMinZoom);
            }

            if (mAttribution != null) {
                tiles.setAttribution(mAttribution);
            }

            return new VectorSource(mID, tiles);
        }
        return new VectorSource(mID, mURL);
    }
}
