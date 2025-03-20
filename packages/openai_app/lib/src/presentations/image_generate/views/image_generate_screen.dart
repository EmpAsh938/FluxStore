import 'dart:async';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../generated/l10n.dart';
import '../../../core/components/constants/constant.dart';
import '../../../core/components/widgets/auto_play_image_page_view.dart';
import '../../../core/components/widgets/custom_image.dart';
import '../../../core/components/widgets/dismiss_focus_overlay.dart';
import '../../../core/components/widgets/image_galery.dart';
import '../../../core/components/widgets/will_pop_scope.dart';
import '../../../domain/entities/image_generate/image_generate_option.dart';
import '../../../domain/entities/image_generate/image_size.dart';
import '../../../domain/entities/image_generate/image_view_type.dart';
import '../../app_coordinator.dart';
import '../bloc/image_generate_bloc.dart';
import 'widgets/image_generate_option_widget.dart';
import 'widgets/image_item.dart';

class ImageGenerateScreen extends StatefulWidget {
  const ImageGenerateScreen({
    super.key,
    Function? loginCallback,
  }) : _loginCallback = loginCallback;

  static const String routeName = 'image-generate';

  final Function? _loginCallback;

  @override
  State<ImageGenerateScreen> createState() => _ImageGenerateScreenState();
}

class _ImageGenerateScreenState extends State<ImageGenerateScreen> {
  final textController = TextEditingController();
  late final ImageGenerateOptionController imageGenerateController;

  final pageController = PageController();

  ImageGenerateBloc get _bloc => BlocProvider.of<ImageGenerateBloc>(context);

  @override
  void initState() {
    super.initState();
    _bloc.add(const ImageGenerateEvent.started());
    imageGenerateController = ImageGenerateOptionController();
    imageGenerateController.addListener(() {
      _onImageViewChange(imageGenerateController.value.imageViewType);
      _onImageSizeChange(imageGenerateController.value.imageSize);
    });
  }

  void _generateImage() {
    var text = textController.text.trim();
    if (text.isNotEmpty) {
      _bloc.add(ImageGenerateEvent.generateImage(
        prompt: text,
        optionPayload: imageGenerateController.value,
      ));
    }
  }

  void _closeErrorMessage() =>
      ScaffoldMessenger.of(context).hideCurrentMaterialBanner();

