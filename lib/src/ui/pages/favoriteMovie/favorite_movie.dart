// не смог значит я реализовать

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app_v1/src/ui/routes/app_routes.dart';
// import 'package:provider/provider.dart';

// class FavoriteModel extends ChangeNotifier {
//   final List<String> _favorites = [];

//   List<String> get favorites => _favorites;

//   void add(String movie) {
//     _favorites.add(movie);
//     notifyListeners();
//   }

//   void remove(String movie) {
//     _favorites.remove(movie);
//     notifyListeners();
//   }
// }

// Center(
//         child: Consumer<FavoriteModel>(
//           builder: (context, favoriteModel, child) {
//             return ListView.builder(
//               itemCount: favoriteModel.favorites.length,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   title: Text(favoriteModel.favorites[index]),
//                 );
//               },
//             );
//           },
//         ),
//       ),

class FavoriteMoviePage extends StatelessWidget {
  const FavoriteMoviePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Movie Page'),
        leading: IconButton(
            onPressed: () {
              context.go(AppRoutes.home);
            },
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: const Center(
        child: Text('Упс... что то пошло не так'),
      ),
    );
  }
}
