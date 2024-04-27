import 'package:flutter/material.dart';
import 'package:micro_common/micro_common.dart';

class _DrawerItem {
  const _DrawerItem({
    required this.title,
    required this.onTap,
  });

  final String title;
  final VoidCallback onTap;
}

class HomeDrawerWidget extends StatelessWidget {
  const HomeDrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    'assets/images/movies_catalog.png',
                  ),
                ),
              ),
              child: Center(
                child: Text(
                  'Milhares de filmes, séries e pessoas para descobrir.\nExplore já.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            _expansionTile(
              icon: Icons.movie_creation_outlined,
              headerTitle: 'Filmes',
              children: [
                _DrawerItem(
                  title: 'Populares',
                  onTap: () => EventBus.emit(const GoToPopularMoviesEvent()),
                ),
                _DrawerItem(
                  title: 'Em Exibição',
                  onTap: () => EventBus.emit(const GoToNowPlayingMoviesEvent()),
                ),
                _DrawerItem(
                  title: 'Brevemente',
                  onTap: () => EventBus.emit(const GoToUpcomingMoviesEvent()),
                ),
                _DrawerItem(
                  title: 'Melhor Classificação',
                  onTap: () => EventBus.emit(const GoToTopRatedMoviesEvent()),
                ),
              ],
            ),
            const Divider(thickness: 1),
            _expansionTile(
              icon: Icons.live_tv_outlined,
              headerTitle: 'Séries',
              children: [
                _DrawerItem(
                  title: 'Populares',
                  onTap: () => EventBus.emit(const GoToPopularTvShowsEvent()),
                ),
                _DrawerItem(
                  title: 'Emitidos Hoje',
                  onTap: () =>
                      EventBus.emit(const GoToAiringTodayTvShowsEvent()),
                ),
                _DrawerItem(
                  title: 'Na TV',
                  onTap: () => EventBus.emit(const GoToOnTheAirTvShowsEvent()),
                ),
                _DrawerItem(
                  title: 'Melhor Classificação',
                  onTap: () => EventBus.emit(const GoToTopRatedTvShowsEvent()),
                ),
              ],
            ),
            const Divider(thickness: 1),
            _expansionTile(
              icon: Icons.person_2_outlined,
              headerTitle: 'Pessoas',
              children: [
                _DrawerItem(
                  title: 'Pessoas populares',
                  onTap: () => EventBus.emit(const GoToPopularPeopleEvent()),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _expansionTile({
    required IconData icon,
    required String headerTitle,
    required List<_DrawerItem> children,
  }) {
    return ExpansionTile(
      initiallyExpanded: false,
      collapsedShape: const RoundedRectangleBorder(
        side: BorderSide.none,
      ),
      shape: const RoundedRectangleBorder(
        side: BorderSide.none,
      ),
      leading: Icon(
        icon,
      ),
      title: Text(
        headerTitle,
      ),
      children: List.generate(
        children.length,
        (index) {
          return ListTile(
            title: Text(
              children[index].title,
              style: TextStyle(
                color: Colors.grey.shade800,
                fontSize: 13,
              ),
            ),
            onTap: children[index].onTap,
          );
        },
      ),
    );
  }
}
