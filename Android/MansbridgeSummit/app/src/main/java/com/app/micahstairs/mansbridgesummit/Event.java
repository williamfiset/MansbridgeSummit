package com.app.micahstairs.mansbridgesummit;

/**
 * Created by micahstairs on 2015-08-06.
 */
public class Event {

    public String name, description, time, location;
    public boolean isEvent;

    public boolean isSelected = false;

    /**
     * @param isEvent       If true, this is a normal event. If false, then this represents a title for a new date
     */
    public Event(String name, String description, String time, String location, boolean isEvent) {

        this.name        = name;
        this.description = description;
        this.time        = time;
        this.location    = location;
        this.isEvent     = isEvent;

    }

}
