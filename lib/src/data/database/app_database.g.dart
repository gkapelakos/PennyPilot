// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class Categories extends Table with TableInfo<Categories, Category> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Categories(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'PRIMARY KEY AUTOINCREMENT');
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _parentCategoryIdMeta =
      const VerificationMeta('parentCategoryId');
  late final GeneratedColumn<int> parentCategoryId = GeneratedColumn<int>(
      'parent_category_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _iconMeta = const VerificationMeta('icon');
  late final GeneratedColumn<String> icon = GeneratedColumn<String>(
      'icon', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _colorMeta = const VerificationMeta('color');
  late final GeneratedColumn<String> color = GeneratedColumn<String>(
      'color', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _colorValueMeta =
      const VerificationMeta('colorValue');
  late final GeneratedColumn<int> colorValue = GeneratedColumn<int>(
      'color_value', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _isSystemMeta =
      const VerificationMeta('isSystem');
  late final GeneratedColumn<bool> isSystem = GeneratedColumn<bool>(
      'is_system', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT FALSE',
      defaultValue: const CustomExpression('FALSE'));
  static const VerificationMeta _displayOrderMeta =
      const VerificationMeta('displayOrder');
  late final GeneratedColumn<int> displayOrder = GeneratedColumn<int>(
      'display_order', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT 0',
      defaultValue: const CustomExpression('0'));
  static const VerificationMeta _isActiveMeta =
      const VerificationMeta('isActive');
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
      'is_active', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT TRUE',
      defaultValue: const CustomExpression('TRUE'));
  static const VerificationMeta _transactionCountMeta =
      const VerificationMeta('transactionCount');
  late final GeneratedColumn<int> transactionCount = GeneratedColumn<int>(
      'transaction_count', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT 0',
      defaultValue: const CustomExpression('0'));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT CURRENT_TIMESTAMP',
      defaultValue: const CustomExpression('CURRENT_TIMESTAMP'));
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, true,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      $customConstraints: '');
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        parentCategoryId,
        icon,
        color,
        colorValue,
        isSystem,
        displayOrder,
        isActive,
        transactionCount,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'categories';
  @override
  VerificationContext validateIntegrity(Insertable<Category> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('parent_category_id')) {
      context.handle(
          _parentCategoryIdMeta,
          parentCategoryId.isAcceptableOrUnknown(
              data['parent_category_id']!, _parentCategoryIdMeta));
    }
    if (data.containsKey('icon')) {
      context.handle(
          _iconMeta, icon.isAcceptableOrUnknown(data['icon']!, _iconMeta));
    } else if (isInserting) {
      context.missing(_iconMeta);
    }
    if (data.containsKey('color')) {
      context.handle(
          _colorMeta, color.isAcceptableOrUnknown(data['color']!, _colorMeta));
    } else if (isInserting) {
      context.missing(_colorMeta);
    }
    if (data.containsKey('color_value')) {
      context.handle(
          _colorValueMeta,
          colorValue.isAcceptableOrUnknown(
              data['color_value']!, _colorValueMeta));
    }
    if (data.containsKey('is_system')) {
      context.handle(_isSystemMeta,
          isSystem.isAcceptableOrUnknown(data['is_system']!, _isSystemMeta));
    }
    if (data.containsKey('display_order')) {
      context.handle(
          _displayOrderMeta,
          displayOrder.isAcceptableOrUnknown(
              data['display_order']!, _displayOrderMeta));
    }
    if (data.containsKey('is_active')) {
      context.handle(_isActiveMeta,
          isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta));
    }
    if (data.containsKey('transaction_count')) {
      context.handle(
          _transactionCountMeta,
          transactionCount.isAcceptableOrUnknown(
              data['transaction_count']!, _transactionCountMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Category map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Category(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      parentCategoryId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}parent_category_id']),
      icon: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}icon'])!,
      color: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}color'])!,
      colorValue: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}color_value']),
      isSystem: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_system'])!,
      displayOrder: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}display_order'])!,
      isActive: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_active'])!,
      transactionCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}transaction_count'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at']),
    );
  }

  @override
  Categories createAlias(String alias) {
    return Categories(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class Category extends DataClass implements Insertable<Category> {
  final int id;
  final String name;
  final int? parentCategoryId;
  final String icon;
  final String color;
  final int? colorValue;
  final bool isSystem;
  final int displayOrder;
  final bool isActive;
  final int transactionCount;
  final DateTime createdAt;
  final DateTime? updatedAt;
  const Category(
      {required this.id,
      required this.name,
      this.parentCategoryId,
      required this.icon,
      required this.color,
      this.colorValue,
      required this.isSystem,
      required this.displayOrder,
      required this.isActive,
      required this.transactionCount,
      required this.createdAt,
      this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || parentCategoryId != null) {
      map['parent_category_id'] = Variable<int>(parentCategoryId);
    }
    map['icon'] = Variable<String>(icon);
    map['color'] = Variable<String>(color);
    if (!nullToAbsent || colorValue != null) {
      map['color_value'] = Variable<int>(colorValue);
    }
    map['is_system'] = Variable<bool>(isSystem);
    map['display_order'] = Variable<int>(displayOrder);
    map['is_active'] = Variable<bool>(isActive);
    map['transaction_count'] = Variable<int>(transactionCount);
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    return map;
  }

  CategoriesCompanion toCompanion(bool nullToAbsent) {
    return CategoriesCompanion(
      id: Value(id),
      name: Value(name),
      parentCategoryId: parentCategoryId == null && nullToAbsent
          ? const Value.absent()
          : Value(parentCategoryId),
      icon: Value(icon),
      color: Value(color),
      colorValue: colorValue == null && nullToAbsent
          ? const Value.absent()
          : Value(colorValue),
      isSystem: Value(isSystem),
      displayOrder: Value(displayOrder),
      isActive: Value(isActive),
      transactionCount: Value(transactionCount),
      createdAt: Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory Category.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Category(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      parentCategoryId: serializer.fromJson<int?>(json['parent_category_id']),
      icon: serializer.fromJson<String>(json['icon']),
      color: serializer.fromJson<String>(json['color']),
      colorValue: serializer.fromJson<int?>(json['color_value']),
      isSystem: serializer.fromJson<bool>(json['is_system']),
      displayOrder: serializer.fromJson<int>(json['display_order']),
      isActive: serializer.fromJson<bool>(json['is_active']),
      transactionCount: serializer.fromJson<int>(json['transaction_count']),
      createdAt: serializer.fromJson<DateTime>(json['created_at']),
      updatedAt: serializer.fromJson<DateTime?>(json['updated_at']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'parent_category_id': serializer.toJson<int?>(parentCategoryId),
      'icon': serializer.toJson<String>(icon),
      'color': serializer.toJson<String>(color),
      'color_value': serializer.toJson<int?>(colorValue),
      'is_system': serializer.toJson<bool>(isSystem),
      'display_order': serializer.toJson<int>(displayOrder),
      'is_active': serializer.toJson<bool>(isActive),
      'transaction_count': serializer.toJson<int>(transactionCount),
      'created_at': serializer.toJson<DateTime>(createdAt),
      'updated_at': serializer.toJson<DateTime?>(updatedAt),
    };
  }

  Category copyWith(
          {int? id,
          String? name,
          Value<int?> parentCategoryId = const Value.absent(),
          String? icon,
          String? color,
          Value<int?> colorValue = const Value.absent(),
          bool? isSystem,
          int? displayOrder,
          bool? isActive,
          int? transactionCount,
          DateTime? createdAt,
          Value<DateTime?> updatedAt = const Value.absent()}) =>
      Category(
        id: id ?? this.id,
        name: name ?? this.name,
        parentCategoryId: parentCategoryId.present
            ? parentCategoryId.value
            : this.parentCategoryId,
        icon: icon ?? this.icon,
        color: color ?? this.color,
        colorValue: colorValue.present ? colorValue.value : this.colorValue,
        isSystem: isSystem ?? this.isSystem,
        displayOrder: displayOrder ?? this.displayOrder,
        isActive: isActive ?? this.isActive,
        transactionCount: transactionCount ?? this.transactionCount,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
      );
  @override
  String toString() {
    return (StringBuffer('Category(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('parentCategoryId: $parentCategoryId, ')
          ..write('icon: $icon, ')
          ..write('color: $color, ')
          ..write('colorValue: $colorValue, ')
          ..write('isSystem: $isSystem, ')
          ..write('displayOrder: $displayOrder, ')
          ..write('isActive: $isActive, ')
          ..write('transactionCount: $transactionCount, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      name,
      parentCategoryId,
      icon,
      color,
      colorValue,
      isSystem,
      displayOrder,
      isActive,
      transactionCount,
      createdAt,
      updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Category &&
          other.id == this.id &&
          other.name == this.name &&
          other.parentCategoryId == this.parentCategoryId &&
          other.icon == this.icon &&
          other.color == this.color &&
          other.colorValue == this.colorValue &&
          other.isSystem == this.isSystem &&
          other.displayOrder == this.displayOrder &&
          other.isActive == this.isActive &&
          other.transactionCount == this.transactionCount &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class CategoriesCompanion extends UpdateCompanion<Category> {
  final Value<int> id;
  final Value<String> name;
  final Value<int?> parentCategoryId;
  final Value<String> icon;
  final Value<String> color;
  final Value<int?> colorValue;
  final Value<bool> isSystem;
  final Value<int> displayOrder;
  final Value<bool> isActive;
  final Value<int> transactionCount;
  final Value<DateTime> createdAt;
  final Value<DateTime?> updatedAt;
  const CategoriesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.parentCategoryId = const Value.absent(),
    this.icon = const Value.absent(),
    this.color = const Value.absent(),
    this.colorValue = const Value.absent(),
    this.isSystem = const Value.absent(),
    this.displayOrder = const Value.absent(),
    this.isActive = const Value.absent(),
    this.transactionCount = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  CategoriesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.parentCategoryId = const Value.absent(),
    required String icon,
    required String color,
    this.colorValue = const Value.absent(),
    this.isSystem = const Value.absent(),
    this.displayOrder = const Value.absent(),
    this.isActive = const Value.absent(),
    this.transactionCount = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  })  : name = Value(name),
        icon = Value(icon),
        color = Value(color);
  static Insertable<Category> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? parentCategoryId,
    Expression<String>? icon,
    Expression<String>? color,
    Expression<int>? colorValue,
    Expression<bool>? isSystem,
    Expression<int>? displayOrder,
    Expression<bool>? isActive,
    Expression<int>? transactionCount,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (parentCategoryId != null) 'parent_category_id': parentCategoryId,
      if (icon != null) 'icon': icon,
      if (color != null) 'color': color,
      if (colorValue != null) 'color_value': colorValue,
      if (isSystem != null) 'is_system': isSystem,
      if (displayOrder != null) 'display_order': displayOrder,
      if (isActive != null) 'is_active': isActive,
      if (transactionCount != null) 'transaction_count': transactionCount,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  CategoriesCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<int?>? parentCategoryId,
      Value<String>? icon,
      Value<String>? color,
      Value<int?>? colorValue,
      Value<bool>? isSystem,
      Value<int>? displayOrder,
      Value<bool>? isActive,
      Value<int>? transactionCount,
      Value<DateTime>? createdAt,
      Value<DateTime?>? updatedAt}) {
    return CategoriesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      parentCategoryId: parentCategoryId ?? this.parentCategoryId,
      icon: icon ?? this.icon,
      color: color ?? this.color,
      colorValue: colorValue ?? this.colorValue,
      isSystem: isSystem ?? this.isSystem,
      displayOrder: displayOrder ?? this.displayOrder,
      isActive: isActive ?? this.isActive,
      transactionCount: transactionCount ?? this.transactionCount,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (parentCategoryId.present) {
      map['parent_category_id'] = Variable<int>(parentCategoryId.value);
    }
    if (icon.present) {
      map['icon'] = Variable<String>(icon.value);
    }
    if (color.present) {
      map['color'] = Variable<String>(color.value);
    }
    if (colorValue.present) {
      map['color_value'] = Variable<int>(colorValue.value);
    }
    if (isSystem.present) {
      map['is_system'] = Variable<bool>(isSystem.value);
    }
    if (displayOrder.present) {
      map['display_order'] = Variable<int>(displayOrder.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (transactionCount.present) {
      map['transaction_count'] = Variable<int>(transactionCount.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoriesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('parentCategoryId: $parentCategoryId, ')
          ..write('icon: $icon, ')
          ..write('color: $color, ')
          ..write('colorValue: $colorValue, ')
          ..write('isSystem: $isSystem, ')
          ..write('displayOrder: $displayOrder, ')
          ..write('isActive: $isActive, ')
          ..write('transactionCount: $transactionCount, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class Receipts extends Table with TableInfo<Receipts, Receipt> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Receipts(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'PRIMARY KEY AUTOINCREMENT');
  static const VerificationMeta _vendorMeta = const VerificationMeta('vendor');
  late final GeneratedColumn<String> vendor = GeneratedColumn<String>(
      'vendor', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
      'amount', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _categoryIdMeta =
      const VerificationMeta('categoryId');
  late final GeneratedColumn<int> categoryId = GeneratedColumn<int>(
      'category_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'REFERENCES categories(id)');
  static const VerificationMeta _imagePathMeta =
      const VerificationMeta('imagePath');
  late final GeneratedColumn<String> imagePath = GeneratedColumn<String>(
      'image_path', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT CURRENT_TIMESTAMP',
      defaultValue: const CustomExpression('CURRENT_TIMESTAMP'));
  @override
  List<GeneratedColumn> get $columns =>
      [id, vendor, amount, date, categoryId, imagePath, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'receipts';
  @override
  VerificationContext validateIntegrity(Insertable<Receipt> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('vendor')) {
      context.handle(_vendorMeta,
          vendor.isAcceptableOrUnknown(data['vendor']!, _vendorMeta));
    } else if (isInserting) {
      context.missing(_vendorMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('category_id')) {
      context.handle(
          _categoryIdMeta,
          categoryId.isAcceptableOrUnknown(
              data['category_id']!, _categoryIdMeta));
    }
    if (data.containsKey('image_path')) {
      context.handle(_imagePathMeta,
          imagePath.isAcceptableOrUnknown(data['image_path']!, _imagePathMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Receipt map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Receipt(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      vendor: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}vendor'])!,
      amount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}amount'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      categoryId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}category_id']),
      imagePath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image_path']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  Receipts createAlias(String alias) {
    return Receipts(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class Receipt extends DataClass implements Insertable<Receipt> {
  final int id;
  final String vendor;
  final double amount;
  final DateTime date;
  final int? categoryId;
  final String? imagePath;
  final DateTime createdAt;
  const Receipt(
      {required this.id,
      required this.vendor,
      required this.amount,
      required this.date,
      this.categoryId,
      this.imagePath,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['vendor'] = Variable<String>(vendor);
    map['amount'] = Variable<double>(amount);
    map['date'] = Variable<DateTime>(date);
    if (!nullToAbsent || categoryId != null) {
      map['category_id'] = Variable<int>(categoryId);
    }
    if (!nullToAbsent || imagePath != null) {
      map['image_path'] = Variable<String>(imagePath);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  ReceiptsCompanion toCompanion(bool nullToAbsent) {
    return ReceiptsCompanion(
      id: Value(id),
      vendor: Value(vendor),
      amount: Value(amount),
      date: Value(date),
      categoryId: categoryId == null && nullToAbsent
          ? const Value.absent()
          : Value(categoryId),
      imagePath: imagePath == null && nullToAbsent
          ? const Value.absent()
          : Value(imagePath),
      createdAt: Value(createdAt),
    );
  }

  factory Receipt.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Receipt(
      id: serializer.fromJson<int>(json['id']),
      vendor: serializer.fromJson<String>(json['vendor']),
      amount: serializer.fromJson<double>(json['amount']),
      date: serializer.fromJson<DateTime>(json['date']),
      categoryId: serializer.fromJson<int?>(json['category_id']),
      imagePath: serializer.fromJson<String?>(json['image_path']),
      createdAt: serializer.fromJson<DateTime>(json['created_at']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'vendor': serializer.toJson<String>(vendor),
      'amount': serializer.toJson<double>(amount),
      'date': serializer.toJson<DateTime>(date),
      'category_id': serializer.toJson<int?>(categoryId),
      'image_path': serializer.toJson<String?>(imagePath),
      'created_at': serializer.toJson<DateTime>(createdAt),
    };
  }

  Receipt copyWith(
          {int? id,
          String? vendor,
          double? amount,
          DateTime? date,
          Value<int?> categoryId = const Value.absent(),
          Value<String?> imagePath = const Value.absent(),
          DateTime? createdAt}) =>
      Receipt(
        id: id ?? this.id,
        vendor: vendor ?? this.vendor,
        amount: amount ?? this.amount,
        date: date ?? this.date,
        categoryId: categoryId.present ? categoryId.value : this.categoryId,
        imagePath: imagePath.present ? imagePath.value : this.imagePath,
        createdAt: createdAt ?? this.createdAt,
      );
  @override
  String toString() {
    return (StringBuffer('Receipt(')
          ..write('id: $id, ')
          ..write('vendor: $vendor, ')
          ..write('amount: $amount, ')
          ..write('date: $date, ')
          ..write('categoryId: $categoryId, ')
          ..write('imagePath: $imagePath, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, vendor, amount, date, categoryId, imagePath, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Receipt &&
          other.id == this.id &&
          other.vendor == this.vendor &&
          other.amount == this.amount &&
          other.date == this.date &&
          other.categoryId == this.categoryId &&
          other.imagePath == this.imagePath &&
          other.createdAt == this.createdAt);
}

class ReceiptsCompanion extends UpdateCompanion<Receipt> {
  final Value<int> id;
  final Value<String> vendor;
  final Value<double> amount;
  final Value<DateTime> date;
  final Value<int?> categoryId;
  final Value<String?> imagePath;
  final Value<DateTime> createdAt;
  const ReceiptsCompanion({
    this.id = const Value.absent(),
    this.vendor = const Value.absent(),
    this.amount = const Value.absent(),
    this.date = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.imagePath = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  ReceiptsCompanion.insert({
    this.id = const Value.absent(),
    required String vendor,
    required double amount,
    required DateTime date,
    this.categoryId = const Value.absent(),
    this.imagePath = const Value.absent(),
    this.createdAt = const Value.absent(),
  })  : vendor = Value(vendor),
        amount = Value(amount),
        date = Value(date);
  static Insertable<Receipt> custom({
    Expression<int>? id,
    Expression<String>? vendor,
    Expression<double>? amount,
    Expression<DateTime>? date,
    Expression<int>? categoryId,
    Expression<String>? imagePath,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (vendor != null) 'vendor': vendor,
      if (amount != null) 'amount': amount,
      if (date != null) 'date': date,
      if (categoryId != null) 'category_id': categoryId,
      if (imagePath != null) 'image_path': imagePath,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  ReceiptsCompanion copyWith(
      {Value<int>? id,
      Value<String>? vendor,
      Value<double>? amount,
      Value<DateTime>? date,
      Value<int?>? categoryId,
      Value<String?>? imagePath,
      Value<DateTime>? createdAt}) {
    return ReceiptsCompanion(
      id: id ?? this.id,
      vendor: vendor ?? this.vendor,
      amount: amount ?? this.amount,
      date: date ?? this.date,
      categoryId: categoryId ?? this.categoryId,
      imagePath: imagePath ?? this.imagePath,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (vendor.present) {
      map['vendor'] = Variable<String>(vendor.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<int>(categoryId.value);
    }
    if (imagePath.present) {
      map['image_path'] = Variable<String>(imagePath.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ReceiptsCompanion(')
          ..write('id: $id, ')
          ..write('vendor: $vendor, ')
          ..write('amount: $amount, ')
          ..write('date: $date, ')
          ..write('categoryId: $categoryId, ')
          ..write('imagePath: $imagePath, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class Transactions extends Table with TableInfo<Transactions, Transaction> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Transactions(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'PRIMARY KEY AUTOINCREMENT');
  static const VerificationMeta _merchantNameMeta =
      const VerificationMeta('merchantName');
  late final GeneratedColumn<String> merchantName = GeneratedColumn<String>(
      'merchant_name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _rawMerchantNameMeta =
      const VerificationMeta('rawMerchantName');
  late final GeneratedColumn<String> rawMerchantName = GeneratedColumn<String>(
      'raw_merchant_name', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
      'amount', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _subtotalAmountMeta =
      const VerificationMeta('subtotalAmount');
  late final GeneratedColumn<double> subtotalAmount = GeneratedColumn<double>(
      'subtotal_amount', aliasedName, true,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _taxAmountMeta =
      const VerificationMeta('taxAmount');
  late final GeneratedColumn<double> taxAmount = GeneratedColumn<double>(
      'tax_amount', aliasedName, true,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _discountAmountMeta =
      const VerificationMeta('discountAmount');
  late final GeneratedColumn<double> discountAmount = GeneratedColumn<double>(
      'discount_amount', aliasedName, true,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _tipAmountMeta =
      const VerificationMeta('tipAmount');
  late final GeneratedColumn<double> tipAmount = GeneratedColumn<double>(
      'tip_amount', aliasedName, true,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _categoryIdMeta =
      const VerificationMeta('categoryId');
  late final GeneratedColumn<int> categoryId = GeneratedColumn<int>(
      'category_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'REFERENCES categories(id)');
  static const VerificationMeta _isSubscriptionMeta =
      const VerificationMeta('isSubscription');
  late final GeneratedColumn<bool> isSubscription = GeneratedColumn<bool>(
      'is_subscription', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT FALSE',
      defaultValue: const CustomExpression('FALSE'));
  static const VerificationMeta _subscriptionIdMeta =
      const VerificationMeta('subscriptionId');
  late final GeneratedColumn<int> subscriptionId = GeneratedColumn<int>(
      'subscription_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _kindMeta = const VerificationMeta('kind');
  late final GeneratedColumn<int> kind = GeneratedColumn<int>(
      'kind', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT 1',
      defaultValue: const CustomExpression('1'));
  static const VerificationMeta _originMeta = const VerificationMeta('origin');
  late final GeneratedColumn<int> origin = GeneratedColumn<int>(
      'origin', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT 0',
      defaultValue: const CustomExpression('0'));
  static const VerificationMeta _isRecurringMeta =
      const VerificationMeta('isRecurring');
  late final GeneratedColumn<bool> isRecurring = GeneratedColumn<bool>(
      'is_recurring', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT FALSE',
      defaultValue: const CustomExpression('FALSE'));
  static const VerificationMeta _extractionConfidenceMeta =
      const VerificationMeta('extractionConfidence');
  late final GeneratedColumn<int> extractionConfidence = GeneratedColumn<int>(
      'extraction_confidence', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT 0',
      defaultValue: const CustomExpression('0'));
  static const VerificationMeta _hasLineItemsMeta =
      const VerificationMeta('hasLineItems');
  late final GeneratedColumn<bool> hasLineItems = GeneratedColumn<bool>(
      'has_line_items', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT FALSE',
      defaultValue: const CustomExpression('FALSE'));
  static const VerificationMeta _originalEmailIdMeta =
      const VerificationMeta('originalEmailId');
  late final GeneratedColumn<String> originalEmailId = GeneratedColumn<String>(
      'original_email_id', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _currencyMeta =
      const VerificationMeta('currency');
  late final GeneratedColumn<String> currency = GeneratedColumn<String>(
      'currency', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT \'USD\'',
      defaultValue: const CustomExpression('\'USD\''));
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _userVerifiedMeta =
      const VerificationMeta('userVerified');
  late final GeneratedColumn<bool> userVerified = GeneratedColumn<bool>(
      'user_verified', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT FALSE',
      defaultValue: const CustomExpression('FALSE'));
  static const VerificationMeta _hasSplitsMeta =
      const VerificationMeta('hasSplits');
  late final GeneratedColumn<bool> hasSplits = GeneratedColumn<bool>(
      'has_splits', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT FALSE',
      defaultValue: const CustomExpression('FALSE'));
  static const VerificationMeta _isManuallyEditedMeta =
      const VerificationMeta('isManuallyEdited');
  late final GeneratedColumn<bool> isManuallyEdited = GeneratedColumn<bool>(
      'is_manually_edited', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT FALSE',
      defaultValue: const CustomExpression('FALSE'));
  static const VerificationMeta _manualEditTimestampMeta =
      const VerificationMeta('manualEditTimestamp');
  late final GeneratedColumn<DateTime> manualEditTimestamp =
      GeneratedColumn<DateTime>('manual_edit_timestamp', aliasedName, true,
          type: DriftSqlType.dateTime,
          requiredDuringInsert: false,
          $customConstraints: '');
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT CURRENT_TIMESTAMP',
      defaultValue: const CustomExpression('CURRENT_TIMESTAMP'));
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, true,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      $customConstraints: '');
  @override
  List<GeneratedColumn> get $columns => [
        id,
        merchantName,
        rawMerchantName,
        amount,
        subtotalAmount,
        taxAmount,
        discountAmount,
        tipAmount,
        date,
        categoryId,
        isSubscription,
        subscriptionId,
        kind,
        origin,
        isRecurring,
        extractionConfidence,
        hasLineItems,
        originalEmailId,
        currency,
        notes,
        userVerified,
        hasSplits,
        isManuallyEdited,
        manualEditTimestamp,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'transactions';
  @override
  VerificationContext validateIntegrity(Insertable<Transaction> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('merchant_name')) {
      context.handle(
          _merchantNameMeta,
          merchantName.isAcceptableOrUnknown(
              data['merchant_name']!, _merchantNameMeta));
    } else if (isInserting) {
      context.missing(_merchantNameMeta);
    }
    if (data.containsKey('raw_merchant_name')) {
      context.handle(
          _rawMerchantNameMeta,
          rawMerchantName.isAcceptableOrUnknown(
              data['raw_merchant_name']!, _rawMerchantNameMeta));
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('subtotal_amount')) {
      context.handle(
          _subtotalAmountMeta,
          subtotalAmount.isAcceptableOrUnknown(
              data['subtotal_amount']!, _subtotalAmountMeta));
    }
    if (data.containsKey('tax_amount')) {
      context.handle(_taxAmountMeta,
          taxAmount.isAcceptableOrUnknown(data['tax_amount']!, _taxAmountMeta));
    }
    if (data.containsKey('discount_amount')) {
      context.handle(
          _discountAmountMeta,
          discountAmount.isAcceptableOrUnknown(
              data['discount_amount']!, _discountAmountMeta));
    }
    if (data.containsKey('tip_amount')) {
      context.handle(_tipAmountMeta,
          tipAmount.isAcceptableOrUnknown(data['tip_amount']!, _tipAmountMeta));
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('category_id')) {
      context.handle(
          _categoryIdMeta,
          categoryId.isAcceptableOrUnknown(
              data['category_id']!, _categoryIdMeta));
    }
    if (data.containsKey('is_subscription')) {
      context.handle(
          _isSubscriptionMeta,
          isSubscription.isAcceptableOrUnknown(
              data['is_subscription']!, _isSubscriptionMeta));
    }
    if (data.containsKey('subscription_id')) {
      context.handle(
          _subscriptionIdMeta,
          subscriptionId.isAcceptableOrUnknown(
              data['subscription_id']!, _subscriptionIdMeta));
    }
    if (data.containsKey('kind')) {
      context.handle(
          _kindMeta, kind.isAcceptableOrUnknown(data['kind']!, _kindMeta));
    }
    if (data.containsKey('origin')) {
      context.handle(_originMeta,
          origin.isAcceptableOrUnknown(data['origin']!, _originMeta));
    }
    if (data.containsKey('is_recurring')) {
      context.handle(
          _isRecurringMeta,
          isRecurring.isAcceptableOrUnknown(
              data['is_recurring']!, _isRecurringMeta));
    }
    if (data.containsKey('extraction_confidence')) {
      context.handle(
          _extractionConfidenceMeta,
          extractionConfidence.isAcceptableOrUnknown(
              data['extraction_confidence']!, _extractionConfidenceMeta));
    }
    if (data.containsKey('has_line_items')) {
      context.handle(
          _hasLineItemsMeta,
          hasLineItems.isAcceptableOrUnknown(
              data['has_line_items']!, _hasLineItemsMeta));
    }
    if (data.containsKey('original_email_id')) {
      context.handle(
          _originalEmailIdMeta,
          originalEmailId.isAcceptableOrUnknown(
              data['original_email_id']!, _originalEmailIdMeta));
    }
    if (data.containsKey('currency')) {
      context.handle(_currencyMeta,
          currency.isAcceptableOrUnknown(data['currency']!, _currencyMeta));
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    if (data.containsKey('user_verified')) {
      context.handle(
          _userVerifiedMeta,
          userVerified.isAcceptableOrUnknown(
              data['user_verified']!, _userVerifiedMeta));
    }
    if (data.containsKey('has_splits')) {
      context.handle(_hasSplitsMeta,
          hasSplits.isAcceptableOrUnknown(data['has_splits']!, _hasSplitsMeta));
    }
    if (data.containsKey('is_manually_edited')) {
      context.handle(
          _isManuallyEditedMeta,
          isManuallyEdited.isAcceptableOrUnknown(
              data['is_manually_edited']!, _isManuallyEditedMeta));
    }
    if (data.containsKey('manual_edit_timestamp')) {
      context.handle(
          _manualEditTimestampMeta,
          manualEditTimestamp.isAcceptableOrUnknown(
              data['manual_edit_timestamp']!, _manualEditTimestampMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Transaction map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Transaction(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      merchantName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}merchant_name'])!,
      rawMerchantName: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}raw_merchant_name']),
      amount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}amount'])!,
      subtotalAmount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}subtotal_amount']),
      taxAmount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}tax_amount']),
      discountAmount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}discount_amount']),
      tipAmount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}tip_amount']),
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      categoryId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}category_id']),
      isSubscription: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_subscription'])!,
      subscriptionId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}subscription_id']),
      kind: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}kind'])!,
      origin: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}origin'])!,
      isRecurring: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_recurring'])!,
      extractionConfidence: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}extraction_confidence'])!,
      hasLineItems: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}has_line_items'])!,
      originalEmailId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}original_email_id']),
      currency: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}currency'])!,
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
      userVerified: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}user_verified'])!,
      hasSplits: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}has_splits'])!,
      isManuallyEdited: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}is_manually_edited'])!,
      manualEditTimestamp: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime,
          data['${effectivePrefix}manual_edit_timestamp']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at']),
    );
  }

  @override
  Transactions createAlias(String alias) {
    return Transactions(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class Transaction extends DataClass implements Insertable<Transaction> {
  final int id;
  final String merchantName;
  final String? rawMerchantName;
  final double amount;
  final double? subtotalAmount;
  final double? taxAmount;
  final double? discountAmount;
  final double? tipAmount;
  final DateTime date;
  final int? categoryId;
  final bool isSubscription;
  final int? subscriptionId;
  final int kind;

  /// 0: income, 1: expense
  final int origin;
  final bool isRecurring;
  final int extractionConfidence;
  final bool hasLineItems;
  final String? originalEmailId;
  final String currency;
  final String? notes;
  final bool userVerified;
  final bool hasSplits;
  final bool isManuallyEdited;
  final DateTime? manualEditTimestamp;
  final DateTime createdAt;
  final DateTime? updatedAt;
  const Transaction(
      {required this.id,
      required this.merchantName,
      this.rawMerchantName,
      required this.amount,
      this.subtotalAmount,
      this.taxAmount,
      this.discountAmount,
      this.tipAmount,
      required this.date,
      this.categoryId,
      required this.isSubscription,
      this.subscriptionId,
      required this.kind,
      required this.origin,
      required this.isRecurring,
      required this.extractionConfidence,
      required this.hasLineItems,
      this.originalEmailId,
      required this.currency,
      this.notes,
      required this.userVerified,
      required this.hasSplits,
      required this.isManuallyEdited,
      this.manualEditTimestamp,
      required this.createdAt,
      this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['merchant_name'] = Variable<String>(merchantName);
    if (!nullToAbsent || rawMerchantName != null) {
      map['raw_merchant_name'] = Variable<String>(rawMerchantName);
    }
    map['amount'] = Variable<double>(amount);
    if (!nullToAbsent || subtotalAmount != null) {
      map['subtotal_amount'] = Variable<double>(subtotalAmount);
    }
    if (!nullToAbsent || taxAmount != null) {
      map['tax_amount'] = Variable<double>(taxAmount);
    }
    if (!nullToAbsent || discountAmount != null) {
      map['discount_amount'] = Variable<double>(discountAmount);
    }
    if (!nullToAbsent || tipAmount != null) {
      map['tip_amount'] = Variable<double>(tipAmount);
    }
    map['date'] = Variable<DateTime>(date);
    if (!nullToAbsent || categoryId != null) {
      map['category_id'] = Variable<int>(categoryId);
    }
    map['is_subscription'] = Variable<bool>(isSubscription);
    if (!nullToAbsent || subscriptionId != null) {
      map['subscription_id'] = Variable<int>(subscriptionId);
    }
    map['kind'] = Variable<int>(kind);
    map['origin'] = Variable<int>(origin);
    map['is_recurring'] = Variable<bool>(isRecurring);
    map['extraction_confidence'] = Variable<int>(extractionConfidence);
    map['has_line_items'] = Variable<bool>(hasLineItems);
    if (!nullToAbsent || originalEmailId != null) {
      map['original_email_id'] = Variable<String>(originalEmailId);
    }
    map['currency'] = Variable<String>(currency);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['user_verified'] = Variable<bool>(userVerified);
    map['has_splits'] = Variable<bool>(hasSplits);
    map['is_manually_edited'] = Variable<bool>(isManuallyEdited);
    if (!nullToAbsent || manualEditTimestamp != null) {
      map['manual_edit_timestamp'] = Variable<DateTime>(manualEditTimestamp);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    return map;
  }

  TransactionsCompanion toCompanion(bool nullToAbsent) {
    return TransactionsCompanion(
      id: Value(id),
      merchantName: Value(merchantName),
      rawMerchantName: rawMerchantName == null && nullToAbsent
          ? const Value.absent()
          : Value(rawMerchantName),
      amount: Value(amount),
      subtotalAmount: subtotalAmount == null && nullToAbsent
          ? const Value.absent()
          : Value(subtotalAmount),
      taxAmount: taxAmount == null && nullToAbsent
          ? const Value.absent()
          : Value(taxAmount),
      discountAmount: discountAmount == null && nullToAbsent
          ? const Value.absent()
          : Value(discountAmount),
      tipAmount: tipAmount == null && nullToAbsent
          ? const Value.absent()
          : Value(tipAmount),
      date: Value(date),
      categoryId: categoryId == null && nullToAbsent
          ? const Value.absent()
          : Value(categoryId),
      isSubscription: Value(isSubscription),
      subscriptionId: subscriptionId == null && nullToAbsent
          ? const Value.absent()
          : Value(subscriptionId),
      kind: Value(kind),
      origin: Value(origin),
      isRecurring: Value(isRecurring),
      extractionConfidence: Value(extractionConfidence),
      hasLineItems: Value(hasLineItems),
      originalEmailId: originalEmailId == null && nullToAbsent
          ? const Value.absent()
          : Value(originalEmailId),
      currency: Value(currency),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
      userVerified: Value(userVerified),
      hasSplits: Value(hasSplits),
      isManuallyEdited: Value(isManuallyEdited),
      manualEditTimestamp: manualEditTimestamp == null && nullToAbsent
          ? const Value.absent()
          : Value(manualEditTimestamp),
      createdAt: Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory Transaction.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Transaction(
      id: serializer.fromJson<int>(json['id']),
      merchantName: serializer.fromJson<String>(json['merchant_name']),
      rawMerchantName: serializer.fromJson<String?>(json['raw_merchant_name']),
      amount: serializer.fromJson<double>(json['amount']),
      subtotalAmount: serializer.fromJson<double?>(json['subtotal_amount']),
      taxAmount: serializer.fromJson<double?>(json['tax_amount']),
      discountAmount: serializer.fromJson<double?>(json['discount_amount']),
      tipAmount: serializer.fromJson<double?>(json['tip_amount']),
      date: serializer.fromJson<DateTime>(json['date']),
      categoryId: serializer.fromJson<int?>(json['category_id']),
      isSubscription: serializer.fromJson<bool>(json['is_subscription']),
      subscriptionId: serializer.fromJson<int?>(json['subscription_id']),
      kind: serializer.fromJson<int>(json['kind']),
      origin: serializer.fromJson<int>(json['origin']),
      isRecurring: serializer.fromJson<bool>(json['is_recurring']),
      extractionConfidence:
          serializer.fromJson<int>(json['extraction_confidence']),
      hasLineItems: serializer.fromJson<bool>(json['has_line_items']),
      originalEmailId: serializer.fromJson<String?>(json['original_email_id']),
      currency: serializer.fromJson<String>(json['currency']),
      notes: serializer.fromJson<String?>(json['notes']),
      userVerified: serializer.fromJson<bool>(json['user_verified']),
      hasSplits: serializer.fromJson<bool>(json['has_splits']),
      isManuallyEdited: serializer.fromJson<bool>(json['is_manually_edited']),
      manualEditTimestamp:
          serializer.fromJson<DateTime?>(json['manual_edit_timestamp']),
      createdAt: serializer.fromJson<DateTime>(json['created_at']),
      updatedAt: serializer.fromJson<DateTime?>(json['updated_at']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'merchant_name': serializer.toJson<String>(merchantName),
      'raw_merchant_name': serializer.toJson<String?>(rawMerchantName),
      'amount': serializer.toJson<double>(amount),
      'subtotal_amount': serializer.toJson<double?>(subtotalAmount),
      'tax_amount': serializer.toJson<double?>(taxAmount),
      'discount_amount': serializer.toJson<double?>(discountAmount),
      'tip_amount': serializer.toJson<double?>(tipAmount),
      'date': serializer.toJson<DateTime>(date),
      'category_id': serializer.toJson<int?>(categoryId),
      'is_subscription': serializer.toJson<bool>(isSubscription),
      'subscription_id': serializer.toJson<int?>(subscriptionId),
      'kind': serializer.toJson<int>(kind),
      'origin': serializer.toJson<int>(origin),
      'is_recurring': serializer.toJson<bool>(isRecurring),
      'extraction_confidence': serializer.toJson<int>(extractionConfidence),
      'has_line_items': serializer.toJson<bool>(hasLineItems),
      'original_email_id': serializer.toJson<String?>(originalEmailId),
      'currency': serializer.toJson<String>(currency),
      'notes': serializer.toJson<String?>(notes),
      'user_verified': serializer.toJson<bool>(userVerified),
      'has_splits': serializer.toJson<bool>(hasSplits),
      'is_manually_edited': serializer.toJson<bool>(isManuallyEdited),
      'manual_edit_timestamp':
          serializer.toJson<DateTime?>(manualEditTimestamp),
      'created_at': serializer.toJson<DateTime>(createdAt),
      'updated_at': serializer.toJson<DateTime?>(updatedAt),
    };
  }

  Transaction copyWith(
          {int? id,
          String? merchantName,
          Value<String?> rawMerchantName = const Value.absent(),
          double? amount,
          Value<double?> subtotalAmount = const Value.absent(),
          Value<double?> taxAmount = const Value.absent(),
          Value<double?> discountAmount = const Value.absent(),
          Value<double?> tipAmount = const Value.absent(),
          DateTime? date,
          Value<int?> categoryId = const Value.absent(),
          bool? isSubscription,
          Value<int?> subscriptionId = const Value.absent(),
          int? kind,
          int? origin,
          bool? isRecurring,
          int? extractionConfidence,
          bool? hasLineItems,
          Value<String?> originalEmailId = const Value.absent(),
          String? currency,
          Value<String?> notes = const Value.absent(),
          bool? userVerified,
          bool? hasSplits,
          bool? isManuallyEdited,
          Value<DateTime?> manualEditTimestamp = const Value.absent(),
          DateTime? createdAt,
          Value<DateTime?> updatedAt = const Value.absent()}) =>
      Transaction(
        id: id ?? this.id,
        merchantName: merchantName ?? this.merchantName,
        rawMerchantName: rawMerchantName.present
            ? rawMerchantName.value
            : this.rawMerchantName,
        amount: amount ?? this.amount,
        subtotalAmount:
            subtotalAmount.present ? subtotalAmount.value : this.subtotalAmount,
        taxAmount: taxAmount.present ? taxAmount.value : this.taxAmount,
        discountAmount:
            discountAmount.present ? discountAmount.value : this.discountAmount,
        tipAmount: tipAmount.present ? tipAmount.value : this.tipAmount,
        date: date ?? this.date,
        categoryId: categoryId.present ? categoryId.value : this.categoryId,
        isSubscription: isSubscription ?? this.isSubscription,
        subscriptionId:
            subscriptionId.present ? subscriptionId.value : this.subscriptionId,
        kind: kind ?? this.kind,
        origin: origin ?? this.origin,
        isRecurring: isRecurring ?? this.isRecurring,
        extractionConfidence: extractionConfidence ?? this.extractionConfidence,
        hasLineItems: hasLineItems ?? this.hasLineItems,
        originalEmailId: originalEmailId.present
            ? originalEmailId.value
            : this.originalEmailId,
        currency: currency ?? this.currency,
        notes: notes.present ? notes.value : this.notes,
        userVerified: userVerified ?? this.userVerified,
        hasSplits: hasSplits ?? this.hasSplits,
        isManuallyEdited: isManuallyEdited ?? this.isManuallyEdited,
        manualEditTimestamp: manualEditTimestamp.present
            ? manualEditTimestamp.value
            : this.manualEditTimestamp,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
      );
  @override
  String toString() {
    return (StringBuffer('Transaction(')
          ..write('id: $id, ')
          ..write('merchantName: $merchantName, ')
          ..write('rawMerchantName: $rawMerchantName, ')
          ..write('amount: $amount, ')
          ..write('subtotalAmount: $subtotalAmount, ')
          ..write('taxAmount: $taxAmount, ')
          ..write('discountAmount: $discountAmount, ')
          ..write('tipAmount: $tipAmount, ')
          ..write('date: $date, ')
          ..write('categoryId: $categoryId, ')
          ..write('isSubscription: $isSubscription, ')
          ..write('subscriptionId: $subscriptionId, ')
          ..write('kind: $kind, ')
          ..write('origin: $origin, ')
          ..write('isRecurring: $isRecurring, ')
          ..write('extractionConfidence: $extractionConfidence, ')
          ..write('hasLineItems: $hasLineItems, ')
          ..write('originalEmailId: $originalEmailId, ')
          ..write('currency: $currency, ')
          ..write('notes: $notes, ')
          ..write('userVerified: $userVerified, ')
          ..write('hasSplits: $hasSplits, ')
          ..write('isManuallyEdited: $isManuallyEdited, ')
          ..write('manualEditTimestamp: $manualEditTimestamp, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
        id,
        merchantName,
        rawMerchantName,
        amount,
        subtotalAmount,
        taxAmount,
        discountAmount,
        tipAmount,
        date,
        categoryId,
        isSubscription,
        subscriptionId,
        kind,
        origin,
        isRecurring,
        extractionConfidence,
        hasLineItems,
        originalEmailId,
        currency,
        notes,
        userVerified,
        hasSplits,
        isManuallyEdited,
        manualEditTimestamp,
        createdAt,
        updatedAt
      ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Transaction &&
          other.id == this.id &&
          other.merchantName == this.merchantName &&
          other.rawMerchantName == this.rawMerchantName &&
          other.amount == this.amount &&
          other.subtotalAmount == this.subtotalAmount &&
          other.taxAmount == this.taxAmount &&
          other.discountAmount == this.discountAmount &&
          other.tipAmount == this.tipAmount &&
          other.date == this.date &&
          other.categoryId == this.categoryId &&
          other.isSubscription == this.isSubscription &&
          other.subscriptionId == this.subscriptionId &&
          other.kind == this.kind &&
          other.origin == this.origin &&
          other.isRecurring == this.isRecurring &&
          other.extractionConfidence == this.extractionConfidence &&
          other.hasLineItems == this.hasLineItems &&
          other.originalEmailId == this.originalEmailId &&
          other.currency == this.currency &&
          other.notes == this.notes &&
          other.userVerified == this.userVerified &&
          other.hasSplits == this.hasSplits &&
          other.isManuallyEdited == this.isManuallyEdited &&
          other.manualEditTimestamp == this.manualEditTimestamp &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class TransactionsCompanion extends UpdateCompanion<Transaction> {
  final Value<int> id;
  final Value<String> merchantName;
  final Value<String?> rawMerchantName;
  final Value<double> amount;
  final Value<double?> subtotalAmount;
  final Value<double?> taxAmount;
  final Value<double?> discountAmount;
  final Value<double?> tipAmount;
  final Value<DateTime> date;
  final Value<int?> categoryId;
  final Value<bool> isSubscription;
  final Value<int?> subscriptionId;
  final Value<int> kind;
  final Value<int> origin;
  final Value<bool> isRecurring;
  final Value<int> extractionConfidence;
  final Value<bool> hasLineItems;
  final Value<String?> originalEmailId;
  final Value<String> currency;
  final Value<String?> notes;
  final Value<bool> userVerified;
  final Value<bool> hasSplits;
  final Value<bool> isManuallyEdited;
  final Value<DateTime?> manualEditTimestamp;
  final Value<DateTime> createdAt;
  final Value<DateTime?> updatedAt;
  const TransactionsCompanion({
    this.id = const Value.absent(),
    this.merchantName = const Value.absent(),
    this.rawMerchantName = const Value.absent(),
    this.amount = const Value.absent(),
    this.subtotalAmount = const Value.absent(),
    this.taxAmount = const Value.absent(),
    this.discountAmount = const Value.absent(),
    this.tipAmount = const Value.absent(),
    this.date = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.isSubscription = const Value.absent(),
    this.subscriptionId = const Value.absent(),
    this.kind = const Value.absent(),
    this.origin = const Value.absent(),
    this.isRecurring = const Value.absent(),
    this.extractionConfidence = const Value.absent(),
    this.hasLineItems = const Value.absent(),
    this.originalEmailId = const Value.absent(),
    this.currency = const Value.absent(),
    this.notes = const Value.absent(),
    this.userVerified = const Value.absent(),
    this.hasSplits = const Value.absent(),
    this.isManuallyEdited = const Value.absent(),
    this.manualEditTimestamp = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  TransactionsCompanion.insert({
    this.id = const Value.absent(),
    required String merchantName,
    this.rawMerchantName = const Value.absent(),
    required double amount,
    this.subtotalAmount = const Value.absent(),
    this.taxAmount = const Value.absent(),
    this.discountAmount = const Value.absent(),
    this.tipAmount = const Value.absent(),
    required DateTime date,
    this.categoryId = const Value.absent(),
    this.isSubscription = const Value.absent(),
    this.subscriptionId = const Value.absent(),
    this.kind = const Value.absent(),
    this.origin = const Value.absent(),
    this.isRecurring = const Value.absent(),
    this.extractionConfidence = const Value.absent(),
    this.hasLineItems = const Value.absent(),
    this.originalEmailId = const Value.absent(),
    this.currency = const Value.absent(),
    this.notes = const Value.absent(),
    this.userVerified = const Value.absent(),
    this.hasSplits = const Value.absent(),
    this.isManuallyEdited = const Value.absent(),
    this.manualEditTimestamp = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  })  : merchantName = Value(merchantName),
        amount = Value(amount),
        date = Value(date);
  static Insertable<Transaction> custom({
    Expression<int>? id,
    Expression<String>? merchantName,
    Expression<String>? rawMerchantName,
    Expression<double>? amount,
    Expression<double>? subtotalAmount,
    Expression<double>? taxAmount,
    Expression<double>? discountAmount,
    Expression<double>? tipAmount,
    Expression<DateTime>? date,
    Expression<int>? categoryId,
    Expression<bool>? isSubscription,
    Expression<int>? subscriptionId,
    Expression<int>? kind,
    Expression<int>? origin,
    Expression<bool>? isRecurring,
    Expression<int>? extractionConfidence,
    Expression<bool>? hasLineItems,
    Expression<String>? originalEmailId,
    Expression<String>? currency,
    Expression<String>? notes,
    Expression<bool>? userVerified,
    Expression<bool>? hasSplits,
    Expression<bool>? isManuallyEdited,
    Expression<DateTime>? manualEditTimestamp,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (merchantName != null) 'merchant_name': merchantName,
      if (rawMerchantName != null) 'raw_merchant_name': rawMerchantName,
      if (amount != null) 'amount': amount,
      if (subtotalAmount != null) 'subtotal_amount': subtotalAmount,
      if (taxAmount != null) 'tax_amount': taxAmount,
      if (discountAmount != null) 'discount_amount': discountAmount,
      if (tipAmount != null) 'tip_amount': tipAmount,
      if (date != null) 'date': date,
      if (categoryId != null) 'category_id': categoryId,
      if (isSubscription != null) 'is_subscription': isSubscription,
      if (subscriptionId != null) 'subscription_id': subscriptionId,
      if (kind != null) 'kind': kind,
      if (origin != null) 'origin': origin,
      if (isRecurring != null) 'is_recurring': isRecurring,
      if (extractionConfidence != null)
        'extraction_confidence': extractionConfidence,
      if (hasLineItems != null) 'has_line_items': hasLineItems,
      if (originalEmailId != null) 'original_email_id': originalEmailId,
      if (currency != null) 'currency': currency,
      if (notes != null) 'notes': notes,
      if (userVerified != null) 'user_verified': userVerified,
      if (hasSplits != null) 'has_splits': hasSplits,
      if (isManuallyEdited != null) 'is_manually_edited': isManuallyEdited,
      if (manualEditTimestamp != null)
        'manual_edit_timestamp': manualEditTimestamp,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  TransactionsCompanion copyWith(
      {Value<int>? id,
      Value<String>? merchantName,
      Value<String?>? rawMerchantName,
      Value<double>? amount,
      Value<double?>? subtotalAmount,
      Value<double?>? taxAmount,
      Value<double?>? discountAmount,
      Value<double?>? tipAmount,
      Value<DateTime>? date,
      Value<int?>? categoryId,
      Value<bool>? isSubscription,
      Value<int?>? subscriptionId,
      Value<int>? kind,
      Value<int>? origin,
      Value<bool>? isRecurring,
      Value<int>? extractionConfidence,
      Value<bool>? hasLineItems,
      Value<String?>? originalEmailId,
      Value<String>? currency,
      Value<String?>? notes,
      Value<bool>? userVerified,
      Value<bool>? hasSplits,
      Value<bool>? isManuallyEdited,
      Value<DateTime?>? manualEditTimestamp,
      Value<DateTime>? createdAt,
      Value<DateTime?>? updatedAt}) {
    return TransactionsCompanion(
      id: id ?? this.id,
      merchantName: merchantName ?? this.merchantName,
      rawMerchantName: rawMerchantName ?? this.rawMerchantName,
      amount: amount ?? this.amount,
      subtotalAmount: subtotalAmount ?? this.subtotalAmount,
      taxAmount: taxAmount ?? this.taxAmount,
      discountAmount: discountAmount ?? this.discountAmount,
      tipAmount: tipAmount ?? this.tipAmount,
      date: date ?? this.date,
      categoryId: categoryId ?? this.categoryId,
      isSubscription: isSubscription ?? this.isSubscription,
      subscriptionId: subscriptionId ?? this.subscriptionId,
      kind: kind ?? this.kind,
      origin: origin ?? this.origin,
      isRecurring: isRecurring ?? this.isRecurring,
      extractionConfidence: extractionConfidence ?? this.extractionConfidence,
      hasLineItems: hasLineItems ?? this.hasLineItems,
      originalEmailId: originalEmailId ?? this.originalEmailId,
      currency: currency ?? this.currency,
      notes: notes ?? this.notes,
      userVerified: userVerified ?? this.userVerified,
      hasSplits: hasSplits ?? this.hasSplits,
      isManuallyEdited: isManuallyEdited ?? this.isManuallyEdited,
      manualEditTimestamp: manualEditTimestamp ?? this.manualEditTimestamp,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (merchantName.present) {
      map['merchant_name'] = Variable<String>(merchantName.value);
    }
    if (rawMerchantName.present) {
      map['raw_merchant_name'] = Variable<String>(rawMerchantName.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (subtotalAmount.present) {
      map['subtotal_amount'] = Variable<double>(subtotalAmount.value);
    }
    if (taxAmount.present) {
      map['tax_amount'] = Variable<double>(taxAmount.value);
    }
    if (discountAmount.present) {
      map['discount_amount'] = Variable<double>(discountAmount.value);
    }
    if (tipAmount.present) {
      map['tip_amount'] = Variable<double>(tipAmount.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<int>(categoryId.value);
    }
    if (isSubscription.present) {
      map['is_subscription'] = Variable<bool>(isSubscription.value);
    }
    if (subscriptionId.present) {
      map['subscription_id'] = Variable<int>(subscriptionId.value);
    }
    if (kind.present) {
      map['kind'] = Variable<int>(kind.value);
    }
    if (origin.present) {
      map['origin'] = Variable<int>(origin.value);
    }
    if (isRecurring.present) {
      map['is_recurring'] = Variable<bool>(isRecurring.value);
    }
    if (extractionConfidence.present) {
      map['extraction_confidence'] = Variable<int>(extractionConfidence.value);
    }
    if (hasLineItems.present) {
      map['has_line_items'] = Variable<bool>(hasLineItems.value);
    }
    if (originalEmailId.present) {
      map['original_email_id'] = Variable<String>(originalEmailId.value);
    }
    if (currency.present) {
      map['currency'] = Variable<String>(currency.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (userVerified.present) {
      map['user_verified'] = Variable<bool>(userVerified.value);
    }
    if (hasSplits.present) {
      map['has_splits'] = Variable<bool>(hasSplits.value);
    }
    if (isManuallyEdited.present) {
      map['is_manually_edited'] = Variable<bool>(isManuallyEdited.value);
    }
    if (manualEditTimestamp.present) {
      map['manual_edit_timestamp'] =
          Variable<DateTime>(manualEditTimestamp.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TransactionsCompanion(')
          ..write('id: $id, ')
          ..write('merchantName: $merchantName, ')
          ..write('rawMerchantName: $rawMerchantName, ')
          ..write('amount: $amount, ')
          ..write('subtotalAmount: $subtotalAmount, ')
          ..write('taxAmount: $taxAmount, ')
          ..write('discountAmount: $discountAmount, ')
          ..write('tipAmount: $tipAmount, ')
          ..write('date: $date, ')
          ..write('categoryId: $categoryId, ')
          ..write('isSubscription: $isSubscription, ')
          ..write('subscriptionId: $subscriptionId, ')
          ..write('kind: $kind, ')
          ..write('origin: $origin, ')
          ..write('isRecurring: $isRecurring, ')
          ..write('extractionConfidence: $extractionConfidence, ')
          ..write('hasLineItems: $hasLineItems, ')
          ..write('originalEmailId: $originalEmailId, ')
          ..write('currency: $currency, ')
          ..write('notes: $notes, ')
          ..write('userVerified: $userVerified, ')
          ..write('hasSplits: $hasSplits, ')
          ..write('isManuallyEdited: $isManuallyEdited, ')
          ..write('manualEditTimestamp: $manualEditTimestamp, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class Subscriptions extends Table with TableInfo<Subscriptions, Subscription> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Subscriptions(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'PRIMARY KEY AUTOINCREMENT');
  static const VerificationMeta _serviceNameMeta =
      const VerificationMeta('serviceName');
  late final GeneratedColumn<String> serviceName = GeneratedColumn<String>(
      'service_name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
      'amount', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _nextRenewalDateMeta =
      const VerificationMeta('nextRenewalDate');
  late final GeneratedColumn<DateTime> nextRenewalDate =
      GeneratedColumn<DateTime>('next_renewal_date', aliasedName, false,
          type: DriftSqlType.dateTime,
          requiredDuringInsert: true,
          $customConstraints: 'NOT NULL');
  static const VerificationMeta _frequencyMeta =
      const VerificationMeta('frequency');
  late final GeneratedColumn<int> frequency = GeneratedColumn<int>(
      'frequency', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _lifecycleStateMeta =
      const VerificationMeta('lifecycleState');
  late final GeneratedColumn<int> lifecycleState = GeneratedColumn<int>(
      'lifecycle_state', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _categoryIdMeta =
      const VerificationMeta('categoryId');
  late final GeneratedColumn<int> categoryId = GeneratedColumn<int>(
      'category_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'REFERENCES categories(id)');
  static const VerificationMeta _firstSeenDateMeta =
      const VerificationMeta('firstSeenDate');
  late final GeneratedColumn<DateTime> firstSeenDate =
      GeneratedColumn<DateTime>('first_seen_date', aliasedName, false,
          type: DriftSqlType.dateTime,
          requiredDuringInsert: true,
          $customConstraints: 'NOT NULL');
  static const VerificationMeta _lastChargedDateMeta =
      const VerificationMeta('lastChargedDate');
  late final GeneratedColumn<DateTime> lastChargedDate =
      GeneratedColumn<DateTime>('last_charged_date', aliasedName, true,
          type: DriftSqlType.dateTime,
          requiredDuringInsert: false,
          $customConstraints: '');
  static const VerificationMeta _priceHistoryJsonMeta =
      const VerificationMeta('priceHistoryJson');
  late final GeneratedColumn<String> priceHistoryJson = GeneratedColumn<String>(
      'price_history_json', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _cycleHistoryJsonMeta =
      const VerificationMeta('cycleHistoryJson');
  late final GeneratedColumn<String> cycleHistoryJson = GeneratedColumn<String>(
      'cycle_history_json', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _frequencyConsistencyMeta =
      const VerificationMeta('frequencyConsistency');
  late final GeneratedColumn<int> frequencyConsistency = GeneratedColumn<int>(
      'frequency_consistency', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT 100',
      defaultValue: const CustomExpression('100'));
  static const VerificationMeta _detectionSourceMeta =
      const VerificationMeta('detectionSource');
  late final GeneratedColumn<int> detectionSource = GeneratedColumn<int>(
      'detection_source', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _anomaliesMeta =
      const VerificationMeta('anomalies');
  late final GeneratedColumn<String> anomalies = GeneratedColumn<String>(
      'anomalies', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _isTrialMeta =
      const VerificationMeta('isTrial');
  late final GeneratedColumn<bool> isTrial = GeneratedColumn<bool>(
      'is_trial', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT FALSE',
      defaultValue: const CustomExpression('FALSE'));
  static const VerificationMeta _trialEndDateMeta =
      const VerificationMeta('trialEndDate');
  late final GeneratedColumn<DateTime> trialEndDate = GeneratedColumn<DateTime>(
      'trial_end_date', aliasedName, true,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _chargeCountMeta =
      const VerificationMeta('chargeCount');
  late final GeneratedColumn<int> chargeCount = GeneratedColumn<int>(
      'charge_count', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT 0',
      defaultValue: const CustomExpression('0'));
  static const VerificationMeta _averageDaysBetweenChargesMeta =
      const VerificationMeta('averageDaysBetweenCharges');
  late final GeneratedColumn<double> averageDaysBetweenCharges =
      GeneratedColumn<double>('average_days_between_charges', aliasedName, true,
          type: DriftSqlType.double,
          requiredDuringInsert: false,
          $customConstraints: '');
  static const VerificationMeta _currencyMeta =
      const VerificationMeta('currency');
  late final GeneratedColumn<String> currency = GeneratedColumn<String>(
      'currency', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT \'USD\'',
      defaultValue: const CustomExpression('\'USD\''));
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _userConfirmedMeta =
      const VerificationMeta('userConfirmed');
  late final GeneratedColumn<bool> userConfirmed = GeneratedColumn<bool>(
      'user_confirmed', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT FALSE',
      defaultValue: const CustomExpression('FALSE'));
  static const VerificationMeta _isZombieMeta =
      const VerificationMeta('isZombie');
  late final GeneratedColumn<bool> isZombie = GeneratedColumn<bool>(
      'is_zombie', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT FALSE',
      defaultValue: const CustomExpression('FALSE'));
  static const VerificationMeta _zombieReasonMeta =
      const VerificationMeta('zombieReason');
  late final GeneratedColumn<String> zombieReason = GeneratedColumn<String>(
      'zombie_reason', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _lastPriceHikePercentMeta =
      const VerificationMeta('lastPriceHikePercent');
  late final GeneratedColumn<double> lastPriceHikePercent =
      GeneratedColumn<double>('last_price_hike_percent', aliasedName, true,
          type: DriftSqlType.double,
          requiredDuringInsert: false,
          $customConstraints: '');
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT CURRENT_TIMESTAMP',
      defaultValue: const CustomExpression('CURRENT_TIMESTAMP'));
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, true,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      $customConstraints: '');
  @override
  List<GeneratedColumn> get $columns => [
        id,
        serviceName,
        amount,
        nextRenewalDate,
        frequency,
        lifecycleState,
        categoryId,
        firstSeenDate,
        lastChargedDate,
        priceHistoryJson,
        cycleHistoryJson,
        frequencyConsistency,
        detectionSource,
        anomalies,
        isTrial,
        trialEndDate,
        chargeCount,
        averageDaysBetweenCharges,
        currency,
        notes,
        userConfirmed,
        isZombie,
        zombieReason,
        lastPriceHikePercent,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'subscriptions';
  @override
  VerificationContext validateIntegrity(Insertable<Subscription> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('service_name')) {
      context.handle(
          _serviceNameMeta,
          serviceName.isAcceptableOrUnknown(
              data['service_name']!, _serviceNameMeta));
    } else if (isInserting) {
      context.missing(_serviceNameMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('next_renewal_date')) {
      context.handle(
          _nextRenewalDateMeta,
          nextRenewalDate.isAcceptableOrUnknown(
              data['next_renewal_date']!, _nextRenewalDateMeta));
    } else if (isInserting) {
      context.missing(_nextRenewalDateMeta);
    }
    if (data.containsKey('frequency')) {
      context.handle(_frequencyMeta,
          frequency.isAcceptableOrUnknown(data['frequency']!, _frequencyMeta));
    } else if (isInserting) {
      context.missing(_frequencyMeta);
    }
    if (data.containsKey('lifecycle_state')) {
      context.handle(
          _lifecycleStateMeta,
          lifecycleState.isAcceptableOrUnknown(
              data['lifecycle_state']!, _lifecycleStateMeta));
    } else if (isInserting) {
      context.missing(_lifecycleStateMeta);
    }
    if (data.containsKey('category_id')) {
      context.handle(
          _categoryIdMeta,
          categoryId.isAcceptableOrUnknown(
              data['category_id']!, _categoryIdMeta));
    }
    if (data.containsKey('first_seen_date')) {
      context.handle(
          _firstSeenDateMeta,
          firstSeenDate.isAcceptableOrUnknown(
              data['first_seen_date']!, _firstSeenDateMeta));
    } else if (isInserting) {
      context.missing(_firstSeenDateMeta);
    }
    if (data.containsKey('last_charged_date')) {
      context.handle(
          _lastChargedDateMeta,
          lastChargedDate.isAcceptableOrUnknown(
              data['last_charged_date']!, _lastChargedDateMeta));
    }
    if (data.containsKey('price_history_json')) {
      context.handle(
          _priceHistoryJsonMeta,
          priceHistoryJson.isAcceptableOrUnknown(
              data['price_history_json']!, _priceHistoryJsonMeta));
    }
    if (data.containsKey('cycle_history_json')) {
      context.handle(
          _cycleHistoryJsonMeta,
          cycleHistoryJson.isAcceptableOrUnknown(
              data['cycle_history_json']!, _cycleHistoryJsonMeta));
    }
    if (data.containsKey('frequency_consistency')) {
      context.handle(
          _frequencyConsistencyMeta,
          frequencyConsistency.isAcceptableOrUnknown(
              data['frequency_consistency']!, _frequencyConsistencyMeta));
    }
    if (data.containsKey('detection_source')) {
      context.handle(
          _detectionSourceMeta,
          detectionSource.isAcceptableOrUnknown(
              data['detection_source']!, _detectionSourceMeta));
    } else if (isInserting) {
      context.missing(_detectionSourceMeta);
    }
    if (data.containsKey('anomalies')) {
      context.handle(_anomaliesMeta,
          anomalies.isAcceptableOrUnknown(data['anomalies']!, _anomaliesMeta));
    }
    if (data.containsKey('is_trial')) {
      context.handle(_isTrialMeta,
          isTrial.isAcceptableOrUnknown(data['is_trial']!, _isTrialMeta));
    }
    if (data.containsKey('trial_end_date')) {
      context.handle(
          _trialEndDateMeta,
          trialEndDate.isAcceptableOrUnknown(
              data['trial_end_date']!, _trialEndDateMeta));
    }
    if (data.containsKey('charge_count')) {
      context.handle(
          _chargeCountMeta,
          chargeCount.isAcceptableOrUnknown(
              data['charge_count']!, _chargeCountMeta));
    }
    if (data.containsKey('average_days_between_charges')) {
      context.handle(
          _averageDaysBetweenChargesMeta,
          averageDaysBetweenCharges.isAcceptableOrUnknown(
              data['average_days_between_charges']!,
              _averageDaysBetweenChargesMeta));
    }
    if (data.containsKey('currency')) {
      context.handle(_currencyMeta,
          currency.isAcceptableOrUnknown(data['currency']!, _currencyMeta));
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    if (data.containsKey('user_confirmed')) {
      context.handle(
          _userConfirmedMeta,
          userConfirmed.isAcceptableOrUnknown(
              data['user_confirmed']!, _userConfirmedMeta));
    }
    if (data.containsKey('is_zombie')) {
      context.handle(_isZombieMeta,
          isZombie.isAcceptableOrUnknown(data['is_zombie']!, _isZombieMeta));
    }
    if (data.containsKey('zombie_reason')) {
      context.handle(
          _zombieReasonMeta,
          zombieReason.isAcceptableOrUnknown(
              data['zombie_reason']!, _zombieReasonMeta));
    }
    if (data.containsKey('last_price_hike_percent')) {
      context.handle(
          _lastPriceHikePercentMeta,
          lastPriceHikePercent.isAcceptableOrUnknown(
              data['last_price_hike_percent']!, _lastPriceHikePercentMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Subscription map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Subscription(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      serviceName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}service_name'])!,
      amount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}amount'])!,
      nextRenewalDate: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}next_renewal_date'])!,
      frequency: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}frequency'])!,
      lifecycleState: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}lifecycle_state'])!,
      categoryId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}category_id']),
      firstSeenDate: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}first_seen_date'])!,
      lastChargedDate: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}last_charged_date']),
      priceHistoryJson: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}price_history_json']),
      cycleHistoryJson: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}cycle_history_json']),
      frequencyConsistency: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}frequency_consistency'])!,
      detectionSource: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}detection_source'])!,
      anomalies: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}anomalies']),
      isTrial: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_trial'])!,
      trialEndDate: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}trial_end_date']),
      chargeCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}charge_count'])!,
      averageDaysBetweenCharges: attachedDatabase.typeMapping.read(
          DriftSqlType.double,
          data['${effectivePrefix}average_days_between_charges']),
      currency: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}currency'])!,
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
      userConfirmed: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}user_confirmed'])!,
      isZombie: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_zombie'])!,
      zombieReason: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}zombie_reason']),
      lastPriceHikePercent: attachedDatabase.typeMapping.read(
          DriftSqlType.double,
          data['${effectivePrefix}last_price_hike_percent']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at']),
    );
  }

  @override
  Subscriptions createAlias(String alias) {
    return Subscriptions(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class Subscription extends DataClass implements Insertable<Subscription> {
  final int id;
  final String serviceName;
  final double amount;
  final DateTime nextRenewalDate;
  final int frequency;
  final int lifecycleState;
  final int? categoryId;
  final DateTime firstSeenDate;
  final DateTime? lastChargedDate;
  final String? priceHistoryJson;
  final String? cycleHistoryJson;
  final int frequencyConsistency;
  final int detectionSource;
  final String? anomalies;

  /// JSON encoded list
  final bool isTrial;
  final DateTime? trialEndDate;
  final int chargeCount;
  final double? averageDaysBetweenCharges;
  final String currency;
  final String? notes;
  final bool userConfirmed;
  final bool isZombie;
  final String? zombieReason;
  final double? lastPriceHikePercent;
  final DateTime createdAt;
  final DateTime? updatedAt;
  const Subscription(
      {required this.id,
      required this.serviceName,
      required this.amount,
      required this.nextRenewalDate,
      required this.frequency,
      required this.lifecycleState,
      this.categoryId,
      required this.firstSeenDate,
      this.lastChargedDate,
      this.priceHistoryJson,
      this.cycleHistoryJson,
      required this.frequencyConsistency,
      required this.detectionSource,
      this.anomalies,
      required this.isTrial,
      this.trialEndDate,
      required this.chargeCount,
      this.averageDaysBetweenCharges,
      required this.currency,
      this.notes,
      required this.userConfirmed,
      required this.isZombie,
      this.zombieReason,
      this.lastPriceHikePercent,
      required this.createdAt,
      this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['service_name'] = Variable<String>(serviceName);
    map['amount'] = Variable<double>(amount);
    map['next_renewal_date'] = Variable<DateTime>(nextRenewalDate);
    map['frequency'] = Variable<int>(frequency);
    map['lifecycle_state'] = Variable<int>(lifecycleState);
    if (!nullToAbsent || categoryId != null) {
      map['category_id'] = Variable<int>(categoryId);
    }
    map['first_seen_date'] = Variable<DateTime>(firstSeenDate);
    if (!nullToAbsent || lastChargedDate != null) {
      map['last_charged_date'] = Variable<DateTime>(lastChargedDate);
    }
    if (!nullToAbsent || priceHistoryJson != null) {
      map['price_history_json'] = Variable<String>(priceHistoryJson);
    }
    if (!nullToAbsent || cycleHistoryJson != null) {
      map['cycle_history_json'] = Variable<String>(cycleHistoryJson);
    }
    map['frequency_consistency'] = Variable<int>(frequencyConsistency);
    map['detection_source'] = Variable<int>(detectionSource);
    if (!nullToAbsent || anomalies != null) {
      map['anomalies'] = Variable<String>(anomalies);
    }
    map['is_trial'] = Variable<bool>(isTrial);
    if (!nullToAbsent || trialEndDate != null) {
      map['trial_end_date'] = Variable<DateTime>(trialEndDate);
    }
    map['charge_count'] = Variable<int>(chargeCount);
    if (!nullToAbsent || averageDaysBetweenCharges != null) {
      map['average_days_between_charges'] =
          Variable<double>(averageDaysBetweenCharges);
    }
    map['currency'] = Variable<String>(currency);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['user_confirmed'] = Variable<bool>(userConfirmed);
    map['is_zombie'] = Variable<bool>(isZombie);
    if (!nullToAbsent || zombieReason != null) {
      map['zombie_reason'] = Variable<String>(zombieReason);
    }
    if (!nullToAbsent || lastPriceHikePercent != null) {
      map['last_price_hike_percent'] = Variable<double>(lastPriceHikePercent);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    return map;
  }

  SubscriptionsCompanion toCompanion(bool nullToAbsent) {
    return SubscriptionsCompanion(
      id: Value(id),
      serviceName: Value(serviceName),
      amount: Value(amount),
      nextRenewalDate: Value(nextRenewalDate),
      frequency: Value(frequency),
      lifecycleState: Value(lifecycleState),
      categoryId: categoryId == null && nullToAbsent
          ? const Value.absent()
          : Value(categoryId),
      firstSeenDate: Value(firstSeenDate),
      lastChargedDate: lastChargedDate == null && nullToAbsent
          ? const Value.absent()
          : Value(lastChargedDate),
      priceHistoryJson: priceHistoryJson == null && nullToAbsent
          ? const Value.absent()
          : Value(priceHistoryJson),
      cycleHistoryJson: cycleHistoryJson == null && nullToAbsent
          ? const Value.absent()
          : Value(cycleHistoryJson),
      frequencyConsistency: Value(frequencyConsistency),
      detectionSource: Value(detectionSource),
      anomalies: anomalies == null && nullToAbsent
          ? const Value.absent()
          : Value(anomalies),
      isTrial: Value(isTrial),
      trialEndDate: trialEndDate == null && nullToAbsent
          ? const Value.absent()
          : Value(trialEndDate),
      chargeCount: Value(chargeCount),
      averageDaysBetweenCharges:
          averageDaysBetweenCharges == null && nullToAbsent
              ? const Value.absent()
              : Value(averageDaysBetweenCharges),
      currency: Value(currency),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
      userConfirmed: Value(userConfirmed),
      isZombie: Value(isZombie),
      zombieReason: zombieReason == null && nullToAbsent
          ? const Value.absent()
          : Value(zombieReason),
      lastPriceHikePercent: lastPriceHikePercent == null && nullToAbsent
          ? const Value.absent()
          : Value(lastPriceHikePercent),
      createdAt: Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory Subscription.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Subscription(
      id: serializer.fromJson<int>(json['id']),
      serviceName: serializer.fromJson<String>(json['service_name']),
      amount: serializer.fromJson<double>(json['amount']),
      nextRenewalDate: serializer.fromJson<DateTime>(json['next_renewal_date']),
      frequency: serializer.fromJson<int>(json['frequency']),
      lifecycleState: serializer.fromJson<int>(json['lifecycle_state']),
      categoryId: serializer.fromJson<int?>(json['category_id']),
      firstSeenDate: serializer.fromJson<DateTime>(json['first_seen_date']),
      lastChargedDate:
          serializer.fromJson<DateTime?>(json['last_charged_date']),
      priceHistoryJson:
          serializer.fromJson<String?>(json['price_history_json']),
      cycleHistoryJson:
          serializer.fromJson<String?>(json['cycle_history_json']),
      frequencyConsistency:
          serializer.fromJson<int>(json['frequency_consistency']),
      detectionSource: serializer.fromJson<int>(json['detection_source']),
      anomalies: serializer.fromJson<String?>(json['anomalies']),
      isTrial: serializer.fromJson<bool>(json['is_trial']),
      trialEndDate: serializer.fromJson<DateTime?>(json['trial_end_date']),
      chargeCount: serializer.fromJson<int>(json['charge_count']),
      averageDaysBetweenCharges:
          serializer.fromJson<double?>(json['average_days_between_charges']),
      currency: serializer.fromJson<String>(json['currency']),
      notes: serializer.fromJson<String?>(json['notes']),
      userConfirmed: serializer.fromJson<bool>(json['user_confirmed']),
      isZombie: serializer.fromJson<bool>(json['is_zombie']),
      zombieReason: serializer.fromJson<String?>(json['zombie_reason']),
      lastPriceHikePercent:
          serializer.fromJson<double?>(json['last_price_hike_percent']),
      createdAt: serializer.fromJson<DateTime>(json['created_at']),
      updatedAt: serializer.fromJson<DateTime?>(json['updated_at']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'service_name': serializer.toJson<String>(serviceName),
      'amount': serializer.toJson<double>(amount),
      'next_renewal_date': serializer.toJson<DateTime>(nextRenewalDate),
      'frequency': serializer.toJson<int>(frequency),
      'lifecycle_state': serializer.toJson<int>(lifecycleState),
      'category_id': serializer.toJson<int?>(categoryId),
      'first_seen_date': serializer.toJson<DateTime>(firstSeenDate),
      'last_charged_date': serializer.toJson<DateTime?>(lastChargedDate),
      'price_history_json': serializer.toJson<String?>(priceHistoryJson),
      'cycle_history_json': serializer.toJson<String?>(cycleHistoryJson),
      'frequency_consistency': serializer.toJson<int>(frequencyConsistency),
      'detection_source': serializer.toJson<int>(detectionSource),
      'anomalies': serializer.toJson<String?>(anomalies),
      'is_trial': serializer.toJson<bool>(isTrial),
      'trial_end_date': serializer.toJson<DateTime?>(trialEndDate),
      'charge_count': serializer.toJson<int>(chargeCount),
      'average_days_between_charges':
          serializer.toJson<double?>(averageDaysBetweenCharges),
      'currency': serializer.toJson<String>(currency),
      'notes': serializer.toJson<String?>(notes),
      'user_confirmed': serializer.toJson<bool>(userConfirmed),
      'is_zombie': serializer.toJson<bool>(isZombie),
      'zombie_reason': serializer.toJson<String?>(zombieReason),
      'last_price_hike_percent':
          serializer.toJson<double?>(lastPriceHikePercent),
      'created_at': serializer.toJson<DateTime>(createdAt),
      'updated_at': serializer.toJson<DateTime?>(updatedAt),
    };
  }

  Subscription copyWith(
          {int? id,
          String? serviceName,
          double? amount,
          DateTime? nextRenewalDate,
          int? frequency,
          int? lifecycleState,
          Value<int?> categoryId = const Value.absent(),
          DateTime? firstSeenDate,
          Value<DateTime?> lastChargedDate = const Value.absent(),
          Value<String?> priceHistoryJson = const Value.absent(),
          Value<String?> cycleHistoryJson = const Value.absent(),
          int? frequencyConsistency,
          int? detectionSource,
          Value<String?> anomalies = const Value.absent(),
          bool? isTrial,
          Value<DateTime?> trialEndDate = const Value.absent(),
          int? chargeCount,
          Value<double?> averageDaysBetweenCharges = const Value.absent(),
          String? currency,
          Value<String?> notes = const Value.absent(),
          bool? userConfirmed,
          bool? isZombie,
          Value<String?> zombieReason = const Value.absent(),
          Value<double?> lastPriceHikePercent = const Value.absent(),
          DateTime? createdAt,
          Value<DateTime?> updatedAt = const Value.absent()}) =>
      Subscription(
        id: id ?? this.id,
        serviceName: serviceName ?? this.serviceName,
        amount: amount ?? this.amount,
        nextRenewalDate: nextRenewalDate ?? this.nextRenewalDate,
        frequency: frequency ?? this.frequency,
        lifecycleState: lifecycleState ?? this.lifecycleState,
        categoryId: categoryId.present ? categoryId.value : this.categoryId,
        firstSeenDate: firstSeenDate ?? this.firstSeenDate,
        lastChargedDate: lastChargedDate.present
            ? lastChargedDate.value
            : this.lastChargedDate,
        priceHistoryJson: priceHistoryJson.present
            ? priceHistoryJson.value
            : this.priceHistoryJson,
        cycleHistoryJson: cycleHistoryJson.present
            ? cycleHistoryJson.value
            : this.cycleHistoryJson,
        frequencyConsistency: frequencyConsistency ?? this.frequencyConsistency,
        detectionSource: detectionSource ?? this.detectionSource,
        anomalies: anomalies.present ? anomalies.value : this.anomalies,
        isTrial: isTrial ?? this.isTrial,
        trialEndDate:
            trialEndDate.present ? trialEndDate.value : this.trialEndDate,
        chargeCount: chargeCount ?? this.chargeCount,
        averageDaysBetweenCharges: averageDaysBetweenCharges.present
            ? averageDaysBetweenCharges.value
            : this.averageDaysBetweenCharges,
        currency: currency ?? this.currency,
        notes: notes.present ? notes.value : this.notes,
        userConfirmed: userConfirmed ?? this.userConfirmed,
        isZombie: isZombie ?? this.isZombie,
        zombieReason:
            zombieReason.present ? zombieReason.value : this.zombieReason,
        lastPriceHikePercent: lastPriceHikePercent.present
            ? lastPriceHikePercent.value
            : this.lastPriceHikePercent,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
      );
  @override
  String toString() {
    return (StringBuffer('Subscription(')
          ..write('id: $id, ')
          ..write('serviceName: $serviceName, ')
          ..write('amount: $amount, ')
          ..write('nextRenewalDate: $nextRenewalDate, ')
          ..write('frequency: $frequency, ')
          ..write('lifecycleState: $lifecycleState, ')
          ..write('categoryId: $categoryId, ')
          ..write('firstSeenDate: $firstSeenDate, ')
          ..write('lastChargedDate: $lastChargedDate, ')
          ..write('priceHistoryJson: $priceHistoryJson, ')
          ..write('cycleHistoryJson: $cycleHistoryJson, ')
          ..write('frequencyConsistency: $frequencyConsistency, ')
          ..write('detectionSource: $detectionSource, ')
          ..write('anomalies: $anomalies, ')
          ..write('isTrial: $isTrial, ')
          ..write('trialEndDate: $trialEndDate, ')
          ..write('chargeCount: $chargeCount, ')
          ..write('averageDaysBetweenCharges: $averageDaysBetweenCharges, ')
          ..write('currency: $currency, ')
          ..write('notes: $notes, ')
          ..write('userConfirmed: $userConfirmed, ')
          ..write('isZombie: $isZombie, ')
          ..write('zombieReason: $zombieReason, ')
          ..write('lastPriceHikePercent: $lastPriceHikePercent, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
        id,
        serviceName,
        amount,
        nextRenewalDate,
        frequency,
        lifecycleState,
        categoryId,
        firstSeenDate,
        lastChargedDate,
        priceHistoryJson,
        cycleHistoryJson,
        frequencyConsistency,
        detectionSource,
        anomalies,
        isTrial,
        trialEndDate,
        chargeCount,
        averageDaysBetweenCharges,
        currency,
        notes,
        userConfirmed,
        isZombie,
        zombieReason,
        lastPriceHikePercent,
        createdAt,
        updatedAt
      ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Subscription &&
          other.id == this.id &&
          other.serviceName == this.serviceName &&
          other.amount == this.amount &&
          other.nextRenewalDate == this.nextRenewalDate &&
          other.frequency == this.frequency &&
          other.lifecycleState == this.lifecycleState &&
          other.categoryId == this.categoryId &&
          other.firstSeenDate == this.firstSeenDate &&
          other.lastChargedDate == this.lastChargedDate &&
          other.priceHistoryJson == this.priceHistoryJson &&
          other.cycleHistoryJson == this.cycleHistoryJson &&
          other.frequencyConsistency == this.frequencyConsistency &&
          other.detectionSource == this.detectionSource &&
          other.anomalies == this.anomalies &&
          other.isTrial == this.isTrial &&
          other.trialEndDate == this.trialEndDate &&
          other.chargeCount == this.chargeCount &&
          other.averageDaysBetweenCharges == this.averageDaysBetweenCharges &&
          other.currency == this.currency &&
          other.notes == this.notes &&
          other.userConfirmed == this.userConfirmed &&
          other.isZombie == this.isZombie &&
          other.zombieReason == this.zombieReason &&
          other.lastPriceHikePercent == this.lastPriceHikePercent &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class SubscriptionsCompanion extends UpdateCompanion<Subscription> {
  final Value<int> id;
  final Value<String> serviceName;
  final Value<double> amount;
  final Value<DateTime> nextRenewalDate;
  final Value<int> frequency;
  final Value<int> lifecycleState;
  final Value<int?> categoryId;
  final Value<DateTime> firstSeenDate;
  final Value<DateTime?> lastChargedDate;
  final Value<String?> priceHistoryJson;
  final Value<String?> cycleHistoryJson;
  final Value<int> frequencyConsistency;
  final Value<int> detectionSource;
  final Value<String?> anomalies;
  final Value<bool> isTrial;
  final Value<DateTime?> trialEndDate;
  final Value<int> chargeCount;
  final Value<double?> averageDaysBetweenCharges;
  final Value<String> currency;
  final Value<String?> notes;
  final Value<bool> userConfirmed;
  final Value<bool> isZombie;
  final Value<String?> zombieReason;
  final Value<double?> lastPriceHikePercent;
  final Value<DateTime> createdAt;
  final Value<DateTime?> updatedAt;
  const SubscriptionsCompanion({
    this.id = const Value.absent(),
    this.serviceName = const Value.absent(),
    this.amount = const Value.absent(),
    this.nextRenewalDate = const Value.absent(),
    this.frequency = const Value.absent(),
    this.lifecycleState = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.firstSeenDate = const Value.absent(),
    this.lastChargedDate = const Value.absent(),
    this.priceHistoryJson = const Value.absent(),
    this.cycleHistoryJson = const Value.absent(),
    this.frequencyConsistency = const Value.absent(),
    this.detectionSource = const Value.absent(),
    this.anomalies = const Value.absent(),
    this.isTrial = const Value.absent(),
    this.trialEndDate = const Value.absent(),
    this.chargeCount = const Value.absent(),
    this.averageDaysBetweenCharges = const Value.absent(),
    this.currency = const Value.absent(),
    this.notes = const Value.absent(),
    this.userConfirmed = const Value.absent(),
    this.isZombie = const Value.absent(),
    this.zombieReason = const Value.absent(),
    this.lastPriceHikePercent = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  SubscriptionsCompanion.insert({
    this.id = const Value.absent(),
    required String serviceName,
    required double amount,
    required DateTime nextRenewalDate,
    required int frequency,
    required int lifecycleState,
    this.categoryId = const Value.absent(),
    required DateTime firstSeenDate,
    this.lastChargedDate = const Value.absent(),
    this.priceHistoryJson = const Value.absent(),
    this.cycleHistoryJson = const Value.absent(),
    this.frequencyConsistency = const Value.absent(),
    required int detectionSource,
    this.anomalies = const Value.absent(),
    this.isTrial = const Value.absent(),
    this.trialEndDate = const Value.absent(),
    this.chargeCount = const Value.absent(),
    this.averageDaysBetweenCharges = const Value.absent(),
    this.currency = const Value.absent(),
    this.notes = const Value.absent(),
    this.userConfirmed = const Value.absent(),
    this.isZombie = const Value.absent(),
    this.zombieReason = const Value.absent(),
    this.lastPriceHikePercent = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  })  : serviceName = Value(serviceName),
        amount = Value(amount),
        nextRenewalDate = Value(nextRenewalDate),
        frequency = Value(frequency),
        lifecycleState = Value(lifecycleState),
        firstSeenDate = Value(firstSeenDate),
        detectionSource = Value(detectionSource);
  static Insertable<Subscription> custom({
    Expression<int>? id,
    Expression<String>? serviceName,
    Expression<double>? amount,
    Expression<DateTime>? nextRenewalDate,
    Expression<int>? frequency,
    Expression<int>? lifecycleState,
    Expression<int>? categoryId,
    Expression<DateTime>? firstSeenDate,
    Expression<DateTime>? lastChargedDate,
    Expression<String>? priceHistoryJson,
    Expression<String>? cycleHistoryJson,
    Expression<int>? frequencyConsistency,
    Expression<int>? detectionSource,
    Expression<String>? anomalies,
    Expression<bool>? isTrial,
    Expression<DateTime>? trialEndDate,
    Expression<int>? chargeCount,
    Expression<double>? averageDaysBetweenCharges,
    Expression<String>? currency,
    Expression<String>? notes,
    Expression<bool>? userConfirmed,
    Expression<bool>? isZombie,
    Expression<String>? zombieReason,
    Expression<double>? lastPriceHikePercent,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (serviceName != null) 'service_name': serviceName,
      if (amount != null) 'amount': amount,
      if (nextRenewalDate != null) 'next_renewal_date': nextRenewalDate,
      if (frequency != null) 'frequency': frequency,
      if (lifecycleState != null) 'lifecycle_state': lifecycleState,
      if (categoryId != null) 'category_id': categoryId,
      if (firstSeenDate != null) 'first_seen_date': firstSeenDate,
      if (lastChargedDate != null) 'last_charged_date': lastChargedDate,
      if (priceHistoryJson != null) 'price_history_json': priceHistoryJson,
      if (cycleHistoryJson != null) 'cycle_history_json': cycleHistoryJson,
      if (frequencyConsistency != null)
        'frequency_consistency': frequencyConsistency,
      if (detectionSource != null) 'detection_source': detectionSource,
      if (anomalies != null) 'anomalies': anomalies,
      if (isTrial != null) 'is_trial': isTrial,
      if (trialEndDate != null) 'trial_end_date': trialEndDate,
      if (chargeCount != null) 'charge_count': chargeCount,
      if (averageDaysBetweenCharges != null)
        'average_days_between_charges': averageDaysBetweenCharges,
      if (currency != null) 'currency': currency,
      if (notes != null) 'notes': notes,
      if (userConfirmed != null) 'user_confirmed': userConfirmed,
      if (isZombie != null) 'is_zombie': isZombie,
      if (zombieReason != null) 'zombie_reason': zombieReason,
      if (lastPriceHikePercent != null)
        'last_price_hike_percent': lastPriceHikePercent,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  SubscriptionsCompanion copyWith(
      {Value<int>? id,
      Value<String>? serviceName,
      Value<double>? amount,
      Value<DateTime>? nextRenewalDate,
      Value<int>? frequency,
      Value<int>? lifecycleState,
      Value<int?>? categoryId,
      Value<DateTime>? firstSeenDate,
      Value<DateTime?>? lastChargedDate,
      Value<String?>? priceHistoryJson,
      Value<String?>? cycleHistoryJson,
      Value<int>? frequencyConsistency,
      Value<int>? detectionSource,
      Value<String?>? anomalies,
      Value<bool>? isTrial,
      Value<DateTime?>? trialEndDate,
      Value<int>? chargeCount,
      Value<double?>? averageDaysBetweenCharges,
      Value<String>? currency,
      Value<String?>? notes,
      Value<bool>? userConfirmed,
      Value<bool>? isZombie,
      Value<String?>? zombieReason,
      Value<double?>? lastPriceHikePercent,
      Value<DateTime>? createdAt,
      Value<DateTime?>? updatedAt}) {
    return SubscriptionsCompanion(
      id: id ?? this.id,
      serviceName: serviceName ?? this.serviceName,
      amount: amount ?? this.amount,
      nextRenewalDate: nextRenewalDate ?? this.nextRenewalDate,
      frequency: frequency ?? this.frequency,
      lifecycleState: lifecycleState ?? this.lifecycleState,
      categoryId: categoryId ?? this.categoryId,
      firstSeenDate: firstSeenDate ?? this.firstSeenDate,
      lastChargedDate: lastChargedDate ?? this.lastChargedDate,
      priceHistoryJson: priceHistoryJson ?? this.priceHistoryJson,
      cycleHistoryJson: cycleHistoryJson ?? this.cycleHistoryJson,
      frequencyConsistency: frequencyConsistency ?? this.frequencyConsistency,
      detectionSource: detectionSource ?? this.detectionSource,
      anomalies: anomalies ?? this.anomalies,
      isTrial: isTrial ?? this.isTrial,
      trialEndDate: trialEndDate ?? this.trialEndDate,
      chargeCount: chargeCount ?? this.chargeCount,
      averageDaysBetweenCharges:
          averageDaysBetweenCharges ?? this.averageDaysBetweenCharges,
      currency: currency ?? this.currency,
      notes: notes ?? this.notes,
      userConfirmed: userConfirmed ?? this.userConfirmed,
      isZombie: isZombie ?? this.isZombie,
      zombieReason: zombieReason ?? this.zombieReason,
      lastPriceHikePercent: lastPriceHikePercent ?? this.lastPriceHikePercent,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (serviceName.present) {
      map['service_name'] = Variable<String>(serviceName.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (nextRenewalDate.present) {
      map['next_renewal_date'] = Variable<DateTime>(nextRenewalDate.value);
    }
    if (frequency.present) {
      map['frequency'] = Variable<int>(frequency.value);
    }
    if (lifecycleState.present) {
      map['lifecycle_state'] = Variable<int>(lifecycleState.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<int>(categoryId.value);
    }
    if (firstSeenDate.present) {
      map['first_seen_date'] = Variable<DateTime>(firstSeenDate.value);
    }
    if (lastChargedDate.present) {
      map['last_charged_date'] = Variable<DateTime>(lastChargedDate.value);
    }
    if (priceHistoryJson.present) {
      map['price_history_json'] = Variable<String>(priceHistoryJson.value);
    }
    if (cycleHistoryJson.present) {
      map['cycle_history_json'] = Variable<String>(cycleHistoryJson.value);
    }
    if (frequencyConsistency.present) {
      map['frequency_consistency'] = Variable<int>(frequencyConsistency.value);
    }
    if (detectionSource.present) {
      map['detection_source'] = Variable<int>(detectionSource.value);
    }
    if (anomalies.present) {
      map['anomalies'] = Variable<String>(anomalies.value);
    }
    if (isTrial.present) {
      map['is_trial'] = Variable<bool>(isTrial.value);
    }
    if (trialEndDate.present) {
      map['trial_end_date'] = Variable<DateTime>(trialEndDate.value);
    }
    if (chargeCount.present) {
      map['charge_count'] = Variable<int>(chargeCount.value);
    }
    if (averageDaysBetweenCharges.present) {
      map['average_days_between_charges'] =
          Variable<double>(averageDaysBetweenCharges.value);
    }
    if (currency.present) {
      map['currency'] = Variable<String>(currency.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (userConfirmed.present) {
      map['user_confirmed'] = Variable<bool>(userConfirmed.value);
    }
    if (isZombie.present) {
      map['is_zombie'] = Variable<bool>(isZombie.value);
    }
    if (zombieReason.present) {
      map['zombie_reason'] = Variable<String>(zombieReason.value);
    }
    if (lastPriceHikePercent.present) {
      map['last_price_hike_percent'] =
          Variable<double>(lastPriceHikePercent.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SubscriptionsCompanion(')
          ..write('id: $id, ')
          ..write('serviceName: $serviceName, ')
          ..write('amount: $amount, ')
          ..write('nextRenewalDate: $nextRenewalDate, ')
          ..write('frequency: $frequency, ')
          ..write('lifecycleState: $lifecycleState, ')
          ..write('categoryId: $categoryId, ')
          ..write('firstSeenDate: $firstSeenDate, ')
          ..write('lastChargedDate: $lastChargedDate, ')
          ..write('priceHistoryJson: $priceHistoryJson, ')
          ..write('cycleHistoryJson: $cycleHistoryJson, ')
          ..write('frequencyConsistency: $frequencyConsistency, ')
          ..write('detectionSource: $detectionSource, ')
          ..write('anomalies: $anomalies, ')
          ..write('isTrial: $isTrial, ')
          ..write('trialEndDate: $trialEndDate, ')
          ..write('chargeCount: $chargeCount, ')
          ..write('averageDaysBetweenCharges: $averageDaysBetweenCharges, ')
          ..write('currency: $currency, ')
          ..write('notes: $notes, ')
          ..write('userConfirmed: $userConfirmed, ')
          ..write('isZombie: $isZombie, ')
          ..write('zombieReason: $zombieReason, ')
          ..write('lastPriceHikePercent: $lastPriceHikePercent, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class Mappings extends Table with TableInfo<Mappings, Mapping> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Mappings(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'PRIMARY KEY AUTOINCREMENT');
  static const VerificationMeta _merchantNameMeta =
      const VerificationMeta('merchantName');
  late final GeneratedColumn<String> merchantName = GeneratedColumn<String>(
      'merchant_name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _categoryIdMeta =
      const VerificationMeta('categoryId');
  late final GeneratedColumn<int> categoryId = GeneratedColumn<int>(
      'category_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL REFERENCES categories(id)');
  static const VerificationMeta _isAutomaticMeta =
      const VerificationMeta('isAutomatic');
  late final GeneratedColumn<bool> isAutomatic = GeneratedColumn<bool>(
      'is_automatic', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT TRUE',
      defaultValue: const CustomExpression('TRUE'));
  static const VerificationMeta _confidenceMeta =
      const VerificationMeta('confidence');
  late final GeneratedColumn<int> confidence = GeneratedColumn<int>(
      'confidence', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT 100',
      defaultValue: const CustomExpression('100'));
  static const VerificationMeta _userConfirmedMeta =
      const VerificationMeta('userConfirmed');
  late final GeneratedColumn<bool> userConfirmed = GeneratedColumn<bool>(
      'user_confirmed', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT FALSE',
      defaultValue: const CustomExpression('FALSE'));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT CURRENT_TIMESTAMP',
      defaultValue: const CustomExpression('CURRENT_TIMESTAMP'));
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, true,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      $customConstraints: '');
  @override
  List<GeneratedColumn> get $columns => [
        id,
        merchantName,
        categoryId,
        isAutomatic,
        confidence,
        userConfirmed,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'mappings';
  @override
  VerificationContext validateIntegrity(Insertable<Mapping> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('merchant_name')) {
      context.handle(
          _merchantNameMeta,
          merchantName.isAcceptableOrUnknown(
              data['merchant_name']!, _merchantNameMeta));
    } else if (isInserting) {
      context.missing(_merchantNameMeta);
    }
    if (data.containsKey('category_id')) {
      context.handle(
          _categoryIdMeta,
          categoryId.isAcceptableOrUnknown(
              data['category_id']!, _categoryIdMeta));
    } else if (isInserting) {
      context.missing(_categoryIdMeta);
    }
    if (data.containsKey('is_automatic')) {
      context.handle(
          _isAutomaticMeta,
          isAutomatic.isAcceptableOrUnknown(
              data['is_automatic']!, _isAutomaticMeta));
    }
    if (data.containsKey('confidence')) {
      context.handle(
          _confidenceMeta,
          confidence.isAcceptableOrUnknown(
              data['confidence']!, _confidenceMeta));
    }
    if (data.containsKey('user_confirmed')) {
      context.handle(
          _userConfirmedMeta,
          userConfirmed.isAcceptableOrUnknown(
              data['user_confirmed']!, _userConfirmedMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Mapping map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Mapping(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      merchantName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}merchant_name'])!,
      categoryId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}category_id'])!,
      isAutomatic: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_automatic'])!,
      confidence: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}confidence'])!,
      userConfirmed: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}user_confirmed'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at']),
    );
  }

  @override
  Mappings createAlias(String alias) {
    return Mappings(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class Mapping extends DataClass implements Insertable<Mapping> {
  final int id;
  final String merchantName;
  final int categoryId;
  final bool isAutomatic;
  final int confidence;
  final bool userConfirmed;
  final DateTime createdAt;
  final DateTime? updatedAt;
  const Mapping(
      {required this.id,
      required this.merchantName,
      required this.categoryId,
      required this.isAutomatic,
      required this.confidence,
      required this.userConfirmed,
      required this.createdAt,
      this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['merchant_name'] = Variable<String>(merchantName);
    map['category_id'] = Variable<int>(categoryId);
    map['is_automatic'] = Variable<bool>(isAutomatic);
    map['confidence'] = Variable<int>(confidence);
    map['user_confirmed'] = Variable<bool>(userConfirmed);
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    return map;
  }

  MappingsCompanion toCompanion(bool nullToAbsent) {
    return MappingsCompanion(
      id: Value(id),
      merchantName: Value(merchantName),
      categoryId: Value(categoryId),
      isAutomatic: Value(isAutomatic),
      confidence: Value(confidence),
      userConfirmed: Value(userConfirmed),
      createdAt: Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory Mapping.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Mapping(
      id: serializer.fromJson<int>(json['id']),
      merchantName: serializer.fromJson<String>(json['merchant_name']),
      categoryId: serializer.fromJson<int>(json['category_id']),
      isAutomatic: serializer.fromJson<bool>(json['is_automatic']),
      confidence: serializer.fromJson<int>(json['confidence']),
      userConfirmed: serializer.fromJson<bool>(json['user_confirmed']),
      createdAt: serializer.fromJson<DateTime>(json['created_at']),
      updatedAt: serializer.fromJson<DateTime?>(json['updated_at']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'merchant_name': serializer.toJson<String>(merchantName),
      'category_id': serializer.toJson<int>(categoryId),
      'is_automatic': serializer.toJson<bool>(isAutomatic),
      'confidence': serializer.toJson<int>(confidence),
      'user_confirmed': serializer.toJson<bool>(userConfirmed),
      'created_at': serializer.toJson<DateTime>(createdAt),
      'updated_at': serializer.toJson<DateTime?>(updatedAt),
    };
  }

  Mapping copyWith(
          {int? id,
          String? merchantName,
          int? categoryId,
          bool? isAutomatic,
          int? confidence,
          bool? userConfirmed,
          DateTime? createdAt,
          Value<DateTime?> updatedAt = const Value.absent()}) =>
      Mapping(
        id: id ?? this.id,
        merchantName: merchantName ?? this.merchantName,
        categoryId: categoryId ?? this.categoryId,
        isAutomatic: isAutomatic ?? this.isAutomatic,
        confidence: confidence ?? this.confidence,
        userConfirmed: userConfirmed ?? this.userConfirmed,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
      );
  @override
  String toString() {
    return (StringBuffer('Mapping(')
          ..write('id: $id, ')
          ..write('merchantName: $merchantName, ')
          ..write('categoryId: $categoryId, ')
          ..write('isAutomatic: $isAutomatic, ')
          ..write('confidence: $confidence, ')
          ..write('userConfirmed: $userConfirmed, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, merchantName, categoryId, isAutomatic,
      confidence, userConfirmed, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Mapping &&
          other.id == this.id &&
          other.merchantName == this.merchantName &&
          other.categoryId == this.categoryId &&
          other.isAutomatic == this.isAutomatic &&
          other.confidence == this.confidence &&
          other.userConfirmed == this.userConfirmed &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class MappingsCompanion extends UpdateCompanion<Mapping> {
  final Value<int> id;
  final Value<String> merchantName;
  final Value<int> categoryId;
  final Value<bool> isAutomatic;
  final Value<int> confidence;
  final Value<bool> userConfirmed;
  final Value<DateTime> createdAt;
  final Value<DateTime?> updatedAt;
  const MappingsCompanion({
    this.id = const Value.absent(),
    this.merchantName = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.isAutomatic = const Value.absent(),
    this.confidence = const Value.absent(),
    this.userConfirmed = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  MappingsCompanion.insert({
    this.id = const Value.absent(),
    required String merchantName,
    required int categoryId,
    this.isAutomatic = const Value.absent(),
    this.confidence = const Value.absent(),
    this.userConfirmed = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  })  : merchantName = Value(merchantName),
        categoryId = Value(categoryId);
  static Insertable<Mapping> custom({
    Expression<int>? id,
    Expression<String>? merchantName,
    Expression<int>? categoryId,
    Expression<bool>? isAutomatic,
    Expression<int>? confidence,
    Expression<bool>? userConfirmed,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (merchantName != null) 'merchant_name': merchantName,
      if (categoryId != null) 'category_id': categoryId,
      if (isAutomatic != null) 'is_automatic': isAutomatic,
      if (confidence != null) 'confidence': confidence,
      if (userConfirmed != null) 'user_confirmed': userConfirmed,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  MappingsCompanion copyWith(
      {Value<int>? id,
      Value<String>? merchantName,
      Value<int>? categoryId,
      Value<bool>? isAutomatic,
      Value<int>? confidence,
      Value<bool>? userConfirmed,
      Value<DateTime>? createdAt,
      Value<DateTime?>? updatedAt}) {
    return MappingsCompanion(
      id: id ?? this.id,
      merchantName: merchantName ?? this.merchantName,
      categoryId: categoryId ?? this.categoryId,
      isAutomatic: isAutomatic ?? this.isAutomatic,
      confidence: confidence ?? this.confidence,
      userConfirmed: userConfirmed ?? this.userConfirmed,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (merchantName.present) {
      map['merchant_name'] = Variable<String>(merchantName.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<int>(categoryId.value);
    }
    if (isAutomatic.present) {
      map['is_automatic'] = Variable<bool>(isAutomatic.value);
    }
    if (confidence.present) {
      map['confidence'] = Variable<int>(confidence.value);
    }
    if (userConfirmed.present) {
      map['user_confirmed'] = Variable<bool>(userConfirmed.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MappingsCompanion(')
          ..write('id: $id, ')
          ..write('merchantName: $merchantName, ')
          ..write('categoryId: $categoryId, ')
          ..write('isAutomatic: $isAutomatic, ')
          ..write('confidence: $confidence, ')
          ..write('userConfirmed: $userConfirmed, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class Budgets extends Table with TableInfo<Budgets, Budget> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Budgets(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'PRIMARY KEY AUTOINCREMENT');
  static const VerificationMeta _categoryIdMeta =
      const VerificationMeta('categoryId');
  late final GeneratedColumn<int> categoryId = GeneratedColumn<int>(
      'category_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'REFERENCES categories(id)');
  static const VerificationMeta _limitAmountMeta =
      const VerificationMeta('limitAmount');
  late final GeneratedColumn<double> limitAmount = GeneratedColumn<double>(
      'limit_amount', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _periodMeta = const VerificationMeta('period');
  late final GeneratedColumn<int> period = GeneratedColumn<int>(
      'period', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT 1',
      defaultValue: const CustomExpression('1'));
  static const VerificationMeta _rolloverMeta =
      const VerificationMeta('rollover');
  late final GeneratedColumn<bool> rollover = GeneratedColumn<bool>(
      'rollover', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT FALSE',
      defaultValue: const CustomExpression('FALSE'));
  static const VerificationMeta _carryOverAmountMeta =
      const VerificationMeta('carryOverAmount');
  late final GeneratedColumn<double> carryOverAmount = GeneratedColumn<double>(
      'carry_over_amount', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT 0.0',
      defaultValue: const CustomExpression('0.0'));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT CURRENT_TIMESTAMP',
      defaultValue: const CustomExpression('CURRENT_TIMESTAMP'));
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, true,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      $customConstraints: '');
  @override
  List<GeneratedColumn> get $columns => [
        id,
        categoryId,
        limitAmount,
        period,
        rollover,
        carryOverAmount,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'budgets';
  @override
  VerificationContext validateIntegrity(Insertable<Budget> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('category_id')) {
      context.handle(
          _categoryIdMeta,
          categoryId.isAcceptableOrUnknown(
              data['category_id']!, _categoryIdMeta));
    }
    if (data.containsKey('limit_amount')) {
      context.handle(
          _limitAmountMeta,
          limitAmount.isAcceptableOrUnknown(
              data['limit_amount']!, _limitAmountMeta));
    } else if (isInserting) {
      context.missing(_limitAmountMeta);
    }
    if (data.containsKey('period')) {
      context.handle(_periodMeta,
          period.isAcceptableOrUnknown(data['period']!, _periodMeta));
    }
    if (data.containsKey('rollover')) {
      context.handle(_rolloverMeta,
          rollover.isAcceptableOrUnknown(data['rollover']!, _rolloverMeta));
    }
    if (data.containsKey('carry_over_amount')) {
      context.handle(
          _carryOverAmountMeta,
          carryOverAmount.isAcceptableOrUnknown(
              data['carry_over_amount']!, _carryOverAmountMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Budget map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Budget(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      categoryId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}category_id']),
      limitAmount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}limit_amount'])!,
      period: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}period'])!,
      rollover: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}rollover'])!,
      carryOverAmount: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}carry_over_amount'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at']),
    );
  }

  @override
  Budgets createAlias(String alias) {
    return Budgets(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class Budget extends DataClass implements Insertable<Budget> {
  final int id;
  final int? categoryId;
  final double limitAmount;
  final int period;

  /// 0: weekly, 1: monthly
  final bool rollover;
  final double carryOverAmount;
  final DateTime createdAt;
  final DateTime? updatedAt;
  const Budget(
      {required this.id,
      this.categoryId,
      required this.limitAmount,
      required this.period,
      required this.rollover,
      required this.carryOverAmount,
      required this.createdAt,
      this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || categoryId != null) {
      map['category_id'] = Variable<int>(categoryId);
    }
    map['limit_amount'] = Variable<double>(limitAmount);
    map['period'] = Variable<int>(period);
    map['rollover'] = Variable<bool>(rollover);
    map['carry_over_amount'] = Variable<double>(carryOverAmount);
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    return map;
  }

  BudgetsCompanion toCompanion(bool nullToAbsent) {
    return BudgetsCompanion(
      id: Value(id),
      categoryId: categoryId == null && nullToAbsent
          ? const Value.absent()
          : Value(categoryId),
      limitAmount: Value(limitAmount),
      period: Value(period),
      rollover: Value(rollover),
      carryOverAmount: Value(carryOverAmount),
      createdAt: Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory Budget.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Budget(
      id: serializer.fromJson<int>(json['id']),
      categoryId: serializer.fromJson<int?>(json['category_id']),
      limitAmount: serializer.fromJson<double>(json['limit_amount']),
      period: serializer.fromJson<int>(json['period']),
      rollover: serializer.fromJson<bool>(json['rollover']),
      carryOverAmount: serializer.fromJson<double>(json['carry_over_amount']),
      createdAt: serializer.fromJson<DateTime>(json['created_at']),
      updatedAt: serializer.fromJson<DateTime?>(json['updated_at']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'category_id': serializer.toJson<int?>(categoryId),
      'limit_amount': serializer.toJson<double>(limitAmount),
      'period': serializer.toJson<int>(period),
      'rollover': serializer.toJson<bool>(rollover),
      'carry_over_amount': serializer.toJson<double>(carryOverAmount),
      'created_at': serializer.toJson<DateTime>(createdAt),
      'updated_at': serializer.toJson<DateTime?>(updatedAt),
    };
  }

  Budget copyWith(
          {int? id,
          Value<int?> categoryId = const Value.absent(),
          double? limitAmount,
          int? period,
          bool? rollover,
          double? carryOverAmount,
          DateTime? createdAt,
          Value<DateTime?> updatedAt = const Value.absent()}) =>
      Budget(
        id: id ?? this.id,
        categoryId: categoryId.present ? categoryId.value : this.categoryId,
        limitAmount: limitAmount ?? this.limitAmount,
        period: period ?? this.period,
        rollover: rollover ?? this.rollover,
        carryOverAmount: carryOverAmount ?? this.carryOverAmount,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
      );
  @override
  String toString() {
    return (StringBuffer('Budget(')
          ..write('id: $id, ')
          ..write('categoryId: $categoryId, ')
          ..write('limitAmount: $limitAmount, ')
          ..write('period: $period, ')
          ..write('rollover: $rollover, ')
          ..write('carryOverAmount: $carryOverAmount, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, categoryId, limitAmount, period, rollover,
      carryOverAmount, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Budget &&
          other.id == this.id &&
          other.categoryId == this.categoryId &&
          other.limitAmount == this.limitAmount &&
          other.period == this.period &&
          other.rollover == this.rollover &&
          other.carryOverAmount == this.carryOverAmount &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class BudgetsCompanion extends UpdateCompanion<Budget> {
  final Value<int> id;
  final Value<int?> categoryId;
  final Value<double> limitAmount;
  final Value<int> period;
  final Value<bool> rollover;
  final Value<double> carryOverAmount;
  final Value<DateTime> createdAt;
  final Value<DateTime?> updatedAt;
  const BudgetsCompanion({
    this.id = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.limitAmount = const Value.absent(),
    this.period = const Value.absent(),
    this.rollover = const Value.absent(),
    this.carryOverAmount = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  BudgetsCompanion.insert({
    this.id = const Value.absent(),
    this.categoryId = const Value.absent(),
    required double limitAmount,
    this.period = const Value.absent(),
    this.rollover = const Value.absent(),
    this.carryOverAmount = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : limitAmount = Value(limitAmount);
  static Insertable<Budget> custom({
    Expression<int>? id,
    Expression<int>? categoryId,
    Expression<double>? limitAmount,
    Expression<int>? period,
    Expression<bool>? rollover,
    Expression<double>? carryOverAmount,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (categoryId != null) 'category_id': categoryId,
      if (limitAmount != null) 'limit_amount': limitAmount,
      if (period != null) 'period': period,
      if (rollover != null) 'rollover': rollover,
      if (carryOverAmount != null) 'carry_over_amount': carryOverAmount,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  BudgetsCompanion copyWith(
      {Value<int>? id,
      Value<int?>? categoryId,
      Value<double>? limitAmount,
      Value<int>? period,
      Value<bool>? rollover,
      Value<double>? carryOverAmount,
      Value<DateTime>? createdAt,
      Value<DateTime?>? updatedAt}) {
    return BudgetsCompanion(
      id: id ?? this.id,
      categoryId: categoryId ?? this.categoryId,
      limitAmount: limitAmount ?? this.limitAmount,
      period: period ?? this.period,
      rollover: rollover ?? this.rollover,
      carryOverAmount: carryOverAmount ?? this.carryOverAmount,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<int>(categoryId.value);
    }
    if (limitAmount.present) {
      map['limit_amount'] = Variable<double>(limitAmount.value);
    }
    if (period.present) {
      map['period'] = Variable<int>(period.value);
    }
    if (rollover.present) {
      map['rollover'] = Variable<bool>(rollover.value);
    }
    if (carryOverAmount.present) {
      map['carry_over_amount'] = Variable<double>(carryOverAmount.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BudgetsCompanion(')
          ..write('id: $id, ')
          ..write('categoryId: $categoryId, ')
          ..write('limitAmount: $limitAmount, ')
          ..write('period: $period, ')
          ..write('rollover: $rollover, ')
          ..write('carryOverAmount: $carryOverAmount, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class Splits extends Table with TableInfo<Splits, Split> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Splits(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'PRIMARY KEY AUTOINCREMENT');
  static const VerificationMeta _transactionIdMeta =
      const VerificationMeta('transactionId');
  late final GeneratedColumn<int> transactionId = GeneratedColumn<int>(
      'transaction_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL REFERENCES transactions(id)');
  static const VerificationMeta _categoryIdMeta =
      const VerificationMeta('categoryId');
  late final GeneratedColumn<int> categoryId = GeneratedColumn<int>(
      'category_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL REFERENCES categories(id)');
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
      'amount', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT CURRENT_TIMESTAMP',
      defaultValue: const CustomExpression('CURRENT_TIMESTAMP'));
  @override
  List<GeneratedColumn> get $columns =>
      [id, transactionId, categoryId, amount, notes, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'splits';
  @override
  VerificationContext validateIntegrity(Insertable<Split> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('transaction_id')) {
      context.handle(
          _transactionIdMeta,
          transactionId.isAcceptableOrUnknown(
              data['transaction_id']!, _transactionIdMeta));
    } else if (isInserting) {
      context.missing(_transactionIdMeta);
    }
    if (data.containsKey('category_id')) {
      context.handle(
          _categoryIdMeta,
          categoryId.isAcceptableOrUnknown(
              data['category_id']!, _categoryIdMeta));
    } else if (isInserting) {
      context.missing(_categoryIdMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Split map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Split(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      transactionId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}transaction_id'])!,
      categoryId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}category_id'])!,
      amount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}amount'])!,
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  Splits createAlias(String alias) {
    return Splits(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class Split extends DataClass implements Insertable<Split> {
  final int id;
  final int transactionId;
  final int categoryId;
  final double amount;
  final String? notes;
  final DateTime createdAt;
  const Split(
      {required this.id,
      required this.transactionId,
      required this.categoryId,
      required this.amount,
      this.notes,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['transaction_id'] = Variable<int>(transactionId);
    map['category_id'] = Variable<int>(categoryId);
    map['amount'] = Variable<double>(amount);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  SplitsCompanion toCompanion(bool nullToAbsent) {
    return SplitsCompanion(
      id: Value(id),
      transactionId: Value(transactionId),
      categoryId: Value(categoryId),
      amount: Value(amount),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
      createdAt: Value(createdAt),
    );
  }

  factory Split.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Split(
      id: serializer.fromJson<int>(json['id']),
      transactionId: serializer.fromJson<int>(json['transaction_id']),
      categoryId: serializer.fromJson<int>(json['category_id']),
      amount: serializer.fromJson<double>(json['amount']),
      notes: serializer.fromJson<String?>(json['notes']),
      createdAt: serializer.fromJson<DateTime>(json['created_at']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'transaction_id': serializer.toJson<int>(transactionId),
      'category_id': serializer.toJson<int>(categoryId),
      'amount': serializer.toJson<double>(amount),
      'notes': serializer.toJson<String?>(notes),
      'created_at': serializer.toJson<DateTime>(createdAt),
    };
  }

  Split copyWith(
          {int? id,
          int? transactionId,
          int? categoryId,
          double? amount,
          Value<String?> notes = const Value.absent(),
          DateTime? createdAt}) =>
      Split(
        id: id ?? this.id,
        transactionId: transactionId ?? this.transactionId,
        categoryId: categoryId ?? this.categoryId,
        amount: amount ?? this.amount,
        notes: notes.present ? notes.value : this.notes,
        createdAt: createdAt ?? this.createdAt,
      );
  @override
  String toString() {
    return (StringBuffer('Split(')
          ..write('id: $id, ')
          ..write('transactionId: $transactionId, ')
          ..write('categoryId: $categoryId, ')
          ..write('amount: $amount, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, transactionId, categoryId, amount, notes, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Split &&
          other.id == this.id &&
          other.transactionId == this.transactionId &&
          other.categoryId == this.categoryId &&
          other.amount == this.amount &&
          other.notes == this.notes &&
          other.createdAt == this.createdAt);
}

class SplitsCompanion extends UpdateCompanion<Split> {
  final Value<int> id;
  final Value<int> transactionId;
  final Value<int> categoryId;
  final Value<double> amount;
  final Value<String?> notes;
  final Value<DateTime> createdAt;
  const SplitsCompanion({
    this.id = const Value.absent(),
    this.transactionId = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.amount = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  SplitsCompanion.insert({
    this.id = const Value.absent(),
    required int transactionId,
    required int categoryId,
    required double amount,
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
  })  : transactionId = Value(transactionId),
        categoryId = Value(categoryId),
        amount = Value(amount);
  static Insertable<Split> custom({
    Expression<int>? id,
    Expression<int>? transactionId,
    Expression<int>? categoryId,
    Expression<double>? amount,
    Expression<String>? notes,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (transactionId != null) 'transaction_id': transactionId,
      if (categoryId != null) 'category_id': categoryId,
      if (amount != null) 'amount': amount,
      if (notes != null) 'notes': notes,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  SplitsCompanion copyWith(
      {Value<int>? id,
      Value<int>? transactionId,
      Value<int>? categoryId,
      Value<double>? amount,
      Value<String?>? notes,
      Value<DateTime>? createdAt}) {
    return SplitsCompanion(
      id: id ?? this.id,
      transactionId: transactionId ?? this.transactionId,
      categoryId: categoryId ?? this.categoryId,
      amount: amount ?? this.amount,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (transactionId.present) {
      map['transaction_id'] = Variable<int>(transactionId.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<int>(categoryId.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SplitsCompanion(')
          ..write('id: $id, ')
          ..write('transactionId: $transactionId, ')
          ..write('categoryId: $categoryId, ')
          ..write('amount: $amount, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  _$AppDatabaseManager get managers => _$AppDatabaseManager(this);
  late final Categories categories = Categories(this);
  late final Receipts receipts = Receipts(this);
  late final Transactions transactions = Transactions(this);
  late final Subscriptions subscriptions = Subscriptions(this);
  late final Mappings mappings = Mappings(this);
  late final Budgets budgets = Budgets(this);
  late final Splits splits = Splits(this);
  late final Index transactionsDateIdx = Index('transactions_date_idx',
      'CREATE INDEX IF NOT EXISTS transactions_date_idx ON transactions (date)');
  late final Index subscriptionsRenewalIdx = Index('subscriptions_renewal_idx',
      'CREATE INDEX IF NOT EXISTS subscriptions_renewal_idx ON subscriptions (next_renewal_date)');
  late final ReceiptDao receiptDao = ReceiptDao(this as AppDatabase);
  late final TransactionDao transactionDao =
      TransactionDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        categories,
        receipts,
        transactions,
        subscriptions,
        mappings,
        budgets,
        splits,
        transactionsDateIdx,
        subscriptionsRenewalIdx
      ];
}

typedef $CategoriesInsertCompanionBuilder = CategoriesCompanion Function({
  Value<int> id,
  required String name,
  Value<int?> parentCategoryId,
  required String icon,
  required String color,
  Value<int?> colorValue,
  Value<bool> isSystem,
  Value<int> displayOrder,
  Value<bool> isActive,
  Value<int> transactionCount,
  Value<DateTime> createdAt,
  Value<DateTime?> updatedAt,
});
typedef $CategoriesUpdateCompanionBuilder = CategoriesCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<int?> parentCategoryId,
  Value<String> icon,
  Value<String> color,
  Value<int?> colorValue,
  Value<bool> isSystem,
  Value<int> displayOrder,
  Value<bool> isActive,
  Value<int> transactionCount,
  Value<DateTime> createdAt,
  Value<DateTime?> updatedAt,
});

class $CategoriesTableManager extends RootTableManager<
    _$AppDatabase,
    Categories,
    Category,
    $CategoriesFilterComposer,
    $CategoriesOrderingComposer,
    $CategoriesProcessedTableManager,
    $CategoriesInsertCompanionBuilder,
    $CategoriesUpdateCompanionBuilder> {
  $CategoriesTableManager(_$AppDatabase db, Categories table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $CategoriesFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $CategoriesOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) => $CategoriesProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<int?> parentCategoryId = const Value.absent(),
            Value<String> icon = const Value.absent(),
            Value<String> color = const Value.absent(),
            Value<int?> colorValue = const Value.absent(),
            Value<bool> isSystem = const Value.absent(),
            Value<int> displayOrder = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
            Value<int> transactionCount = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime?> updatedAt = const Value.absent(),
          }) =>
              CategoriesCompanion(
            id: id,
            name: name,
            parentCategoryId: parentCategoryId,
            icon: icon,
            color: color,
            colorValue: colorValue,
            isSystem: isSystem,
            displayOrder: displayOrder,
            isActive: isActive,
            transactionCount: transactionCount,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            required String name,
            Value<int?> parentCategoryId = const Value.absent(),
            required String icon,
            required String color,
            Value<int?> colorValue = const Value.absent(),
            Value<bool> isSystem = const Value.absent(),
            Value<int> displayOrder = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
            Value<int> transactionCount = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime?> updatedAt = const Value.absent(),
          }) =>
              CategoriesCompanion.insert(
            id: id,
            name: name,
            parentCategoryId: parentCategoryId,
            icon: icon,
            color: color,
            colorValue: colorValue,
            isSystem: isSystem,
            displayOrder: displayOrder,
            isActive: isActive,
            transactionCount: transactionCount,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
        ));
}

class $CategoriesProcessedTableManager extends ProcessedTableManager<
    _$AppDatabase,
    Categories,
    Category,
    $CategoriesFilterComposer,
    $CategoriesOrderingComposer,
    $CategoriesProcessedTableManager,
    $CategoriesInsertCompanionBuilder,
    $CategoriesUpdateCompanionBuilder> {
  $CategoriesProcessedTableManager(super.$state);
}

class $CategoriesFilterComposer
    extends FilterComposer<_$AppDatabase, Categories> {
  $CategoriesFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get parentCategoryId => $state.composableBuilder(
      column: $state.table.parentCategoryId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get icon => $state.composableBuilder(
      column: $state.table.icon,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get color => $state.composableBuilder(
      column: $state.table.color,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get colorValue => $state.composableBuilder(
      column: $state.table.colorValue,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get isSystem => $state.composableBuilder(
      column: $state.table.isSystem,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get displayOrder => $state.composableBuilder(
      column: $state.table.displayOrder,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get isActive => $state.composableBuilder(
      column: $state.table.isActive,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get transactionCount => $state.composableBuilder(
      column: $state.table.transactionCount,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get updatedAt => $state.composableBuilder(
      column: $state.table.updatedAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ComposableFilter receiptsRefs(
      ComposableFilter Function($ReceiptsFilterComposer f) f) {
    final $ReceiptsFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.receipts,
        getReferencedColumn: (t) => t.categoryId,
        builder: (joinBuilder, parentComposers) => $ReceiptsFilterComposer(
            ComposerState(
                $state.db, $state.db.receipts, joinBuilder, parentComposers)));
    return f(composer);
  }

  ComposableFilter transactionsRefs(
      ComposableFilter Function($TransactionsFilterComposer f) f) {
    final $TransactionsFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.transactions,
        getReferencedColumn: (t) => t.categoryId,
        builder: (joinBuilder, parentComposers) => $TransactionsFilterComposer(
            ComposerState($state.db, $state.db.transactions, joinBuilder,
                parentComposers)));
    return f(composer);
  }

  ComposableFilter subscriptionsRefs(
      ComposableFilter Function($SubscriptionsFilterComposer f) f) {
    final $SubscriptionsFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.subscriptions,
        getReferencedColumn: (t) => t.categoryId,
        builder: (joinBuilder, parentComposers) => $SubscriptionsFilterComposer(
            ComposerState($state.db, $state.db.subscriptions, joinBuilder,
                parentComposers)));
    return f(composer);
  }

  ComposableFilter mappingsRefs(
      ComposableFilter Function($MappingsFilterComposer f) f) {
    final $MappingsFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.mappings,
        getReferencedColumn: (t) => t.categoryId,
        builder: (joinBuilder, parentComposers) => $MappingsFilterComposer(
            ComposerState(
                $state.db, $state.db.mappings, joinBuilder, parentComposers)));
    return f(composer);
  }

  ComposableFilter budgetsRefs(
      ComposableFilter Function($BudgetsFilterComposer f) f) {
    final $BudgetsFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.budgets,
        getReferencedColumn: (t) => t.categoryId,
        builder: (joinBuilder, parentComposers) => $BudgetsFilterComposer(
            ComposerState(
                $state.db, $state.db.budgets, joinBuilder, parentComposers)));
    return f(composer);
  }

  ComposableFilter splitsRefs(
      ComposableFilter Function($SplitsFilterComposer f) f) {
    final $SplitsFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.splits,
        getReferencedColumn: (t) => t.categoryId,
        builder: (joinBuilder, parentComposers) => $SplitsFilterComposer(
            ComposerState(
                $state.db, $state.db.splits, joinBuilder, parentComposers)));
    return f(composer);
  }
}

class $CategoriesOrderingComposer
    extends OrderingComposer<_$AppDatabase, Categories> {
  $CategoriesOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get parentCategoryId => $state.composableBuilder(
      column: $state.table.parentCategoryId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get icon => $state.composableBuilder(
      column: $state.table.icon,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get color => $state.composableBuilder(
      column: $state.table.color,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get colorValue => $state.composableBuilder(
      column: $state.table.colorValue,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get isSystem => $state.composableBuilder(
      column: $state.table.isSystem,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get displayOrder => $state.composableBuilder(
      column: $state.table.displayOrder,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get isActive => $state.composableBuilder(
      column: $state.table.isActive,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get transactionCount => $state.composableBuilder(
      column: $state.table.transactionCount,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get updatedAt => $state.composableBuilder(
      column: $state.table.updatedAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $ReceiptsInsertCompanionBuilder = ReceiptsCompanion Function({
  Value<int> id,
  required String vendor,
  required double amount,
  required DateTime date,
  Value<int?> categoryId,
  Value<String?> imagePath,
  Value<DateTime> createdAt,
});
typedef $ReceiptsUpdateCompanionBuilder = ReceiptsCompanion Function({
  Value<int> id,
  Value<String> vendor,
  Value<double> amount,
  Value<DateTime> date,
  Value<int?> categoryId,
  Value<String?> imagePath,
  Value<DateTime> createdAt,
});

class $ReceiptsTableManager extends RootTableManager<
    _$AppDatabase,
    Receipts,
    Receipt,
    $ReceiptsFilterComposer,
    $ReceiptsOrderingComposer,
    $ReceiptsProcessedTableManager,
    $ReceiptsInsertCompanionBuilder,
    $ReceiptsUpdateCompanionBuilder> {
  $ReceiptsTableManager(_$AppDatabase db, Receipts table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer: $ReceiptsFilterComposer(ComposerState(db, table)),
          orderingComposer: $ReceiptsOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) => $ReceiptsProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<String> vendor = const Value.absent(),
            Value<double> amount = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
            Value<int?> categoryId = const Value.absent(),
            Value<String?> imagePath = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              ReceiptsCompanion(
            id: id,
            vendor: vendor,
            amount: amount,
            date: date,
            categoryId: categoryId,
            imagePath: imagePath,
            createdAt: createdAt,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            required String vendor,
            required double amount,
            required DateTime date,
            Value<int?> categoryId = const Value.absent(),
            Value<String?> imagePath = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              ReceiptsCompanion.insert(
            id: id,
            vendor: vendor,
            amount: amount,
            date: date,
            categoryId: categoryId,
            imagePath: imagePath,
            createdAt: createdAt,
          ),
        ));
}

class $ReceiptsProcessedTableManager extends ProcessedTableManager<
    _$AppDatabase,
    Receipts,
    Receipt,
    $ReceiptsFilterComposer,
    $ReceiptsOrderingComposer,
    $ReceiptsProcessedTableManager,
    $ReceiptsInsertCompanionBuilder,
    $ReceiptsUpdateCompanionBuilder> {
  $ReceiptsProcessedTableManager(super.$state);
}

class $ReceiptsFilterComposer extends FilterComposer<_$AppDatabase, Receipts> {
  $ReceiptsFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get vendor => $state.composableBuilder(
      column: $state.table.vendor,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get amount => $state.composableBuilder(
      column: $state.table.amount,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get date => $state.composableBuilder(
      column: $state.table.date,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get imagePath => $state.composableBuilder(
      column: $state.table.imagePath,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  $CategoriesFilterComposer get categoryId {
    final $CategoriesFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.categoryId,
        referencedTable: $state.db.categories,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) => $CategoriesFilterComposer(
            ComposerState($state.db, $state.db.categories, joinBuilder,
                parentComposers)));
    return composer;
  }
}

class $ReceiptsOrderingComposer
    extends OrderingComposer<_$AppDatabase, Receipts> {
  $ReceiptsOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get vendor => $state.composableBuilder(
      column: $state.table.vendor,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get amount => $state.composableBuilder(
      column: $state.table.amount,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get date => $state.composableBuilder(
      column: $state.table.date,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get imagePath => $state.composableBuilder(
      column: $state.table.imagePath,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  $CategoriesOrderingComposer get categoryId {
    final $CategoriesOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.categoryId,
        referencedTable: $state.db.categories,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) => $CategoriesOrderingComposer(
            ComposerState($state.db, $state.db.categories, joinBuilder,
                parentComposers)));
    return composer;
  }
}

typedef $TransactionsInsertCompanionBuilder = TransactionsCompanion Function({
  Value<int> id,
  required String merchantName,
  Value<String?> rawMerchantName,
  required double amount,
  Value<double?> subtotalAmount,
  Value<double?> taxAmount,
  Value<double?> discountAmount,
  Value<double?> tipAmount,
  required DateTime date,
  Value<int?> categoryId,
  Value<bool> isSubscription,
  Value<int?> subscriptionId,
  Value<int> kind,
  Value<int> origin,
  Value<bool> isRecurring,
  Value<int> extractionConfidence,
  Value<bool> hasLineItems,
  Value<String?> originalEmailId,
  Value<String> currency,
  Value<String?> notes,
  Value<bool> userVerified,
  Value<bool> hasSplits,
  Value<bool> isManuallyEdited,
  Value<DateTime?> manualEditTimestamp,
  Value<DateTime> createdAt,
  Value<DateTime?> updatedAt,
});
typedef $TransactionsUpdateCompanionBuilder = TransactionsCompanion Function({
  Value<int> id,
  Value<String> merchantName,
  Value<String?> rawMerchantName,
  Value<double> amount,
  Value<double?> subtotalAmount,
  Value<double?> taxAmount,
  Value<double?> discountAmount,
  Value<double?> tipAmount,
  Value<DateTime> date,
  Value<int?> categoryId,
  Value<bool> isSubscription,
  Value<int?> subscriptionId,
  Value<int> kind,
  Value<int> origin,
  Value<bool> isRecurring,
  Value<int> extractionConfidence,
  Value<bool> hasLineItems,
  Value<String?> originalEmailId,
  Value<String> currency,
  Value<String?> notes,
  Value<bool> userVerified,
  Value<bool> hasSplits,
  Value<bool> isManuallyEdited,
  Value<DateTime?> manualEditTimestamp,
  Value<DateTime> createdAt,
  Value<DateTime?> updatedAt,
});

class $TransactionsTableManager extends RootTableManager<
    _$AppDatabase,
    Transactions,
    Transaction,
    $TransactionsFilterComposer,
    $TransactionsOrderingComposer,
    $TransactionsProcessedTableManager,
    $TransactionsInsertCompanionBuilder,
    $TransactionsUpdateCompanionBuilder> {
  $TransactionsTableManager(_$AppDatabase db, Transactions table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $TransactionsFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $TransactionsOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) => $TransactionsProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<String> merchantName = const Value.absent(),
            Value<String?> rawMerchantName = const Value.absent(),
            Value<double> amount = const Value.absent(),
            Value<double?> subtotalAmount = const Value.absent(),
            Value<double?> taxAmount = const Value.absent(),
            Value<double?> discountAmount = const Value.absent(),
            Value<double?> tipAmount = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
            Value<int?> categoryId = const Value.absent(),
            Value<bool> isSubscription = const Value.absent(),
            Value<int?> subscriptionId = const Value.absent(),
            Value<int> kind = const Value.absent(),
            Value<int> origin = const Value.absent(),
            Value<bool> isRecurring = const Value.absent(),
            Value<int> extractionConfidence = const Value.absent(),
            Value<bool> hasLineItems = const Value.absent(),
            Value<String?> originalEmailId = const Value.absent(),
            Value<String> currency = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<bool> userVerified = const Value.absent(),
            Value<bool> hasSplits = const Value.absent(),
            Value<bool> isManuallyEdited = const Value.absent(),
            Value<DateTime?> manualEditTimestamp = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime?> updatedAt = const Value.absent(),
          }) =>
              TransactionsCompanion(
            id: id,
            merchantName: merchantName,
            rawMerchantName: rawMerchantName,
            amount: amount,
            subtotalAmount: subtotalAmount,
            taxAmount: taxAmount,
            discountAmount: discountAmount,
            tipAmount: tipAmount,
            date: date,
            categoryId: categoryId,
            isSubscription: isSubscription,
            subscriptionId: subscriptionId,
            kind: kind,
            origin: origin,
            isRecurring: isRecurring,
            extractionConfidence: extractionConfidence,
            hasLineItems: hasLineItems,
            originalEmailId: originalEmailId,
            currency: currency,
            notes: notes,
            userVerified: userVerified,
            hasSplits: hasSplits,
            isManuallyEdited: isManuallyEdited,
            manualEditTimestamp: manualEditTimestamp,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            required String merchantName,
            Value<String?> rawMerchantName = const Value.absent(),
            required double amount,
            Value<double?> subtotalAmount = const Value.absent(),
            Value<double?> taxAmount = const Value.absent(),
            Value<double?> discountAmount = const Value.absent(),
            Value<double?> tipAmount = const Value.absent(),
            required DateTime date,
            Value<int?> categoryId = const Value.absent(),
            Value<bool> isSubscription = const Value.absent(),
            Value<int?> subscriptionId = const Value.absent(),
            Value<int> kind = const Value.absent(),
            Value<int> origin = const Value.absent(),
            Value<bool> isRecurring = const Value.absent(),
            Value<int> extractionConfidence = const Value.absent(),
            Value<bool> hasLineItems = const Value.absent(),
            Value<String?> originalEmailId = const Value.absent(),
            Value<String> currency = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<bool> userVerified = const Value.absent(),
            Value<bool> hasSplits = const Value.absent(),
            Value<bool> isManuallyEdited = const Value.absent(),
            Value<DateTime?> manualEditTimestamp = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime?> updatedAt = const Value.absent(),
          }) =>
              TransactionsCompanion.insert(
            id: id,
            merchantName: merchantName,
            rawMerchantName: rawMerchantName,
            amount: amount,
            subtotalAmount: subtotalAmount,
            taxAmount: taxAmount,
            discountAmount: discountAmount,
            tipAmount: tipAmount,
            date: date,
            categoryId: categoryId,
            isSubscription: isSubscription,
            subscriptionId: subscriptionId,
            kind: kind,
            origin: origin,
            isRecurring: isRecurring,
            extractionConfidence: extractionConfidence,
            hasLineItems: hasLineItems,
            originalEmailId: originalEmailId,
            currency: currency,
            notes: notes,
            userVerified: userVerified,
            hasSplits: hasSplits,
            isManuallyEdited: isManuallyEdited,
            manualEditTimestamp: manualEditTimestamp,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
        ));
}

class $TransactionsProcessedTableManager extends ProcessedTableManager<
    _$AppDatabase,
    Transactions,
    Transaction,
    $TransactionsFilterComposer,
    $TransactionsOrderingComposer,
    $TransactionsProcessedTableManager,
    $TransactionsInsertCompanionBuilder,
    $TransactionsUpdateCompanionBuilder> {
  $TransactionsProcessedTableManager(super.$state);
}

class $TransactionsFilterComposer
    extends FilterComposer<_$AppDatabase, Transactions> {
  $TransactionsFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get merchantName => $state.composableBuilder(
      column: $state.table.merchantName,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get rawMerchantName => $state.composableBuilder(
      column: $state.table.rawMerchantName,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get amount => $state.composableBuilder(
      column: $state.table.amount,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get subtotalAmount => $state.composableBuilder(
      column: $state.table.subtotalAmount,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get taxAmount => $state.composableBuilder(
      column: $state.table.taxAmount,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get discountAmount => $state.composableBuilder(
      column: $state.table.discountAmount,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get tipAmount => $state.composableBuilder(
      column: $state.table.tipAmount,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get date => $state.composableBuilder(
      column: $state.table.date,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get isSubscription => $state.composableBuilder(
      column: $state.table.isSubscription,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get subscriptionId => $state.composableBuilder(
      column: $state.table.subscriptionId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get kind => $state.composableBuilder(
      column: $state.table.kind,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get origin => $state.composableBuilder(
      column: $state.table.origin,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get isRecurring => $state.composableBuilder(
      column: $state.table.isRecurring,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get extractionConfidence => $state.composableBuilder(
      column: $state.table.extractionConfidence,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get hasLineItems => $state.composableBuilder(
      column: $state.table.hasLineItems,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get originalEmailId => $state.composableBuilder(
      column: $state.table.originalEmailId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get currency => $state.composableBuilder(
      column: $state.table.currency,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get notes => $state.composableBuilder(
      column: $state.table.notes,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get userVerified => $state.composableBuilder(
      column: $state.table.userVerified,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get hasSplits => $state.composableBuilder(
      column: $state.table.hasSplits,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get isManuallyEdited => $state.composableBuilder(
      column: $state.table.isManuallyEdited,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get manualEditTimestamp => $state.composableBuilder(
      column: $state.table.manualEditTimestamp,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get updatedAt => $state.composableBuilder(
      column: $state.table.updatedAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  $CategoriesFilterComposer get categoryId {
    final $CategoriesFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.categoryId,
        referencedTable: $state.db.categories,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) => $CategoriesFilterComposer(
            ComposerState($state.db, $state.db.categories, joinBuilder,
                parentComposers)));
    return composer;
  }

  ComposableFilter splitsRefs(
      ComposableFilter Function($SplitsFilterComposer f) f) {
    final $SplitsFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.splits,
        getReferencedColumn: (t) => t.transactionId,
        builder: (joinBuilder, parentComposers) => $SplitsFilterComposer(
            ComposerState(
                $state.db, $state.db.splits, joinBuilder, parentComposers)));
    return f(composer);
  }
}

class $TransactionsOrderingComposer
    extends OrderingComposer<_$AppDatabase, Transactions> {
  $TransactionsOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get merchantName => $state.composableBuilder(
      column: $state.table.merchantName,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get rawMerchantName => $state.composableBuilder(
      column: $state.table.rawMerchantName,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get amount => $state.composableBuilder(
      column: $state.table.amount,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get subtotalAmount => $state.composableBuilder(
      column: $state.table.subtotalAmount,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get taxAmount => $state.composableBuilder(
      column: $state.table.taxAmount,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get discountAmount => $state.composableBuilder(
      column: $state.table.discountAmount,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get tipAmount => $state.composableBuilder(
      column: $state.table.tipAmount,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get date => $state.composableBuilder(
      column: $state.table.date,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get isSubscription => $state.composableBuilder(
      column: $state.table.isSubscription,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get subscriptionId => $state.composableBuilder(
      column: $state.table.subscriptionId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get kind => $state.composableBuilder(
      column: $state.table.kind,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get origin => $state.composableBuilder(
      column: $state.table.origin,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get isRecurring => $state.composableBuilder(
      column: $state.table.isRecurring,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get extractionConfidence => $state.composableBuilder(
      column: $state.table.extractionConfidence,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get hasLineItems => $state.composableBuilder(
      column: $state.table.hasLineItems,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get originalEmailId => $state.composableBuilder(
      column: $state.table.originalEmailId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get currency => $state.composableBuilder(
      column: $state.table.currency,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get notes => $state.composableBuilder(
      column: $state.table.notes,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get userVerified => $state.composableBuilder(
      column: $state.table.userVerified,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get hasSplits => $state.composableBuilder(
      column: $state.table.hasSplits,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get isManuallyEdited => $state.composableBuilder(
      column: $state.table.isManuallyEdited,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get manualEditTimestamp => $state.composableBuilder(
      column: $state.table.manualEditTimestamp,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get updatedAt => $state.composableBuilder(
      column: $state.table.updatedAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  $CategoriesOrderingComposer get categoryId {
    final $CategoriesOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.categoryId,
        referencedTable: $state.db.categories,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) => $CategoriesOrderingComposer(
            ComposerState($state.db, $state.db.categories, joinBuilder,
                parentComposers)));
    return composer;
  }
}

typedef $SubscriptionsInsertCompanionBuilder = SubscriptionsCompanion Function({
  Value<int> id,
  required String serviceName,
  required double amount,
  required DateTime nextRenewalDate,
  required int frequency,
  required int lifecycleState,
  Value<int?> categoryId,
  required DateTime firstSeenDate,
  Value<DateTime?> lastChargedDate,
  Value<String?> priceHistoryJson,
  Value<String?> cycleHistoryJson,
  Value<int> frequencyConsistency,
  required int detectionSource,
  Value<String?> anomalies,
  Value<bool> isTrial,
  Value<DateTime?> trialEndDate,
  Value<int> chargeCount,
  Value<double?> averageDaysBetweenCharges,
  Value<String> currency,
  Value<String?> notes,
  Value<bool> userConfirmed,
  Value<bool> isZombie,
  Value<String?> zombieReason,
  Value<double?> lastPriceHikePercent,
  Value<DateTime> createdAt,
  Value<DateTime?> updatedAt,
});
typedef $SubscriptionsUpdateCompanionBuilder = SubscriptionsCompanion Function({
  Value<int> id,
  Value<String> serviceName,
  Value<double> amount,
  Value<DateTime> nextRenewalDate,
  Value<int> frequency,
  Value<int> lifecycleState,
  Value<int?> categoryId,
  Value<DateTime> firstSeenDate,
  Value<DateTime?> lastChargedDate,
  Value<String?> priceHistoryJson,
  Value<String?> cycleHistoryJson,
  Value<int> frequencyConsistency,
  Value<int> detectionSource,
  Value<String?> anomalies,
  Value<bool> isTrial,
  Value<DateTime?> trialEndDate,
  Value<int> chargeCount,
  Value<double?> averageDaysBetweenCharges,
  Value<String> currency,
  Value<String?> notes,
  Value<bool> userConfirmed,
  Value<bool> isZombie,
  Value<String?> zombieReason,
  Value<double?> lastPriceHikePercent,
  Value<DateTime> createdAt,
  Value<DateTime?> updatedAt,
});

class $SubscriptionsTableManager extends RootTableManager<
    _$AppDatabase,
    Subscriptions,
    Subscription,
    $SubscriptionsFilterComposer,
    $SubscriptionsOrderingComposer,
    $SubscriptionsProcessedTableManager,
    $SubscriptionsInsertCompanionBuilder,
    $SubscriptionsUpdateCompanionBuilder> {
  $SubscriptionsTableManager(_$AppDatabase db, Subscriptions table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $SubscriptionsFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $SubscriptionsOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) => $SubscriptionsProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<String> serviceName = const Value.absent(),
            Value<double> amount = const Value.absent(),
            Value<DateTime> nextRenewalDate = const Value.absent(),
            Value<int> frequency = const Value.absent(),
            Value<int> lifecycleState = const Value.absent(),
            Value<int?> categoryId = const Value.absent(),
            Value<DateTime> firstSeenDate = const Value.absent(),
            Value<DateTime?> lastChargedDate = const Value.absent(),
            Value<String?> priceHistoryJson = const Value.absent(),
            Value<String?> cycleHistoryJson = const Value.absent(),
            Value<int> frequencyConsistency = const Value.absent(),
            Value<int> detectionSource = const Value.absent(),
            Value<String?> anomalies = const Value.absent(),
            Value<bool> isTrial = const Value.absent(),
            Value<DateTime?> trialEndDate = const Value.absent(),
            Value<int> chargeCount = const Value.absent(),
            Value<double?> averageDaysBetweenCharges = const Value.absent(),
            Value<String> currency = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<bool> userConfirmed = const Value.absent(),
            Value<bool> isZombie = const Value.absent(),
            Value<String?> zombieReason = const Value.absent(),
            Value<double?> lastPriceHikePercent = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime?> updatedAt = const Value.absent(),
          }) =>
              SubscriptionsCompanion(
            id: id,
            serviceName: serviceName,
            amount: amount,
            nextRenewalDate: nextRenewalDate,
            frequency: frequency,
            lifecycleState: lifecycleState,
            categoryId: categoryId,
            firstSeenDate: firstSeenDate,
            lastChargedDate: lastChargedDate,
            priceHistoryJson: priceHistoryJson,
            cycleHistoryJson: cycleHistoryJson,
            frequencyConsistency: frequencyConsistency,
            detectionSource: detectionSource,
            anomalies: anomalies,
            isTrial: isTrial,
            trialEndDate: trialEndDate,
            chargeCount: chargeCount,
            averageDaysBetweenCharges: averageDaysBetweenCharges,
            currency: currency,
            notes: notes,
            userConfirmed: userConfirmed,
            isZombie: isZombie,
            zombieReason: zombieReason,
            lastPriceHikePercent: lastPriceHikePercent,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            required String serviceName,
            required double amount,
            required DateTime nextRenewalDate,
            required int frequency,
            required int lifecycleState,
            Value<int?> categoryId = const Value.absent(),
            required DateTime firstSeenDate,
            Value<DateTime?> lastChargedDate = const Value.absent(),
            Value<String?> priceHistoryJson = const Value.absent(),
            Value<String?> cycleHistoryJson = const Value.absent(),
            Value<int> frequencyConsistency = const Value.absent(),
            required int detectionSource,
            Value<String?> anomalies = const Value.absent(),
            Value<bool> isTrial = const Value.absent(),
            Value<DateTime?> trialEndDate = const Value.absent(),
            Value<int> chargeCount = const Value.absent(),
            Value<double?> averageDaysBetweenCharges = const Value.absent(),
            Value<String> currency = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<bool> userConfirmed = const Value.absent(),
            Value<bool> isZombie = const Value.absent(),
            Value<String?> zombieReason = const Value.absent(),
            Value<double?> lastPriceHikePercent = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime?> updatedAt = const Value.absent(),
          }) =>
              SubscriptionsCompanion.insert(
            id: id,
            serviceName: serviceName,
            amount: amount,
            nextRenewalDate: nextRenewalDate,
            frequency: frequency,
            lifecycleState: lifecycleState,
            categoryId: categoryId,
            firstSeenDate: firstSeenDate,
            lastChargedDate: lastChargedDate,
            priceHistoryJson: priceHistoryJson,
            cycleHistoryJson: cycleHistoryJson,
            frequencyConsistency: frequencyConsistency,
            detectionSource: detectionSource,
            anomalies: anomalies,
            isTrial: isTrial,
            trialEndDate: trialEndDate,
            chargeCount: chargeCount,
            averageDaysBetweenCharges: averageDaysBetweenCharges,
            currency: currency,
            notes: notes,
            userConfirmed: userConfirmed,
            isZombie: isZombie,
            zombieReason: zombieReason,
            lastPriceHikePercent: lastPriceHikePercent,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
        ));
}

class $SubscriptionsProcessedTableManager extends ProcessedTableManager<
    _$AppDatabase,
    Subscriptions,
    Subscription,
    $SubscriptionsFilterComposer,
    $SubscriptionsOrderingComposer,
    $SubscriptionsProcessedTableManager,
    $SubscriptionsInsertCompanionBuilder,
    $SubscriptionsUpdateCompanionBuilder> {
  $SubscriptionsProcessedTableManager(super.$state);
}

class $SubscriptionsFilterComposer
    extends FilterComposer<_$AppDatabase, Subscriptions> {
  $SubscriptionsFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get serviceName => $state.composableBuilder(
      column: $state.table.serviceName,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get amount => $state.composableBuilder(
      column: $state.table.amount,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get nextRenewalDate => $state.composableBuilder(
      column: $state.table.nextRenewalDate,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get frequency => $state.composableBuilder(
      column: $state.table.frequency,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get lifecycleState => $state.composableBuilder(
      column: $state.table.lifecycleState,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get firstSeenDate => $state.composableBuilder(
      column: $state.table.firstSeenDate,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get lastChargedDate => $state.composableBuilder(
      column: $state.table.lastChargedDate,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get priceHistoryJson => $state.composableBuilder(
      column: $state.table.priceHistoryJson,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get cycleHistoryJson => $state.composableBuilder(
      column: $state.table.cycleHistoryJson,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get frequencyConsistency => $state.composableBuilder(
      column: $state.table.frequencyConsistency,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get detectionSource => $state.composableBuilder(
      column: $state.table.detectionSource,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get anomalies => $state.composableBuilder(
      column: $state.table.anomalies,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get isTrial => $state.composableBuilder(
      column: $state.table.isTrial,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get trialEndDate => $state.composableBuilder(
      column: $state.table.trialEndDate,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get chargeCount => $state.composableBuilder(
      column: $state.table.chargeCount,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get averageDaysBetweenCharges =>
      $state.composableBuilder(
          column: $state.table.averageDaysBetweenCharges,
          builder: (column, joinBuilders) =>
              ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get currency => $state.composableBuilder(
      column: $state.table.currency,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get notes => $state.composableBuilder(
      column: $state.table.notes,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get userConfirmed => $state.composableBuilder(
      column: $state.table.userConfirmed,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get isZombie => $state.composableBuilder(
      column: $state.table.isZombie,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get zombieReason => $state.composableBuilder(
      column: $state.table.zombieReason,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get lastPriceHikePercent => $state.composableBuilder(
      column: $state.table.lastPriceHikePercent,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get updatedAt => $state.composableBuilder(
      column: $state.table.updatedAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  $CategoriesFilterComposer get categoryId {
    final $CategoriesFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.categoryId,
        referencedTable: $state.db.categories,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) => $CategoriesFilterComposer(
            ComposerState($state.db, $state.db.categories, joinBuilder,
                parentComposers)));
    return composer;
  }
}

class $SubscriptionsOrderingComposer
    extends OrderingComposer<_$AppDatabase, Subscriptions> {
  $SubscriptionsOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get serviceName => $state.composableBuilder(
      column: $state.table.serviceName,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get amount => $state.composableBuilder(
      column: $state.table.amount,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get nextRenewalDate => $state.composableBuilder(
      column: $state.table.nextRenewalDate,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get frequency => $state.composableBuilder(
      column: $state.table.frequency,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get lifecycleState => $state.composableBuilder(
      column: $state.table.lifecycleState,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get firstSeenDate => $state.composableBuilder(
      column: $state.table.firstSeenDate,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get lastChargedDate => $state.composableBuilder(
      column: $state.table.lastChargedDate,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get priceHistoryJson => $state.composableBuilder(
      column: $state.table.priceHistoryJson,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get cycleHistoryJson => $state.composableBuilder(
      column: $state.table.cycleHistoryJson,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get frequencyConsistency => $state.composableBuilder(
      column: $state.table.frequencyConsistency,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get detectionSource => $state.composableBuilder(
      column: $state.table.detectionSource,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get anomalies => $state.composableBuilder(
      column: $state.table.anomalies,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get isTrial => $state.composableBuilder(
      column: $state.table.isTrial,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get trialEndDate => $state.composableBuilder(
      column: $state.table.trialEndDate,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get chargeCount => $state.composableBuilder(
      column: $state.table.chargeCount,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get averageDaysBetweenCharges => $state
      .composableBuilder(
          column: $state.table.averageDaysBetweenCharges,
          builder: (column, joinBuilders) =>
              ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get currency => $state.composableBuilder(
      column: $state.table.currency,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get notes => $state.composableBuilder(
      column: $state.table.notes,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get userConfirmed => $state.composableBuilder(
      column: $state.table.userConfirmed,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get isZombie => $state.composableBuilder(
      column: $state.table.isZombie,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get zombieReason => $state.composableBuilder(
      column: $state.table.zombieReason,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get lastPriceHikePercent => $state.composableBuilder(
      column: $state.table.lastPriceHikePercent,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get updatedAt => $state.composableBuilder(
      column: $state.table.updatedAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  $CategoriesOrderingComposer get categoryId {
    final $CategoriesOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.categoryId,
        referencedTable: $state.db.categories,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) => $CategoriesOrderingComposer(
            ComposerState($state.db, $state.db.categories, joinBuilder,
                parentComposers)));
    return composer;
  }
}

typedef $MappingsInsertCompanionBuilder = MappingsCompanion Function({
  Value<int> id,
  required String merchantName,
  required int categoryId,
  Value<bool> isAutomatic,
  Value<int> confidence,
  Value<bool> userConfirmed,
  Value<DateTime> createdAt,
  Value<DateTime?> updatedAt,
});
typedef $MappingsUpdateCompanionBuilder = MappingsCompanion Function({
  Value<int> id,
  Value<String> merchantName,
  Value<int> categoryId,
  Value<bool> isAutomatic,
  Value<int> confidence,
  Value<bool> userConfirmed,
  Value<DateTime> createdAt,
  Value<DateTime?> updatedAt,
});

class $MappingsTableManager extends RootTableManager<
    _$AppDatabase,
    Mappings,
    Mapping,
    $MappingsFilterComposer,
    $MappingsOrderingComposer,
    $MappingsProcessedTableManager,
    $MappingsInsertCompanionBuilder,
    $MappingsUpdateCompanionBuilder> {
  $MappingsTableManager(_$AppDatabase db, Mappings table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer: $MappingsFilterComposer(ComposerState(db, table)),
          orderingComposer: $MappingsOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) => $MappingsProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<String> merchantName = const Value.absent(),
            Value<int> categoryId = const Value.absent(),
            Value<bool> isAutomatic = const Value.absent(),
            Value<int> confidence = const Value.absent(),
            Value<bool> userConfirmed = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime?> updatedAt = const Value.absent(),
          }) =>
              MappingsCompanion(
            id: id,
            merchantName: merchantName,
            categoryId: categoryId,
            isAutomatic: isAutomatic,
            confidence: confidence,
            userConfirmed: userConfirmed,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            required String merchantName,
            required int categoryId,
            Value<bool> isAutomatic = const Value.absent(),
            Value<int> confidence = const Value.absent(),
            Value<bool> userConfirmed = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime?> updatedAt = const Value.absent(),
          }) =>
              MappingsCompanion.insert(
            id: id,
            merchantName: merchantName,
            categoryId: categoryId,
            isAutomatic: isAutomatic,
            confidence: confidence,
            userConfirmed: userConfirmed,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
        ));
}

class $MappingsProcessedTableManager extends ProcessedTableManager<
    _$AppDatabase,
    Mappings,
    Mapping,
    $MappingsFilterComposer,
    $MappingsOrderingComposer,
    $MappingsProcessedTableManager,
    $MappingsInsertCompanionBuilder,
    $MappingsUpdateCompanionBuilder> {
  $MappingsProcessedTableManager(super.$state);
}

class $MappingsFilterComposer extends FilterComposer<_$AppDatabase, Mappings> {
  $MappingsFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get merchantName => $state.composableBuilder(
      column: $state.table.merchantName,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get isAutomatic => $state.composableBuilder(
      column: $state.table.isAutomatic,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get confidence => $state.composableBuilder(
      column: $state.table.confidence,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get userConfirmed => $state.composableBuilder(
      column: $state.table.userConfirmed,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get updatedAt => $state.composableBuilder(
      column: $state.table.updatedAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  $CategoriesFilterComposer get categoryId {
    final $CategoriesFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.categoryId,
        referencedTable: $state.db.categories,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) => $CategoriesFilterComposer(
            ComposerState($state.db, $state.db.categories, joinBuilder,
                parentComposers)));
    return composer;
  }
}

class $MappingsOrderingComposer
    extends OrderingComposer<_$AppDatabase, Mappings> {
  $MappingsOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get merchantName => $state.composableBuilder(
      column: $state.table.merchantName,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get isAutomatic => $state.composableBuilder(
      column: $state.table.isAutomatic,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get confidence => $state.composableBuilder(
      column: $state.table.confidence,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get userConfirmed => $state.composableBuilder(
      column: $state.table.userConfirmed,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get updatedAt => $state.composableBuilder(
      column: $state.table.updatedAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  $CategoriesOrderingComposer get categoryId {
    final $CategoriesOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.categoryId,
        referencedTable: $state.db.categories,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) => $CategoriesOrderingComposer(
            ComposerState($state.db, $state.db.categories, joinBuilder,
                parentComposers)));
    return composer;
  }
}

typedef $BudgetsInsertCompanionBuilder = BudgetsCompanion Function({
  Value<int> id,
  Value<int?> categoryId,
  required double limitAmount,
  Value<int> period,
  Value<bool> rollover,
  Value<double> carryOverAmount,
  Value<DateTime> createdAt,
  Value<DateTime?> updatedAt,
});
typedef $BudgetsUpdateCompanionBuilder = BudgetsCompanion Function({
  Value<int> id,
  Value<int?> categoryId,
  Value<double> limitAmount,
  Value<int> period,
  Value<bool> rollover,
  Value<double> carryOverAmount,
  Value<DateTime> createdAt,
  Value<DateTime?> updatedAt,
});

class $BudgetsTableManager extends RootTableManager<
    _$AppDatabase,
    Budgets,
    Budget,
    $BudgetsFilterComposer,
    $BudgetsOrderingComposer,
    $BudgetsProcessedTableManager,
    $BudgetsInsertCompanionBuilder,
    $BudgetsUpdateCompanionBuilder> {
  $BudgetsTableManager(_$AppDatabase db, Budgets table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer: $BudgetsFilterComposer(ComposerState(db, table)),
          orderingComposer: $BudgetsOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) => $BudgetsProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<int?> categoryId = const Value.absent(),
            Value<double> limitAmount = const Value.absent(),
            Value<int> period = const Value.absent(),
            Value<bool> rollover = const Value.absent(),
            Value<double> carryOverAmount = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime?> updatedAt = const Value.absent(),
          }) =>
              BudgetsCompanion(
            id: id,
            categoryId: categoryId,
            limitAmount: limitAmount,
            period: period,
            rollover: rollover,
            carryOverAmount: carryOverAmount,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<int?> categoryId = const Value.absent(),
            required double limitAmount,
            Value<int> period = const Value.absent(),
            Value<bool> rollover = const Value.absent(),
            Value<double> carryOverAmount = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime?> updatedAt = const Value.absent(),
          }) =>
              BudgetsCompanion.insert(
            id: id,
            categoryId: categoryId,
            limitAmount: limitAmount,
            period: period,
            rollover: rollover,
            carryOverAmount: carryOverAmount,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
        ));
}

class $BudgetsProcessedTableManager extends ProcessedTableManager<
    _$AppDatabase,
    Budgets,
    Budget,
    $BudgetsFilterComposer,
    $BudgetsOrderingComposer,
    $BudgetsProcessedTableManager,
    $BudgetsInsertCompanionBuilder,
    $BudgetsUpdateCompanionBuilder> {
  $BudgetsProcessedTableManager(super.$state);
}

class $BudgetsFilterComposer extends FilterComposer<_$AppDatabase, Budgets> {
  $BudgetsFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get limitAmount => $state.composableBuilder(
      column: $state.table.limitAmount,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get period => $state.composableBuilder(
      column: $state.table.period,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get rollover => $state.composableBuilder(
      column: $state.table.rollover,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get carryOverAmount => $state.composableBuilder(
      column: $state.table.carryOverAmount,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get updatedAt => $state.composableBuilder(
      column: $state.table.updatedAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  $CategoriesFilterComposer get categoryId {
    final $CategoriesFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.categoryId,
        referencedTable: $state.db.categories,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) => $CategoriesFilterComposer(
            ComposerState($state.db, $state.db.categories, joinBuilder,
                parentComposers)));
    return composer;
  }
}

class $BudgetsOrderingComposer
    extends OrderingComposer<_$AppDatabase, Budgets> {
  $BudgetsOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get limitAmount => $state.composableBuilder(
      column: $state.table.limitAmount,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get period => $state.composableBuilder(
      column: $state.table.period,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get rollover => $state.composableBuilder(
      column: $state.table.rollover,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get carryOverAmount => $state.composableBuilder(
      column: $state.table.carryOverAmount,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get updatedAt => $state.composableBuilder(
      column: $state.table.updatedAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  $CategoriesOrderingComposer get categoryId {
    final $CategoriesOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.categoryId,
        referencedTable: $state.db.categories,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) => $CategoriesOrderingComposer(
            ComposerState($state.db, $state.db.categories, joinBuilder,
                parentComposers)));
    return composer;
  }
}

typedef $SplitsInsertCompanionBuilder = SplitsCompanion Function({
  Value<int> id,
  required int transactionId,
  required int categoryId,
  required double amount,
  Value<String?> notes,
  Value<DateTime> createdAt,
});
typedef $SplitsUpdateCompanionBuilder = SplitsCompanion Function({
  Value<int> id,
  Value<int> transactionId,
  Value<int> categoryId,
  Value<double> amount,
  Value<String?> notes,
  Value<DateTime> createdAt,
});

class $SplitsTableManager extends RootTableManager<
    _$AppDatabase,
    Splits,
    Split,
    $SplitsFilterComposer,
    $SplitsOrderingComposer,
    $SplitsProcessedTableManager,
    $SplitsInsertCompanionBuilder,
    $SplitsUpdateCompanionBuilder> {
  $SplitsTableManager(_$AppDatabase db, Splits table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer: $SplitsFilterComposer(ComposerState(db, table)),
          orderingComposer: $SplitsOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) => $SplitsProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<int> transactionId = const Value.absent(),
            Value<int> categoryId = const Value.absent(),
            Value<double> amount = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              SplitsCompanion(
            id: id,
            transactionId: transactionId,
            categoryId: categoryId,
            amount: amount,
            notes: notes,
            createdAt: createdAt,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            required int transactionId,
            required int categoryId,
            required double amount,
            Value<String?> notes = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              SplitsCompanion.insert(
            id: id,
            transactionId: transactionId,
            categoryId: categoryId,
            amount: amount,
            notes: notes,
            createdAt: createdAt,
          ),
        ));
}

class $SplitsProcessedTableManager extends ProcessedTableManager<
    _$AppDatabase,
    Splits,
    Split,
    $SplitsFilterComposer,
    $SplitsOrderingComposer,
    $SplitsProcessedTableManager,
    $SplitsInsertCompanionBuilder,
    $SplitsUpdateCompanionBuilder> {
  $SplitsProcessedTableManager(super.$state);
}

class $SplitsFilterComposer extends FilterComposer<_$AppDatabase, Splits> {
  $SplitsFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get amount => $state.composableBuilder(
      column: $state.table.amount,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get notes => $state.composableBuilder(
      column: $state.table.notes,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  $TransactionsFilterComposer get transactionId {
    final $TransactionsFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.transactionId,
        referencedTable: $state.db.transactions,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) => $TransactionsFilterComposer(
            ComposerState($state.db, $state.db.transactions, joinBuilder,
                parentComposers)));
    return composer;
  }

  $CategoriesFilterComposer get categoryId {
    final $CategoriesFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.categoryId,
        referencedTable: $state.db.categories,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) => $CategoriesFilterComposer(
            ComposerState($state.db, $state.db.categories, joinBuilder,
                parentComposers)));
    return composer;
  }
}

class $SplitsOrderingComposer extends OrderingComposer<_$AppDatabase, Splits> {
  $SplitsOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get amount => $state.composableBuilder(
      column: $state.table.amount,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get notes => $state.composableBuilder(
      column: $state.table.notes,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  $TransactionsOrderingComposer get transactionId {
    final $TransactionsOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.transactionId,
        referencedTable: $state.db.transactions,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $TransactionsOrderingComposer(ComposerState($state.db,
                $state.db.transactions, joinBuilder, parentComposers)));
    return composer;
  }

  $CategoriesOrderingComposer get categoryId {
    final $CategoriesOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.categoryId,
        referencedTable: $state.db.categories,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) => $CategoriesOrderingComposer(
            ComposerState($state.db, $state.db.categories, joinBuilder,
                parentComposers)));
    return composer;
  }
}

class _$AppDatabaseManager {
  final _$AppDatabase _db;
  _$AppDatabaseManager(this._db);
  $CategoriesTableManager get categories =>
      $CategoriesTableManager(_db, _db.categories);
  $ReceiptsTableManager get receipts =>
      $ReceiptsTableManager(_db, _db.receipts);
  $TransactionsTableManager get transactions =>
      $TransactionsTableManager(_db, _db.transactions);
  $SubscriptionsTableManager get subscriptions =>
      $SubscriptionsTableManager(_db, _db.subscriptions);
  $MappingsTableManager get mappings =>
      $MappingsTableManager(_db, _db.mappings);
  $BudgetsTableManager get budgets => $BudgetsTableManager(_db, _db.budgets);
  $SplitsTableManager get splits => $SplitsTableManager(_db, _db.splits);
}
