import 'package:flutter/material.dart';

import '../widgets/category_card.dart';

class MenuScreen extends StatelessWidget {
  final BuildContext nabeel;

  const MenuScreen({
    Key? key,
    required this.nabeel,
  }) : super(key: key);

  _showPopupMenu(context) {
    showMenu<String>(
      context: context,
      position: const RelativeRect.fromLTRB(25.0, 0.0, 0.0,
          0.0), //position where you want to show the menu on screen
      items: [
        const PopupMenuItem<String>(value: '1', child: Text('Rate us')),
        const PopupMenuItem<String>(value: '2', child: Text('Share app')),
        const PopupMenuItem<String>(value: '3', child: Text('Send feedback')),
      ],
      elevation: 8.0,
    ).then<void>((String? itemSelected) {
      if (itemSelected == null) return;
      if (itemSelected == "1") {
        // _controller.reload();
      } else if (itemSelected == "2") {
        // extensions.copyLink(widget.url, context);
      } else if (itemSelected == "3") {
        // extensions.openExternalURL(widget.url, context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0xFF181818),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.close),
        ),
        title: const Text(
          'മെനു',
          style: TextStyle(
              fontFamily: 'Baloo Chettan 2',
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => _showPopupMenu(context),
            icon: const Icon(
              Icons.more_vert,
            ),
          ),
        ],
      ),
      body: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 3,
        children: <Widget>[
          CategoryCard(
            label: 'ഫീഡ്സ്',
            icon: Icons.home_filled,
            categoryId: '0',
            nabeel: nabeel,
          ),
          CategoryCard(
            label: 'മണ്ണാർക്കാട്',
            icon: Icons.local_airport_sharp,
            categoryId: '1',
            nabeel: nabeel,
          ),
          CategoryCard(
            label: 'വിനോദം',
            icon: Icons.tv_rounded,
            categoryId: '2',
            nabeel: nabeel,
          ),
          CategoryCard(
            label: 'ഫീഡുകൾ',
            icon: Icons.home_filled,
            categoryId: '1',
            nabeel: nabeel,
          ),
          CategoryCard(
            label: 'മണ്ണാർക്കാട്',
            icon: Icons.local_airport_sharp,
            categoryId: '2',
            nabeel: nabeel,
          ),
          CategoryCard(
            label: 'വിനോദം',
            icon: Icons.tv_rounded,
            categoryId: '0',
            nabeel: nabeel,
          ),
        ],
      ),
    );
  }
}
