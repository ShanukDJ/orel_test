import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AppNetworkImageView extends StatelessWidget {
  final String? url;
  final String? meta;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final BoxShape? shape;
  final BorderRadius? borderRadius;
  const AppNetworkImageView({
    Key? key,
    this.url,
    required this.meta,
    this.width,
    this.height,
    this.fit,
    this.shape,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url ?? 'https://avatars.dicebear.com/api/initials/${meta ?? "OrelTest"}.png',
      fit: fit,
      imageBuilder: (context, imageProvider) {
        return Container(
          width: width,
          height: height,
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.green
            ),
            shape: shape ?? BoxShape.circle,
            borderRadius: shape != BoxShape.circle ? borderRadius : null,
            color: Theme.of(context).colorScheme.surface,
            image: DecorationImage(
              image: imageProvider,
              fit: fit,
            ),
          ),
        );
      },
      progressIndicatorBuilder: (context, url, progress) {
        return Container(
          width: width,
          height: height,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            shape: shape ?? BoxShape.circle,
            borderRadius: shape != BoxShape.circle ? borderRadius : null,
            color: Theme.of(context).colorScheme.surface,
          ),
          child: Center(
            child: CircularProgressIndicator(
              value: progress.progress,
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(
                Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
        );
      },
      errorWidget: (context, url, error) {
        return Container(
          width: width,
          height: height,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            shape: shape ?? BoxShape.circle,
            borderRadius: shape != BoxShape.circle ? borderRadius : null,
            color: Theme.of(context).colorScheme.surface,
          ),
          child: Center(
            child: Icon(
              Icons.error,
              color: Theme.of(context).colorScheme.error,
            ),
          ),
        );
      },
    );
  }
}