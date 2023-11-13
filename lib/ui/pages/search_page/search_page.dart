import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app_v1/api/api.dart';
import 'package:movie_app_v1/api/movie_data.dart';
import 'package:movie_app_v1/models/details.dart';
import 'package:movie_app_v1/ui/theme/app_colors.dart';

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
          msg: "Ошибка при выполнени поиска $e",
          // toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
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

            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => const HomePage(),
            //   ),
            // );
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
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    context.go('/infoMovie', extra: _searchResults[index]);
                  },
                  child: Card(
                    color: Colors.white.withOpacity(0.1),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(24.0),
                          child: Image.network(
                            '${Deteils.imagePath}${_searchResults[index].posterPath}',
                            width: 100.0,
                            height: 100.0,
                          ),
                        ),
                        const SizedBox(width: 8.0),
                        Expanded(
                          child: Text(
                            _searchResults[index].title!,
                            style: const TextStyle(color: Colors.white),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
