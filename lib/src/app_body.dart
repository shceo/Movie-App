import 'package:movie_app_v1/src/exports.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:shimmer/shimmer.dart';

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
          AutoSizeText(
            'Сегодня в тренде',
            style: TextStyle(color: AppColors.white, fontFamily: 'Axiforma'),
            maxLines: 2,
          ),
          const SizedBox(height: 8),
          SizedBox(
            child: FutureBuilder(
              future: Api.getTrendingMovies(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: AutoSizeText(
                      snapshot.error.toString(),
                      style: TextStyle(color: Colors.red),
                      maxLines: 2,
                    ),
                  );
                } else if (snapshot.hasData) {
                  return ReleaseSliderWidget(
                    snapshot: snapshot,
                  );
                } else {
                  return Center(
                    child: Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      child: Container(
                        // width: 200,
                        // height: 20,
                        color: Colors.white,
                      ),
                    ),
                  );
                }
              },
            ),
          ),
      
          const SizedBox(height: 16),
          Align(
            alignment: Alignment.centerLeft,
            child: TabBar(
              dividerColor: Colors.transparent,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.grey,
              indicator: CircleTabIndicator(color: Colors.white, radius: 4),
              controller: tabController,
              tabs: const [
                Tab(child: AutoSizeText('Популярные', maxLines: 1)),
                Tab(child: AutoSizeText('Наивысший рейтинг',)),
                Tab(child: AutoSizeText('Предстоящие', maxLines: 1)),
              ],
            ),
          ),
          TabBarWidget(tabController: tabController),
        ],
      ),
    );
  }
}
