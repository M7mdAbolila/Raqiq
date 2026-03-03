// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prayer_day_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetPrayerDayModelCollection on Isar {
  IsarCollection<PrayerDayModel> get prayerDayModels => this.collection();
}

const PrayerDayModelSchema = CollectionSchema(
  name: r'PrayerDayModel',
  id: 1664018713883047798,
  properties: {
    r'asr': PropertySchema(id: 0, name: r'asr', type: IsarType.bool),
    r'date': PropertySchema(id: 1, name: r'date', type: IsarType.dateTime),
    r'dhuhr': PropertySchema(id: 2, name: r'dhuhr', type: IsarType.bool),
    r'fajr': PropertySchema(id: 3, name: r'fajr', type: IsarType.bool),
    r'isha': PropertySchema(id: 4, name: r'isha', type: IsarType.bool),
    r'maghrib': PropertySchema(id: 5, name: r'maghrib', type: IsarType.bool),
  },

  estimateSize: _prayerDayModelEstimateSize,
  serialize: _prayerDayModelSerialize,
  deserialize: _prayerDayModelDeserialize,
  deserializeProp: _prayerDayModelDeserializeProp,
  idName: r'id',
  indexes: {
    r'date': IndexSchema(
      id: -7552997827385218417,
      name: r'date',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'date',
          type: IndexType.value,
          caseSensitive: false,
        ),
      ],
    ),
  },
  links: {},
  embeddedSchemas: {},

  getId: _prayerDayModelGetId,
  getLinks: _prayerDayModelGetLinks,
  attach: _prayerDayModelAttach,
  version: '3.3.0',
);

int _prayerDayModelEstimateSize(
  PrayerDayModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _prayerDayModelSerialize(
  PrayerDayModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.asr);
  writer.writeDateTime(offsets[1], object.date);
  writer.writeBool(offsets[2], object.dhuhr);
  writer.writeBool(offsets[3], object.fajr);
  writer.writeBool(offsets[4], object.isha);
  writer.writeBool(offsets[5], object.maghrib);
}

PrayerDayModel _prayerDayModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = PrayerDayModel();
  object.asr = reader.readBool(offsets[0]);
  object.date = reader.readDateTime(offsets[1]);
  object.dhuhr = reader.readBool(offsets[2]);
  object.fajr = reader.readBool(offsets[3]);
  object.id = id;
  object.isha = reader.readBool(offsets[4]);
  object.maghrib = reader.readBool(offsets[5]);
  return object;
}

P _prayerDayModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBool(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readBool(offset)) as P;
    case 3:
      return (reader.readBool(offset)) as P;
    case 4:
      return (reader.readBool(offset)) as P;
    case 5:
      return (reader.readBool(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _prayerDayModelGetId(PrayerDayModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _prayerDayModelGetLinks(PrayerDayModel object) {
  return [];
}

void _prayerDayModelAttach(
  IsarCollection<dynamic> col,
  Id id,
  PrayerDayModel object,
) {
  object.id = id;
}

extension PrayerDayModelByIndex on IsarCollection<PrayerDayModel> {
  Future<PrayerDayModel?> getByDate(DateTime date) {
    return getByIndex(r'date', [date]);
  }

  PrayerDayModel? getByDateSync(DateTime date) {
    return getByIndexSync(r'date', [date]);
  }

  Future<bool> deleteByDate(DateTime date) {
    return deleteByIndex(r'date', [date]);
  }

  bool deleteByDateSync(DateTime date) {
    return deleteByIndexSync(r'date', [date]);
  }

  Future<List<PrayerDayModel?>> getAllByDate(List<DateTime> dateValues) {
    final values = dateValues.map((e) => [e]).toList();
    return getAllByIndex(r'date', values);
  }

  List<PrayerDayModel?> getAllByDateSync(List<DateTime> dateValues) {
    final values = dateValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'date', values);
  }

  Future<int> deleteAllByDate(List<DateTime> dateValues) {
    final values = dateValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'date', values);
  }

  int deleteAllByDateSync(List<DateTime> dateValues) {
    final values = dateValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'date', values);
  }

  Future<Id> putByDate(PrayerDayModel object) {
    return putByIndex(r'date', object);
  }

  Id putByDateSync(PrayerDayModel object, {bool saveLinks = true}) {
    return putByIndexSync(r'date', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByDate(List<PrayerDayModel> objects) {
    return putAllByIndex(r'date', objects);
  }

  List<Id> putAllByDateSync(
    List<PrayerDayModel> objects, {
    bool saveLinks = true,
  }) {
    return putAllByIndexSync(r'date', objects, saveLinks: saveLinks);
  }
}

extension PrayerDayModelQueryWhereSort
    on QueryBuilder<PrayerDayModel, PrayerDayModel, QWhere> {
  QueryBuilder<PrayerDayModel, PrayerDayModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<PrayerDayModel, PrayerDayModel, QAfterWhere> anyDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'date'),
      );
    });
  }
}

