import 'package:flutter/material.dart';
import 'addPost.dart';
import 'homeController.dart';
import 'homeModel.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    HomeController homeController = HomeController();

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              icon: Icon(Icons.arrow_forward_ios_outlined),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddPost(),
                  ),
                );
              })
        ],
      ),
      body: FutureBuilder<List<Article>>(
          future: homeController.getArticles(),
          // ignore: missing_return
          builder: (context, snapshot) {
            // switch (snapshot.connectionState) {
            //   case ConnectionState.waiting:
            //     return Center(child: CircularProgressIndicator());
            //   case ConnectionState.active:
            //     return Text('error');
            //   case ConnectionState.none:
            //     return Text('Check your connection');
            //   case ConnectionState.done:
            //     List<Article> articles = snapshot.data;
            //     return
            // }
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return Center(
                  child: Text('Something went wrong'),
                );
              }
              List<Article> articles = snapshot.data;
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  // return Text(articles[index].newsDescription);
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child:
                    // articles[index].newsUrlToImage != null
                         Image.network(articles[index].newsUrlToImage)
                        // : Image.network(
                        //     "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.pinterest.com%2Fpin%2F398709373239314297%2F&psig=AOvVaw0s49VMnhTA2DGOtJh5ufx7&ust=1603834596008000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCKjxosCb0-wCFQAAAAAdAAAAABAD"),
                  );
                },
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
