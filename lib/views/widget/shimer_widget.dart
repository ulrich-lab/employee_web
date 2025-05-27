import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerColumnWidget extends StatelessWidget {
  const ShimmerColumnWidget({
    super.key,
    required this.itemWith,
    required this.itemHeight,
    required this.shimmerHeight,
  });

  final double itemWith;
  final double itemHeight;
  final double shimmerHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: shimmerHeight,
      child: Shimmer.fromColors(
        baseColor: Colors.grey,
        highlightColor: Colors.white10,
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (ctx, i) => Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  color: Colors.white10,
                  height: itemHeight,
                  width: itemWith,
                ),
              ),
              SizedBox(height: 10)
            ],
          ),
        ),
      ),
    );
  }
}

class ShimmerRowWidget extends StatelessWidget {
  const ShimmerRowWidget({
    super.key,
    required this.itemWith,
    required this.itemHeight,
    required this.shimmerHeight,
  });

  final double itemWith;
  final double itemHeight;
  final double shimmerHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: shimmerHeight,
      child: Shimmer.fromColors(
        baseColor: Colors.grey,
        highlightColor: Colors.white10,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (ctx, i) => Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  color: Colors.white10,
                  height: itemHeight,
                  width: itemWith,
                ),
              ),
              SizedBox(width: 10)
            ],
          ),
        ),
      ),
    );
  }
}

class ShimmerGridWidget extends StatelessWidget {
  const ShimmerGridWidget({
    super.key,
    required this.itemWith,
    required this.shimmerHeight,
  });

  final double itemWith;
  final double shimmerHeight;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final int crossAxisCount = screenWidth > 600 ? 4 : 2;
    return SizedBox(
      height: shimmerHeight,
      child: Shimmer.fromColors(
        baseColor: Colors.grey,
        highlightColor: Colors.white10,
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 1,
            // Vous pouvez ajuster les autres paramètres ici
          ),
          itemCount: 10,
          itemBuilder: (c, i) => ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              color: Colors.white10,
              // height: itemHeight,
              width: itemWith,
            ),
          ),
        ),
      ),
    );
  }
}

class ShimmerContainerWidget extends StatelessWidget {
  const ShimmerContainerWidget({
    super.key,
    required this.itemWith,
    required this.itemHeight,
  });

  final double itemWith;
  final double itemHeight;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey,
      highlightColor: Colors.white10,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          color: Colors.white10,
          height: itemHeight,
          width: itemWith,
        ),
      ),
    );
  }
}
