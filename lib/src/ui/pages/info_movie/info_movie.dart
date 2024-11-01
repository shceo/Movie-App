import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app_v1/src/exports.dart';

class InfoMovie extends StatelessWidget {
  const InfoMovie({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.notblack, 
        body: const InfoMovieBody());
  }
}

class InfoMovieBody extends StatelessWidget {
  const InfoMovieBody({super.key});

  @override
  Widget build(BuildContext context) {
// шткуа для получение жанра пока что самая сложная из всех
    // String jsonString =
    //     '{"genres":[{"id":28,"name":"боевик"},{"id":12,"name":"приключения"},{"id":16,"name":"мультфильм"},{"id":35,"name":"комедия"},{"id":80,"name":"криминал"},{"id":99,"name":"документальный"},{"id":18,"name":"драма"},{"id":10751,"name":"семейный"},{"id":14,"name":"фэнтези"},{"id":36,"name":"история"},{"id":27,"name":"ужасы"},{"id":10402,"name":"музыка"},{"id":9648,"name":"детектив"},{"id":10749,"name":"мелодрама"},{"id":878,"name":"фантастика"},{"id":10770,"name":"телевизионный фильм"},{"id":53,"name":"триллер"},{"id":10752,"name":"военный"},{"id":37,"name":"вестерн"}]}';

    // Map<String, dynamic> jsonMap = jsonDecode(jsonString);

    // Genres genresInstance = Genres.fromJson(jsonMap);
    // Map<int, String> genreMap = {};

    // for (var genre in genresInstance.genres!) {
    //   genreMap[genre.id!] = genre.name!;
    // }

    final res = GoRouter.of(context).routerDelegate.currentConfiguration.extra;
    final item = res is Results ? res : null;

    return FutureBuilder<Cast>(
      future: Api.getMovieCredits(item?.id ?? 0),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Image.network('${Deteils.imagePath}${item?.backdropPath}'),
                    Positioned(
                      top: 40.0,
                      left: 10.0,
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () {
                          context.go('/');
                        },
                      ),
                    ),
                  ],
                ),
                Container(
                  color: AppColors.notblack,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 25.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: '${item?.title} ',
                                      style: const TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: 'Axiforma',
                                        color: Colors.white,
                                      ),
                                    ),
                                    TextSpan(
                                      text:
                                          '${item?.releaseDate?.substring(0, 4)}',
                                      style: const TextStyle(
                                        fontSize: 10.0,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    TextSpan(
                                      text:
                                          '\n${item?.mediaType == 'movie' ? 'фильм' : item?.mediaType == 'tv' ? 'телешоу' : item?.mediaType == 'person' ? 'человек' : ''}',
                                      style: const TextStyle(
                                        fontSize: 12.0,
                                        color: Colors.grey,
                                      ),
                                    ),

                                    // TextSpan(

                                    //   text: '${genreMap[item?.genreIds]}',

                                    //   style: const TextStyle(
                                    //     fontSize: 10.0,
                                    //     color: Colors.grey,
                                    //   ),
                                    // ),
                                  ],
                                ),
                              ),
                            ),
                            Text(
                              '☆☆☆☆☆☆☆☆\nРейтинг: ${item?.voteAverage?.toStringAsFixed(1)}/10',
                              style: const TextStyle(
                                fontSize: 16.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 25.0),
                        Text(
                          '${item?.overview}',
                          style: const TextStyle(
                            fontSize: 14.0,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 25.0),
                        const Text(
                          'Актеры:',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        Container(
                          height: 200.0,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, i) {
                              final actorsName = snapshot.data?.cast?[i];
                              return Padding(
                                padding: const EdgeInsets.only(right: 16.0),
                                child: Column(
                                  children: [
                                    CircleAvatar(
                                      radius: 50.0,
                                      backgroundImage: NetworkImage(
                                        '${Deteils.imagePath}${actorsName?.profilePath}',
                                      ),
                                    ),
                                    const SizedBox(height: 10.0),
                                    Text(
                                      '${actorsName?.name}',
                                      style: const TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                            itemCount: snapshot.data?.cast?.length,
                          ),
                        ),
                        const SizedBox(height: 25.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                context.go(AppRoutes.wantBuy);
                              },
                              child: const Text(
                                'Смотреть',
                                style: TextStyle(
                                    fontFamily: 'Axiforma',
                                    fontWeight: FontWeight.w700),
                              ),
                            ),

                            // я попытался ¯\_(ツ)_/¯

//                               void toggleFavoriteStatus() {
//     setState(() {
//       _isFavorite = !_isFavorite;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.notblack,
//       body: InfoMovieBody(
//           isFavorite: _isFavorite, toggleFavoriteStatus: toggleFavoriteStatus),
//     );
//   }
// }

                            // IconButton(
                            //   icon: Icon(
                            //     isFavorite
                            //         ? Icons.favorite
                            //         : Icons.favorite_border,
                            //     color: isFavorite ? Colors.red : Colors.grey,
                            //   ),
                            //   onPressed: () {
                            //     final model = Provider.of<FavoriteModel>(
                            //         context,
                            //         listen: false);
                            //     if (isFavorite) {
                            //       model.remove(item as String);
                            //     } else {
                            //       model.add(item as String);
                            //     }
                            //     toggleFavoriteStatus();

                            //     ScaffoldMessenger.of(context).showSnackBar(
                            //       SnackBar(
                            //           content: Text(isFavorite
                            //               ? 'Удалено из Избранных'
                            //               : 'Добавлено в Избранные')),
                            //     );
                            //   },
                            // ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
