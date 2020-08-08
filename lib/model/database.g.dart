// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps
class Url extends DataClass implements Insertable<Url> {
  final int id;
  final String urladdress;
  final DateTime dueDate;
  Url({@required this.id, @required this.urladdress, this.dueDate});
  factory Url.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return Url(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      urladdress: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}urladdress']),
      dueDate: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}due_date']),
    );
  }
  factory Url.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return Url(
      id: serializer.fromJson<int>(json['id']),
      urladdress: serializer.fromJson<String>(json['urladdress']),
      dueDate: serializer.fromJson<DateTime>(json['dueDate']),
    );
  }
  @override
  Map<String, dynamic> toJson(
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return {
      'id': serializer.toJson<int>(id),
      'urladdress': serializer.toJson<String>(urladdress),
      'dueDate': serializer.toJson<DateTime>(dueDate),
    };
  }

  @override
  T createCompanion<T extends UpdateCompanion<Url>>(bool nullToAbsent) {
    return UrlsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      urladdress: urladdress == null && nullToAbsent
          ? const Value.absent()
          : Value(urladdress),
      dueDate: dueDate == null && nullToAbsent
          ? const Value.absent()
          : Value(dueDate),
    ) as T;
  }

  Url copyWith({int id, String urladdress, DateTime dueDate}) => Url(
        id: id ?? this.id,
        urladdress: urladdress ?? this.urladdress,
        dueDate: dueDate ?? this.dueDate,
      );
  @override
  String toString() {
    return (StringBuffer('Url(')
          ..write('id: $id, ')
          ..write('urladdress: $urladdress, ')
          ..write('dueDate: $dueDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      $mrjf($mrjc(id.hashCode, $mrjc(urladdress.hashCode, dueDate.hashCode)));
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is Url &&
          other.id == id &&
          other.urladdress == urladdress &&
          other.dueDate == dueDate);
}

class UrlsCompanion extends UpdateCompanion<Url> {
  final Value<int> id;
  final Value<String> urladdress;
  final Value<DateTime> dueDate;
  const UrlsCompanion({
    this.id = const Value.absent(),
    this.urladdress = const Value.absent(),
    this.dueDate = const Value.absent(),
  });
  UrlsCompanion copyWith(
      {Value<int> id, Value<String> urladdress, Value<DateTime> dueDate}) {
    return UrlsCompanion(
      id: id ?? this.id,
      urladdress: urladdress ?? this.urladdress,
      dueDate: dueDate ?? this.dueDate,
    );
  }
}

class $UrlsTable extends Urls with TableInfo<$UrlsTable, Url> {
  final GeneratedDatabase _db;
  final String _alias;
  $UrlsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _urladdressMeta = const VerificationMeta('urladdress');
  GeneratedTextColumn _urladdress;
  @override
  GeneratedTextColumn get urladdress => _urladdress ??= _constructUrladdress();
  GeneratedTextColumn _constructUrladdress() {
    return GeneratedTextColumn('urladdress', $tableName, false,
        minTextLength: 1, maxTextLength: 10000);
  }

  final VerificationMeta _dueDateMeta = const VerificationMeta('dueDate');
  GeneratedDateTimeColumn _dueDate;
  @override
  GeneratedDateTimeColumn get dueDate => _dueDate ??= _constructDueDate();
  GeneratedDateTimeColumn _constructDueDate() {
    return GeneratedDateTimeColumn(
      'due_date',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, urladdress, dueDate];
  @override
  $UrlsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'urls';
  @override
  final String actualTableName = 'urls';
  @override
  VerificationContext validateIntegrity(UrlsCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    } else if (id.isRequired && isInserting) {
      context.missing(_idMeta);
    }
    if (d.urladdress.present) {
      context.handle(_urladdressMeta,
          urladdress.isAcceptableValue(d.urladdress.value, _urladdressMeta));
    } else if (urladdress.isRequired && isInserting) {
      context.missing(_urladdressMeta);
    }
    if (d.dueDate.present) {
      context.handle(_dueDateMeta,
          dueDate.isAcceptableValue(d.dueDate.value, _dueDateMeta));
    } else if (dueDate.isRequired && isInserting) {
      context.missing(_dueDateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Url map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Url.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(UrlsCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.urladdress.present) {
      map['urladdress'] = Variable<String, StringType>(d.urladdress.value);
    }
    if (d.dueDate.present) {
      map['due_date'] = Variable<DateTime, DateTimeType>(d.dueDate.value);
    }
    return map;
  }

  @override
  $UrlsTable createAlias(String alias) {
    return $UrlsTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(const SqlTypeSystem.withDefaults(), e);
  $UrlsTable _urls;
  $UrlsTable get urls => _urls ??= $UrlsTable(this);
  @override
  List<TableInfo> get allTables => [urls];
}
