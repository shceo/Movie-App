import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app_v1/src/core/constants/media_constants.dart';
import 'package:movie_app_v1/src/data/models/movie.dart';
import 'package:movie_app_v1/src/presentation/router/app_routes.dart';

class ReleaseSliderWidget extends StatelessWidget {
  const ReleaseSliderWidget({super.key, required this.movies});

  final MovieData movies;

  @override
  Widget build(BuildContext context) {
    final results = movies.results ?? [];

    if (results.isEmpty) {
      return const SizedBox.shrink();
    }

    return CarouselSlider.builder(
      itemCount: results.length,
      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
        final item = results[itemIndex];
        return GestureDetector(
          onTap: () => context.go(AppRoutes.infoMovie, extra: item),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.25,
            width: MediaQuery.of(context).size.width * 0.9,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Container(
                  padding:
                      const EdgeInsets.only(left: 8, right: 15, bottom: 29),
                  alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(
                    image: item.backdropPath != null
                        ? DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              '${MediaConstants.imageBaseUrl}${item.backdropPath}',
                            ),
                          )
                        : null,
                    color:
                        item.backdropPath == null ? Colors.grey.shade400 : null,
                  ),
                  child: item.backdropPath != null
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Text(
                                item.originalTitle ?? '',
                                style: const TextStyle(
                                  color: Colors.red,
                                  fontFamily: 'Axiforma',
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            Text(
                              'в… ${item.voteAverage?.toStringAsFixed(1) ?? '—'}',
                              style: const TextStyle(
                                color: Colors.red,
                                fontFamily: 'Axiforma',
                                fontSize: 16.0,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        )
                      : Center(
                          child: Text(
                            'РљР°СЂС‚РёРЅР° РЅРµ РЅР°Р№РґРµРЅР°',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: 'Axiforma',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                ),
              ),
            ),
          ),
        );
      },
      options: CarouselOptions(autoPlay: true),
    );
  }
}
