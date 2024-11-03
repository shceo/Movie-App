import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app_v1/src/exports.dart';
import 'package:shimmer/shimmer.dart';

class ReleaseSliderWidget extends StatelessWidget {
  const ReleaseSliderWidget({super.key, required this.snapshot});

  final AsyncSnapshot<MovieData> snapshot;

  @override
  Widget build(BuildContext context) {
    // Шиммер-заглушка при загрузке данных
    if (snapshot.connectionState != ConnectionState.done || !snapshot.hasData) {
      return Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: SizedBox(
          height: 187,
          width: 342,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Container(
                color: Colors.grey.shade300,
              ),
            ),
          ),
        ),
      );
    }

    // Основной контент
    return CarouselSlider.builder(
      itemCount: snapshot.data?.results?.length ?? 0,
      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
        var item = snapshot.data?.results?[itemIndex];
        return GestureDetector(
          onTap: () {
            context.go(AppRoutes.infoMovie, extra: item);
          },
          child: SizedBox(
            height: 187,
            width: 342,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Container(
                  padding: const EdgeInsets.only(left: 8, right: 15, bottom: 29),
                  alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(
                    image: item?.backdropPath != null
                        ? DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage('${Deteils.imagePath}${item?.backdropPath}'),
                          )
                        : null,
                    color: item?.backdropPath == null ? Colors.grey.shade400 : null,
                  ),
                  child: item?.backdropPath != null
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Text(
                                '${item?.originalTitle}',
                                style: const TextStyle(
                                  color: Colors.red,
                                  fontFamily: 'Axiforma',
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            Text(
                              '★ ${item?.voteAverage?.toStringAsFixed(1)}',
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
                            'Картина не найдена',
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
      options: CarouselOptions(
        autoPlay: true,
      ),
    );
  }
}
