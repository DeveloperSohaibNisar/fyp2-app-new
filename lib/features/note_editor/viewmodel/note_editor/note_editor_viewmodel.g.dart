// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_editor_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$saveNoteHash() => r'5865578320e8efb8ddb719e5ce35e77bd027514a';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [saveNote].
@ProviderFor(saveNote)
const saveNoteProvider = SaveNoteFamily();

/// See also [saveNote].
class SaveNoteFamily extends Family<AsyncValue<NoteListItemModel>> {
  /// See also [saveNote].
  const SaveNoteFamily();

  /// See also [saveNote].
  SaveNoteProvider call(
    NoteListItemModel newNote,
  ) {
    return SaveNoteProvider(
      newNote,
    );
  }

  @override
  SaveNoteProvider getProviderOverride(
    covariant SaveNoteProvider provider,
  ) {
    return call(
      provider.newNote,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'saveNoteProvider';
}

/// See also [saveNote].
class SaveNoteProvider extends AutoDisposeFutureProvider<NoteListItemModel> {
  /// See also [saveNote].
  SaveNoteProvider(
    NoteListItemModel newNote,
  ) : this._internal(
          (ref) => saveNote(
            ref as SaveNoteRef,
            newNote,
          ),
          from: saveNoteProvider,
          name: r'saveNoteProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$saveNoteHash,
          dependencies: SaveNoteFamily._dependencies,
          allTransitiveDependencies: SaveNoteFamily._allTransitiveDependencies,
          newNote: newNote,
        );

  SaveNoteProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.newNote,
  }) : super.internal();

  final NoteListItemModel newNote;

  @override
  Override overrideWith(
    FutureOr<NoteListItemModel> Function(SaveNoteRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SaveNoteProvider._internal(
        (ref) => create(ref as SaveNoteRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        newNote: newNote,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<NoteListItemModel> createElement() {
    return _SaveNoteProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SaveNoteProvider && other.newNote == newNote;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, newNote.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SaveNoteRef on AutoDisposeFutureProviderRef<NoteListItemModel> {
  /// The parameter `newNote` of this provider.
  NoteListItemModel get newNote;
}

class _SaveNoteProviderElement
    extends AutoDisposeFutureProviderElement<NoteListItemModel>
    with SaveNoteRef {
  _SaveNoteProviderElement(super.provider);

  @override
  NoteListItemModel get newNote => (origin as SaveNoteProvider).newNote;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
