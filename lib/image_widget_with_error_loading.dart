import 'package:flutter/material.dart';

class ImageWidgetWithErrorLoading extends StatefulWidget {
  const ImageWidgetWithErrorLoading({super.key});

  @override
  State<ImageWidgetWithErrorLoading> createState() =>
      _ImageWidgetWithErrorLoadingState();
}

class _ImageWidgetWithErrorLoadingState
    extends State<ImageWidgetWithErrorLoading> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Image'),
        ),
        body: const ImageBuilderWidget(
          image:
              'https://images.pexels.com/photos/7878199/pexels-photo-7878199.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
        ));
  }
}

class ImageBuilderWidget extends StatelessWidget {
  final double height, width;
  final String image;

  const ImageBuilderWidget({
    super.key,
    this.height = 200,
    this.width = 200,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Image(
      height: height,
      width: width,
      image: NetworkImage(image),
      errorBuilder: (context, exception, stack) {
        return SizedBox(
          height: height,
          width: width,
          child: const Icon(
            Icons.error,
            color: Colors.red,
          ),
        );
      },
      loadingBuilder:
          (BuildContext context, Widget child, ImageChunkEvent? loading) {
        if (loading == null) return child;

        return SizedBox(
          height: height,
          width: width,
          child: Center(
            child: CircularProgressIndicator(
              value: loading.expectedTotalBytes != null
                  ? loading.cumulativeBytesLoaded / loading.expectedTotalBytes!
                  : null,
            ),
          ),
        );
      },
    );
  }
}
