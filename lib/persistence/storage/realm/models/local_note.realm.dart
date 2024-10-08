// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_note.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class LocalNote extends _LocalNote
    with RealmEntity, RealmObjectBase, RealmObject {
  LocalNote(
    String id,
    String title,
    DateTime date,
    String hexColor,
    String text,
    bool pinned, {
    Iterable<String> tags = const [],
  }) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'title', title);
    RealmObjectBase.set(this, 'date', date);
    RealmObjectBase.set(this, 'hexColor', hexColor);
    RealmObjectBase.set<RealmList<String>>(
        this, 'tags', RealmList<String>(tags));
    RealmObjectBase.set(this, 'text', text);
    RealmObjectBase.set(this, 'pinned', pinned);
  }

  LocalNote._();

  @override
  String get id => RealmObjectBase.get<String>(this, 'id') as String;
  @override
  set id(String value) => RealmObjectBase.set(this, 'id', value);

  @override
  String get title => RealmObjectBase.get<String>(this, 'title') as String;
  @override
  set title(String value) => RealmObjectBase.set(this, 'title', value);

  @override
  DateTime get date => RealmObjectBase.get<DateTime>(this, 'date') as DateTime;
  @override
  set date(DateTime value) => RealmObjectBase.set(this, 'date', value);

  @override
  String get hexColor =>
      RealmObjectBase.get<String>(this, 'hexColor') as String;
  @override
  set hexColor(String value) => RealmObjectBase.set(this, 'hexColor', value);

  @override
  RealmList<String> get tags =>
      RealmObjectBase.get<String>(this, 'tags') as RealmList<String>;
  @override
  set tags(covariant RealmList<String> value) =>
      throw RealmUnsupportedSetError();

  @override
  String get text => RealmObjectBase.get<String>(this, 'text') as String;
  @override
  set text(String value) => RealmObjectBase.set(this, 'text', value);

  @override
  bool get pinned => RealmObjectBase.get<bool>(this, 'pinned') as bool;
  @override
  set pinned(bool value) => RealmObjectBase.set(this, 'pinned', value);

  @override
  Stream<RealmObjectChanges<LocalNote>> get changes =>
      RealmObjectBase.getChanges<LocalNote>(this);

  @override
  Stream<RealmObjectChanges<LocalNote>> changesFor([List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<LocalNote>(this, keyPaths);

  @override
  LocalNote freeze() => RealmObjectBase.freezeObject<LocalNote>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'id': id.toEJson(),
      'title': title.toEJson(),
      'date': date.toEJson(),
      'hexColor': hexColor.toEJson(),
      'tags': tags.toEJson(),
      'text': text.toEJson(),
      'pinned': pinned.toEJson(),
    };
  }

  static EJsonValue _toEJson(LocalNote value) => value.toEJson();
  static LocalNote _fromEJson(EJsonValue ejson) {
    return switch (ejson) {
      {
        'id': EJsonValue id,
        'title': EJsonValue title,
        'date': EJsonValue date,
        'hexColor': EJsonValue hexColor,
        'tags': EJsonValue tags,
        'text': EJsonValue text,
        'pinned': EJsonValue pinned,
      } =>
        LocalNote(
          fromEJson(id),
          fromEJson(title),
          fromEJson(date),
          fromEJson(hexColor),
          fromEJson(text),
          fromEJson(pinned),
          tags: fromEJson(tags),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(LocalNote._);
    register(_toEJson, _fromEJson);
    return SchemaObject(ObjectType.realmObject, LocalNote, 'LocalNote', [
      SchemaProperty('id', RealmPropertyType.string, primaryKey: true),
      SchemaProperty('title', RealmPropertyType.string),
      SchemaProperty('date', RealmPropertyType.timestamp),
      SchemaProperty('hexColor', RealmPropertyType.string),
      SchemaProperty('tags', RealmPropertyType.string,
          collectionType: RealmCollectionType.list),
      SchemaProperty('text', RealmPropertyType.string),
      SchemaProperty('pinned', RealmPropertyType.bool),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
