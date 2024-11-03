import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app_v1/src/exports.dart';
import 'package:shimmer/shimmer.dart';

class TabBarWidget extends StatelessWidget {
  const TabBarWidget({
    super.key,
    required this.tabController,
  });

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 20),
          height: 600,
          child: TabBarView(
            controller: tabController,
            children: [
              _buildMovieGrid(Api.getPopularMovies(), context),
              _buildMovieGrid(Api.getTopRatedMovies(), context),
              _buildMovieGrid(Api.getUpcomingMovies(), context),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMovieGrid(Future<MovieData> futureMovies, BuildContext context) {
    return SizedBox(
      child: FutureBuilder<MovieData>(
        future: futureMovies,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return _buildShimmerEffect();
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Ошибка: ${snapshot.error}'),
            );
          } else if (snapshot.hasData) {
            MovieData? movies = snapshot.data;
            return SizedBox(
              height: 200,
              width: double.infinity,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 65,
                  crossAxisSpacing: 16,
                ),
                itemCount: movies?.results?.length ?? 0,
                itemBuilder: (BuildContext context, int index) {
                  var movie = movies?.results?[index];
                  return GestureDetector(
                    onTap: () {
                      if (movie != null) {
                        context.go(AppRoutes.infoMovie, extra: movie);
                      } else {
                        context.go(AppRoutes.notFound404Error);
                      }
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(24),
                      child: movie?.posterPath != null
                          ? Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                      '${Deteils.imagePath}${movie?.posterPath}'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              height: 124,
                              width: 124,
                            )
                          : Container(
                              color: Colors.grey.shade300,
                              height: 124,
                              width: 124,
                              alignment: Alignment.center,
                              child: Text(
                                'Картинка не найдена',
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                    ),
                  );
                },
              ),
            );
          } else {
            return const Center(
              child: Text('Нет данных'),
            );
          }
        },
      ),
    );
  }

  Widget _buildShimmerEffect() {
    return SizedBox(
      height: 200,
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 65,
            crossAxisSpacing: 16,
          ),
          itemCount: 4, // Number of shimmer items
          itemBuilder: (BuildContext context, int index) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Container(
                color: Colors.grey.shade300,
                height: 124,
                width: 124,
              ),
            );
          },
        ),
      ),
    );
  }
}
