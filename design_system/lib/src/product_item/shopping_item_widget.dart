import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../theme/theme.dart';

class ShoppingItemWidget extends StatelessWidget {
  const ShoppingItemWidget({
    Key? key,
    required this.title,
    required this.url,
    required this.isFavorite,
    required this.onTapFavorite,
    this.subtitle,
  }) : super(key: key);

  final String title;
  final String? subtitle;
  final String url;
  final bool isFavorite;
  final Function(BuildContext) onTapFavorite;

  @override
  Widget build(BuildContext context) {
    const double containerHeight = 200;

    return SizedBox(
      height: containerHeight,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          SizedBox(
            height: containerHeight,
            width: double.infinity,
            child: CachedNetworkImage(
              imageUrl: url,
              fit: BoxFit.cover,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  Center(
                child: CircularProgressIndicator(
                  value: downloadProgress.progress,
                ),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          Container(
            height: containerHeight,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment(0, 0),
                end: Alignment(0, 1),
                colors: [
                  Colors.black12,
                  Colors.black87,
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: context.textTheme.subtitle2!.copyWith(
                          color: AppBaseColors.offWhite,
                        ),
                      ),
                      if (subtitle != null && subtitle!.trim().isNotEmpty) ...[
                        const SizedBox(height: 4),
                        Text(
                          subtitle!,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: context.textTheme.caption!.copyWith(
                            color: AppBaseColors.line,
                          ),
                        ),
                      ]
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: () => onTapFavorite(context),
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 200),
                    transitionBuilder: (child, animation) => ScaleTransition(
                      scale: animation,
                      child: child,
                    ),
                    child: isFavorite
                        ? const Icon(
                            Icons.favorite,
                            key: ValueKey('favorite_filled'),
                            color: AppBaseColors.chili,
                          )
                        : const Icon(
                            Icons.favorite_outline,
                            key: ValueKey('favorite_outlined'),
                            color: AppBaseColors.offWhite,
                          ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
