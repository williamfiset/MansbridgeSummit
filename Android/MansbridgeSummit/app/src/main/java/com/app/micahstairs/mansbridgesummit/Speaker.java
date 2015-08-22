package com.app.micahstairs.mansbridgesummit;

/**
 * Created by williamfiset on 2015-08-22.
 */
public class Speaker {

    private String name;
    private String profession;
    private String image;
    private String description;
    private String[] videos;

    public Speaker( String name, String profession, String image, String description, String[] videos ) {
        setName(name);
        setProfession(profession);
        setImage(image);
        setDescription(description);
        setVideos(videos);
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getProfession() {
        return profession;
    }

    public void setProfession(String profession) {
        this.profession = profession;
    }

    public String[] getVideos() {
        return videos;
    }

    public void setVideos(String[] videos) {
        this.videos = videos;
    }
}
