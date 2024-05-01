import 'package:flutter/material.dart';
import 'package:micro_design_system/src/components/images/ds_image_type_enum.dart';

import '../images/ds_asset_image.dart';

class DSEmptyState extends StatelessWidget {
  const DSEmptyState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DSAssetImage(
            image: DSImageTypeEnum.emptyBox,
            width: MediaQuery.of(context).size.width / 2,
          ),
          const SizedBox(height: 10),
          const Text(
            'Nenhum resultado encontrado',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Tente ajustar sua pesquisa ou filtro para encontrar o que procura',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
