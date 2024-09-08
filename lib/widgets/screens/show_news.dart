import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/models/news_model.dart';
import 'package:news/widgets/custom/custom_app_bar.dart';
import 'package:url_launcher/url_launcher.dart';

class ShowNews extends StatelessWidget {
  const ShowNews({
    super.key,
    required this.news,
  });
  final NewsModel news;

  @override
  Widget build(BuildContext context) {
    String str = news.content!;
    List<String> res = str.split(" ");
    res.removeLast();
    res.removeLast();
    str = ("${res.join(" ")}.");
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 255, 238, 205),
        shadowColor: Colors.black,
        elevation: 2,
        title: CustomAppBar(
          title: '${news.source!.name}',
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              '${news.urlToImage}',
              width: double.infinity,
              height: 250,
              fit: BoxFit.fill,
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 4,
              ),
              child: Column(
                children: [
                  Text(
                    '${news.title}',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.josefinSans(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    news.author != null ? '-${news.author}' : '',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.josefinSans(
                      color: Colors.black,
                      fontSize: 17,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Text(
                    '${news.description}',
                    textAlign: TextAlign.justify,
                    style: GoogleFonts.josefinSans(
                      color: Colors.black,
                      fontSize: 17,
                    ),
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  Text(
                    str,
                    textAlign: TextAlign.justify,
                    style: GoogleFonts.josefinSans(
                      color: Colors.black,
                      fontSize: 17,
                    ),
                  ),
                  InkWell(
                    onTap: () => launchUrl(Uri.parse('${news.url}')),
                    child: Text(
                      'Click here for more',
                      style: GoogleFonts.josefinSans(
                        fontSize: 17,
                        color: const Color(0xffa18249),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
