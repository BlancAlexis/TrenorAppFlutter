import 'package:flutter/material.dart';
import 'package:tenor/data/repo.dart';

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
          future: getTenorRepoImpl().getAllFamousWord(),
          builder: (context, projectSnap) {
            if (projectSnap.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (projectSnap.hasError) {
              return Text('Error: ${projectSnap.error}');
            }
            final famousWords = projectSnap.data ?? List.empty();
            return CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                        (context, index) {
                      final word = famousWords[index];
                      return Text('Item: ${word.famousWord}'); // Assuming word is a string
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