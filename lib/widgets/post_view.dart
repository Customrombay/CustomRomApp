import 'package:flutter/material.dart';


import '../tools/build_url.dart';
import '../entities/post.dart';
import '../tools/format_datetime.dart';
import '../pages/post_page.dart';

class PostView extends StatelessWidget{
  const PostView({
    Key? key,
    required this.post,
  }) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {return PostPage(post: post);}));
        },
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      buildUrl(
                        baseUrl: "https://customrombay.org",
                        url: post.image
                      ),
                      height: 200,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 6, 0, 0),
                    child:
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              post.title,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                          Text(
                            "Published: ${formatDateTime(post.published)}",
                            textAlign: TextAlign.left,
                          )
                        ],
                      ),
                    
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}