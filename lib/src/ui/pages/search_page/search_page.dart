import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app_v1/src/exports.dart';
import 'package:shimmer/shimmer.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  List<Results> _searchResults = [];

  void _performSearch(String query) async {
    try {
      final results = await Api.searchMovies(query);
      setState(() {
        _searchResults = results.results!;
      });
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Ошибка при выполнении поиска $e",
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 2,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }

  void _clearSearchHistory() {
    setState(() {
      _searchResults.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.notblack,
      appBar: AppBar(
        backgroundColor: AppColors.notblack,
        title: Text(
          'Поиск',
          style: TextStyle(color: AppColors.white),
        ),
        leading: IconButton(
          onPressed: () {
            context.go('/');
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CupertinoTextField(
              controller: _searchController,
              placeholder: 'Введите название фильма или сериала...',
              placeholderStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
              style: TextStyle(color: AppColors.white),
              cursorColor: Colors.white,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.white.withOpacity(0.1),
              ),
              padding: const EdgeInsets.all(16.0),
              suffix: IconButton(
                icon: const Icon(Icons.search, color: Colors.white),
                onPressed: () => _performSearch(_searchController.text),
              ),
            ),
            if (_searchResults.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: _clearSearchHistory,
                    child: const Text('Очистить историю поиска',
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
              ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _searchResults.length,
                itemBuilder: (context, index) {
                  final movie = _searchResults[index];
                  return GestureDetector(
                    onTap: () {
                      context.go('/infoMovie', extra: movie);
                    },
                    child: Card(
                      color: Colors.white.withOpacity(0.1),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(24.0),
                            child: Shimmer.fromColors(
                              baseColor: Colors.grey[300]!,
                              highlightColor: Colors.white,
                              child: Image.network(
                                '${Deteils.imagePath}${movie.posterPath}',
                                width: 100.0,
                                height: 100.0,
                                errorBuilder: (context, error, stackTrace) {
                                  return Container(
                                    width: 100,
                                    height: 100,
                                    color: Colors.grey,
                                    alignment: Alignment.center,
                                    child: const Icon(
                                      Icons.error,
                                      color: Colors.red,
                                    ),
                                  );
                                },
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8.0),
                          Expanded(
                            child: AutoSizeText(
                              movie.title!,
                              style: const TextStyle(color: Colors.white),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
