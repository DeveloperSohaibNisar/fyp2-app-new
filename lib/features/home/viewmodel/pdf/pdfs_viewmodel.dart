import 'package:fyp2_clean_architecture/core/consts.dart';
import 'package:fyp2_clean_architecture/core/providers/user/current_user.dart';
import 'package:fyp2_clean_architecture/features/home/model/pdf_list_item/pdf_list_item_model.dart';
import 'package:fyp2_clean_architecture/features/home/repositories/remote/pdfs/pdfs_remote_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pdfs_viewmodel.g.dart';

@riverpod
class PdfsViewmodel extends _$PdfsViewmodel {
  late PdfsRemoteRepository _pdfsRepository;
  late String _token;
  bool _hasMore = true;
  int _page = 0;

  @override
  FutureOr<List<PdfListItemModel>> build() async {
    _pdfsRepository = ref.watch(pdfsRemoteRepositoryProvider);
    _token =
        ref.watch(currentUserProvider.select((user) => user.value!.token!));

    state = const AsyncValue.loading();
    var newState = await AsyncValue.guard(() => _getPaginatedPdfs());
    state = newState;
    return newState.value ?? [];
  }

  bool get hasMore => _hasMore;

  Future<void> fetchmore() async {
    if (state.isLoading || !_hasMore) return;
    state = const AsyncValue.loading();
    var newState = await AsyncValue.guard(() async {
      var newRecordings = await _getPaginatedPdfs();
      return [...newRecordings, ...?state.value];
    });
    state = newState;
  }

  Future<List<PdfListItemModel>> _getPaginatedPdfs() async {
    final res = await _pdfsRepository.getPaginatedPdfs(
      token: _token,
      page: _page,
    );

    return res.fold((generalError) {
      throw generalError.message;
    }, (data) {
      _hasMore = data.length == recordingsPerPage;
      _page++;
      return data;
    });
  }

  void sortPdfs(PdfSortMenuItems? selectedItem) {
    List<PdfListItemModel> newState = state.value ?? [];
    switch (selectedItem) {
      case PdfSortMenuItems.title:
        newState.sort((first, second) => first.name.compareTo(second.name));
        break;
      case PdfSortMenuItems.date:
        newState.sort(
            (first, second) => first.uploadDate.compareTo(second.uploadDate));
        break;
      case PdfSortMenuItems.pages:
        newState
            .sort((first, second) => first.numpages.compareTo(second.numpages));
        break;
      default:
    }
    state = AsyncValue.data(newState);
  }

  void tooglePdfsOrder() {
    List<PdfListItemModel> newState = state.value ?? [];
    newState = newState.reversed.toList();
    state = AsyncValue.data(newState);
  }
}
