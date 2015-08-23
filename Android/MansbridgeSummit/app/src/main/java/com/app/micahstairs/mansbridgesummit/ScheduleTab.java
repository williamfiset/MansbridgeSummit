package com.app.micahstairs.mansbridgesummit;

import android.app.Activity;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.util.Log;
import android.view.*;
import android.widget.*;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by micahstairs on 2015-08-06.
 */
public class ScheduleTab extends Fragment {
    /**
     * The fragment argument representing the section number for this
     * fragment.
     */
    private static final String ARG_SECTION_NUMBER = "section_number";
    private DataLoader dataLoader;

    private View rootView;

    /**
     * Returns a new instance of this fragment for the given section
     * number.
     */
    public static ScheduleTab newInstance(int sectionNumber) {
        ScheduleTab fragment = new ScheduleTab();
        Bundle args = new Bundle();
        args.putInt(ARG_SECTION_NUMBER, sectionNumber);
        fragment.setArguments(args);
        return fragment;
    }

    public ScheduleTab() { }

    @Override public View onCreateView(final LayoutInflater inflater, final ViewGroup container, Bundle savedInstanceState) {

        rootView = inflater.inflate(R.layout.fragment_schedule_tab, container, false);

        Event[] events = getEventsFromFile();
        Log.e("DEBUG", "" + events.length);

        final ScheduleArrayAdapter adapter = new ScheduleArrayAdapter(rootView.getContext(), events);
        final ListView list = (ListView) rootView.findViewById(R.id.listView);
        list.setAdapter(adapter);

        list.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                Event event = (Event) parent.getItemAtPosition(position);

                if (event.isEvent) {
                    event.isSelected = !event.isSelected;
                    adapter.notifyDataSetChanged();
                }
            }

        });
        return rootView;
    }

    @Override public void onAttach(Activity activity) {

        dataLoader = new DataLoader(activity, R.raw.schedule_data);
        super.onAttach(activity);

    }

    private Event[] getEventsFromFile() {

        try {

            JSONObject jsonObject = dataLoader.loadResourceAsJSON();

            if (jsonObject == null)
                return new Event[0];

            JSONArray schedule = jsonObject.getJSONArray("schedule");

            List<Event> eventObjects = new ArrayList<Event>();

            for (int i = 0; i < schedule.length(); i++) {

                JSONObject day = schedule.getJSONObject(i);

                // This "event" actually represents a divider
                eventObjects.add(new Event(day.getString("date"), null, null, null, false));

                // Add the actual events to the list
                JSONArray events = day.getJSONArray("events");
                for (int j = 0; j < events.length(); j++) {
                    JSONObject event = events.getJSONObject(j);
                    eventObjects.add(new Event(
                            event.getString("eventName"),
                            event.getString("eventDescription"),
                            event.getString("eventTime"),
                            event.getString("eventLocation"),
                            true
                    ));
                }

            }

            return eventObjects.toArray(new Event[eventObjects.size()]);

        } catch (JSONException e) {
            return new Event[0];
        }

    }

}
