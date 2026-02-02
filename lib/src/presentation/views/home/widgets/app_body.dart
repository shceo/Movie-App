import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import 'package:movie_app_v1/src/core/constants/app_colors.dart';
import 'package:movie_app_v1/src/presentation/viewmodels/movie_lists_view_model.dart';
import 'package:movie_app_v1/src/presentation/views/home/widgets/release_slider_widget.dart';
import 'package:movie_app_v1/src/presentation/views/home/widgets/tab_bar_widget.dart';
import 'package:movie_app_v1/src/presentation/widgets/circle_tab_indicator.dart';

class AppBody extends StatefulWidget {
  const AppBody({super.key});

  @override
  State<AppBody> createState() => _AppBodyState();
}

class _AppBodyState extends State<AppBody> with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);

    final viewModel = context.read<MovieListsViewModel>();
    viewModel
      ..loadTrending()
      ..loadPopular()
      ..loadTopRated()
      ..loadUpcoming();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 25),
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText(
            'РЎРµРіРѕРґРЅСЏ РІ С‚СЂРµРЅРґРµ',
            style: TextStyle(color: AppColors.white, fontFamily: 'Axiforma'),
            maxLines: 2,
          ),
          const SizedBox(height: 8),
          Consumer<MovieListsViewModel>(
            builder: (context, vm, _) {
              final state = vm.trending;

              if (state.isLoading) {
                return Center(
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    child: Container(color: Colors.white, height: 187),
                  ),
                );
              }

              if (state.error != null) {
                return Center(
                  child: AutoSizeText(
                    state.error!,
                    style: const TextStyle(color: Colors.red),
                    maxLines: 2,
                  ),
                );
              }

              if (state.data != null) {
                return ReleaseSliderWidget(movies: state.data!);
              }

              return const SizedBox.shrink();
            },
          ),
          const SizedBox(height: 16),
          Align(
            alignment: Alignment.centerLeft,
            child: TabBar(
              dividerColor: Colors.transparent,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.grey,
              indicator: CircleTabIndicator(color: Colors.white, radius: 4),
              controller: _tabController,
              tabs: const [
                Tab(child: AutoSizeText('РџРѕРїСѓР»СЏСЂРЅС‹Рµ', maxLines: 1)),
                Tab(child: AutoSizeText('РќР°РёРІС‹СЃС€РёР№ СЂРµР№С‚РёРЅРі')),
                Tab(child: AutoSizeText('РџСЂРµРґСЃС‚РѕСЏС‰РёРµ', maxLines: 1)),
              ],
            ),
          ),
          Consumer<MovieListsViewModel>(
            builder: (context, vm, _) => TabBarWidget(
              tabController: _tabController,
              popularState: vm.popular,
              topRatedState: vm.topRated,
              upcomingState: vm.upcoming,
            ),
          ),
        ],
      ),
    );
  }
}
