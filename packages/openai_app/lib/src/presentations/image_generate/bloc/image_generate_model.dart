import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/image_generate/image_size.dart';
import '../../../domain/entities/image_generate/image_view_type.dart';

part 'image_generate_model.freezed.dart';

@freezed
class ImageGenerateModel with _$ImageGenerateModel {
  const factory ImageGenerateModel({
    String? identifier,
    @Default(false) bool allowSubmit,
    @Default(ImageViewType.page) ImageViewType viewType,
    @Default(ImageSize.small) ImageSize imageSize,
    @Default(0) int remainingImageGen,
  }) = _ImageGenerateModel;
}
