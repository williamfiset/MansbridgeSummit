package com.app.micahstairs.mansbridgesummit;

import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.view.*;
import android.webkit.WebSettings;
import android.webkit.WebView;

/**
 * Created by micahstairs on 2015-08-04.
 */
public class RegistrationTab extends Fragment {
    /**
     * The fragment argument representing the section number for this
     * fragment.
     */
    private static final String ARG_SECTION_NUMBER = "section_number";

    /**
     * Returns a new instance of this fragment for the given section
     * number.
     */
    public static RegistrationTab newInstance(int sectionNumber) {
        RegistrationTab fragment = new RegistrationTab();
        Bundle args = new Bundle();
        args.putInt(ARG_SECTION_NUMBER, sectionNumber);
        fragment.setArguments(args);
        return fragment;
    }

    public RegistrationTab() { }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        View rootView = inflater.inflate(R.layout.fragment_registration_tab, container, false);

        WebView webView = (WebView) rootView.findViewById(R.id.webView);
        webView.getSettings().setJavaScriptEnabled(true);
        webView.loadUrl("http://www.mta.ca/Community/Campus_life/Campus_events/Mansbridge_Summit/Application/Mansbridge_Summit_application_form/");

        // NOTE: THE JAVASCRIPT DOESN'T SEEM TO BE CALLED AT ALL???

        // Inject JavaScript into the page to hide the stuff we do not want to see
        webView.loadUrl("javascript:document.getElementsByClassName(\"page-header\")[0].style.display = 'none';");
        webView.loadUrl("javascript:document.getElementsByClassName(\"row\")[1].style.display = 'none';");
        webView.loadUrl("javascript:document.getElementsByClassName(\"page-footer\")[0].style.display = 'none';");
        webView.loadUrl("javascript:document.getElementById(\"breadcrumb-container\").style.display = 'none';");

        // Center the content (which makes the submit button look better)
        webView.loadUrl("javascript:document.getElementById(\"ctl00_PageContent_FormBlock1_content\").setAttribute(\"align\", \"center\");");

        return rootView;
    }
}
