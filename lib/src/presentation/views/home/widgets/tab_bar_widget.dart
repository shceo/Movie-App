import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';

import 'package:movie_app_v1/src/core/constants/media_constants.dart';
import 'package:movie_app_v1/src/data/models/movie.dart';
import 'package:movie_app_v1/src/presentation/router/app_routes.dart';
import 'package:movie_app_v1/src/presentation/viewmodels/view_state.dart';

class TabBarWidget extends StatelessWidget {
  const TabBarWidget({
    super.key,
    required this.tabController,
    required this.popularState,
    required this.topRatedState,
    required this.upcomingState,
  });

  final TabController tabController;
  final Loadable<MovieData> popularState;
  final Loadable<MovieData> topRatedState;
  final Loadable<MovieData> upcomingState;

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
              _buildMovieGrid(popularState, context),
              _buildMovieGrid(topRatedState, context),
              _buildMovieGrid(upcomingState, context),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMovieGrid(Loadable<MovieData> state, BuildContext context) {
    if (state.isLoading) {
      return _buildShimmerEffect();
    }

    if (state.error != null) {
      return Center(
        child: Text('РћС€РёР±РєР°: ${state.error}'),
      );
    }

    final movies = state.data;
    if (movies != null && (movies.results?.isNotEmpty ?? false)) {
      return SizedBox(
        height: 200,
        width: double.infinity,
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 65,
            crossAxisSpacing: 16,
          ),
          itemCount: movies.results!.length,
          itemBuilder: (BuildContext context, int index) {
            final movie = movies.results![index];
            return GestureDetector(
              onTap: () => context.go(AppRoutes.infoMovie, extra: movie),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: movie.posterPath != null
                    ? Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              '${MediaConstants.imageBaseUrl}${movie.posterPath}',
                            ),
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
                        child: const Text(
                          'РљР°СЂС‚РёРЅРєР° РЅРµ РЅР°Р№РґРµРЅР°',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
              ),
            );
          },
        ),
      );
    }

    return const Center(child: Text('РќРµС‚ РґР°РЅРЅС‹С…'));
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
          itemCount: 4,
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