extension PrayerDayModelQueryWhere
    on QueryBuilder<PrayerDayModel, PrayerDayModel, QWhereClause> {
  QueryBuilder<PrayerDayModel, PrayerDayModel, QAfterWhereClause> idEqualTo(
    Id id,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<PrayerDayModel, PrayerDayModel, QAfterWhereClause> idNotEqualTo(
    Id id,
  ) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<PrayerDayModel, PrayerDayModel, QAfterWhereClause> idGreaterThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<PrayerDayModel, PrayerDayModel, QAfterWhereClause> idLessThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<PrayerDayModel, PrayerDayModel, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.between(
          lower: lowerId,
          includeLower: includeLower,
          upper: upperId,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<PrayerDayModel, PrayerDayModel, QAfterWhereClause> dateEqualTo(
    DateTime date,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'date', value: [date]),
      );
    });
  }

  QueryBuilder<PrayerDayModel, PrayerDayModel, QAfterWhereClause>
  dateNotEqualTo(DateTime date) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'date',
                lower: [],
                upper: [date],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'date',
                lower: [date],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'date',
                lower: [date],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'date',
                lower: [],
                upper: [date],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<PrayerDayModel, PrayerDayModel, QAfterWhereClause>
  dateGreaterThan(DateTime date, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'date',
          lower: [date],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<PrayerDayModel, PrayerDayModel, QAfterWhereClause> dateLessThan(
    DateTime date, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'date',
          lower: [],
          upper: [date],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<PrayerDayModel, PrayerDayModel, QAfterWhereClause> dateBetween(
    DateTime lowerDate,
    DateTime upperDate, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'date',
          lower: [lowerDate],
          includeLower: includeLower,
          upper: [upperDate],
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension PrayerDayModelQueryFilter
    on QueryBuilder<PrayerDayModel, PrayerDayModel, QFilterCondition> {
  QueryBuilder<PrayerDayModel, PrayerDayModel, QAfterFilterCondition>
  asrEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'asr', value: value),
      );
    });
  }

  QueryBuilder<PrayerDayModel, PrayerDayModel, QAfterFilterCondition>
  dateEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'date', value: value),
      );
    });
  }

  QueryBuilder<PrayerDayModel, PrayerDayModel, QAfterFilterCondition>
  dateGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'date',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<PrayerDayModel, PrayerDayModel, QAfterFilterCondition>
  dateLessThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'date',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<PrayerDayModel, PrayerDayModel, QAfterFilterCondition>
  dateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'date',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<PrayerDayModel, PrayerDayModel, QAfterFilterCondition>
  dhuhrEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'dhuhr', value: value),
      );
    });
  }

  QueryBuilder<PrayerDayModel, PrayerDayModel, QAfterFilterCondition>
  fajrEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'fajr', value: value),
      );
    });
  }

  QueryBuilder<PrayerDayModel, PrayerDayModel, QAfterFilterCondition> idEqualTo(
    Id value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<PrayerDayModel, PrayerDayModel, QAfterFilterCondition>
  idGreaterThan(Id value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<PrayerDayModel, PrayerDayModel, QAfterFilterCondition>
  idLessThan(Id value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<PrayerDayModel, PrayerDayModel, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'id',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<PrayerDayModel, PrayerDayModel, QAfterFilterCondition>
  ishaEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'isha', value: value),
      );
    });
  }

  QueryBuilder<PrayerDayModel, PrayerDayModel, QAfterFilterCondition>
  maghribEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'maghrib', value: value),
      );
    });
  }
}

extension PrayerDayModelQueryObject
    on QueryBuilder<PrayerDayModel, PrayerDayModel, QFilterCondition> {}

extension PrayerDayModelQueryLinks
    on QueryBuilder<PrayerDayModel, PrayerDayModel, QFilterCondition> {}

