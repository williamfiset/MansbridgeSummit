package com.app.micahstairs.mansbridgesummit;

/**
 * Created by williamfiset on 2015-08-22.
 */

import android.app.Activity;
import android.graphics.*;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.view.*;
import android.widget.*;
import com.nostra13.universalimageloader.core.*;
import com.nostra13.universalimageloader.core.assist.FailReason;
import com.nostra13.universalimageloader.core.listener.ImageLoadingListener;
import android.net.*;
import android.content.*;
import org.json.*;
import android.content.Intent;
import android.graphics.*;
import android.graphics.drawable.*;
import android.support.v4.content.*;

/**
 * A placeholder fragment containing a simple view.
 */
public class HomeTab extends Fragment {

    private static final String ARG_SECTION_NUMBER = "section_number";
    private static final String PETER_MANSBRIDGE_VID = "ZhnhnKV56mA";
    private DataLoader dataLoader;
    private Speaker[] speakers;

    private Button button1;
    private Button button2;
    private Button button3;
    private Button button4;
    private Button button5;

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
        setButtonProperties(rootView);
        setSpeakerPage(0, rootView);
        return rootView;

    }

    @Override public void onActivityCreated(Bundle savedInstanceState) {
        super.onActivityCreated(savedInstanceState);
    }

    public void setSpeakerPage( int index, final View rootView) {

        if (index == 0) {

            // Using Android-Universal-Image-Loader third party library to do asyc calls for thumbnails:
            // https://github.com/nostra13/Android-Universal-Image-Loader

            String thumbnailURL = "http://img.youtube.com/vi/"+ PETER_MANSBRIDGE_VID +"/0.jpg";

            // Housekeeping...
            ImageLoader.getInstance().init(ImageLoaderConfiguration.createDefault(rootView.getContext()));

            // Async call to get thumbnail image
            ImageLoader.getInstance().loadImage(thumbnailURL, new ImageLoadingListener() {

                @Override public void onLoadingStarted(String s, View view) { }
                @Override public void onLoadingFailed(String s, View view, FailReason failReason) { }
                @Override public void onLoadingCancelled(String s, View view) { }

                @Override public void onLoadingComplete(String s, View view, Bitmap bitmap) {

                    ImageView youtubeThumbnail = (ImageView) rootView.findViewById(R.id.youtubeVideo);

                    // Crop image from (0, 0, 480, 360) -> (0, 45, 480, 270).
                    // This removes black border of 45 pixels on top and bottom
                    Bitmap croppedBitmap = Bitmap.createBitmap(bitmap, 0, 45, 480, 270);


                    Bitmap youtubeIcon = BitmapFactory.decodeResource(rootView.getContext().getResources(), R.drawable.youtube_icon);
                    youtubeIcon = Bitmap.createScaledBitmap(youtubeIcon, 120, 90, false);
                    croppedBitmap = Tools.bitmapCenterOverlay(croppedBitmap, youtubeIcon);


                    youtubeThumbnail.setImageBitmap(croppedBitmap);
                    youtubeThumbnail.setScaleType(ImageView.ScaleType.FIT_CENTER);

                    youtubeThumbnail.setOnClickListener(new View.OnClickListener() {
                        @Override public void onClick(View v) {
                            Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse("https://www.youtube.com/watch?v=7ouLkgRHjS8"));
                            getActivity().startActivity(intent);
                        }
                    });

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

    private void setButtonProperties ( final View rootView ) {

        button1 = (Button) rootView.findViewById(R.id.home_button1);
        button2 = (Button) rootView.findViewById(R.id.home_button2);
        button3 = (Button) rootView.findViewById(R.id.home_button3);
        button4 = (Button) rootView.findViewById(R.id.home_button4);
        button5 = (Button) rootView.findViewById(R.id.home_button5);

        button1.setPadding(5,0,5,0);

//
//        button1.setBackgroundColor(getResources().getColor(R.color.garnet));
//        button2.setBackgroundColor(getResources().getColor(R.color.gold));
//        button3.setBackgroundColor(getResources().getColor(R.color.gold));
//        button4.setBackgroundColor(getResources().getColor(R.color.gold));
//        button5.setBackgroundColor(getResources().getColor(R.color.gold));

        button1.setOnClickListener(new View.OnClickListener() {
            @Override public void onClick(View v) {

            }
        });
        button2.setOnClickListener(new View.OnClickListener() {
            @Override public void onClick(View v) {
                changeSelectedButton(0, v);
            }
        });
        button3.setOnClickListener(new View.OnClickListener() {
            @Override public void onClick(View v) {
                changeSelectedButton(1, v);
            }
        });
        button4.setOnClickListener(new View.OnClickListener() {
            @Override public void onClick(View v) {
                changeSelectedButton(2, v);
            }
        });
        button5.setOnClickListener(new View.OnClickListener() {
            @Override public void onClick(View v) {
                changeSelectedButton(3,v );
            }
        });

    }

    private void changeSelectedButton(int index, View v) {

        Intent intent = new Intent(v.getContext(), SpeakerActivity.class);
        if (index < speakers.length) {

            Speaker speaker = speakers[index];

            intent.putExtra("name", speaker.getName());
            intent.putExtra("profession", speaker.getProfession());
            intent.putExtra("image", speaker.getImage());
            intent.putExtra("description", speaker.getDescription());
            intent.putExtra("videos", speaker.getVideos());

            startActivity(intent);

        }
    }

}

























