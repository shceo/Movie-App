import 'package:flutter/material.dart';
import 'package:movie_app_v1/api/api.dart';
import 'package:movie_app_v1/ui/components/release_slider_widget.dart';
import 'package:movie_app_v1/ui/components/tab_bar_widget.dart';

import '../ui/components/tab_indecator.dart';
import '../ui/theme/app_colors.dart';

class AppBody extends StatefulWidget {
  const AppBody({
    super.key,
  });

  @override
  State<AppBody> createState() => _AppBodyState();
}

class _AppBodyState extends State<AppBody> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(
      length: 3,
      vsync: this,
    );
    return Container(
      margin: const EdgeInsets.only(top: 25),
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Сегодня в тренде',
            style: TextStyle(color: AppColors.white, fontFamily: 'Axiforma'),
          ),
          const SizedBox(height: 8),
          SizedBox(
            child: FutureBuilder(
              future: Api.getTrendingMovies(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                } else if (snapshot.hasData) {
                  return ReleaseSliderWidget(
                    snapshot: snapshot,
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
      
          // to here
          const SizedBox(height: 16),
          // по желанию добавлю
          // Text(
          //   'Popular',
          //   style: TextStyle(
          //     color: AppColors.white,
          //     fontFamily: 'Axiforma',
          //   ),
          // ),
          const SizedBox(),
          Align(
            alignment: Alignment.centerLeft,
            child: TabBar(
              dividerColor: Colors.transparent,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.grey,
              // isScrollable: true,
              indicator: CircleTabIndicator(color: Colors.white, radius: 4),
              controller: tabController,
              tabs: const [
                Tab(text: 'Популярные'),
                Tab(text: 'Наивысший рейтинг'),
                Tab(text: 'Предстоящие'),
              ],
            ),
          ),
          TabBarWidget(tabController: tabController),
        ],
      ),
    );
  }
}

