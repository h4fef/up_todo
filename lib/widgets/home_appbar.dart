//flutter
import 'package:flutter/material.dart';

class HomeAppbar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppbar({super.key});
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.only(left: 24, top: 13),
        child: Icon(Icons.filter_list_outlined),
      ),
      title: Padding(
        padding: const EdgeInsets.only(top: 13),
        child: Text('Index', style: Theme.of(context).textTheme.bodyMedium),
      ),
      centerTitle: true,
      actionsPadding: const EdgeInsets.only(top: 13, right: 24),
      actions: [Image.asset("assets/user.png")],
    );
  }
}
