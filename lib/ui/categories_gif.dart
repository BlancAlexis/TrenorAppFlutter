import 'package:flutter/material.dart';

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
                      return Container(
                        alignment: Alignment.center,
                        color: Colors.teal[100 * (index % 9)],
                        child: Column(
                          children: [
                            Image.network(categories[index].image),
                            Text('${categories[index].name}'),
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
