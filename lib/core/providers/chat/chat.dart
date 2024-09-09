import 'package:fyp2_clean_architecture/core/models/chat/chat_model.dart';
import 'package:fyp2_clean_architecture/core/providers/user/current_user.dart';
import 'package:fyp2_clean_architecture/core/repositories/remote/chat/chat_remote_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'chat.g.dart';

@riverpod
class Chat extends _$Chat {
  late String _token;
  late ChatRemoteRepository _chatRemoteRepository;
  String? _currentQuery;

  String? get currentQuery => _currentQuery;

  @override
  FutureOr<List<ChatModel>> build(String sourceId) async {
    _token = ref.watch(currentUserProvider.select((user) => user.value!.token!));
    _chatRemoteRepository = ref.watch(chatRemoteRepositoryProvider);

    state = const AsyncValue.loading();
    // await Future.delayed(const Duration(seconds: 5), () {});
    var newState = await AsyncValue.guard(() async {
      final res = await _chatRemoteRepository.getChats(
        token: _token,
        sourceId: sourceId,
      );
      return res.fold((generalError) => throw generalError.message, (data) => data);
    });
    state = newState;
    return newState.value ?? [];
  }

  Future<void> sendMessage(String query) async {
    final link = ref.keepAlive();
    _currentQuery = query;
    state = const AsyncValue.loading();
    final res = await _chatRemoteRepository.chat(sourceId: sourceId, token: _token, query: query);

    res.fold((generalError) => state = AsyncValue.error(generalError.message, StackTrace.current), (newMessage) => state = AsyncValue.data([...?state.value, newMessage]));
    _currentQuery = null;
    link.close();
  }
}
