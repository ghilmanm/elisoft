import 'package:flutter/material.dart';

class ArticleItemTop extends StatelessWidget {
  const ArticleItemTop({
    Key? key,
    this.title,
    this.desc,
  }) : super(key: key);
  final String? title;
  final String? desc;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: const Color(0xFF247881),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title ?? 'No title',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Color(0xFF247881),
            ),
          ),
          Text(
            desc ?? 'No Description',
            maxLines: 7,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 16),
          )
        ],
      ),
    );
  }
}
