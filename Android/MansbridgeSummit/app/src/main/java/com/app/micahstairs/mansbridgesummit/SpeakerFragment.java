package com.app.micahstairs.mansbridgesummit;

import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.view.*;


/**
 * Created by williamfiset on 15-09-02.
 */
public class SpeakerFragment extends Fragment {

    @Override public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle bundle) {

        return inflater.inflate(R.layout.fragment_speaker_scrollview, container, false);

    }

}
