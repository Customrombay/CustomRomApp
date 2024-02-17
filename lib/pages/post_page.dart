import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import '../widgets/drawer.dart';
import '../tools/build_url.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Settings",
          style: TextStyle(
            color: Color.fromARGB(255, 65, 219, 134)
          ),
        ),
        iconTheme: const IconThemeData(
          color: Color.fromARGB(255, 65, 219, 134)
        ),
      ),
      drawer: const NavigationDrawerWidget(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Center(
          child: ListView(
            children: [
              HtmlWidget("""<div><h1 id="this-device-isnt-play-protect-certified---easy-fix-for-android-14-and-older">This device isn't Play Protect certified - easy fix for Android 14 and older</h1>
      <p>After flashing a custom ROM, installing a Google Mobile Services package, or sometimes even after upgrading the OEM's Android version on your device, you may receive the following notification:</p>
      <div class="grid place-content-center"><img src="https://customrombay.org/post-images/play_protect_certification_fix_1.webp" alt="Play Protect notification"></div>
      It means that your device does not pass the Google Play Protect certification test. This causes some apps not to work correctly or at all. It may also prevent you from signing in to your Google account on your device, displaying the following message if you try to do so:
      <div class="grid place-content-center"><img src="/post-images/play_protect_certification_fix_2.webp" alt="Message that you cannot sign in to your Google account"></div>
      But don't worry. It can be easily fixed! Just follow one of the methods listed below.
      <h2 id="method-1-no-pc-required">Method 1 (no PC required)</h2>
      <p>This is the easiest method for fixing the Play Protect certification issue. It does not require using a PC and takes less than 10 minutes to complete.</p>
      <ol>
      <li>Download the latest <a href="https://www.apkmirror.com/apk/evozi/device-id/device-id-1-3-2-release/">Device ID .apk file</a>. This step may not be as simple as it seems because the preinstalled browser may complain about the lack of Play Protect certification. In this case, download also <a href="https://www.apkmirror.com/apk/mozilla/firefox/">Firefox</a> on another device and transfer both files to your problematic device.</li>
      <li>Install the downloaded .apk file(s) using file manager. If the installation of the Device ID app fails, try following the second method from this article.
      <div class="grid place-content-center"><img src="/post-images/play_protect_certification_fix_3.webp" alt="Install Device ID window"></div>
      </li>
      <li>Open the Device ID app. Find the <em>Google Service Framework (GSF)</em> value, tap on it and copy it to the clipboard.
      <div class="grid place-content-center"><img src="/post-images/play_protect_certification_fix_4.webp" alt="Google Service Framework (GSF) in Device ID"></div>
      </li>
      <li>Go to <a href="https://www.google.com/android/uncertified/">www.google.com/android/uncertified/</a>. Log in with your Google account, paste the value from your clipboard, and complete the captcha test. Then click <em>Register</em>.
      <div class="grid place-content-center"><img src="/post-images/play_protect_certification_fix_5.webp" alt="Registering your device ID"></div>
      </li>
      <li>Go to <em>Settings -&gt; Apps -&gt; All apps</em>. Find <em>Google Play Services</em> and <em>Google Play Store</em>. Force stop them and clear their cache &amp; storage.
      <div class="grid place-content-center"><img src="/post-images/play_protect_certification_fix_6.webp" alt="Google Play Services and Store"></div>
      </li>
      <li>Reboot your device.</li>
      <li>Voilà. You should now be able to log in to your Google account and use most of your apps.</li>
      </ol>
      <h2 id="method-2-pc-required">Method 2 (PC required)</h2>
      <p>This method is slightly more difficult than the first one and may take more time. However, it might be the only working method for some users because the Device ID app fails to install on some devices with newer Android versions.</p>
      <ol>
      <li>Unlock developer options on your device. To do this, go to <em>Settings -&gt; About phone</em> and click <em>Build number</em> 7 times. This procedure might be slightly different on some Android ROMs.</li>
      <li>Go to <em>Settings -&gt; System -&gt; Developer options</em>. Scroll to the <em>Debugging</em> section and turn on <em>USB debugging</em> and <em>Rooted debugging</em>.</li>
      <li><a href="https://www.xda-developers.com/install-adb-windows-macos-linux/">Install <em>ADB</em> on your PC</a></li>
      <li>Connect your device to your PC via a USB cable. Allow for <em>USB debugging</em>.
      <div class="grid place-content-center"><img src="/post-images/play_protect_certification_fix_7.webp" alt="Allow for USB debugging"></div>
      </li>
      <li>Run the following command:
      <pre><code class="language-bash">adb devices
      </code></pre>
      Make sure you can see your device in the list of connected devices.</li>
      <li>Restart the <em>ADB service</em> as <em>root</em> by running the following command:
      <pre><code class="language-bash">adb root
      </code></pre>
      </li>
      <li>Use this command to find your Google Services Framework Android ID:
      <pre><code class="language-bash">adb shell 'sqlite3 /data/*/*/*/gservices.db \
         &quot;select * from main where name = \&quot;android_id\&quot;;&quot;'
      </code></pre>
      This command should work on most Android ROMs. If you get the following error:
      <pre><code class="language-bash">/system/bin/sh: sqlite3: inaccessible or not found
      </code></pre>
      try following the third method.</li>
      <li>Go to <a href="https://www.google.com/android/uncertified/">www.google.com/android/uncertified/</a>. Log in with your Google account, paste the value obtained from the previous step, and complete the captcha test. Then click <em>Register</em>.
      <div class="grid place-content-center"><img src="/post-images/play_protect_certification_fix_5.webp" alt="Registering your device ID"></div>
      </li>
      <li>Follow steps 5-7 from the first method.</li>
      </ol>
      <h2 id="method-3-pc-required">Method 3 (PC required)</h2>
      <p>Follow this method if the seventh step from the second method failed for you.</p>
      <ol>
      <li>Follow steps 1-6 from the first method.</li>
      <li>Run the following command to copy the <em>gservices.db</em> file from its original location to the <em>Download</em> folder:
      <pre><code class="language-bash">adb shell cp /data/*/*/*/gservices.db /storage/emulated/0/Download
      </code></pre>
      </li>
      <li>Now pull the <em>gservices.db</em> file to your PC:
      <pre><code class="language-bash">adb pull /storage/emulated/0/Download/gservices.db
      </code></pre>
      </li>
      <li>Install <em>sqlite3</em> on your PC. If you use a Debian-based Linux distribution, you can do this by running the following command:
      <pre><code class="language-bash">sudo apt install sqlite3
      </code></pre>
      If you use Windows, follow <a href="https://dev.to/dendihandian/installing-sqlite3-in-windows-44eb">this tutorial</a>.
      To verify that <em>sqlite3</em> is correctly installed on your computer and present in the path, run the following command:
      <pre><code class="language-bash">sqlite3 --version
      </code></pre>
      It should output the version of <em>sqlite3</em> installed on your PC.</li>
      <li>Finally, use this command to find your Google Services Framework Android ID:
      <pre><code class="language-bash">sqlite3 gservices.db &quot;select * from main where name = \&quot;android_id\&quot;;&quot;
      </code></pre>
      </li>
      <li>Follow steps 8 &amp; 9 from the second method.</li>
      </ol>
      <p>After following this guide, you should be able to use Google Mobile Services on your device. However, some banking or government apps might still refuse to work. This is because fixing Play Protect certification does not fix SafetyNet or Play Integrity attestation. Dealing with them is beyond the scope of this article and will be discussed in the future on <a href="https://customrombay.org/">customrombay.org</a>.</p>
      </div>
      <div>
      <h2>About the author
      </h2>
      <div class="flex flex-col md:flex-row md:space-x-8">
      <div class="grid place-content-center">
      <img class="rounded-full max-w-sm" src="/post-images/piotr_lange_fixed.webp">
      </div>
      <div>
      <h3><a href="https://piotrlange.de/">Piotr Lange</a>
      </h3>
      <p>A young software developer, custom ROM maintainer, LineageOS contributor and FOSS enthusiast. Lead developer at <a href="https://customrombay.org/">customrombay.org</a>. IBDP student from Poland.</p>
      </div>
      </div>
      <p>Did you like this post? <a href="https://www.paypal.me/PiotrZPL/">Support its author via PayPal</a>!</p>
      </div>""",
                baseUrl: Uri.parse("https://customrombay.org"),

                customWidgetBuilder: (element) {
                  if (element.outerHtml.trim().startsWith("<img") && element.attributes["src"] != null){
                    // print(element.attributes["src"]);
                    // print(element.outerHtml);
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15), // Adjust the radius as needed
                        child: Image.network(
                          buildUrl(baseUrl: "https://customrombay.org", url: element.attributes["src"]!),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  }
                  return null;
                },
              ),
            ],
          )
        ),
      ),
    );
  }
}
