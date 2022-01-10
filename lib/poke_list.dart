import 'package:flutter/material.dart';
import 'package:pokemon/poke_detail.dart';

class PokeList extends StatelessWidget {
  const PokeList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 50,
        itemBuilder: (context, index) => PokeListItem(index: index));
  }
}

class PokeListItem extends StatelessWidget {
  const PokeListItem({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
        "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/25.png",
        height: 100,
        width: 100,
      ),
      title: const Text(
        "pikachu",
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      subtitle: const Text("⚡️electric"),
      onTap: () => {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => const PokeDetail()))
      },
      trailing: const Icon(Icons.navigate_next),
    );
  }
}
