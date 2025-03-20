import 'package:flutter/material.dart';

import '../../../../../generated/l10n.dart';
import '../../../../core/components/wrappers/dropdown_button_wrapper.dart';
import '../../../../domain/entities/image_generate/image_generate_option.dart';
import '../../../../domain/entities/image_generate/image_size.dart';
import '../../../../domain/entities/image_generate/image_view_type.dart';
import '../../../../domain/entities/payloads/image_generate_option_payload.dart';

const _firstItem = null;
const _maxItems = 10;

class ImageGenerateOptionWidget extends StatefulWidget {
  const ImageGenerateOptionWidget({
    super.key,
    required this.imageGenerateOption,
    required this.imageGenerateOptionController,
  });

  final ImageGenerateOption imageGenerateOption;
  final ImageGenerateOptionController imageGenerateOptionController;

  @override
  State<ImageGenerateOptionWidget> createState() =>
      _ImageGenerateOptionWidgetState();
}

class _ImageGenerateOptionWidgetState extends State<ImageGenerateOptionWidget> {
  ImageGenerateOptionPayload get data =>
      widget.imageGenerateOptionController.value;

  ImageGenerateOptionController get controller =>
      widget.imageGenerateOptionController;

  List<String?> get styles =>
      [_firstItem, ...widget.imageGenerateOption.styles];

  List<String?> get mediums =>
      [_firstItem, ...widget.imageGenerateOption.mediums];

  List<String?> get artists =>
      [_firstItem, ...widget.imageGenerateOption.artists];

  List<String?> get moods => [_firstItem, ...widget.imageGenerateOption.moods];

  List<String?> get details =>
      [_firstItem, ...widget.imageGenerateOption.details];

  final divider = const Divider(height: 2);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final subTitleTheme = theme.textTheme.bodySmall?.copyWith(
      fontWeight: FontWeight.w500,
      color: theme.textTheme.bodySmall?.color?.withOpacity(0.5),
    );

