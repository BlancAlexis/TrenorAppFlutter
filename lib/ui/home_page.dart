import 'package:flutter/material.dart';
import 'package:tenor/ui/search_gif_page.dart';

import '../domain/repository/tenor_repository_impl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _DetailsPage();
}

class _DetailsPage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: TenorRepositoryImpl().getAllFamousWord(),
          builder: (context, projectSnap) {
            if (projectSnap.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (projectSnap.hasError) {
              return Text('Error: ${projectSnap.error}');
            }
            final famousWords = projectSnap.data ?? List.empty();
            return CustomScrollView(
              slivers: <Widget>[
                const SliverAppBar(
                  title: Center(child: Text('Mots en vogues de la journée')),
                  backgroundColor: Colors.blueGrey,
                  expandedHeight: 20.0,
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final word = famousWords[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SearchGifPage(
                                selectedCategory: word.famousWord,
                              ),
                            ),
                          );
                        },
                        child: SizedBox(
                          height: 30,
                          width: 10,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                color: Colors.blue,
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            color: Colors.blue,
                            elevation: 8,
                            child: Center(
                              child: Text(word.famousWord),
                            ),
                          ),
                        ),
                      ); // Assuming word is a string
                    },
                    childCount: famousWords.length,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
