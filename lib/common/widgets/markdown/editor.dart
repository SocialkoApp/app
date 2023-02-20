import 'package:app/profile/widgets/input.widget.dart';
import 'package:app/utils/assets.util.dart';
import 'package:app/utils/markdown/format.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

/// Widget with markdown buttons
class MarkdownTextInput extends StatefulWidget {
  /// Callback called when text changed
  final Function onTextChanged;

  /// Initial value you want to display
  final String initialValue;

  /// Validator for the TextFormField
  final String? Function(String? value)? validators;

  /// Change the text direction of the input (RTL / LTR)
  final TextDirection textDirection;

  /// List of action the component can handle
  final List<MarkdownType> actions;

  /// Optional controller to manage the input
  final TextEditingController controller;

  /// Constructor for [MarkdownTextInput]
  const MarkdownTextInput(
    this.onTextChanged,
    this.initialValue, {
    super.key,
    this.validators,
    this.textDirection = TextDirection.ltr,
    this.actions = const [
      MarkdownType.bold,
      MarkdownType.italic,
      MarkdownType.title,
      MarkdownType.link,
      MarkdownType.list
    ],
    required this.controller,
  });

  @override
  _MarkdownTextInputState createState() => _MarkdownTextInputState(controller);
}

class _MarkdownTextInputState extends State<MarkdownTextInput> {
  final TextEditingController _controller;
  TextSelection textSelection =
      const TextSelection(baseOffset: 0, extentOffset: 0);
  FocusNode focusNode = FocusNode();

  _MarkdownTextInputState(this._controller);

  void onTap(
    MarkdownType type, {
    int titleSize = 1,
    String? link,
    String? selectedText,
  }) {
    final basePosition = textSelection.baseOffset;
    var noTextSelected =
        (textSelection.baseOffset - textSelection.extentOffset) == 0;

    var fromIndex = textSelection.baseOffset;
    var toIndex = textSelection.extentOffset;

    final result = FormatMarkdown.convertToMarkdown(
      type,
      _controller.text,
      fromIndex,
      toIndex,
      titleSize: titleSize,
      link: link,
      selectedText: selectedText ??
          _controller.text.substring(
            fromIndex,
            toIndex,
          ),
    );

    _controller.value = _controller.value.copyWith(
      text: result.data,
      selection: TextSelection.collapsed(
        offset: basePosition + result.cursorIndex,
      ),
    );

    if (noTextSelected) {
      _controller.selection = TextSelection.collapsed(
        offset: _controller.selection.end - result.replaceCursorIndex,
      );
      focusNode.requestFocus();
    }
  }

  @override
  void initState() {
    _controller.text = widget.initialValue;
    _controller.addListener(() {
      if (_controller.selection.baseOffset != -1) {
        textSelection = _controller.selection;
      }
      widget.onTextChanged(_controller.text);
    });
    super.initState();
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppAssets.styles.inputBoxDecoration.copyWith(
        color: AppAssets.colors.dark,
      ),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 44,
            child: Material(
              color: AppAssets.colors.darkHighlight,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12.0),
                topRight: Radius.circular(12.0),
              ),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: widget.actions.map(
                  (type) {
                    switch (type) {
                      case MarkdownType.title:
                        return ExpandableNotifier(
                          child: Expandable(
                            key: const Key('H#_button'),
                            collapsed: ExpandableButton(
                              child: const Center(
                                child: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Text(
                                    'H#',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ),
                            ),
                            expanded: Container(
                              color: Colors.white10,
                              child: Row(
                                children: [
                                  for (int i = 1; i <= 6; i++)
                                    InkWell(
                                      key: Key('H${i}_button'),
                                      onTap: () => onTap(
                                        MarkdownType.title,
                                        titleSize: i,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Text(
                                          'H$i',
                                          style: TextStyle(
                                              fontSize: (18 - i).toDouble(),
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ),
                                    ),
                                  ExpandableButton(
                                    child: const Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Icon(
                                        Icons.close,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      case MarkdownType.link:
                        return _basicInkwell(
                          type,
                          customOnTap: () {
                            var text = _controller.text.substring(
                              textSelection.baseOffset,
                              textSelection.extentOffset,
                            );

                            var textController = TextEditingController()
                              ..text = text;
                            var linkController = TextEditingController();

                            showDialog<void>(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  backgroundColor: AppAssets.colors.dark,
                                  title: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      GestureDetector(
                                        child: const Icon(Icons.close),
                                        onTap: () => Navigator.pop(
                                          context,
                                        ),
                                      )
                                    ],
                                  ),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      MeInput(
                                        controller: textController,
                                        helper: 'Text',
                                      ),
                                      const SizedBox(height: 10),
                                      MeInput(
                                        controller: linkController,
                                        helper: 'Link',
                                      ),
                                    ],
                                  ),
                                  contentPadding: const EdgeInsets.all(
                                    20.0,
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        onTap(
                                          type,
                                          link: linkController.text,
                                          selectedText: textController.text,
                                        );
                                        Navigator.pop(context);
                                      },
                                      child: const Text('OK'),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        );
                      case MarkdownType.image:
                        return _basicInkwell(
                          type,
                          customOnTap: () {
                            var text = _controller.text.substring(
                              textSelection.baseOffset,
                              textSelection.extentOffset,
                            );

                            var textController = TextEditingController()
                              ..text = text;
                            var linkController = TextEditingController();

                            showDialog<void>(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  backgroundColor: AppAssets.colors.dark,
                                  title: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      GestureDetector(
                                        child: const Icon(Icons.close),
                                        onTap: () => Navigator.pop(
                                          context,
                                        ),
                                      )
                                    ],
                                  ),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      MeInput(
                                        controller: textController,
                                        helper: 'Alt Text',
                                      ),
                                      const SizedBox(height: 10),
                                      MeInput(
                                        controller: linkController,
                                        helper: 'Image Link',
                                      ),
                                    ],
                                  ),
                                  contentPadding: const EdgeInsets.all(
                                    20.0,
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        onTap(
                                          type,
                                          link: linkController.text,
                                          selectedText: textController.text,
                                        );
                                        Navigator.pop(context);
                                      },
                                      child: const Text('OK'),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        );
                      default:
                        return _basicInkwell(type);
                    }
                  },
                ).toList(),
              ),
            ),
          ),
          TextFormField(
            focusNode: focusNode,
            textInputAction: TextInputAction.newline,
            maxLines: null,
            controller: _controller,
            textCapitalization: TextCapitalization.sentences,
            validator: widget.validators != null
                ? (value) => widget.validators!(value)
                : null,
            // style: widget.textStyle ?? Theme.of(context).textTheme.bodyMedium,
            cursorColor: AppAssets.colors.primary,
            textDirection: widget.textDirection,
            decoration: AppAssets.styles.inputDecoration.copyWith(
              hintStyle: const TextStyle(
                color: Color.fromRGBO(63, 61, 86, 0.5),
              ),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 15,
                horizontal: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _basicInkwell(MarkdownType type, {Function? customOnTap}) {
    return InkWell(
      key: Key(type.key),
      onTap: () => customOnTap != null ? customOnTap() : onTap(type),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Icon(type.icon),
      ),
    );
  }
}
