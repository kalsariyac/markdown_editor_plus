import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../src/toolbar.dart';
import 'modal_select_emoji.dart';
import 'modal_input_url.dart';
import 'toolbar_item.dart';

class MarkdownToolbar extends StatelessWidget {
  /// Preview/Eye button
  final VoidCallback? onPreviewChanged;
  final TextEditingController controller;
  final VoidCallback? unfocus;
  final bool emojiConvert;
  final bool autoCloseAfterSelectEmoji;
  final Toolbar toolbar;
  final Color? toolbarBackground;
  final Color? expandableBackground;
  final bool showPreviewButton;
  final bool showEmojiSelection;
  final VoidCallback? onActionCompleted;
  final String? markdownSyntax;

  final bool showClearFieldButton;
  final bool showResetTextButton;
  final bool showSelectSingleLineButton;
  final bool showBoldButton;
  final bool showItalicButton;
  final bool showStrikethroughButton;
  final bool showHeadingButton;
  final bool showUnorderButton;
  final bool showCheckboxButton;
  final bool showLinkButton;
  final bool showImageButton;
  final bool showBlockquoteButton;
  final bool showCodeButton;
  final bool showLineButton;

  const MarkdownToolbar({
    Key? key,
    this.onPreviewChanged,
    this.markdownSyntax,
    required this.controller,
    this.emojiConvert = true,
    this.unfocus,
    required this.toolbar,
    this.autoCloseAfterSelectEmoji = true,
    this.toolbarBackground,
    this.expandableBackground,
    this.onActionCompleted,
    this.showPreviewButton = false,
    this.showEmojiSelection = false,
    this.showClearFieldButton = false,
    this.showResetTextButton = false,
    this.showSelectSingleLineButton = false,
    this.showBoldButton = true,
    this.showItalicButton = true,
    this.showStrikethroughButton = true,
    this.showHeadingButton = false,
    this.showUnorderButton = false,
    this.showCheckboxButton = false,
    this.showLinkButton = false,
    this.showImageButton = false,
    this.showBlockquoteButton = false,
    this.showCodeButton = false,
    this.showLineButton = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: toolbarBackground ?? Colors.grey[200],
      width: double.maxFinite,
      height: 45,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            // preview
            if (showPreviewButton)
              ToolbarItem(
                key: const ValueKey<String>("toolbar_view_item"),
                icon: FontAwesomeIcons.eye,
                onPressedButton: onPreviewChanged,
                tooltip: 'Show/Hide markdown preview',
              ),

            // Clear the field
            if (showLineButton)
            ToolbarItem(
              key: const ValueKey<String>("toolbar_clear_action"),
              icon: FontAwesomeIcons.trashCan,
              onPressedButton: () {
                controller.clear();
                onActionCompleted?.call();
              },
              tooltip: 'Clear the text field',
            ),

            // Reset the text field
            if (showResetTextButton)
            ToolbarItem(
              key: const ValueKey<String>("toolbar_reset_action"),
              icon: FontAwesomeIcons.arrowRotateLeft,
              onPressedButton: () {
                if (markdownSyntax != null) {
                  controller.text = markdownSyntax!;
                  onActionCompleted?.call();
                }
              },
              tooltip: 'Reset the text field to specified format',
            ),

            // select single line
            if (showSelectSingleLineButton)
            ToolbarItem(
              key: const ValueKey<String>("toolbar_selection_action"),
              icon: FontAwesomeIcons.textWidth,
              onPressedButton: () {
                toolbar.selectSingleLine.call();
                onActionCompleted?.call();
              },
              tooltip: 'Select single line',
            ),
            // bold
            if (showBoldButton)
            ToolbarItem(
              key: const ValueKey<String>("toolbar_bold_action"),
              icon: FontAwesomeIcons.bold,
              tooltip: 'Make text bold',
              onPressedButton: () {
                toolbar.action("**", "**");
                onActionCompleted?.call();
              },
            ),
            // italic
            if (showItalicButton)
            ToolbarItem(
              key: const ValueKey<String>("toolbar_italic_action"),
              icon: FontAwesomeIcons.italic,
              tooltip: 'Make text italic',
              onPressedButton: () {
                toolbar.action("_", "_");
                onActionCompleted?.call();
              },
            ),
            // strikethrough
            if (showStrikethroughButton)
            ToolbarItem(
              key: const ValueKey<String>("toolbar_strikethrough_action"),
              icon: FontAwesomeIcons.strikethrough,
              tooltip: 'Strikethrough',
              onPressedButton: () {
                toolbar.action("~~", "~~");
                onActionCompleted?.call();
              },
            ),
            // heading
            if (showHeadingButton)
            ToolbarItem(
              key: const ValueKey<String>("toolbar_heading_action"),
              icon: FontAwesomeIcons.heading,
              isExpandable: true,
              tooltip: 'Insert Heading',
              expandableBackground: expandableBackground,
              items: [
                ToolbarItem(
                  key: const ValueKey<String>("h1"),
                  icon: "H1",
                  tooltip: 'Insert Heading 1',
                  onPressedButton: () {
                    toolbar.action("# ", "");
                    onActionCompleted?.call();
                  },
                ),
                ToolbarItem(
                  key: const ValueKey<String>("h2"),
                  icon: "H2",
                  tooltip: 'Insert Heading 2',
                  onPressedButton: () {
                    toolbar.action("## ", "");
                    onActionCompleted?.call();
                  },
                ),
                ToolbarItem(
                  key: const ValueKey<String>("h3"),
                  icon: "H3",
                  tooltip: 'Insert Heading 3',
                  onPressedButton: () {
                    toolbar.action("### ", "");
                    onActionCompleted?.call();
                  },
                ),
                ToolbarItem(
                  key: const ValueKey<String>("h4"),
                  icon: "H4",
                  tooltip: 'Insert Heading 4',
                  onPressedButton: () {
                    toolbar.action("#### ", "");
                    onActionCompleted?.call();
                  },
                ),
                // Heading 5 onwards has same font
              ],
            ),
            // unorder list
            if (showUnorderButton)
            ToolbarItem(
              key: const ValueKey<String>("toolbar_unorder_list_action"),
              icon: FontAwesomeIcons.listUl,
              tooltip: 'Unordered list',
              onPressedButton: () {
                toolbar.action("* ", "");
                onActionCompleted?.call();
              },
            ),
            // checkbox list
            if (showCheckboxButton)
            ToolbarItem(
              key: const ValueKey<String>("toolbar_checkbox_list_action"),
              icon: FontAwesomeIcons.listCheck,
              isExpandable: true,
              expandableBackground: expandableBackground,
              items: [
                ToolbarItem(
                  key: const ValueKey<String>("checkbox"),
                  icon: FontAwesomeIcons.solidSquareCheck,
                  tooltip: 'Checked checkbox',
                  onPressedButton: () {
                    toolbar.action("- [x] ", "");
                    onActionCompleted?.call();
                  },
                ),
                ToolbarItem(
                  key: const ValueKey<String>("uncheckbox"),
                  icon: FontAwesomeIcons.square,
                  tooltip: 'Unchecked checkbox',
                  onPressedButton: () {
                    toolbar.action("- [ ] ", "");
                    onActionCompleted?.call();
                  },
                )
              ],
            ),
            // emoji
            if (showEmojiSelection)
              ToolbarItem(
                key: const ValueKey<String>("toolbar_emoji_action"),
                icon: FontAwesomeIcons.faceSmile,
                tooltip: 'Select emoji',
                onPressedButton: () async {
                  await _showModalSelectEmoji(context, controller.selection);
                },
              ),
            // link
            if (showLinkButton)
            ToolbarItem(
              key: const ValueKey<String>("toolbar_link_action"),
              icon: FontAwesomeIcons.link,
              tooltip: 'Add hyperlink',
              onPressedButton: () async {
                if (toolbar.hasSelection) {
                  toolbar.action("[enter link description here](", ")");
                } else {
                  await _showModalInputUrl(context,
                      "[enter link description here](", controller.selection);
                }

                onActionCompleted?.call();
              },
            ),
            // image
            if (showImageButton)
            ToolbarItem(
              key: const ValueKey<String>("toolbar_image_action"),
              icon: FontAwesomeIcons.image,
              tooltip: 'Add image',
              onPressedButton: () async {
                if (toolbar.hasSelection) {
                  toolbar.action("![enter image description here](", ")");
                } else {
                  await _showModalInputUrl(
                    context,
                    "![enter image description here](",
                    controller.selection,
                  );
                }

                onActionCompleted?.call();
              },
            ),
            // blockquote
            if (showBlockquoteButton)
            ToolbarItem(
              key: const ValueKey<String>("toolbar_blockquote_action"),
              icon: FontAwesomeIcons.quoteLeft,
              tooltip: 'Blockquote',
              onPressedButton: () {
                toolbar.action("> ", "");
                onActionCompleted?.call();
              },
            ),
            // code
            if (showCodeButton)
            ToolbarItem(
              key: const ValueKey<String>("toolbar_code_action"),
              icon: FontAwesomeIcons.code,
              tooltip: 'Code syntax/font',
              onPressedButton: () {
                toolbar.action("`", "`");
                onActionCompleted?.call();
              },
            ),
            // line
            if (showLineButton)
            ToolbarItem(
              key: const ValueKey<String>("toolbar_line_action"),
              icon: FontAwesomeIcons.rulerHorizontal,
              tooltip: 'Add line',
              onPressedButton: () {
                toolbar.action("\n___\n", "");
                onActionCompleted?.call();
              },
            ),
          ],
        ),
      ),
    );
  }

  // Show modal to select emoji
  Future<dynamic> _showModalSelectEmoji(
      BuildContext context, TextSelection selection) {
    return showModalBottomSheet(
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30),
        ),
      ),
      context: context,
      builder: (context) {
        return ModalSelectEmoji(
          emojiConvert: emojiConvert,
          onChanged: (String emot) {
            if (autoCloseAfterSelectEmoji) Navigator.pop(context);
            final newSelection = toolbar.getSelection(selection);

            toolbar.action(emot, "", textSelection: newSelection);
            // change selection baseoffset if not auto close emoji
            if (!autoCloseAfterSelectEmoji) {
              selection = TextSelection.collapsed(
                offset: newSelection.baseOffset + emot.length,
              );
              unfocus?.call();
            }
            onActionCompleted?.call();
          },
        );
      },
    );
  }

  // show modal input
  Future<dynamic> _showModalInputUrl(
    BuildContext context,
    String leftText,
    TextSelection selection,
  ) {
    return showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30),
        ),
      ),
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return ModalInputUrl(
          toolbar: toolbar,
          leftText: leftText,
          selection: selection,
          onActionCompleted: onActionCompleted,
        );
      },
    );
  }
}
