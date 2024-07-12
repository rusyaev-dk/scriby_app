// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class Note extends _Note with RealmEntity, RealmObjectBase, RealmObject {
  Note(
    String id,
    String title,
    String dateTime,
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

  Note._();

  @override
  String get id => RealmObjectBase.get<String>(this, 'id') as String;
  @override
  set id(String value) => RealmObjectBase.set(this, 'id', value);

  @override
  String get title => RealmObjectBase.get<String>(this, 'title') as String;
  @override
  set title(String value) => RealmObjectBase.set(this, 'title', value);

  @override
  String get dateTime =>
      RealmObjectBase.get<String>(this, 'dateTime') as String;
  @override
  set dateTime(String value) => RealmObjectBase.set(this, 'dateTime', value);

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
  Stream<RealmObjectChanges<Note>> get changes =>
      RealmObjectBase.getChanges<Note>(this);

  @override
  Stream<RealmObjectChanges<Note>> changesFor([List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<Note>(this, keyPaths);

  @override
  Note freeze() => RealmObjectBase.freezeObject<Note>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'id': id.toEJson(),
      'title': title.toEJson(),
      'dateTime': dateTime.toEJson(),
      'tags': tags.toEJson(),
      'text': text.toEJson(),
    };
  }

  static EJsonValue _toEJson(Note value) => value.toEJson();
  static Note _fromEJson(EJsonValue ejson) {
    return switch (ejson) {
      {
        'id': EJsonValue id,
        'title': EJsonValue title,
        'dateTime': EJsonValue dateTime,
        'tags': EJsonValue tags,
        'text': EJsonValue text,
      } =>
        Note(
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
    RealmObjectBase.registerFactory(Note._);
    register(_toEJson, _fromEJson);
    return SchemaObject(ObjectType.realmObject, Note, 'Note', [
      SchemaProperty('id', RealmPropertyType.string, primaryKey: true),
      SchemaProperty('title', RealmPropertyType.string),
      SchemaProperty('dateTime', RealmPropertyType.string),
      SchemaProperty('tags', RealmPropertyType.string,
          collectionType: RealmCollectionType.list),
      SchemaProperty('text', RealmPropertyType.string),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
