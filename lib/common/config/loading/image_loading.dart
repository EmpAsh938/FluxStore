import 'package:flutter/material.dart';

import '../../../widgets/common/index.dart';
import '../models/loading_config.dart';

class ImageLoading extends StatelessWidget {
  final LoadingConfig loadingConfig;
  const ImageLoading(this.loadingConfig);

  @override
  Widget build(BuildContext context) {
    if (loadingConfig.path?.isEmpty ?? true) return const SizedBox();
    return SizedBox(
      height: (loadingConfig.size ?? 90.0).toDouble(),
      width: (loadingConfig.size ?? 90.0).toDouble(),
      child: FluxImage(imageUrl: loadingConfig.path!),
    );
  }
}
