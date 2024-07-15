// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class LocalNote extends _LocalNote
    with RealmEntity, RealmObjectBase, RealmObject {
  LocalNote(
    String id,
    String title,
    DateTime dateTime,
    String text, {
    Iterable<String> tags = const [],
  }) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'title', title);
    RealmObjectBase.set(this, 'dateTime', dateTime);
    RealmObjectBase.set<RealmList<String>>(
        this, 'tags', RealmList<String>(tags));
    RealmObjectBase.set(this, 'text', text);
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
  DateTime get dateTime =>
      RealmObjectBase.get<DateTime>(this, 'dateTime') as DateTime;
  @override
  set dateTime(DateTime value) => RealmObjectBase.set(this, 'dateTime', value);

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
      'dateTime': dateTime.toEJson(),
      'tags': tags.toEJson(),
      'text': text.toEJson(),
    };
  }

  static EJsonValue _toEJson(LocalNote value) => value.toEJson();
  static LocalNote _fromEJson(EJsonValue ejson) {
    return switch (ejson) {
      {
        'id': EJsonValue id,
        'title': EJsonValue title,
        'dateTime': EJsonValue dateTime,
        'tags': EJsonValue tags,
        'text': EJsonValue text,
      } =>
        LocalNote(
          fromEJson(id),
          fromEJson(title),
          fromEJson(dateTime),
          fromEJson(text),
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
      SchemaProperty('dateTime', RealmPropertyType.timestamp),
      SchemaProperty('tags', RealmPropertyType.string,
          collectionType: RealmCollectionType.list),
      SchemaProperty('text', RealmPropertyType.string),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
