package com.app.micahstairs.mansbridgesummit;

import android.app.Activity;

import org.json.JSONObject;

import java.io.IOException;
import java.io.InputStream;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

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
    private Activity activity;

    /* Need to supply an activity to be able to load application data */
    public DataLoader(Activity activity, int resourceId) {
        this.resourceID = resourceID;
        this.activity = activity;
    }

    public JSONObject loadResourceAsJSON() throws JSONException {

        String json = null;

        try {

            InputStream is =  activity.getResources().openRawResource(R.raw.schedule_data);

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
