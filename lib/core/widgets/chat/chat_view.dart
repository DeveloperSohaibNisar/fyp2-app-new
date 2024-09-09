import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fyp2_clean_architecture/core/models/summary/additional_info.dart';
import 'package:fyp2_clean_architecture/core/providers/chat/chat.dart';
import 'package:fyp2_clean_architecture/core/util.dart';
import 'package:fyp2_clean_architecture/core/widgets/chat/bot_chat_card.dart';
import 'package:fyp2_clean_architecture/core/widgets/chat/user_chat_card.dart';
import 'package:fyp2_clean_architecture/core/widgets/loader.dart';

class ChatView extends ConsumerStatefulWidget {
  const ChatView({super.key, required this.additionalInfo, required this.sourceId});

  final AdditionalInfo additionalInfo;
  final String sourceId;

  @override
  ConsumerState<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends ConsumerState<ChatView> {
  late ScrollController _scrollController;
  late TextEditingController _textFieldController;
  bool isQueryEmpty = true;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _textFieldController = TextEditingController();
    _textFieldController.text = 'hello';
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _textFieldController.dispose();
    super.dispose();
  }

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 100),
        curve: Curves.fastOutSlowIn,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final chatsAsyncValue = ref.watch(chatProvider(widget.sourceId));
    final chats = chatsAsyncValue.value ?? [];
    final isInitialLoading = chatsAsyncValue.isLoading && chatsAsyncValue.value == null;
    final isSendingMessage = chatsAsyncValue.isLoading && chatsAsyncValue.value != null;
    final currentQuery = ref.watch(chatProvider(widget.sourceId).notifier).currentQuery;

    SchedulerBinding.instance.addPostFrameCallback((_) {
      _scrollToBottom();
    });

    if (chatsAsyncValue.error != null) {
      showSnackBar(context, chatsAsyncValue.error.toString());
    }

    return isInitialLoading
        ? const Loader()
        : Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            decoration: const BoxDecoration(color: Colors.white),
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    controller: _scrollController,
                    itemCount: chats.length + 1 + (isSendingMessage ? 1 : 0),
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return Column(
                          children: [
                            const BotChatCard(text: "How can I help you?"),
                            for (var question in widget.additionalInfo.followUpQuestions)
                              Card.filled(
                                color: const Color(0xFFF6F9FC),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 4,
                                    horizontal: 8,
                                  ),
                                  child: ListTile(
                                    title: Text(question),
                                    trailing: const Icon(Icons.arrow_forward),
                                    contentPadding: const EdgeInsets.all(0),
                                    horizontalTitleGap: 4,
                                    dense: true,
                                    onTap: () {
                                      ref.read(chatProvider(widget.sourceId).notifier).sendMessage(question);
                                    },
                                  ),
                                ),
                              ),
                          ],
                        );
                      }

                      if (index <= chats.length) {
                        return Column(
                          children: [
                            UserChatCard(text: chats[index - 1].query),
                            BotChatCard(text: chats[index - 1].reply),
                          ],
                        );
                      }

                      if (isSendingMessage) {
                        return Column(
                          children: [
                            UserChatCard(text: currentQuery!),
                            const BotChatCard(text: null),
                          ],
                        );
                      }

                      return const SizedBox();
                    },
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: Theme(
                        data: Theme.of(context).copyWith(
                          textSelectionTheme: const TextSelectionThemeData(
                            cursorColor: Color(0xFFFE600C),
                            selectionColor: Color(0xFFFE600C),
                            selectionHandleColor: Color(0xFFFE600C),
                          ),
                        ),
                        child: TextField(
                          controller: _textFieldController,
                          onChanged: (val) {
                            setState(() {
                              isQueryEmpty = val.trim().isEmpty;
                            });
                          },
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                            hintStyle: const TextStyle(
                              fontSize: 14,
                              fontFamily: 'Inria Sans',
                            ),
                            hintText: "Enter a prompt here",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide.none,
                            ),
                            fillColor: const Color.fromRGBO(246, 249, 252, 1),
                            filled: true,
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      iconSize: 40,
                      color: const Color(0xFFFE600C),
                      icon: const Icon(
                        Icons.send,
                      ),
                      onPressed: (_textFieldController.text.trim().isEmpty || isSendingMessage)
                          ? null
                          : () {
                              ref.read(chatProvider(widget.sourceId).notifier).sendMessage(_textFieldController.text);
                              _textFieldController.clear();
                              FocusScope.of(context).requestFocus(FocusNode());
                            },
                    ),
                  ],
                ),
                const SizedBox(height: 16),
              ],
            ),
          );
  }
}