    return ValueListenableBuilder(
      valueListenable: widget.imageGenerateOptionController,
      builder: (context, value, child) {
        return Column(
          children: [
            Column(
              children: [
                ListTile(
                  title: Text(S.of(context).layoutStyle_openai),
                  trailing: DropdownButtonWrapper<ImageViewType>(
                    items: ImageViewType.values,
                    displayValue: (imageViewType) =>
                        imageViewType?.displayValue ?? '',
                    onChanged: (imageViewType) {
                      controller.setImageViewType(
                        imageViewType ?? ImageViewType.page,
                      );
                    },
                    value: data.imageViewType,
                  ),
                ),
                ListTile(
                  title: Text(S.of(context).imageSize_openai),
                  trailing: DropdownButtonWrapper<ImageSize>(
                    items: ImageSize.values,
                    displayValue: (imageSize) => imageSize?.displayValue ?? '',
                    onChanged: (imageSize) {
                      controller.setImageSize(imageSize ?? ImageSize.small);
                    },
                    value: data.imageSize,
                  ),
                ),
                ListTile(
                  title: Text(S.of(context).numberOfImages_openai),
                  subtitle: Text(
                    S.of(context).numberOfImagesCondition_openai,
                    style: subTitleTheme,
                  ),
                  trailing: DropdownButtonWrapper<int>(
                    items: List.generate(_maxItems, (index) => (index + 1)),
                    onChanged: (numberOfImages) {
                      controller.setNumberOfImages(numberOfImages ?? 1);
                    },
                    value: data.numberOfImages,
                  ),
                ),
                ListTile(
                  title: Text(S.of(context).style_openai),
                  subtitle: Text(
                    S.of(context).choseStyle_openai,
                    style: subTitleTheme,
                  ),
                  trailing: DropdownButtonWrapper<String?>(
                    items: styles,
                    displayValue: _getEffectiveValue,
                    onChanged: (style) {
                      controller.setStyle(style);
                    },
                    value: data.style,
                  ),
                ),
                ListTile(
                  title: Text(S.of(context).medium_openai),
                  subtitle: Text(
                    S.of(context).chooseMedium_openai,
                    style: subTitleTheme,
                  ),
                  trailing: DropdownButtonWrapper<String?>(
                    items: mediums,
                    displayValue: _getEffectiveValue,
                    onChanged: (value) {
                      controller.setMedium(value);
                    },
                    value: data.medium,
                  ),
                ),
                ListTile(
                  title: Text(S.of(context).mood_openai),
                  subtitle: Text(
                    S.of(context).chooseMood_openai,
                    style: subTitleTheme,
                  ),
                  trailing: DropdownButtonWrapper<String?>(
                    items: moods,
                    displayValue: _getEffectiveValue,
                    onChanged: (value) {
                      controller.setMood(value);
                    },
                    value: data.mood,
                    offset: const Offset(-10, 250),
                  ),
                ),
                ListTile(
                  title: Text(S.of(context).artist_openai),
                  subtitle: Text(
                    S.of(context).chooseArtist_openai,
                    style: subTitleTheme,
                  ),
                  trailing: DropdownButtonWrapper<String?>(
                    items: artists,
                    displayValue: _getEffectiveValue,
                    onChanged: (value) {
                      controller.setArtist(value);
                    },
                    value: data.artist,
                    offset: const Offset(-10, 250),
                  ),
                ),
                ListTile(
                  title: Text(S.of(context).detail_openai),
                  subtitle: Text(
                    S.of(context).chooseDetail_openai,
                    style: subTitleTheme,
                  ),
                  trailing: DropdownButtonWrapper<String?>(
                    items: details,
                    dropdownWidth: 220,
                    displayValue: _getEffectiveValue,
                    onChanged: (value) {
                      controller.setDetail(value);
                    },
                    value: data.detail,
                    offset: const Offset(-10, 250),
                  ),
                ),
              ]
                  .expand((element) => [
                        element,
                        divider,
                      ])
                  .toList()
                ..removeLast(),
            ),
            SafeArea(
              top: false,
              minimum: const EdgeInsets.only(
                bottom: 16,
                top: 12,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: SizedBox(
                  height: 44,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Reset setting and apply button
                      Expanded(
                        child: ElevatedButton(
                          onPressed: controller.reset,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).disabledColor,
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                            ),
                          ),
                          child: Text(S.of(context).reset_openai),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: Navigator.of(context).pop,
                          style: ElevatedButton.styleFrom(
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                            ),
                          ),
                          child: Text(S.of(context).apply_openai),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  String _getEffectiveValue(String? value) {
    return value ?? S.of(context).none_openai;
  }
}

class ImageGenerateOptionController
    extends ValueNotifier<ImageGenerateOptionPayload> {
  ImageGenerateOptionController({ImageGenerateOptionPayload? value})
      : super(value ?? const ImageGenerateOptionPayload());

  // set value(ImageGenerateOptionPayload value) => super.value = value;
  // ImageGenerateOptionPayload get value => super.value;

  void reset() {
    value = const ImageGenerateOptionPayload();
  }

  void setStyle(String? style) {
    value = value.copyWith(style: style);
  }

  void setMedium(String? medium) {
    value = value.copyWith(medium: medium);
  }

  void setArtist(String? artist) {
    value = value.copyWith(artist: artist);
  }

  void setMood(String? mood) {
    value = value.copyWith(mood: mood);
  }

  void setDetail(String? detail) {
    value = value.copyWith(detail: detail);
  }

  void setNumberOfImages(int numberOfImages) {
    value = value.copyWith(numberOfImages: numberOfImages);
  }

  void setImageSize(ImageSize imageSize) {
    value = value.copyWith(imageSize: imageSize);
  }

  void setImageViewType(ImageViewType imageViewType) {
    value = value.copyWith(imageViewType: imageViewType);
  }
}