  void _onErrorMessage(String message) {
    _closeErrorMessage();
    ScaffoldMessenger.of(context).showMaterialBanner(
      MaterialBanner(
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              _closeErrorMessage();
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void _onTextChange(String value) {
    _bloc.add(ImageGenerateEvent.textChanged(text: value));
  }

  void _onImageSizeChange(ImageSize? value) {
    _bloc.add(ImageGenerateEvent.imageSizeChanged(
      imageSize: value ?? ImageSize.small,
    ));
  }

  void _onImageViewChange(ImageViewType? value) {
    _bloc.add(ImageGenerateEvent.imageViewChanged(
      viewType: value ?? ImageViewType.page,
    ));
  }

  void _onTapImage({
    required int index,
    required List<String> images,
  }) {
    Navigator.of(context)
        .push(
          FFTransparentPageRoute(
            pageBuilder: (context, _, ___) => ImageGallery(
              images: images,
              index: index,
              heroTagPrefix: 'image_generate',
            ),
          ),
        )
        .then((value) => pageController.jumpToPage(index));
  }

  Future _onShowOptions() async {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16),
        ),
      ),
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 12),
            Text(
              S.of(context).settings_openai,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            ImageGenerateOptionWidget(
              imageGenerateOption: const ImageGenerateOption(
                artists: [
                  'Pixar',
                  'Disney',
                  'Van Gogh',
                  'Mona Lisa',
                ],
                styles: [
                  'Abstract',
                  'Anime',
                  'Cartoon',
                  'Comic',
                  'Manga',
                ],
                moods: [
                  'Happy',
                  'Sad',
                  'Angry',
                  'Calm',
                  'Excited',
                ],
                details: [
                  'Black and White',
                  'Color',
                  'Ambient Light',
                  'Sharp',
                  'Full face portrait',
                ],
                mediums: [
                  'Pencil',
                  'Canvas',
                  'Glass',
                  'Wood',
                  'Paper',
                  'Sculpture',
                  'Painting',
                  'Drawing',
                  'Digital Art',
                  'Mixed Media',
                ],
              ),
              imageGenerateOptionController: imageGenerateController,
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    textController.dispose();
    imageGenerateController.dispose();
    imageGenerateController.removeListener(() {
      _onImageViewChange(imageGenerateController.value.imageViewType);
      _onImageSizeChange(imageGenerateController.value.imageSize);
    });
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScopeWidget(
      onWillPop: () async {
        _closeErrorMessage();

        return true;
      },
      child: DismissFocusOverlay(
        child: Stack(
          children: [
            Container(
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
            if (Constant.chatBackgroundImage.isNotEmpty)
              Positioned.fill(
                child: CustomImage(
                  imageUrl: Constant.chatBackgroundImage,
                  fit: BoxFit.cover,
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                ),
              ),
            BlocConsumer<ImageGenerateBloc, ImageGenerateState>(
              listener: _listenStateChanged,
              builder: (_, state) {
                final remainingImageGenerateCount =
                    state.data.remainingImageGen;

                return Scaffold(
                  appBar: AppBar(
                    leadingWidth: 30,
                    centerTitle: true,
                    toolbarHeight: 70,
                    elevation: 0,
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    title: CupertinoSearchTextField(
                      controller: textController,
                      enabled: state.maybeWhen(
                        loading: (_) => false,
                        orElse: () => true,
                      ),
                      style: Theme.of(context).textTheme.titleMedium,
                      onChanged: _onTextChange,
                      onSubmitted: (value) => _generateImage(),
                      backgroundColor:
                          Theme.of(context).scaffoldBackgroundColor,
                      placeholder: S.of(context).searchByPrompt_openai,
                    ),
                  ),
                  backgroundColor: Colors.transparent,
                  body: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child:
                            BlocBuilder<ImageGenerateBloc, ImageGenerateState>(
                          builder: (context, state) {
                            return state.maybeWhen(
                              orElse: () => const SizedBox.shrink(),
                              loading: (_) => const Center(
                                child: CupertinoActivityIndicator(),
                              ),
                              success: (data, images) {
                                if (images.isEmpty) {
                                  return Center(
                                    child: Text(
                                        S.of(context).noImageGenerate_openai),
                                  );
                                }

                                if (state.data.viewType.isPage) {
                                  return _buildCarouselImages(images);
                                }

                                return _buildGridViewImages(images);
                              },
                            );
                          },
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Expanded(
                            child: _buildFilters(),
                          ),
                          const SizedBox(width: 16),
                          Container(
                            margin: const EdgeInsets.all(4),
                            height: 56,
                            width: 56,
                            child: ElevatedButton(
                              onPressed: state.maybeWhen(
                                orElse: () => _onShowOptions,
                                loading: (_) => null,
                              ),
                              style: ElevatedButton.styleFrom(
                                elevation: 1,
                                padding: const EdgeInsets.all(10),
                                backgroundColor:
                                    Theme.of(context).colorScheme.primary,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(12),
                                  ),
                                ),
                              ),
                              child: const Icon(Icons.auto_fix_high),
                            ),
                          ),
                          const SizedBox(width: 16),
                        ],
                      ),
                      SafeArea(
                        minimum: const EdgeInsets.all(16).copyWith(top: 12),
                        top: false,
                        child: SizedBox(
                          height: 44,
                          child: ElevatedButton(
                            onPressed:
                                state.data.allowSubmit ? _generateImage : null,
                            style: ElevatedButton.styleFrom(
                              elevation: 1,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                ),
                              ),
                            ),
                            child: Text(
                              remainingImageGenerateCount > 0
                                  ? S.of(context).timeGenerate_openai(
                                      remainingImageGenerateCount)
                                  : S.of(context).generate_openai,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void _listenStateChanged(_, ImageGenerateState state) {
    state.whenOrNull(
      error: (data, error) => _onErrorMessage(error),
      expiredSubscription: (data, errorMessage, identifier) async {
        final newIdentifier = await context.showExpiredSubscriptionBottomSheet(
          identifier,
          widget._loginCallback,
        );
        if (newIdentifier != null) {
          _bloc.add(ImageGenerateEvent.updateIdentifier(newIdentifier));
        }
      },
      updateIdentifierSuccess: (data, isExpiredSubscription) {
        if (isExpiredSubscription) {
          context.showSubscriptionBottomSheet();
        }
      },
    );
  }

  Widget _buildFilters() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: AnimatedBuilder(
        animation: imageGenerateController,
        builder: (context, child) {
          final value = imageGenerateController.value;

          return Row(
            children: [
              if (value.style != null)
                _buildTag(
                  text: value.style!,
                  title: S.current.style_openai,
                  onTap: () => imageGenerateController.setStyle(null),
                ),
              if (value.medium != null)
                _buildTag(
                  text: value.medium!,
                  title: S.current.medium_openai,
                  onTap: () => imageGenerateController.setMedium(null),
                ),
              if (value.mood != null)
                _buildTag(
                  text: value.mood!,
                  title: S.current.mood_openai,
                  onTap: () => imageGenerateController.setMood(null),
                ),
              if (value.artist != null)
                _buildTag(
                  text: value.artist!,
                  title: S.current.artist_openai,
                  onTap: () => imageGenerateController.setArtist(null),
                ),
              if (value.detail != null)
                _buildTag(
                  text: value.detail!,
                  title: S.current.detail_openai,
                  onTap: () => imageGenerateController.setDetail(null),
                ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildTag({
    required String text,
    required String title,
    VoidCallback? onTap,
  }) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: onTap,
      key: ValueKey(text),
      child: Padding(
        padding: const EdgeInsets.only(right: 8),
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 8,
          ),
          margin: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            color: theme.scaffoldBackgroundColor,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
            border: Border.all(
              width: 0.5,
              color: theme.colorScheme.secondary.withOpacity(0.25),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: theme.textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: theme.textTheme.bodySmall?.color?.withOpacity(0.5),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                text,
                style: theme.textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGridViewImages(List<String> images) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      padding: const EdgeInsets.all(12),
      itemCount: images.length,
      itemBuilder: (context, index) {
        final url = images[index];

        return ImageItem(
          image: ExtendedNetworkImageProvider(url),
          onTap: () => _onTapImage(
            images: images,
            index: index,
          ),
        );
      },
    );
  }

  Widget _buildCarouselImages(List<String> images) {
    return Column(
      children: [
        Expanded(
          child: AutoPlayImagePageView(
            controller: pageController,
            duration: const Duration(seconds: 5),
            imageUrls: images,
            builder: (context, index, image) {
              return ImageItem(
                image: image,
                onTap: () => _onTapImage(
                  images: images,
                  index: index,
                ),
              );
            },
          ),
        ),
        SmoothPageIndicator(
          controller: pageController, // PageController
          count: images.length,
          effect: ExpandingDotsEffect(
            dotWidth: 8,
            dotHeight: 8,
            activeDotColor: Theme.of(context).colorScheme.primary,
            dotColor: Theme.of(context).colorScheme.secondary.withOpacity(0.5),
          ), // your preferred effect
          onDotClicked: (index) => pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          ),
        ),
        const SizedBox(height: 46),
      ],
    );
  }
}

/// Transparent Page Route
class FFTransparentPageRoute<T> extends PageRouteBuilder<T> {
  FFTransparentPageRoute({
    super.settings,
    required super.pageBuilder,
    super.transitionsBuilder = _defaultTransitionsBuilder,
    super.transitionDuration = const Duration(milliseconds: 150),
    super.barrierDismissible,
    super.barrierColor,
    super.barrierLabel,
    super.maintainState,
  }) : super(
          opaque: false,
        );
}

Widget _defaultTransitionsBuilder(
  BuildContext _,
  Animation<double> animation,
  Animation<double> __,
  Widget child,
) {
  return FadeTransition(
    opacity: CurvedAnimation(
      parent: animation,
      curve: Curves.easeOut,
    ),
    child: child,
  );
}
