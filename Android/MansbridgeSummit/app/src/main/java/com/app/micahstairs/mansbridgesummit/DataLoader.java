package com.app.micahstairs.mansbridgesummit;

import android.app.Activity;
import android.content.Context;
import java.io.*;
import org.json.*;

/**
 * Created by williamfiset on 2015-08-22.
 *
 * The DataLoader Class assists in loading resources from the application to
 * make them ready to use in code. For example a json file needs to be loaded and parsed
 * as a JSONObject before being used, this is what this class is for.
 *
 */
public class DataLoader {

    private int resourceID;
    private Context context;

    /* Need to supply an Context to be able to load application data */
    public DataLoader(Context context, int id) {
        this.resourceID = id;
        this.context = context;
    }

    public JSONObject loadResourceAsJSON() throws JSONException {

        String json;

        try {

            InputStream is =  context.getResources().openRawResource(resourceID);

            int size = is.available();
            byte[] buffer = new byte[size];

            is.read(buffer);
            is.close();

            json = new String(buffer, "UTF-8");

        } catch (IOException e) {
            return null;
        }

        return new JSONObject(json);

    }

}
