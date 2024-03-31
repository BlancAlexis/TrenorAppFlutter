import 'package:flutter/material.dart';
import 'package:tenor/ui/search_gif_page.dart';

import '../domain/repository/tenor_repository_impl.dart';

class CategorizedTrend extends StatefulWidget {
  const CategorizedTrend({super.key});

  @override
  State<CategorizedTrend> createState() => _CategorizedTrend();
}

class _CategorizedTrend extends State<CategorizedTrend> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: getTenorRepoImpl().getAllGifCategory(),
          builder: (context, projectSnap) {
            if (projectSnap.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (projectSnap.hasError) {
              return Text('Error: ${projectSnap.error}');
            }
            final categories =
                projectSnap.data ?? List.empty();
            return CustomScrollView(
              slivers: <Widget>[
                SliverGrid(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200.0,
                    mainAxisSpacing: 10.0,
                    crossAxisSpacing: 10.0,
                    childAspectRatio: 1,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SearchGifPage(
                                selectedCategory: categories[index].name,
                              ),
                            ),
                          );
                        },
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Image.network(
                              categories[index].image,
                              fit: BoxFit.cover,
                            ),
                            Text(
                              '${categories[index].name}',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                shadows: [
                                  Shadow(
                                    offset: Offset(2.0, 2.0),
                                    blurRadius: 4.0,
                                    color: Colors.black.withOpacity(0.5),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                      );
                    },
                    childCount: categories.length,
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
