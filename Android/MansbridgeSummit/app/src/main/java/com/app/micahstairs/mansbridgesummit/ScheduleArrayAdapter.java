package com.app.micahstairs.mansbridgesummit;

import android.content.*;
import android.text.Layout;
import android.view.*;
import android.widget.*;

/**
 * Created by micahstairs on 2015-08-06.
 */

public class ScheduleArrayAdapter extends ArrayAdapter<Event> {

    public ScheduleArrayAdapter(Context context, Event[] events) {
        super(context, R.layout.schedule_event, events);
    }

    @Override
    public View getView(int position, View convertView, ViewGroup parent) {

        LayoutInflater inflater = LayoutInflater.from(getContext());
        View customView = inflater.inflate(R.layout.schedule_event, parent, false);

        Event item = getItem(position);
        TextView textView = (TextView) customView.findViewById(R.id.textView);
        TextView textView2 = (TextView) customView.findViewById(R.id.textView2);
        textView.setText(item.name);
        textView2.setText(item.description);

        return customView;

    }
}
