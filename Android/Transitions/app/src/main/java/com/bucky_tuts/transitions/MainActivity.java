package com.bucky_tuts.transitions;

import android.support.v7.app.ActionBarActivity;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;

import android.widget.*;
import android.view.*;

import android.transition.TransitionManager;

public class MainActivity extends ActionBarActivity {

    ViewGroup viewGroup;

    @Override
    protected void onCreate(Bundle savedInstanceState) {

        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        viewGroup = (ViewGroup) findViewById(R.id.layout);
        viewGroup.setOnTouchListener(
                new View.OnTouchListener() {
                    @Override
                    public boolean onTouch(View v, MotionEvent event) {

                        movebutton();

                        return true;
                    }
                }
        );

    }

    private void movebutton() {

        View button = findViewById(R.id.the_button);

        // Actually does the transition for you.
        TransitionManager.beginDelayedTransition(viewGroup);

        RelativeLayout.LayoutParams positionrules = new RelativeLayout.LayoutParams(RelativeLayout.LayoutParams.WRAP_CONTENT, RelativeLayout.LayoutParams.WRAP_CONTENT);
        positionrules.addRule(RelativeLayout.ALIGN_PARENT_BOTTOM, RelativeLayout.TRUE);
        positionrules.addRule(RelativeLayout.ALIGN_PARENT_RIGHT, RelativeLayout.TRUE);

        button.setLayoutParams(positionrules);

        // Get information on the button
        ViewGroup.LayoutParams sizeRules = button.getLayoutParams();
        sizeRules.width = 300;
        sizeRules.height = 400;
        button.setLayoutParams(sizeRules);


    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.menu_main, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
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
}
