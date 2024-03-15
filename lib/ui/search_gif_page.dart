import 'package:flutter/material.dart';

import '../data/Model/famous_word_details_model.dart';
import '../domain/repository/tenor_repository_impl.dart';

class SearchGifPage extends StatefulWidget {
  const SearchGifPage({super.key});

  @override
  State<SearchGifPage> createState() => _SearchGifPage();
}

class _SearchGifPage extends State<SearchGifPage> {
  final textViewSearch = TextEditingController();
  List<FamousWordDetailsModel> listFamousGif = [];

  @override
  void initState() {
    super.initState();
    textViewSearch.addListener(prout);
  }

  @override
  void dispose() {
    textViewSearch.dispose();
    super.dispose();
  }

  void prout() async{
    if (textViewSearch.text.isNotEmpty &&textViewSearch.text.length > 2 ) {
      final response= await getTenorRepoImpl().getDetailsAboutFamousWord(textViewSearch.text);
      setState(() {
        listFamousGif.addAll(response);
      });
    }
     }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: textViewSearch,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Entrez votre valeur en binaire',
                    hintText: '01110',
                  ),
                ),
              ),
            ) ,
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
                        Image.network(listFamousGif[index].image),
                        Text('grid item $index'),
                      ],
                    ),
                  );
                },
                childCount: listFamousGif.length,
              ),
            ),
          ],
        ));
  }
}
