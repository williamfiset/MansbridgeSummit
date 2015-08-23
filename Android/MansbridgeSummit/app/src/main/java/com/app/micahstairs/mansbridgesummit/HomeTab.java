package com.app.micahstairs.mansbridgesummit;

/**
 * Created by williamfiset on 2015-08-22.
 */

import android.app.Activity;
import android.graphics.Bitmap;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.*;
import com.google.gson.JsonArray;
import com.nostra13.universalimageloader.core.ImageLoader;
import com.nostra13.universalimageloader.core.ImageLoaderConfiguration;
import com.nostra13.universalimageloader.core.assist.FailReason;
import com.nostra13.universalimageloader.core.assist.ImageSize;
import com.nostra13.universalimageloader.core.listener.ImageLoadingListener;

import android.content.*;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/**
 * A placeholder fragment containing a simple view.
 */
public class HomeTab extends Fragment {
    /**
     * The fragment argument representing the section number for this
     * fragment.
     */
    private static final String ARG_SECTION_NUMBER = "section_number";
    private static final String PETER_MANSBRIDGE_THUMBNAIL = "ZhnhnKV56mA";
    private DataLoader dataLoader;
    private Speaker[] speakers;

    /**
     * Returns a new instance of this fragment for the given section
     * number.
     */
    public static HomeTab newInstance(int sectionNumber) {
        HomeTab fragment = new HomeTab();
        Bundle args = new Bundle();
        args.putInt(ARG_SECTION_NUMBER, sectionNumber);
        fragment.setArguments(args);
        return fragment;
    }

    public HomeTab() { }

    @Override public void onAttach(Activity activity) {

        this.dataLoader = new DataLoader(activity, R.raw.speakers_test);
        parseSpeakers();
        super.onAttach(activity);

    }

    @Override public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {

        // Fragment place holder
        View rootView = inflater.inflate(R.layout.home_main, container, false);
        setSpeakerPage(0, rootView);
        return rootView;

    }

    @Override public void onActivityCreated(Bundle savedInstanceState) {
        super.onActivityCreated(savedInstanceState);
    }

    public void setSpeakerPage( int index, final View rootView) {

        if (index == 0) {

            ImageView mansbridgeHeader = (ImageView) rootView.findViewById(R.id.mansbridgeSummitHeader);
            //mansbridgeHeader.setImageResource( R.drawable.mansbride_summit_presents);

            // Using Android-Universal-Image-Loader third party library to do asyc calls for thumbnails:
            // https://github.com/nostra13/Android-Universal-Image-Loader

            String thumbnailURL = "http://img.youtube.com/vi/"+ PETER_MANSBRIDGE_THUMBNAIL +"/0.jpg";

            // Housekeeping...
            ImageLoader.getInstance().init(ImageLoaderConfiguration.createDefault(rootView.getContext()));

            // Asyc call to get thumbnail image
            ImageLoader.getInstance().loadImage(thumbnailURL, new ImageLoadingListener() {

                @Override public void onLoadingStarted(String s, View view) { }
                @Override public void onLoadingFailed(String s, View view, FailReason failReason) { }
                @Override public void onLoadingCancelled(String s, View view) { }

                @Override public void onLoadingComplete(String s, View view, Bitmap bitmap) {

                    ImageView youtubeThumbnail = (ImageView) rootView.findViewById(R.id.youtubeVideo);
                    youtubeThumbnail.setImageBitmap(bitmap);

                }

            });


        } else if (index < speakers.length) {

        }
    }

    private void parseSpeakers() {

        try {

            JSONObject jsonObj = dataLoader.loadResourceAsJSON();
            if (jsonObj != null) {

                JSONArray arr = jsonObj.getJSONArray("panelists");
                int length = arr.length();
                speakers = new Speaker[length];

                for (int i = 0; i < length; i++) {

                    JSONObject o = arr.getJSONObject(i);
                    String name = o.getString("name");
                    String profession = o.getString("profession");
                    String image = o.getString("image");
                    String description = o.getString("description");

                    JSONArray videos = o.getJSONArray("videos");
                    String[] speakerVideos = new String[videos.length()];

                    for (int j = 0; j < videos.length(); j++)
                        speakerVideos[j] = (String) videos.get(j);

                    speakers[i] = new Speaker(name, profession, image, description, speakerVideos);

                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /*
    // startActivity(new Intent(Intent.ACTION_VIEW, Uri.parse("https://www.youtube.com/watch?v=AiplrfFB6h0")));
    // Get the thumbnail from http://img.youtube.com/vi/YOUTUBE_ID_GOES_HERE/0.jpg
     */

}
