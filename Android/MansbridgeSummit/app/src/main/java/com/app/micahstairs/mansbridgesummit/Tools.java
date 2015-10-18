package com.app.micahstairs.mansbridgesummit;

import android.content.Context;
import android.content.res.AssetManager;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;

import java.io.BufferedInputStream;
import java.io.IOException;
import java.io.InputStream;

/**
 * Created by williamfiset on 15-09-02.
 *
 * Place any miscellaneous functions in here
 */
public class Tools {

    public static Bitmap bitmapCenterOverlay(Bitmap bmp1, Bitmap bmp2) {
        Bitmap bmOverlay = Bitmap.createBitmap(bmp1.getWidth(), bmp1.getHeight(), bmp1.getConfig());
        Canvas canvas = new Canvas(bmOverlay);
        canvas.drawBitmap(bmp1, new Matrix(), null);
        canvas.drawBitmap(bmp2, (bmp1.getWidth() - bmp2.getWidth()) / 2, (bmp1.getHeight() - bmp2.getHeight()) / 2, null);
        return bmOverlay;
    }

    // Attempt to reduce memory consumption
    public static Drawable getAssetImage(Context context, String fileName) throws IOException {
        AssetManager assets = context.getResources().getAssets();
        InputStream buffer = new BufferedInputStream( assets.open("drawable/" + fileName + ".png") );
        Bitmap b = BitmapFactory.decodeStream(buffer);
        return new BitmapDrawable(context.getResources(), b);

    }

}
