import 'package:flutter/material.dart';
import 'package:story_view/story_view.dart';

class StoryPageView extends StatelessWidget {
  const StoryPageView({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = StoryController();
    final List<StoryItem> storyItems = [
      StoryItem.text("Buchi", Colors.red),
      StoryItem.pageImage(NetworkImage(
          "https://images.unsplash.com/photo-1541233349642-6e425fe6190e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80")),
      StoryItem.pageGif(
          "https://blog-assets.hootsuite.com/wp-content/uploads/2018/04/Nyan-Cat-GIF-source.gif")
    ];
    return Material(
      child: StoryView(
        storyItems,
        controller: controller,
        inline: false,
        repeat: false,
      ),
    );
  }
}
