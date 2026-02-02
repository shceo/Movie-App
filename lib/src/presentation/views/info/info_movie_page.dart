import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import 'package:movie_app_v1/src/core/constants/app_colors.dart';
import 'package:movie_app_v1/src/core/constants/media_constants.dart';
import 'package:movie_app_v1/src/data/models/cast.dart';
import 'package:movie_app_v1/src/data/models/movie.dart';
import 'package:movie_app_v1/src/presentation/router/app_routes.dart';
import 'package:movie_app_v1/src/presentation/viewmodels/movie_detail_view_model.dart';
import 'package:movie_app_v1/src/presentation/viewmodels/view_state.dart';

class InfoMovie extends StatelessWidget {
  const InfoMovie({super.key, required this.movie});

  final Results? movie;

  @override
  Widget build(BuildContext context) {
    final castState = context.watch<MovieDetailViewModel>().cast;

    return Scaffold(
      backgroundColor: AppColors.notblack,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(context),
            _buildBody(context, castState),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          '${MediaConstants.imageBaseUrl}${movie?.backdropPath ?? movie?.posterPath ?? ''}',
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width * 9 / 16,
          fit: BoxFit.cover,
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
            onPressed: () => context.pop(),
          ),
        ),
      ],
    );
  }

  Widget _buildBody(BuildContext context, Loadable<Cast> castState) {
    return Container(
      color: AppColors.notblack,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '${movie?.title ?? movie?.originalTitle ?? ''} ',
                        style: const TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Axiforma',
                          color: Colors.white,
                        ),
                      ),
                      TextSpan(
                        text: (movie?.releaseDate ?? '').length >= 4
                            ? movie!.releaseDate!.substring(0, 4)
                            : '',
                        style: const TextStyle(
                          fontSize: 10.0,
                          color: Colors.grey,
                        ),
                      ),
                      TextSpan(
                        text:
                            '\n${movie?.mediaType == 'movie' ? 'С„РёР»СЊРј' : movie?.mediaType == 'tv' ? 'С‚РµР»РµС€РѕСѓ' : movie?.mediaType == 'person' ? 'С‡РµР»РѕРІРµРє' : ''}',
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
                'Р РµР№С‚РёРЅРі: ${movie?.voteAverage?.toStringAsFixed(1) ?? 'N/A'}/10',
                style: const TextStyle(
                  fontSize: 16.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
                maxLines: 2,
              ),
            ],
          ),
          const SizedBox(height: 25.0),
          AutoSizeText(
            movie?.overview ?? '',
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
            'РђРєС‚РµСЂС‹:',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10.0),
          SizedBox(
            height: 200.0,
            child: _buildCast(castState),
          ),
          const SizedBox(height: 25.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () => context.go(AppRoutes.wantBuy),
                child: const Text(
                  'РЎРјРѕС‚СЂРµС‚СЊ',
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
    );
  }

  Widget _buildCast(Loadable<Cast> castState) {
    if (castState.isLoading) {
      return Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (context, i) {
            return Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Column(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: const BoxDecoration(
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
      );
    }

    if (castState.error != null) {
      return Center(
        child: Text(
          castState.error!,
          style: const TextStyle(color: Colors.red),
        ),
      );
    }

    final cast = castState.data?.cast ?? [];

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: cast.length,
      itemBuilder: (context, i) {
        final actor = cast[i];
        return Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: Column(
            children: [
              ClipOval(
                child: Image.network(
                  '${MediaConstants.imageBaseUrl}${actor.profilePath}',
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
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
                ),
              ),
              const SizedBox(height: 10.0),
              AutoSizeText(
                actor.name ?? '',
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
    );
  }
}
