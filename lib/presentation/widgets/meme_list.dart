import 'package:flutter/material.dart';
import '../../domain/entities/meme.dart';

class MemeList extends StatelessWidget {
  final List<Meme> memes;

  const MemeList({
    Key? key,
    required this.memes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: memes.length,
      itemBuilder: (context, index) {
        final meme = memes[index];
        return Card(
          margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: ListTile(
            contentPadding: EdgeInsets.all(8.0),
            leading: Image.network(meme.url,
                width: 50, height: 50, fit: BoxFit.cover),
            title: Text(meme.name),
            subtitle: Text('ID: ${meme.id}'),
          ),
        );
      },
    );
  }
}
