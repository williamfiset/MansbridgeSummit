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

        Event event = getItem(position);

        LayoutInflater inflater = LayoutInflater.from(getContext());
        View customView;

            /* Create different layouts depending on whether this is an event or a header */

        if (event.isEvent) {

            if (event.isSelected && !event.description.equals("N/A")) {
                customView = inflater.inflate(R.layout.schedule_event_selected, parent, false);

                TextView eventTime = (TextView) customView.findViewById(R.id.eventTime);
                eventTime.setText(event.time);

                TextView eventName = (TextView) customView.findViewById(R.id.eventName);
                eventName.setText(event.name);

                TextView eventLocation = (TextView) customView.findViewById(R.id.eventLocation);
                eventLocation.setText(event.location);

                TextView eventDescription = (TextView) customView.findViewById(R.id.eventDescription);
                eventDescription.setText(event.description);



            } else {

                customView = inflater.inflate(R.layout.schedule_event, parent, false);

                TextView eventTime = (TextView) customView.findViewById(R.id.eventTime);
                eventTime.setText(event.time);

                TextView eventName = (TextView) customView.findViewById(R.id.eventName);
                eventName.setText(event.name);

                TextView eventLocation = (TextView) customView.findViewById(R.id.eventLocation);
                eventLocation.setText(event.location);

            }

        } else {

            customView = inflater.inflate(R.layout.schedule_day_header, parent, false);

            TextView text = (TextView) customView.findViewById(R.id.text);
            text.setText(event.name);

        }

        return customView;

    }
}
