import 'package:flutter/material.dart';

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
                  onTap: () {},
                ),
                _DrawerItem(
                  title: 'Em Exibição',
                  onTap: () {},
                ),
                _DrawerItem(
                  title: 'Brevemente',
                  onTap: () {},
                ),
                _DrawerItem(
                  title: 'Melhor Classificação',
                  onTap: () {},
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
                  onTap: () {},
                ),
                _DrawerItem(
                  title: 'Emitidos Hoje',
                  onTap: () {},
                ),
                _DrawerItem(
                  title: 'Na TV',
                  onTap: () {},
                ),
                _DrawerItem(
                  title: 'Melhor Classificação',
                  onTap: () {},
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
                  onTap: () {},
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
