package com.app.micahstairs.mansbridgesummit;

/**
 * Created by micahstairs on 2015-08-04.
 */

import android.graphics.Color;
import android.graphics.ColorFilter;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.InsetDrawable;
import android.graphics.drawable.ShapeDrawable;
import android.graphics.drawable.shapes.RoundRectShape;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.*;
import android.widget.Button;
import android.widget.ImageButton;
import android.widget.ListView;

import com.twitter.sdk.android.tweetcomposer.TweetComposer;
import com.twitter.sdk.android.tweetui.*;

public class TwitterTab extends Fragment {
    /**
     * The fragment argument representing the section number for this
     * fragment.
     */
    private static final String ARG_SECTION_NUMBER = "section_number";

    /**
     * Returns a new instance of this fragment for the given section
     * number.
     */
    public static TwitterTab newInstance(int sectionNumber) {
        TwitterTab fragment = new TwitterTab();
        Bundle args = new Bundle();
        args.putInt(ARG_SECTION_NUMBER, sectionNumber);
        fragment.setArguments(args);
        return fragment;
    }

    public TwitterTab() { }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        final View rootView = inflater.inflate(R.layout.fragment_twitter_tab, container, false);

        ListView listView = (ListView) rootView.findViewById(R.id.listView);
        final CollectionTimeline timeline = new CollectionTimeline.Builder().id(625072681285758976L).build();
//        final UserTimeline timeline = new UserTimeline.Builder().screenName("fabric").build();

        // Collection "Fabric Picks"
//        final CollectionTimeline timeline = new CollectionTimeline.Builder().id(569961150045896704L).build();
        final TweetTimelineListAdapter adapter = new TweetTimelineListAdapter(listView.getContext(), timeline);

        listView.setAdapter(adapter);

        final ImageButton button = (ImageButton) rootView.findViewById(R.id.composeTweet);
        button.setOnClickListener(new View.OnClickListener() {
            @Override public void onClick(View v) {

                TweetComposer.Builder builder = new TweetComposer.Builder(rootView.getContext())
                        .text("#MansbridgeSummit");
                builder.show();

            }
        });
//        button.setBackgroundColor(getResources().getColor(R.color.blue));
//        RoundRectShape rs = new RoundRectShape(new float[] { 10, 10, 10, 10, 10, 10, 10, 10}, null, null);
//        ShapeDrawable sd = new ShapeDrawable(rs);
//        sd.getPaint().setColor(8856628); // garnet
//        button.setBackgroundDrawable(sd);

        return rootView;
    }
}
