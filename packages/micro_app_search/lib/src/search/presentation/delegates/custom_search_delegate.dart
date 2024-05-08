import 'package:flutter/material.dart';
import 'package:micro_app_search/src/search/presentation/widgets/search_card_widget.dart';
import 'package:micro_common/micro_common.dart';
import 'package:micro_design_system/micro_design_system.dart';

import '../../domain/entities/multi_search_entity.dart';
import '../../domain/usecases/search_by_name_usecase.dart';

class CustomSearchDelegate extends SearchDelegate<MultiSearchEntity> {
  final SearchByNameUseCase _searchByNameUseCase;

  CustomSearchDelegate(this._searchByNameUseCase);

  @override
  String get searchFieldLabel => 'Pesquisar por filmes, séries, ou pessoas';

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
      hintColor: Colors.grey,
      textTheme: const TextTheme(titleLarge: TextStyle(color: Colors.white)),
      appBarTheme: const AppBarTheme(
        color: Color(0xFF404040), // aff
      ),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => Navigator.of(context).pop(),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(
      future: _searchByNameUseCase(query),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return snapshot.data!.fold((error) {
            return const DSEmptyState();
          }, (result) {
            if (result.isNotEmpty) {
              return ListView.separated(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.all(10),
                itemCount: result.length,
                separatorBuilder: (_, index) => const SizedBox(
                  height: 10,
                ),
                itemBuilder: (_, index) {
                  final search = result[index];
                  return SearchCardWidget(
                    search: search,
                    onTap: () {
                      if (search.mediaType == MediaTypeEnum.movie) {
                        EventBus.emit(
                          GoToMovieDetailsEvent(id: search.id),
                        );
                      } else if (search.mediaType == MediaTypeEnum.tv) {
                        EventBus.emit(
                          GoToTVShowDetailsEvent(id: search.id),
                        );
                      } else {
                        EventBus.emit(
                          GoToPersonDetailsEvent(
                            id: search.id,
                            knownFor: search.knownFor!,
                          ),
                        );
                      }
                    },
                  );
                },
              );
            }
            return const DSEmptyState();
          });
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}
