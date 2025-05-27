import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:visitor_pass/constants/constants.dart';

class CachedImage extends StatelessWidget {
  const CachedImage(
      {super.key,
      required this.width,
      required this.height,
      required this.imageUrl});
  final double width;
  final double height;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        imageBuilder: (context, imageProvider) => CircleAvatar(
          radius: 40.0,
          backgroundColor: Colors.transparent,
          backgroundImage: imageProvider,
        ),
        placeholder: (context, url) => Shimmer.fromColors(
          child: const CircleAvatar(radius: 40.0),
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[400]!,
        ),
        errorWidget: (context, url, error) => CircleAvatar(
          child: Image.asset(
            'assets/images/visitor.png',
            width: width,
            height: height,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class CachedImageOnLine extends StatelessWidget {
  const CachedImageOnLine({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,
      height: 60,
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        imageBuilder: (context, imageProvider) => Stack(
          children: [
            CircleAvatar(
              radius: 40.0,
              backgroundColor: Colors.transparent,
              backgroundImage: imageProvider,
            ),
            Positioned(
              bottom: 0,
              right: 5,
              child: Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xff59CA00),
                ),
              ),
            )
          ],
        ),
        placeholder: (context, url) => Shimmer.fromColors(
          child: const CircleAvatar(radius: 40.0),
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[400]!,
        ),
        errorWidget: (context, url, error) => CircleAvatar(
          child: Image.asset(
            'assets/images/visitor.png',
            width: 60,
            height: 60,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
