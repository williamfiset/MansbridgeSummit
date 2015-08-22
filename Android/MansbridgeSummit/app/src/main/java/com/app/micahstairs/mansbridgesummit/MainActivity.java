package com.app.micahstairs.mansbridgesummit;

import com.twitter.sdk.android.Twitter;
import com.twitter.sdk.android.core.TwitterAuthConfig;
import com.twitter.sdk.android.tweetui.*;
import com.twitter.sdk.android.tweetui.TweetTimelineListAdapter;

import io.fabric.sdk.android.Fabric;
import java.util.Locale;

import android.content.pm.ActivityInfo;
import android.graphics.drawable.Drawable;
import android.support.v7.app.ActionBarActivity;
import android.support.v7.app.ActionBar;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentTransaction;
import android.support.v4.app.FragmentPagerAdapter;
import android.os.Bundle;
import android.support.v4.view.ViewPager;
import android.view.*;
import android.widget.*;

// App icons created here: http://romannurik.github.io/AndroidAssetStudio/icons-launcher.html

public class MainActivity extends ActionBarActivity implements ActionBar.TabListener {

    // Note: Your consumer key and secret should be obfuscated in your source code before shipping.
    private static final String TWITTER_KEY = "1QaB3nlI2dXah3vJiIIbtDBaP";
    private static final String TWITTER_SECRET = "V2qExJfJtPR81Gtn1cl6DjFuzWJ3HcGqJLPpIXd5kwp6zt4Ctz";


    /**
     * The {@link android.support.v4.view.PagerAdapter} that will provide
     * fragments for each of the sections. We use a
     * {@link FragmentPagerAdapter} derivative, which will keep every
     * loaded fragment in memory. If this becomes too memory intensive, it
     * may be best to switch to a
     * {@link android.support.v4.app.FragmentStatePagerAdapter}.
     */
    SectionsPagerAdapter mSectionsPagerAdapter;

    /**
     * The {@link ViewPager} that will host the section contents.
     */
    ViewPager mViewPager;

    @Override protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        // prevents rotations by keeping it in the default state (not all devices have portrait mode)
        setRequestedOrientation (ActivityInfo.SCREEN_ORIENTATION_NOSENSOR);

        // sets up twitter
        TwitterAuthConfig authConfig = new TwitterAuthConfig(TWITTER_KEY, TWITTER_SECRET);
        Fabric.with(this, new Twitter(authConfig));

        setContentView(R.layout.activity_main);

        // Set up the action bar.
        final ActionBar actionBar = getSupportActionBar();
        actionBar.setNavigationMode(ActionBar.NAVIGATION_MODE_TABS);

        // Create the adapter that will return a fragment for each of the five
        // primary sections of the activity.
        mSectionsPagerAdapter = new SectionsPagerAdapter(getSupportFragmentManager());

        // Set up the ViewPager with the sections adapter.
        mViewPager = (ViewPager) findViewById(R.id.pager);
        mViewPager.setAdapter(mSectionsPagerAdapter);

        // When swiping between different sections, select the corresponding
        // tab. We can also use ActionBar.Tab#select() to do this if we have
        // a reference to the Tab.
        mViewPager.setOnPageChangeListener(new ViewPager.SimpleOnPageChangeListener() {
            @Override public void onPageSelected(int position) {
                actionBar.setSelectedNavigationItem(position);
            }
        });

        // For each of the sections in the app, add a tab to the action bar.
        for (int i = 0; i < mSectionsPagerAdapter.getCount(); i++) {
            // Create a tab with text corresponding to the page title defined by
            // the adapter. Also specify this Activity object, which implements
            // the TabListener interface, as the callback (listener) for when
            // this tab is selected.
            actionBar.addTab(
                    actionBar.newTab()
                            .setText(mSectionsPagerAdapter.getPageTitle(i))
                            .setTabListener(this));
        }
    }


    @Override public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.menu_main, menu);
        return true;
    }

    @Override public boolean onOptionsItemSelected(MenuItem item) {
        // Handle action bar item clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.
        int id = item.getItemId();

        //noinspection SimplifiableIfStatement
        if (id == R.id.action_settings) {
            return true;
        }

        return super.onOptionsItemSelected(item);
    }

    @Override public void onTabSelected(ActionBar.Tab tab, FragmentTransaction fragmentTransaction) {
        // When the given tab is selected, switch to the corresponding page in
        // the ViewPager.
        mViewPager.setCurrentItem(tab.getPosition());
    }

    @Override public void onTabUnselected(ActionBar.Tab tab, FragmentTransaction fragmentTransaction) {
    }

    @Override public void onTabReselected(ActionBar.Tab tab, FragmentTransaction fragmentTransaction) {
    }

    /**
     * A {@link FragmentPagerAdapter} that returns a fragment corresponding to
     * one of the sections/tabs/pages.
     */
    public class SectionsPagerAdapter extends FragmentPagerAdapter {

        public SectionsPagerAdapter(FragmentManager fm) {
            super(fm);
        }

        @Override
        public Fragment getItem(int position) {
            // getItem is called to initially instantiate the fragment for the given page.
            
            switch (position) {
                case 0:
                    return HomeTab.newInstance(position + 1);
                case 1:
                    return RegistrationTab.newInstance(position + 1);
                case 2:
                    return TwitterTab.newInstance(position + 1);
                case 3:
                    return ScheduleTab.newInstance(position + 1);
                case 4:
                    return QRCodesTab.newInstance(position + 1);
            }

            return null;

        }

        @Override public int getCount() {
            // Show 5 total pages.
            return 5;
        }

        @Override public CharSequence getPageTitle(int position) {
            Locale l = Locale.getDefault();

            switch (position) {
                case 0:
                    return getString(R.string.title_home).toUpperCase(l);
                case 1:
                    return getString(R.string.title_registration).toUpperCase(l);
                case 2:
                    return getString(R.string.title_twitter).toUpperCase(l);
                case 3:
                    return getString(R.string.title_schedule).toUpperCase(l);
                case 4:
                    return getString(R.string.title_qr_codes).toUpperCase(l);
            }
            return null;
        }

    }

}