extension PrayerDayModelQuerySortBy
    on QueryBuilder<PrayerDayModel, PrayerDayModel, QSortBy> {
  QueryBuilder<PrayerDayModel, PrayerDayModel, QAfterSortBy> sortByAsr() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'asr', Sort.asc);
    });
  }

  QueryBuilder<PrayerDayModel, PrayerDayModel, QAfterSortBy> sortByAsrDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'asr', Sort.desc);
    });
  }

  QueryBuilder<PrayerDayModel, PrayerDayModel, QAfterSortBy> sortByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<PrayerDayModel, PrayerDayModel, QAfterSortBy> sortByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<PrayerDayModel, PrayerDayModel, QAfterSortBy> sortByDhuhr() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dhuhr', Sort.asc);
    });
  }

  QueryBuilder<PrayerDayModel, PrayerDayModel, QAfterSortBy> sortByDhuhrDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dhuhr', Sort.desc);
    });
  }

  QueryBuilder<PrayerDayModel, PrayerDayModel, QAfterSortBy> sortByFajr() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fajr', Sort.asc);
    });
  }

  QueryBuilder<PrayerDayModel, PrayerDayModel, QAfterSortBy> sortByFajrDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fajr', Sort.desc);
    });
  }

  QueryBuilder<PrayerDayModel, PrayerDayModel, QAfterSortBy> sortByIsha() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isha', Sort.asc);
    });
  }

  QueryBuilder<PrayerDayModel, PrayerDayModel, QAfterSortBy> sortByIshaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isha', Sort.desc);
    });
  }

  QueryBuilder<PrayerDayModel, PrayerDayModel, QAfterSortBy> sortByMaghrib() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maghrib', Sort.asc);
    });
  }

  QueryBuilder<PrayerDayModel, PrayerDayModel, QAfterSortBy>
  sortByMaghribDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maghrib', Sort.desc);
    });
  }
}

extension PrayerDayModelQuerySortThenBy
    on QueryBuilder<PrayerDayModel, PrayerDayModel, QSortThenBy> {
  QueryBuilder<PrayerDayModel, PrayerDayModel, QAfterSortBy> thenByAsr() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'asr', Sort.asc);
    });
  }

  QueryBuilder<PrayerDayModel, PrayerDayModel, QAfterSortBy> thenByAsrDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'asr', Sort.desc);
    });
  }

  QueryBuilder<PrayerDayModel, PrayerDayModel, QAfterSortBy> thenByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<PrayerDayModel, PrayerDayModel, QAfterSortBy> thenByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<PrayerDayModel, PrayerDayModel, QAfterSortBy> thenByDhuhr() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dhuhr', Sort.asc);
    });
  }

  QueryBuilder<PrayerDayModel, PrayerDayModel, QAfterSortBy> thenByDhuhrDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dhuhr', Sort.desc);
    });
  }

  QueryBuilder<PrayerDayModel, PrayerDayModel, QAfterSortBy> thenByFajr() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fajr', Sort.asc);
    });
  }

  QueryBuilder<PrayerDayModel, PrayerDayModel, QAfterSortBy> thenByFajrDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fajr', Sort.desc);
    });
  }

  QueryBuilder<PrayerDayModel, PrayerDayModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<PrayerDayModel, PrayerDayModel, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<PrayerDayModel, PrayerDayModel, QAfterSortBy> thenByIsha() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isha', Sort.asc);
    });
  }

  QueryBuilder<PrayerDayModel, PrayerDayModel, QAfterSortBy> thenByIshaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isha', Sort.desc);
    });
  }

  QueryBuilder<PrayerDayModel, PrayerDayModel, QAfterSortBy> thenByMaghrib() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maghrib', Sort.asc);
    });
  }

  QueryBuilder<PrayerDayModel, PrayerDayModel, QAfterSortBy>
  thenByMaghribDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maghrib', Sort.desc);
    });
  }
}

extension PrayerDayModelQueryWhereDistinct
    on QueryBuilder<PrayerDayModel, PrayerDayModel, QDistinct> {
  QueryBuilder<PrayerDayModel, PrayerDayModel, QDistinct> distinctByAsr() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'asr');
    });
  }

  QueryBuilder<PrayerDayModel, PrayerDayModel, QDistinct> distinctByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'date');
    });
  }

  QueryBuilder<PrayerDayModel, PrayerDayModel, QDistinct> distinctByDhuhr() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dhuhr');
    });
  }

  QueryBuilder<PrayerDayModel, PrayerDayModel, QDistinct> distinctByFajr() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fajr');
    });
  }

  QueryBuilder<PrayerDayModel, PrayerDayModel, QDistinct> distinctByIsha() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isha');
    });
  }

  QueryBuilder<PrayerDayModel, PrayerDayModel, QDistinct> distinctByMaghrib() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'maghrib');
    });
  }
}

extension PrayerDayModelQueryProperty
    on QueryBuilder<PrayerDayModel, PrayerDayModel, QQueryProperty> {
  QueryBuilder<PrayerDayModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<PrayerDayModel, bool, QQueryOperations> asrProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'asr');
    });
  }

  QueryBuilder<PrayerDayModel, DateTime, QQueryOperations> dateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'date');
    });
  }

  QueryBuilder<PrayerDayModel, bool, QQueryOperations> dhuhrProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dhuhr');
    });
  }

  QueryBuilder<PrayerDayModel, bool, QQueryOperations> fajrProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fajr');
    });
  }

  QueryBuilder<PrayerDayModel, bool, QQueryOperations> ishaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isha');
    });
  }

  QueryBuilder<PrayerDayModel, bool, QQueryOperations> maghribProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'maghrib');
    });
  }
}
