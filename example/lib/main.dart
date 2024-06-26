
import 'package:flutter/material.dart';
import 'package:gallery_image_viewer/gallery_image_viewer.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GalleryImageViewer Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'GalleryImageViewer Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<ImageProvider> _imageProviders = const [
    NetworkImage("https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg"),
    NetworkImage("https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg"),
    NetworkImage("https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg"),
    NetworkImage("https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg"),
    NetworkImage("https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                child: const Text("Show Single Image"),
                onPressed: () {
                  showImageViewer(
                      context,
                      Image.network("https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg")
                          .image,
                      swipeDismissible: true);
                }),
            ElevatedButton(
                child: const Text("Show Multiple Images (Simple)"),
                onPressed: () {
                  MultiImageProvider multiImageProvider =
                      MultiImageProvider(_imageProviders);
                  showImageViewerPager(context, multiImageProvider, onDownload: (d) {},
                      swipeDismissible: true);
                }),
            const Text("<<<< Gallery type 1 >>>>"),
            GalleryImageView(
              listImage: _imageProviders,
               onDownload: (d) {},
              width: 200,
              height: 200,
              seperatorColor: Colors.white,
              imageDecoration:
                  BoxDecoration(border: Border.all(color: Colors.white)),
              galleryType: 1,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text("<<<< Gallery type 2 >>>>"),
            GalleryImageView(
              listImage: _imageProviders,
               onDownload: (d) {},
              width: 200,
              height: 200,
              seperatorColor: Colors.white,
              imageDecoration:
                  BoxDecoration(border: Border.all(color: Colors.white)),
              galleryType: 2,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text("<<<< Gallery type 4 >>>>"),
            GalleryImageView(
              listImage: _imageProviders,
               onDownload: (d) {},
              width: 200,
              height: 200,
              seperatorColor: Colors.white,
              galleryType: 4,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text("<<<< Gallery type 3 >>>>"),
            GalleryImageView(
              listImage: _imageProviders,
               onDownload: (d) {},
              width: 200,
              height: 200,
              seperatorColor: Colors.white,
              imageDecoration:
                  BoxDecoration(border: Border.all(color: Colors.white)),
              galleryType: 3,
            )
          ],
        )),
      ),
    );
  }
}

class CustomImageProvider extends EasyImageProvider {
  @override
  final int initialIndex;
  final List<String> imageUrls;

  CustomImageProvider({required this.imageUrls, this.initialIndex = 0})
      : super();

  @override
  ImageProvider<Object> imageBuilder(BuildContext context, int index) {
    return NetworkImage(imageUrls[index]);
  }

  @override
  int get imageCount => imageUrls.length;
}
