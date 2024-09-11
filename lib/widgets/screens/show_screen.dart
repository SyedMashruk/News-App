import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/models/api_call.dart';
import 'package:news/models/news_model.dart';
import 'package:news/widgets/custom/custom_app_bar.dart';
import 'package:news/widgets/screens/show_news.dart';

class ShowScreen extends StatelessWidget {
  ShowScreen(
      {super.key, required this.selectedCategory, required this.newsTitle});
  final String selectedCategory;
  final ApiCall apiCall = ApiCall();
  final String newsTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 255, 238, 205),
        shadowColor: Colors.black,
        elevation: 2,
        title: CustomAppBar(title: newsTitle),
      ),
      body: FutureBuilder(
          future: apiCall.categoryNews(categoryName: selectedCategory),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<NewsModel> newsList = snapshot.data ?? [];
              return ListView.builder(
                  itemCount: newsList.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ShowNews(
                              news: newsList[index],
                            ),
                          ),
                        );
                      },
                      child: Container(
                        height: 200,
                        margin: const EdgeInsets.symmetric(
                            vertical: 4, horizontal: 8),
                        child: Stack(
                          children: [
                            Image.network(
                              '${newsList[index].urlToImage}',
                              width: double.infinity,
                              height: 200,
                              fit: BoxFit.cover,
                            ),
                            Positioned(
                                bottom: 0,
                                right: 0,
                                left: 0,
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(.6)),
                                  height: 80,
                                  child: Center(
                                    child: Text(
                                      '${newsList[index].title}',
                                      maxLines: 2,
                                      style: GoogleFonts.josefinSans(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                )),
                          ],
                        ),
                      ),
                    );
                  });
            }
            return const Center(child: CircularProgressIndicator());
          }),
    );
  }
}
