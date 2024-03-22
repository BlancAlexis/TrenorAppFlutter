import 'package:flutter/material.dart';

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
          future: getTenorRepoImpl().getAllFamousWord(),
          builder: (context, projectSnap) {
            if (projectSnap.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (projectSnap.hasError) {
              return Text('Error: ${projectSnap.error}');
            }
            final famousWords = projectSnap.data ?? List.empty();
            return CustomScrollView(
              slivers: <Widget>[
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Allahackbar', textAlign: TextAlign.center ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final word = famousWords[index];
                      return GestureDetector(
                        onTap: (){
                          print('tap');
                        },
                        child: SizedBox(
                          height: 300,
                          width: 300,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                color: Colors.blue,
                                width: 2223,
                              ),
                              borderRadius: BorderRadius.circular(1), //<-- SEE HERE
                            ),
                            color: Colors.deepOrangeAccent,
                            elevation: 8,
                            child: Text(
                                'Item: ${word.famousWord}'),
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
