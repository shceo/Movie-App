import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app_v1/src/exports.dart';

class TabBarWidget extends StatelessWidget {
  const TabBarWidget({
    super.key,
    required this.tabController,
  });

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    // final res = GoRouter.of(context).routerDelegate.currentConfiguration.extra;
    // final item = res is Results ? res : null;
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 20),
          height: 600,
          // width: double.maxFinite,
          child: TabBarView(
            controller: tabController,
            children: [
              SizedBox(
                child: FutureBuilder(
                  future: Api.getPopularMovies(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    } else if (snapshot.hasData) {
                      MovieData? movies = snapshot.data;
                      return SizedBox(
                        height: 200,
                        width: double.infinity,
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 65,
                            crossAxisSpacing: 16,
                          ),
                          itemCount: movies
                              ?.results?.length,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                var movie = movies?.results?[index];
                                if (movie != null) {
                                  context.go(AppRoutes.infoMovie, extra: movie);
                                } else {
                                  context.go(AppRoutes
                                      .notFound404Error /*, extra: movie8*/);
                                }
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(24),
                                child: Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          '${Deteils.imagePath}${movies?.results?[index].posterPath}'), // Use the posterPath of each movie
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  height: 124,
                                  width: 124,
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ),



              
              SizedBox(
                child: FutureBuilder(
                  future: Api.getTopRatedMovies(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    } else if (snapshot.hasData) {
                      MovieData? movies = snapshot.data;
                      return SizedBox(
                        height: 200,
                        width: double.infinity,
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 65,
                            crossAxisSpacing: 16,
                          ),
                          itemCount: movies
                              ?.results?.length, 
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                var movie = movies?.results?[index];
                                if (movie != null) {
                                  context.go(AppRoutes.infoMovie, extra: movie);
                                } else {
                                  context.go(AppRoutes
                                      .notFound404Error /*, extra: movie8*/);
                                }
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(24),
                                child: Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          '${Deteils.imagePath}${movies?.results?[index].posterPath}'), // Use the posterPath of each movie
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  height: 124,
                                  width: 124,
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ),

              
              SizedBox(
                child: FutureBuilder(
                  future: Api.getUpcomingMovies(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    } else if (snapshot.hasData) {
                      MovieData? movies = snapshot.data;
                      return SizedBox(
                        height: 200,
                        width: double.infinity,
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 65,
                            crossAxisSpacing: 16,
                          ),
                          itemCount: movies?.results?.length,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                var movie = movies?.results?[index];
                                if (movie != null) {
                                  context.go(AppRoutes.infoMovie, extra: movie);
                                } else {
                                  context.go(AppRoutes
                                      .notFound404Error /*, extra: movie8*/);
                                }
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(24),
                                child: Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          '${Deteils.imagePath}${movies?.results?[index].posterPath}'), // Use the posterPath of each movie
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  height: 124,
                                  width: 124,
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

