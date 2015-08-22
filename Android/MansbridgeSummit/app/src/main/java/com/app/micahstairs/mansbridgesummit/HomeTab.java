package com.app.micahstairs.mansbridgesummit;

/**
 * Created by williamfiset on 2015-08-22.
 */

import android.app.Activity;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import com.google.gson.JsonArray;

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
        super.onAttach(activity);

    }

    @Override public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {

        View rootView = inflater.inflate(R.layout.fragment_placeholder_tab, container, false);
        return rootView;

    }

    @Override public void onActivityCreated(Bundle savedInstanceState) {

        parseSpeakers();
        super.onActivityCreated(savedInstanceState);
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
                    for (int j = 0; j < videos.length(); j++) {
                        speakerVideos[j] = (String) videos.get(j);
                    }
                    speakers[i] = new Speaker(name, profession, image, description, speakerVideos);

                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }



    }

}
