import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../generated/l10n.dart';
import '../../../core/components/constants/constant.dart';
import '../../../core/components/extensions/build_context_ext.dart';
import '../../../core/components/extensions/int_ext.dart';
import '../../../core/components/widgets/animation/animated_clip_rect.dart';
import '../../../core/components/widgets/animation/animated_flip.dart';
import '../../../core/components/widgets/will_pop_scope.dart';
import '../../../core/components/wrappers/dropdown_button_wrapper.dart';
import '../../../domain/entities/text_generate/prompt_use_case.dart';
import '../../app_coordinator.dart';
import '../bloc/text_generate_bloc.dart';

const _content = '{{your content here}}';

class TextGenerateScreen extends StatefulWidget {
  const TextGenerateScreen({
    super.key,
    Function? loginCallback,
  }) : _loginCallback = loginCallback;

  static const String routeName = 'text-generate';

  final Function? _loginCallback;

  @override
  State<TextGenerateScreen> createState() => _TextGenerateScreenState();
}

class _TextGenerateScreenState extends State<TextGenerateScreen> {
  final _formKey = GlobalKey<FormState>();

  TextGenerateBloc get bloc => context.read<TextGenerateBloc>();

  final _mapTextController = <int, TextEditingController>{};

  TextEditingController _getController(int key) {
    if (!_mapTextController.containsKey(key)) {
      _mapTextController[key] = TextEditingController();
    }

    return _mapTextController[key]!;
  }

  final _promptController = TextEditingController();

  final _contentController = TextEditingController();

