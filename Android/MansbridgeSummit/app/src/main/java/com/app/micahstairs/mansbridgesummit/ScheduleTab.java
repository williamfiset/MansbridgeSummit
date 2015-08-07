package com.app.micahstairs.mansbridgesummit;

import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.view.*;
import android.widget.*;

/**
 * Created by micahstairs on 2015-08-06.
 */
public class ScheduleTab extends Fragment {
    /**
     * The fragment argument representing the section number for this
     * fragment.
     */
    private static final String ARG_SECTION_NUMBER = "section_number";

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

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        View rootView = inflater.inflate(R.layout.fragment_schedule_tab, container, false);

        Event[] events = {
                new Event("Event1", "This is description #1"),
                new Event("Event2", "This is description #2"),
                new Event("Event3", "This is description #3"),
                new Event("Event4", "This is description #4"),

        };
        ListAdapter adapter = new ScheduleArrayAdapter(rootView.getContext(), events);

        ListView list = (ListView) rootView.findViewById(R.id.listView);
        list.setAdapter(adapter);

        list.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                Event event = (Event) parent.getItemAtPosition(position);
                // do something
            }
        });

        return rootView;
    }
}
