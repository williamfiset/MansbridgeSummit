package com.bucky_tuts.intentexample;

import android.support.v7.app.ActionBarActivity;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;

import android.content.Intent;
import android.view.*;
import android.widget.EditText;
import android.widget.TextView;

public class Apples extends ActionBarActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {

        // Start Service
        Intent intentService = new Intent(this, AppIntentService.class);
        startService(intentService);

        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_apples);


        Bundle baconData = getIntent().getExtras();
        if (baconData != null) {
            String baconMessage = baconData.getString("bacon_message");
            TextView appleTextView = (TextView) findViewById(R.id.apple_text);
            appleTextView.setText(baconMessage);
        }

    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.menu_apples, menu);
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

    public void appleClick(View v) {
        Intent i = new Intent(this, Bacon.class);

        EditText textbox = (EditText) findViewById(R.id.apples_textbox);
        String userMEssage = textbox.getText().toString();
        i.putExtra("apples_message", userMEssage);

        startActivity(i);
    }

}
