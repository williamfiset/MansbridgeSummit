package com.bucky_tuts.intentexample;

import android.support.v7.app.ActionBarActivity;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;
import android.view.*;
import android.content.Intent;
import android.widget.EditText;
import android.widget.TextView;


public class Bacon extends ActionBarActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {

        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_bacon);

        Bundle applesData = getIntent().getExtras();
        if (applesData != null) {
            String applesMessage = applesData.getString("apples_message");
            TextView baconTextView = (TextView) findViewById(R.id.bacon_text);
            baconTextView.setText(applesMessage);
        }

    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.menu_bacon, menu);
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

    public void baconClick(View v) {

        Intent i = new Intent(this, Apples.class);

        EditText editText = (EditText) findViewById(R.id.bacon_textbox);
        i.putExtra("bacon_message", editText.getText().toString() );

        startActivity(i);

    }
}
