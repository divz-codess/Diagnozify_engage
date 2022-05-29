// ignore_for_file: prefer_if_null_operators

import 'package:proj2/news/article.dart';
import 'package:flutter/material.dart';
import 'package:proj2/news/apicall.dart';

// article coass to display article data in list which is fetched by api
class ArticlePage extends StatelessWidget {
  ArticlePage({Key? key, this.hasAppbar = false}) : super(key: key);

  final apicall = ApiService();
  bool hasAppbar;
  get articles => apicall.getArticle();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: hasAppbar
          ? AppBar(
              title: const Text('articles'),
            )
          : null,
      body: FutureBuilder(
          future: articles,
          builder: (context, AsyncSnapshot<List<Article>> snapshot) {
            if (snapshot.hasData && snapshot.data != null)
              // ignore: curly_braces_in_flow_control_structures
              return ListView.builder(
                  itemCount: snapshot.data == null ? 0 : snapshot.data?.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 200.0,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(snapshot
                                              .data![index].urlToImage !=
                                          null
                                      ? snapshot.data![index].urlToImage
                                      : 'https://cdn.who.int/media/images/default-source/mca/mca-covid-19/coronavirus-2.tmb-479v.jpg?sfvrsn=4dba955c_6%20479w'),
                                  fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          Container(
                            padding: const EdgeInsets.all(6.0),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            child: Text(
                              snapshot.data![index].source.name,
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          Text(
                            snapshot.data![index].description,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                            ),
                          )
                        ],
                      ),
                    );
                  });
            return const SizedBox();
          }),
    );
  }
}
