import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import 'package:movie_app_v1/src/core/constants/app_colors.dart';
import 'package:movie_app_v1/src/core/constants/media_constants.dart';
import 'package:movie_app_v1/src/presentation/router/app_routes.dart';
import 'package:movie_app_v1/src/presentation/viewmodels/search_view_model.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _performSearch(BuildContext context) {
    context.read<SearchViewModel>().search(_searchController.text);
  }

  void _clearSearchHistory(BuildContext context) {
    _searchController.clear();
    context.read<SearchViewModel>().clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.notblack,
      appBar: AppBar(
        backgroundColor: AppColors.notblack,
        title: Text(
          'РџРѕРёСЃРє',
          style: TextStyle(color: AppColors.white),
        ),
        leading: IconButton(
          onPressed: () => context.go(AppRoutes.home),
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CupertinoTextField(
              controller: _searchController,
              placeholder:
                  'Р’РІРµРґРёС‚Рµ РЅР°Р·РІР°РЅРёРµ С„РёР»СЊРјР° РёР»Рё СЃРµСЂРёР°Р»Р°...',
              placeholderStyle:
                  TextStyle(color: Colors.white.withAlpha((0.5 * 255).round())),
              style: TextStyle(color: AppColors.white),
              cursorColor: Colors.white,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.white.withAlpha((0.1 * 255).round()),
              ),
              padding: const EdgeInsets.all(16.0),
              suffix: IconButton(
                icon: const Icon(Icons.search, color: Colors.white),
                onPressed: () => _performSearch(context),
              ),
              onSubmitted: (_) => _performSearch(context),
            ),
            const SizedBox(height: 12),
            Consumer<SearchViewModel>(
              builder: (context, vm, _) {
                final state = vm.results;
                final items = state.data ?? [];

                if (items.isNotEmpty) {
                  return Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () => _clearSearchHistory(context),
                      child: const Text(
                        'РћС‡РёСЃС‚РёС‚СЊ РёСЃС‚РѕСЂРёСЋ РїРѕРёСЃРєР°',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                }

                if (state.error != null) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      state.error!,
                      style: const TextStyle(color: Colors.red),
                    ),
                  );
                }

                return const SizedBox.shrink();
              },
            ),
            const SizedBox(height: 8),
            Expanded(
              child: Consumer<SearchViewModel>(
                builder: (context, vm, _) {
                  final state = vm.results;

                  if (state.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  final items = state.data ?? [];

                  if (items.isEmpty) {
                    return const Center(
                      child: Text(
                        'РќР°С‡РЅРёС‚Рµ РїРѕРёСЃРє, С‡С‚РѕР±С‹ СѓРІРёРґРµС‚СЊ СЂРµР·СѓР»СЊС‚Р°С‚С‹',
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    );
                  }

                  return ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      final movie = items[index];
                      return GestureDetector(
                        onTap: () =>
                            context.go(AppRoutes.infoMovie, extra: movie),
                        child: Card(
                          color: Colors.white.withAlpha((0.1 * 255).round()),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(24.0),
                                child: Shimmer.fromColors(
                                  baseColor: Colors.grey[300]!,
                                  highlightColor: Colors.white,
                                  child: Image.network(
                                    '${MediaConstants.imageBaseUrl}${movie.posterPath}',
                                    width: 100.0,
                                    height: 100.0,
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
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8.0),
                              Expanded(
                                child: AutoSizeText(
                                  movie.title ?? '',
                                  style: const TextStyle(color: Colors.white),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
