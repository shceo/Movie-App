import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app_v1/src/exports.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:shimmer/shimmer.dart';

class InfoMovie extends StatelessWidget {
  const InfoMovie({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.notblack,
      body: const InfoMovieBody(),
    );
  }
}

class InfoMovieBody extends StatelessWidget {
  const InfoMovieBody({super.key});

  @override
  Widget build(BuildContext context) {
    final res = GoRouter.of(context).routerDelegate.currentConfiguration.extra;
    final item = res is Results ? res : null;

    return FutureBuilder<Cast>(
      future: Api.getMovieCredits(item?.id ?? 0),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Ошибка: ${snapshot.error}'),
            );
          }

          return SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Image.network(
                      '${Deteils.imagePath}${item?.backdropPath}',
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.grey,
                          child: const Center(
                            child: Icon(
                              Icons.error,
                              color: Colors.red,
                            ),
                          ),
                        );
                      },
                    ),
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
                                  ],
                                ),
                              ),
                            ),
                            AutoSizeText(
                              'Рейтинг: ${item?.voteAverage?.toStringAsFixed(1) ?? 'N/A'}/10\n' +
                                  '★' *
                                      (item?.voteAverage?.toInt() ??
                                          0) + // Полные звезды
                                  (item?.voteAverage != null &&
                                          (item!.voteAverage! % 1) >= 0.5
                                      ? '⭐️'
                                      : '') + // Половинчатая звезда
                                  '☆' *
                                      (10 -
                                          (item?.voteAverage?.toInt() ?? 0) -
                                          (item?.voteAverage != null &&
                                                  (item!.voteAverage! % 1) >= 0.5
                                              ? 1
                                              : 0)), // Пустые звезды
                              style: const TextStyle(
                                fontSize: 16.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 25.0),
                        AutoSizeText(
                          '${item?.overview}',
                          style: const TextStyle(
                            fontSize: 14.0,
                            color: Colors.grey,
                          ),
                          maxLines: 3,
                          minFontSize: 12,
                          overflow: TextOverflow.ellipsis,
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
                          child: snapshot.hasData
                              ? ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: snapshot.data?.cast?.length ?? 0,
                                  itemBuilder: (context, i) {
                                    final actorsName = snapshot.data?.cast?[i];
                                    return Padding(
                                      padding:
                                          const EdgeInsets.only(right: 16.0),
                                      child: Column(
                                        children: [
                                          ClipOval(
                                            child: Image.network(
                                              '${Deteils.imagePath}${actorsName?.profilePath}',
                                              width: 100,
                                              height: 100,
                                              fit: BoxFit.cover,
                                              errorBuilder:
                                                  (context, error, stackTrace) {
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
                                            ),
                                          ),
                                          const SizedBox(height: 10.0),
                                          AutoSizeText(
                                            '${actorsName?.name}',
                                            style: const TextStyle(
                                              fontSize: 16.0,
                                              color: Colors.white,
                                            ),
                                            maxLines: 1,
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                )
                              : Shimmer.fromColors(
                                  baseColor: Colors.grey[300]!,
                                  highlightColor: Colors.grey[100]!,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount:
                                        5, // количество "актеров" для шиммера
                                    itemBuilder: (context, i) {
                                      return Padding(
                                        padding:
                                            const EdgeInsets.only(right: 16.0),
                                        child: Column(
                                          children: [
                                            Container(
                                              width: 100,
                                              height: 100,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                shape: BoxShape.circle,
                                              ),
                                            ),
                                            const SizedBox(height: 10.0),
                                            Container(
                                              width: 80,
                                              height: 16,
                                              color: Colors.white,
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
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
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
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
          return Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
