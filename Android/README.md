**TabbedActivity:**
  * We have 3 options:
    * Swiping between tabs (with no titles, or any indication of which tab is which). NOTE: This is less than ideal.
    * Having a dropdown menu at the top with a list of tabs. This is not them most visually appealing, and may not be overly intuitive (some users might overlook the fact that we have 5 tabs).
    * Having tabs at the top, as well as swiping functionality to navigate between tabs. Tabs can have either text or icons (or both, like our iOS app). NOTE: I have figured out how to subclass ViewPager in order to disable the swiping. This seems to be the best option so far. The only notable issue I'm facing is spacing issues. It should be noted that rotating to landscape seems to turn this into a dropdown menu (still with text and icons).

**We've figured out how to do the following so far:**
  * Home tab:
    * We will be using a ViewPager (Android's counter-part of PageViewController). I have not made a working example of this yet.
    * I have a line of code which will initiate the playing of a video (tested with a YouTube video, but it may work for videos from other websites). I also know how to access the thumbnails for a given YouTube video. (NOTE: This is contained in a project called VideoPlayer on Micah's computer)
  * Registration tab:
    * We will be using a WebView to display a website in our app. There are methods to inject JS, although I have not tested them yet. (NOTE: This is contained in a project called MasterFlow on Micah's computer)
  * Twitter tab:
    * We will be using the TwitterKit framework for this app as well. I haven't looked into this yet, but it should be quite easy to do at this point since we've done it for iOS already.
  * Schedule tab:
    * We will likely want to use a ListView with a custom XML layout file. This is an easy and clean solution. I haven't looked into expanding tabs yet. (NOTE: A relevant example is contained in a project called ListExample on Micah's computer)
    * I have figured how to have the equivalent of Push Notifications in Android. I have a working example that submits a notification to be displayed at some arbitrary time in the future (so we can automatically notify the user about an event say 5 minutes before it happens). (NOTE: A relevant example is contained in a project called Notification on Micah's computer)
  * QR Codes tab:
    * This tab hasn't been explored yet, but there are frameworks we can use. 

**Life cycle of an Android Application:**

![](http://i.stack.imgur.com/tcjUx.png)
