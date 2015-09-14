package com.app.micahstairs.mansbridgesummit;

import android.app.ActionBar;
import android.content.Intent;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Point;
import android.graphics.drawable.Drawable;
import android.media.Image;
import android.net.Uri;
import android.os.Bundle;
import android.os.PersistableBundle;
import android.support.v7.app.ActionBarActivity;
import android.view.ContextMenu;
import android.view.Display;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;

import com.nostra13.universalimageloader.core.ImageLoader;
import com.nostra13.universalimageloader.core.ImageLoaderConfiguration;
import com.nostra13.universalimageloader.core.assist.FailReason;
import com.nostra13.universalimageloader.core.listener.ImageLoadingListener;

import java.io.File;

/**
 * Created by williamfiset on 15-09-02.
 */
public class SpeakerActivity extends ActionBarActivity {

    Speaker speaker;

    @Override
    public void onCreate(Bundle bundle) {

        super.onCreate(bundle);
        setContentView(R.layout.activity_speaker);

        Bundle arguments = getIntent().getExtras();
        if (arguments != null) {

            String name = arguments.getString("name");
            String profession = arguments.getString("profession");
            String image = arguments.getString("image");
            String description = arguments.getString("description");
            String[] videos = arguments.getStringArray("videos");

            this.speaker = new Speaker(name, profession,image,description,videos);

            setSpeakerText();
            setSpeakerImage();
            dynamicallyAddVideos();

        }

    }


    private void setSpeakerText() {

        TextView nameLabel = (TextView) findViewById(R.id.speaker_name);
        TextView professionLabel = (TextView) findViewById(R.id.speaker_profession);
        TextView bioLabel = (TextView) findViewById(R.id.speaker_bio);

        nameLabel.setText(speaker.getName());
        professionLabel.setText(speaker.getProfession());
        bioLabel.setText(speaker.getDescription());

    }

    private void setSpeakerImage() {

        try {

            String imageName = speaker.getImage();
            ImageView imgView = (ImageView) findViewById(R.id.speaker_image);

//            Drawable img = Tools.getAssetImage(this, imageName);
//            imgView.setImageDrawable(img);

            Display display = getWindowManager().getDefaultDisplay();
            Point size = new Point();
            display.getSize(size);
            int SCREEN_WIDTH = size.x;
            int SCREEN_HEIGHT= size.y;

            // Getting Out of memory here..
            // The issue is that the drawable is being cached and hoggin memory for
            // other tasks it needs to do.

            Resources res = getResources();
            int imageID = res.getIdentifier(imageName, "drawable", getPackageName());
            Drawable drawable = res.getDrawable(imageID);
            imgView.setImageDrawable(drawable);

//            String p = "/Users/williamfiset/Desktop/GitHub/MansbridgeSummit/Android/MansbridgeSummit/app/src/main/res/drawable/rhonda.png";
//            BitmapFactory.Options options = new BitmapFactory.Options();
//            options.inSampleSize = 8;
//            options.inPreferQualityOverSpeed = false;
//            options.inPreferredConfig = Bitmap.Config.RGB_565; // correct?
//            Bitmap b = BitmapFactory.decodeFile(p, options);
//            imgView.setImageBitmap(b);

            imgView.setPadding(20,15,20,15);

        // I have gotten java.lang.OutOfMemoryError when trying to load some images...
        } catch (Exception ex) {
            ex.printStackTrace();
        }

    }

    private void dynamicallyAddVideos() {

        if (speaker != null) {

            final LinearLayout layout = (LinearLayout) findViewById(R.id.videos);

            for (final String videoID : speaker.getVideos()) {

                ImageView video = new ImageView(this);

                String thumbnailURL = "http://img.youtube.com/vi/"+ videoID +"/0.jpg";
                ImageLoader.getInstance().init(ImageLoaderConfiguration.createDefault(layout.getContext()));

                // Async call to get thumbnail image
                ImageLoader.getInstance().loadImage(thumbnailURL, new ImageLoadingListener() {

                    @Override public void onLoadingStarted(String s, View view) { }
                    @Override public void onLoadingFailed(String s, View view, FailReason failReason) { }
                    @Override public void onLoadingCancelled(String s, View view) { }
                    @Override public void onLoadingComplete(String s, View view, Bitmap bitmap) {

                        if (bitmap == null) return;

                        ImageView thumbnail = new ImageView(layout.getContext());

                        // Crop image from (0, 0, 480, 360) -> (0, 45, 480, 270).
                        // This removes black border of 45 pixels on top and bottom
                        Bitmap croppedBitmap = Bitmap.createBitmap(bitmap, 0, 45, 480, 270);

                        Bitmap youtubeIcon = BitmapFactory.decodeResource(layout.getContext().getResources(), R.drawable.youtube_icon);
                        youtubeIcon = Bitmap.createScaledBitmap(youtubeIcon, 120, 90, false);
                        croppedBitmap = Tools.bitmapCenterOverlay(croppedBitmap, youtubeIcon);

                        thumbnail.setImageBitmap(croppedBitmap);
                        thumbnail.setScaleType(ImageView.ScaleType.FIT_CENTER);

                        thumbnail.setPadding(0,15,0,15);

                        layout.addView(thumbnail);

                        thumbnail.setOnClickListener(new View.OnClickListener() {
                            @Override public void onClick(View v) {

                                Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse("https://www.youtube.com/watch?v=" + videoID));
                                startActivity(intent);

                            }
                        });

                    }
                });

            }
        }

    }

}












