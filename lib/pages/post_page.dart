import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

import '../tools/build_url.dart';
import '../entities/post.dart';

class PostPage extends StatefulWidget {
  const PostPage({
    super.key,
    required this.post
  });

  final Post post;

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {

  @override
  Widget build(BuildContext context) {
    Future<http.Response> request = http.get(Uri.parse("https://raw.githubusercontent.com/Customrombay/customrombay.org/main/posts/${widget.post.path}.md"));

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.post.title,
          style: const TextStyle(
            color: Color.fromARGB(255, 65, 219, 134)
          ),
        ),
        iconTheme: const IconThemeData(
          color: Color.fromARGB(255, 65, 219, 134)
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Center(
          child: ListView(
            children: [
              FutureBuilder(
                future: request,
                builder: (context, response) {
                  if (response.hasData) {
                    return HtmlWidget(
                      md.markdownToHtml(response.data!.body),
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

                      onTapUrl: (url) {
                        Uri? uri = Uri.tryParse(url);
                        if (uri?.hasAbsolutePath ?? false) {
                          launchUrl(
                            uri!,
                            mode: LaunchMode.externalApplication
                          );
                        }
                        return true;
                      },
                    );
                  }
                  return const Text("Loading...");
                }
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          )
        ),
      ),
    );
  }
}