  void _clearContent() {
    // show cupertino dialog style notice user need confirm to clear content
    showCupertinoDialog<bool>(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text(S.of(context).clearContent_openai),
          content: Text(S.of(context).clearConfirm_openai),
          actions: [
            CupertinoDialogAction(
              child: Text(S.of(context).cancel_openai),
              onPressed: () => Navigator.of(context).pop(false),
            ),
            CupertinoDialogAction(
              isDefaultAction: true,
              isDestructiveAction: true,
              onPressed: () => Navigator.of(context).pop(true),
              child: Text(S.of(context).clear_openai),
            ),
          ],
        );
      },
    ).then((value) {
      if (value == true) {
        _contentController.clear();
        _textChanged('');
      }
    });
  }

  void _onPromptUseCaseChanged(PromptUseCase? useCase) {
    bloc.add(TextGenerateEvent.useCaseChanged(useCase: useCase!));
    for (var element in _mapTextController.values) {
      element.clear();
    }
    _promptController.clear();
  }

  String? _validator(value) {
    if (value == null || value.isEmpty) {
      return S.of(context).pleaseInputValue_openai;
    }

    return null;
  }

  void _generateContent(PromptUseCase selectedUseCase) {
    if (!_formKey.currentState!.validate()) {
      _showMessage(S.of(context).pleaseInputFillAllFields_openai);

      return;
    }

    final listSubPromptUseCase = selectedUseCase.listSubPromptUseCase;

    final newListSubPromptUseCase = listSubPromptUseCase
        .mapIndexed(
          (index, subPrompt) =>
              subPrompt.copyWith(promptText: _getController(index).text),
        )
        .toList();

    final useCaseWithInput =
        selectedUseCase.copyWith(listSubPromptUseCase: newListSubPromptUseCase);

    bloc.add(TextGenerateEvent.generateContent(useCaseWithInput));
  }

  void _generateContentWithPrompt() {
    bloc.add(TextGenerateEvent.generateContentWithPrompt(
      prompt: _promptController.text,
    ));
  }

  void _changeToEditMode() {
    bloc.add(const TextGenerateEvent.changeToEditMode());
  }

  void _changeToViewMode() {
    _textChanged(_contentController.text);
    bloc.add(const TextGenerateEvent.changeToViewMode());
  }

  void _completeAnimatedText() {
    if (_contentController.text.isEmpty) {
      return;
    }
    bloc.add(const TextGenerateEvent.completeAnimatedText());
  }

  void _textChanged(String text) {
    bloc.add(TextGenerateEvent.textChanged(text));
  }

  void _onCopyContent() {
    context.copyText(_contentController.text, showNotice: false);
    _showMessage(S.of(context).copiedToClipboard_openai);
  }

  void _onSelectPrompt() {
    bloc.add(TextGenerateEvent.selectPrompt(
      selectPrompt: () => context.showSelectPrompt(),
    ));
  }

  void _listenStateChanged(_, TextGenerateState state) {
    state.whenOrNull(
      success: (data) {
        _contentController.text = data.content;
      },
      loading: (_) {
        _contentController.text = '';
        FocusScope.of(context).requestFocus(FocusNode());
      },
      failure: (_, errorMessage) {
        _showMessage(errorMessage);
      },
      editMode: (data) {
        _contentController.text = data.content;
      },
      expiredSubscription: (data, errorMessage, identifier) async {
        final newIdentifier = await context.showExpiredSubscriptionBottomSheet(
          identifier,
          widget._loginCallback,
        );
        if (newIdentifier != null) {
          bloc.add(TextGenerateEvent.updateIdentifier(newIdentifier));
        }
      },
      updateIdentifierSuccess: (data, isExpiredSubscription) {
        if (isExpiredSubscription) {
          context.showSubscriptionBottomSheet();
        }
      },
      selectPromptSuccess: (data, prompt) {
        _promptController.text = prompt.description;
        const lengthOfContent = _content.length;
        if (_promptController.text.contains(_content)) {
          final startIndex = _promptController.text.indexOf(_content);
          final endIndex = startIndex + lengthOfContent;
          _promptController.selection = TextSelection(
            baseOffset: startIndex,
            extentOffset: endIndex,
          );
        } else {
          _promptController.selection =
              TextSelection.collapsed(offset: _promptController.text.length);
        }
      },
    );
  }

  void _closeMessage() => ScaffoldMessenger.of(context).clearMaterialBanners();

  void _showMessage(String message) {
    _closeMessage();
    ScaffoldMessenger.of(context).showMaterialBanner(
      MaterialBanner(
        content: Text(message),
        onVisible: () {
          Future.delayed(const Duration(seconds: 2)).then((value) {
            if (mounted) {
              _closeMessage();
            }
          });
        },
        actions: [
          TextButton(
            onPressed: () {
              _closeMessage();
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    bloc.add(const TextGenerateEvent.started());
  }

  @override
  void dispose() {
    _contentController.dispose();
    _promptController.dispose();
    for (var element in _mapTextController.values) {
      element.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TextGenerateBloc, TextGenerateState>(
      listener: _listenStateChanged,
      builder: (context, state) {
        final dataState = state.data;
        final content = dataState.content;
        final selectedUseCase = dataState.selectedUseCase;
        final isEditing = state.maybeWhen(
          orElse: () => false,
          editMode: (_) => true,
        );

        return Scaffold(
          resizeToAvoidBottomInset: isEditing,
          appBar: AppBar(
            title: Text(S.of(context).textGenerator_openai),
            backgroundColor: Theme.of(context).colorScheme.primary,
          ),
          body: WillPopScopeWidget(
            onWillPop: () async {
              _closeMessage();

              return true;
            },
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _buildSelectAndInputUseCase(
                        isEditing: isEditing,
                        selectedUseCase: selectedUseCase,
                        useCases: dataState.useCases,
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        height: 30,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            OutlinedButton.icon(
                              onPressed:
                                  state.allowClear ? _clearContent : null,
                              icon: const Icon(
                                CupertinoIcons.clear_circled,
                                size: 16,
                              ),
                              label: Text(S.of(context).clear_openai),
                            ),
                            ElevatedButton.icon(
                              onPressed:
                                  state.allowCopy ? _onCopyContent : null,
                              icon: const Icon(
                                Icons.copy_all_rounded,
                                size: 16,
                              ),
                              label: Text(S.of(context).copy_openai),
                            ),
                            !isEditing
                                ? ElevatedButton.icon(
                                    onPressed: state.allowEdit
                                        ? _changeToEditMode
                                        : null,
                                    icon: const Icon(
                                      Icons.mode_edit_outline_outlined,
                                      size: 16,
                                    ),
                                    label: Text(S.of(context).edit_openai),
                                  )
                                : ElevatedButton.icon(
                                    onPressed: _changeToViewMode,
                                    icon: const Icon(
                                      Icons.chrome_reader_mode_outlined,
                                      size: 16,
                                    ),
                                    label: Text(S.of(context).view_openai),
                                  ),
                          ]
                              .expand((element) => [
                                    Expanded(child: element),
                                    const SizedBox(width: 8),
                                  ])
                              .toList()
                            ..removeLast(),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Expanded(
                        child: AnimatedFlip(
                          showFront: !isEditing,
                          frontWidget: InputDecorator(
                            expands: true,
                            textAlign: TextAlign.start,
                            textAlignVertical: TextAlignVertical.top,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                ),
                              ),
                              contentPadding: EdgeInsets.all(12),
                            ),
                            child: SingleChildScrollView(
                              reverse: true,
                              child: state.data.isCompleteAnimatedText
                                  ? Text(
                                      content,
                                      style: const TextStyle(
                                        fontSize: 16.0,
                                      ),
                                    )
                                  : AnimatedTextKit(
                                      key: ValueKey(content),
                                      animatedTexts: [
                                        TypewriterAnimatedText(
                                          content,
                                          textStyle: const TextStyle(
                                            fontSize: 16.0,
                                          ),
                                          speed:
                                              const Duration(milliseconds: 15),
                                        ),
                                      ],
                                      totalRepeatCount: 4,
                                      displayFullTextOnTap: true,
                                      isRepeatingAnimation: false,
                                      onFinished: _completeAnimatedText,
                                      onTap: _completeAnimatedText,
                                    ),
                            ),
                          ),
                          rearWidget: TextField(
                            maxLines: null,
                            autocorrect: false,
                            controller: _contentController,
                            minLines: 50,
                            selectionControls: MaterialTextSelectionControls(),
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                              ),
                              contentPadding: const EdgeInsets.all(12),
                              fillColor: Theme.of(context)
                                  .dividerColor
                                  .withOpacity(0.03),
                              filled: true,
                            ),
                          ),
                        ),
                      ),
                      SafeArea(
                        minimum: const EdgeInsets.symmetric(
                          vertical: 16,
                        ).copyWith(top: 8),
                        top: false,
                        bottom: false,
                        child: AnimatedSlide(
                          duration: const Duration(milliseconds: 250),
                          offset: isEditing
                              ? const Offset(0, 1)
                              : const Offset(0, 0),
                          child: AnimatedClipRect(
                            duration: const Duration(milliseconds: 250),
                            alignment: Alignment.bottomCenter,
                            open: !isEditing,
                            child: SizedBox(
                              // height: state.data.isEditing ? 0 : null,
                              width: double.infinity,
                              child: ElevatedButton.icon(
                                onPressed: isEditing
                                    ? null
                                    : dataState.selectedUseCase.isPromptLibrary
                                        ? _generateContentWithPrompt
                                        : () => _generateContent(
                                              dataState.selectedUseCase,
                                            ),
                                icon: isEditing
                                    ? const SizedBox()
                                    : const Icon(Icons.create, size: 16),
                                label: Text(S.of(context).write_openai),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                state.maybeWhen(
                  loading: (_) {
                    return Container(
                      color: Colors.black.withOpacity(0.4),
                      child: const Center(
                        child: CupertinoActivityIndicator(
                          radius: 20,
                        ),
                      ),
                    );
                  },
                  orElse: () {
                    return const SizedBox.shrink();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildSelectAndInputUseCase({
    required bool isEditing,
    required PromptUseCase selectedUseCase,
    required List<PromptUseCase> useCases,
  }) {
    return AnimatedSlide(
      offset: !isEditing ? Offset.zero : const Offset(0, -1.25),
      duration: const Duration(milliseconds: 250),
      child: AnimatedClipRect(
        open: !isEditing,
        duration: const Duration(milliseconds: 250),
        reverseDuration: const Duration(milliseconds: 250),
        reverseCurve: Curves.easeInOut,
        alignment: Alignment.bottomCenter,
        child: AnimatedSize(
          duration: const Duration(milliseconds: 250),
          reverseDuration: const Duration(milliseconds: 250),
          alignment: Alignment.topCenter,
          curve: Curves.easeInOut,
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 16),
                Text(S.of(context).chooseUseCase_openai),
                const SizedBox(height: 8),
                LayoutBuilder(
                  builder: (context, constraints) {
                    return DropdownButtonWrapper<PromptUseCase>(
                      items: useCases,
                      onChanged: _onPromptUseCaseChanged,
                      value: selectedUseCase.copyWith(
                        listSubPromptUseCase: selectedUseCase
                            .listSubPromptUseCase
                            .map((e) => e.copyWith(promptText: ''))
                            .toList(),
                      ),
                      displayValue: (value) => value?.name ?? '',
                      dropdownWidth: constraints.maxWidth * 2 / 3,
                      buttonHeight: 48,
                    );
                  },
                ),
                const SizedBox(height: 12),
                ...List.generate(
                  selectedUseCase.listSubPromptUseCase.length,
                  (index) {
                    final listSubPromptUseCase =
                        selectedUseCase.listSubPromptUseCase;
                    final subUseCase =
                        selectedUseCase.listSubPromptUseCase[index];

                    if (selectedUseCase.isPromptLibrary) {
                      return SelectPromptLibraryWidget(
                        name: subUseCase.type.title(context),
                        description: subUseCase.description,
                        controller: _promptController,
                        onSelectPrompt: _onSelectPrompt,
                      );
                    }

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(subUseCase.type.title(context)),
                        const SizedBox(height: 8),
                        TextFormField(
                          autocorrect: false,
                          controller: _getController(index),
                          validator: _validator,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            contentPadding: const EdgeInsets.all(12),
                            hintText: subUseCase.description,
                          ),
                        ),
                        if (!index.isLastIndex(listSubPromptUseCase.length))
                          const SizedBox(height: 12),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SelectPromptLibraryWidget extends StatefulWidget {
  const SelectPromptLibraryWidget({
    super.key,
    required this.name,
    required this.description,
    required this.controller,
    this.onSelectPrompt,
  });

  final String name;
  final String description;
  final TextEditingController controller;
  final VoidCallback? onSelectPrompt;

  @override
  State<SelectPromptLibraryWidget> createState() =>
      _SelectPromptLibraryWidgetState();
}

class _SelectPromptLibraryWidgetState extends State<SelectPromptLibraryWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(widget.name),
        const SizedBox(height: 8),
        TextField(
          autocorrect: false,
          controller: widget.controller,
          maxLines: 4,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            contentPadding: const EdgeInsets.all(12),
            hintText: widget.description,
          ),
        ),
        OutlinedButton(
          onPressed: widget.onSelectPrompt,
          child: Text(S.of(context).selectPrompt_openai),
        ),
      ],
    );
  }
}
