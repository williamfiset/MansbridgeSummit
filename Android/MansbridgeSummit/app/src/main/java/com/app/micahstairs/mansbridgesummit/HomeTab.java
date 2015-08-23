package com.app.micahstairs.mansbridgesummit;

/**
 * Created by williamfiset on 2015-08-22.
 */

import android.app.Activity;
import android.graphics.*;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.view.*;
import android.widget.ImageView;
import com.nostra13.universalimageloader.core.*;
import com.nostra13.universalimageloader.core.assist.FailReason;
import com.nostra13.universalimageloader.core.listener.ImageLoadingListener;
import android.net.*;
import android.content.*;
import org.json.*;

/**
 * A placeholder fragment containing a simple view.
 */
public class HomeTab extends Fragment {

    /**
     * The fragment argument representing the section number for this
     * fragment.
     */
    private static final String ARG_SECTION_NUMBER = "section_number";
    private static final String PETER_MANSBRIDGE_VID = "ZhnhnKV56mA";
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

                    // testing
                    croppedBitmap = overlay(croppedBitmap, BitmapFactory.decodeResource(rootView.getContext().getResources(), R.drawable.youtube_icon));

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

    // overlay in center
    public static Bitmap overlay(Bitmap bmp1, Bitmap bmp2) {
        Bitmap bmOverlay = Bitmap.createBitmap(bmp1.getWidth(), bmp1.getHeight(), bmp1.getConfig());
        Canvas canvas = new Canvas(bmOverlay);
        canvas.drawBitmap(bmp1, new Matrix(), null);
        canvas.drawBitmap(bmp2, (bmp1.getWidth() - bmp2.getWidth())/2, (bmp1.getHeight() - bmp2.getHeight())/2, null);
        return bmOverlay;
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
