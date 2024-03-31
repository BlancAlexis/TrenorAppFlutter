import 'package:flutter/material.dart';

import '../data/Model/famous_word_details_model.dart';
import '../domain/repository/tenor_repository_impl.dart';
import 'paginate_scroll_listener.dart';

class SearchGifPage extends StatefulWidget {
  const SearchGifPage({super.key, this.selectedCategory});

  final String? selectedCategory;
  @override
  State<SearchGifPage> createState() => _SearchGifPage();
}

class _SearchGifPage extends State<SearchGifPage> {
  PaginationScrollController paginationScrollController =
  PaginationScrollController();

  final textViewSearch = TextEditingController();
  List<FamousWordDetailsModel> listFamousGif = [];


  Future<void> _getNextPage() async {
    try {
      final response = await getTenorRepoImpl().getNextDetailsAboutFamousWord(textViewSearch.text);
      setState(() {
        listFamousGif.addAll(response); // Update list
      });
    } catch (error) {
      // Handle error here (e.g., print error message, show a snackbar)
      print('Error fetching data: $error');
    }
  }
  @override
  void initState() {
    super.initState();
    paginationScrollController.init(
        loadAction: () async => {
          await _getNextPage() }
    );
    textViewSearch.addListener(checkText);

    if (widget.selectedCategory != null) {
      textViewSearch.text = widget.selectedCategory!.substring(1);
      _getNextPage(); // Lancer la recherche avec la catégorie
    }
  }

  @override
  void dispose() {
    textViewSearch.dispose();
    paginationScrollController.dispose();
    super.dispose();
  }

  void checkText() async{
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
          controller: paginationScrollController.scrollController,
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: textViewSearch,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    labelText: 'Entrez votre mot',
                    hintText: 'Recherche',
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
                    child:
                        Image.network(listFamousGif[index].image, fit: BoxFit.cover),
                  );
                },
                childCount: listFamousGif.length,
              ),
            ),
          ],
        ));
  }
}
