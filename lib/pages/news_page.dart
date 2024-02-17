
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:yaml/yaml.dart';

import '../widgets/drawer.dart';
import '../widgets/post_view.dart';
import '../entities/post.dart';
import '../tools/datetime_from_string.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {

  @override
  Widget build(BuildContext context) {
    Future<http.Response> request = http.get(Uri.parse("https://raw.githubusercontent.com/Customrombay/customrombay.org/main/posts/posts.yaml"));

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "News",
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
        child: FutureBuilder(
          future: request,
          builder: (context, response) {
            if (response.hasData) {
              YamlMap ydoc = loadYaml(response.data!.body);
              YamlList list = ydoc["posts"];
              List<Post> listOfPosts = list.map((element) => Post(title: element["post_title"], path: element["post_path"], image: element["post_image"], published: dateTimeFromString(element["post_published"]))).toList();
              return Center(
                child: ListView.builder(
                  itemCount: listOfPosts.length + 1,
                  itemBuilder: (context, index) {
                    if (index == listOfPosts.length) {
                      return const SizedBox(height: 30);
                    }
                    return PostView(post: listOfPosts[index]);
                  }
                )
              );
            }
            return const Text("OK");
          }
        ),
      ),
    );
  }
}
