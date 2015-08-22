package com.bucky_tuts.intentexample;

import android.app.IntentService;
import android.content.Intent;
import android.util.Log;

/**
 * Created by williamfiset on 2015-08-22.
 *
 * The IntentService creates a background thread to perform actions
 *
 */
public class AppIntentService extends IntentService {

    private static final String TAG = "com.williamfiset.appname";

    public AppIntentService() {
        super("App Intent Service");
    }

    @Override
    protected void onHandleIntent(Intent intent) {

        // In reality get your app to do what ever it needs to do,
        // You know fetching images from the web or checking for status updates
        System.out.println("Service working away...");

    }
}
