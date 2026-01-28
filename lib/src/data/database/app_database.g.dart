// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $CategoriesTable extends Categories with TableInfo<$CategoriesTable, Category>{
@override final GeneratedDatabase attachedDatabase;
final String? _alias;
$CategoriesTable(this.attachedDatabase, [this._alias]);
static const VerificationMeta _idMeta = const VerificationMeta('id');
@override
late final GeneratedColumn<int> id = GeneratedColumn<int>('id', aliasedName, false, hasAutoIncrement: true, type: DriftSqlType.int, requiredDuringInsert: false, defaultConstraints: GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
static const VerificationMeta _nameMeta = const VerificationMeta('name');
@override
late final GeneratedColumn<String> name = GeneratedColumn<String>('name', aliasedName, false, additionalChecks: GeneratedColumn.checkTextLength(minTextLength: 1,maxTextLength: 100), type: DriftSqlType.string, requiredDuringInsert: true);
static const VerificationMeta _parentCategoryIdMeta = const VerificationMeta('parentCategoryId');
@override
late final GeneratedColumn<int> parentCategoryId = GeneratedColumn<int>('parent_category_id', aliasedName, true, type: DriftSqlType.int, requiredDuringInsert: false);
static const VerificationMeta _iconMeta = const VerificationMeta('icon');
@override
late final GeneratedColumn<String> icon = GeneratedColumn<String>('icon', aliasedName, false, type: DriftSqlType.string, requiredDuringInsert: true);
static const VerificationMeta _colorMeta = const VerificationMeta('color');
@override
late final GeneratedColumn<String> color = GeneratedColumn<String>('color', aliasedName, false, type: DriftSqlType.string, requiredDuringInsert: true);
static const VerificationMeta _colorValueMeta = const VerificationMeta('colorValue');
@override
late final GeneratedColumn<int> colorValue = GeneratedColumn<int>('color_value', aliasedName, true, type: DriftSqlType.int, requiredDuringInsert: false);
static const VerificationMeta _isSystemMeta = const VerificationMeta('isSystem');
@override
late final GeneratedColumn<bool> isSystem = GeneratedColumn<bool>('is_system', aliasedName, false, type: DriftSqlType.bool, requiredDuringInsert: false, defaultConstraints: GeneratedColumn.constraintIsAlways('CHECK ("is_system" IN (0, 1))'), defaultValue: const Constant(false));
static const VerificationMeta _displayOrderMeta = const VerificationMeta('displayOrder');
@override
late final GeneratedColumn<int> displayOrder = GeneratedColumn<int>('display_order', aliasedName, false, type: DriftSqlType.int, requiredDuringInsert: false, defaultValue: const Constant(0));
static const VerificationMeta _isActiveMeta = const VerificationMeta('isActive');
@override
late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>('is_active', aliasedName, false, type: DriftSqlType.bool, requiredDuringInsert: false, defaultConstraints: GeneratedColumn.constraintIsAlways('CHECK ("is_active" IN (0, 1))'), defaultValue: const Constant(true));
static const VerificationMeta _transactionCountMeta = const VerificationMeta('transactionCount');
@override
late final GeneratedColumn<int> transactionCount = GeneratedColumn<int>('transaction_count', aliasedName, false, type: DriftSqlType.int, requiredDuringInsert: false, defaultValue: const Constant(0));
static const VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
@override
late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>('created_at', aliasedName, false, type: DriftSqlType.dateTime, requiredDuringInsert: false, defaultValue: currentDateAndTime);
static const VerificationMeta _updatedAtMeta = const VerificationMeta('updatedAt');
@override
late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>('updated_at', aliasedName, true, type: DriftSqlType.dateTime, requiredDuringInsert: false);
@override
List<GeneratedColumn> get $columns => [id, name, parentCategoryId, icon, color, colorValue, isSystem, displayOrder, isActive, transactionCount, createdAt, updatedAt];
@override
String get aliasedName => _alias ?? actualTableName;
@override
 String get actualTableName => $name;
static const String $name = 'categories';
@override
VerificationContext validateIntegrity(Insertable<Category> instance, {bool isInserting = false}) {
final context = VerificationContext();
final data = instance.toColumns(true);
if (data.containsKey('id')) {
context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));}if (data.containsKey('name')) {
context.handle(_nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));} else if (isInserting) {
context.missing(_nameMeta);
}
if (data.containsKey('parent_category_id')) {
context.handle(_parentCategoryIdMeta, parentCategoryId.isAcceptableOrUnknown(data['parent_category_id']!, _parentCategoryIdMeta));}if (data.containsKey('icon')) {
context.handle(_iconMeta, icon.isAcceptableOrUnknown(data['icon']!, _iconMeta));} else if (isInserting) {
context.missing(_iconMeta);
}
if (data.containsKey('color')) {
context.handle(_colorMeta, color.isAcceptableOrUnknown(data['color']!, _colorMeta));} else if (isInserting) {
context.missing(_colorMeta);
}
if (data.containsKey('color_value')) {
context.handle(_colorValueMeta, colorValue.isAcceptableOrUnknown(data['color_value']!, _colorValueMeta));}if (data.containsKey('is_system')) {
context.handle(_isSystemMeta, isSystem.isAcceptableOrUnknown(data['is_system']!, _isSystemMeta));}if (data.containsKey('display_order')) {
context.handle(_displayOrderMeta, displayOrder.isAcceptableOrUnknown(data['display_order']!, _displayOrderMeta));}if (data.containsKey('is_active')) {
context.handle(_isActiveMeta, isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta));}if (data.containsKey('transaction_count')) {
context.handle(_transactionCountMeta, transactionCount.isAcceptableOrUnknown(data['transaction_count']!, _transactionCountMeta));}if (data.containsKey('created_at')) {
context.handle(_createdAtMeta, createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));}if (data.containsKey('updated_at')) {
context.handle(_updatedAtMeta, updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));}return context;
}
@override
Set<GeneratedColumn> get $primaryKey => {id};
@override Category map(Map<String, dynamic> data, {String? tablePrefix})  {
final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';return Category(id: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}id'])!, name: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}name'])!, parentCategoryId: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}parent_category_id']), icon: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}icon'])!, color: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}color'])!, colorValue: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}color_value']), isSystem: attachedDatabase.typeMapping.read(DriftSqlType.bool, data['${effectivePrefix}is_system'])!, displayOrder: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}display_order'])!, isActive: attachedDatabase.typeMapping.read(DriftSqlType.bool, data['${effectivePrefix}is_active'])!, transactionCount: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}transaction_count'])!, createdAt: attachedDatabase.typeMapping.read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!, updatedAt: attachedDatabase.typeMapping.read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at']), );
}
@override
$CategoriesTable createAlias(String alias) {
return $CategoriesTable(attachedDatabase, alias);}}class Category extends DataClass implements Insertable<Category> 
{
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
const Category({required this.id, required this.name, this.parentCategoryId, required this.icon, required this.color, this.colorValue, required this.isSystem, required this.displayOrder, required this.isActive, required this.transactionCount, required this.createdAt, this.updatedAt});@override
Map<String, Expression> toColumns(bool nullToAbsent) {
final map = <String, Expression> {};map['id'] = Variable<int>(id);
map['name'] = Variable<String>(name);
if (!nullToAbsent || parentCategoryId != null){map['parent_category_id'] = Variable<int>(parentCategoryId);
}map['icon'] = Variable<String>(icon);
map['color'] = Variable<String>(color);
if (!nullToAbsent || colorValue != null){map['color_value'] = Variable<int>(colorValue);
}map['is_system'] = Variable<bool>(isSystem);
map['display_order'] = Variable<int>(displayOrder);
map['is_active'] = Variable<bool>(isActive);
map['transaction_count'] = Variable<int>(transactionCount);
map['created_at'] = Variable<DateTime>(createdAt);
if (!nullToAbsent || updatedAt != null){map['updated_at'] = Variable<DateTime>(updatedAt);
}return map; 
}
CategoriesCompanion toCompanion(bool nullToAbsent) {
return CategoriesCompanion(id: Value(id),name: Value(name),parentCategoryId: parentCategoryId == null && nullToAbsent ? const Value.absent() : Value(parentCategoryId),icon: Value(icon),color: Value(color),colorValue: colorValue == null && nullToAbsent ? const Value.absent() : Value(colorValue),isSystem: Value(isSystem),displayOrder: Value(displayOrder),isActive: Value(isActive),transactionCount: Value(transactionCount),createdAt: Value(createdAt),updatedAt: updatedAt == null && nullToAbsent ? const Value.absent() : Value(updatedAt),);
}
factory Category.fromJson(Map<String, dynamic> json, {ValueSerializer? serializer}) {
serializer ??= driftRuntimeOptions.defaultSerializer;
return Category(id: serializer.fromJson<int>(json['id']),name: serializer.fromJson<String>(json['name']),parentCategoryId: serializer.fromJson<int?>(json['parentCategoryId']),icon: serializer.fromJson<String>(json['icon']),color: serializer.fromJson<String>(json['color']),colorValue: serializer.fromJson<int?>(json['colorValue']),isSystem: serializer.fromJson<bool>(json['isSystem']),displayOrder: serializer.fromJson<int>(json['displayOrder']),isActive: serializer.fromJson<bool>(json['isActive']),transactionCount: serializer.fromJson<int>(json['transactionCount']),createdAt: serializer.fromJson<DateTime>(json['createdAt']),updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),);}
@override Map<String, dynamic> toJson({ValueSerializer? serializer}) {
serializer ??= driftRuntimeOptions.defaultSerializer;
return <String, dynamic>{
'id': serializer.toJson<int>(id),'name': serializer.toJson<String>(name),'parentCategoryId': serializer.toJson<int?>(parentCategoryId),'icon': serializer.toJson<String>(icon),'color': serializer.toJson<String>(color),'colorValue': serializer.toJson<int?>(colorValue),'isSystem': serializer.toJson<bool>(isSystem),'displayOrder': serializer.toJson<int>(displayOrder),'isActive': serializer.toJson<bool>(isActive),'transactionCount': serializer.toJson<int>(transactionCount),'createdAt': serializer.toJson<DateTime>(createdAt),'updatedAt': serializer.toJson<DateTime?>(updatedAt),};}Category copyWith({int? id,String? name,Value<int?> parentCategoryId = const Value.absent(),String? icon,String? color,Value<int?> colorValue = const Value.absent(),bool? isSystem,int? displayOrder,bool? isActive,int? transactionCount,DateTime? createdAt,Value<DateTime?> updatedAt = const Value.absent()}) => Category(id: id ?? this.id,name: name ?? this.name,parentCategoryId: parentCategoryId.present ? parentCategoryId.value : this.parentCategoryId,icon: icon ?? this.icon,color: color ?? this.color,colorValue: colorValue.present ? colorValue.value : this.colorValue,isSystem: isSystem ?? this.isSystem,displayOrder: displayOrder ?? this.displayOrder,isActive: isActive ?? this.isActive,transactionCount: transactionCount ?? this.transactionCount,createdAt: createdAt ?? this.createdAt,updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,);Category copyWithCompanion(CategoriesCompanion data) {
return Category(
id: data.id.present ? data.id.value : this.id,name: data.name.present ? data.name.value : this.name,parentCategoryId: data.parentCategoryId.present ? data.parentCategoryId.value : this.parentCategoryId,icon: data.icon.present ? data.icon.value : this.icon,color: data.color.present ? data.color.value : this.color,colorValue: data.colorValue.present ? data.colorValue.value : this.colorValue,isSystem: data.isSystem.present ? data.isSystem.value : this.isSystem,displayOrder: data.displayOrder.present ? data.displayOrder.value : this.displayOrder,isActive: data.isActive.present ? data.isActive.value : this.isActive,transactionCount: data.transactionCount.present ? data.transactionCount.value : this.transactionCount,createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,);
}
@override
String toString() {return (StringBuffer('Category(')..write('id: $id, ')..write('name: $name, ')..write('parentCategoryId: $parentCategoryId, ')..write('icon: $icon, ')..write('color: $color, ')..write('colorValue: $colorValue, ')..write('isSystem: $isSystem, ')..write('displayOrder: $displayOrder, ')..write('isActive: $isActive, ')..write('transactionCount: $transactionCount, ')..write('createdAt: $createdAt, ')..write('updatedAt: $updatedAt')..write(')')).toString();}
@override
 int get hashCode => Object.hash(id, name, parentCategoryId, icon, color, colorValue, isSystem, displayOrder, isActive, transactionCount, createdAt, updatedAt);@override
bool operator ==(Object other) => identical(this, other) || (other is Category && other.id == this.id && other.name == this.name && other.parentCategoryId == this.parentCategoryId && other.icon == this.icon && other.color == this.color && other.colorValue == this.colorValue && other.isSystem == this.isSystem && other.displayOrder == this.displayOrder && other.isActive == this.isActive && other.transactionCount == this.transactionCount && other.createdAt == this.createdAt && other.updatedAt == this.updatedAt);
}class CategoriesCompanion extends UpdateCompanion<Category> {
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
const CategoriesCompanion({this.id = const Value.absent(),this.name = const Value.absent(),this.parentCategoryId = const Value.absent(),this.icon = const Value.absent(),this.color = const Value.absent(),this.colorValue = const Value.absent(),this.isSystem = const Value.absent(),this.displayOrder = const Value.absent(),this.isActive = const Value.absent(),this.transactionCount = const Value.absent(),this.createdAt = const Value.absent(),this.updatedAt = const Value.absent(),});
CategoriesCompanion.insert({this.id = const Value.absent(),required String name,this.parentCategoryId = const Value.absent(),required String icon,required String color,this.colorValue = const Value.absent(),this.isSystem = const Value.absent(),this.displayOrder = const Value.absent(),this.isActive = const Value.absent(),this.transactionCount = const Value.absent(),this.createdAt = const Value.absent(),this.updatedAt = const Value.absent(),}): name = Value(name), icon = Value(icon), color = Value(color);
static Insertable<Category> custom({Expression<int>? id, 
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
return RawValuesInsertable({if (id != null)'id': id,if (name != null)'name': name,if (parentCategoryId != null)'parent_category_id': parentCategoryId,if (icon != null)'icon': icon,if (color != null)'color': color,if (colorValue != null)'color_value': colorValue,if (isSystem != null)'is_system': isSystem,if (displayOrder != null)'display_order': displayOrder,if (isActive != null)'is_active': isActive,if (transactionCount != null)'transaction_count': transactionCount,if (createdAt != null)'created_at': createdAt,if (updatedAt != null)'updated_at': updatedAt,});
}CategoriesCompanion copyWith({Value<int>? id, Value<String>? name, Value<int?>? parentCategoryId, Value<String>? icon, Value<String>? color, Value<int?>? colorValue, Value<bool>? isSystem, Value<int>? displayOrder, Value<bool>? isActive, Value<int>? transactionCount, Value<DateTime>? createdAt, Value<DateTime?>? updatedAt}) {
return CategoriesCompanion(id: id ?? this.id,name: name ?? this.name,parentCategoryId: parentCategoryId ?? this.parentCategoryId,icon: icon ?? this.icon,color: color ?? this.color,colorValue: colorValue ?? this.colorValue,isSystem: isSystem ?? this.isSystem,displayOrder: displayOrder ?? this.displayOrder,isActive: isActive ?? this.isActive,transactionCount: transactionCount ?? this.transactionCount,createdAt: createdAt ?? this.createdAt,updatedAt: updatedAt ?? this.updatedAt,);
}
@override
Map<String, Expression> toColumns(bool nullToAbsent) {
final map = <String, Expression> {};if (id.present) {
map['id'] = Variable<int>(id.value);}
if (name.present) {
map['name'] = Variable<String>(name.value);}
if (parentCategoryId.present) {
map['parent_category_id'] = Variable<int>(parentCategoryId.value);}
if (icon.present) {
map['icon'] = Variable<String>(icon.value);}
if (color.present) {
map['color'] = Variable<String>(color.value);}
if (colorValue.present) {
map['color_value'] = Variable<int>(colorValue.value);}
if (isSystem.present) {
map['is_system'] = Variable<bool>(isSystem.value);}
if (displayOrder.present) {
map['display_order'] = Variable<int>(displayOrder.value);}
if (isActive.present) {
map['is_active'] = Variable<bool>(isActive.value);}
if (transactionCount.present) {
map['transaction_count'] = Variable<int>(transactionCount.value);}
if (createdAt.present) {
map['created_at'] = Variable<DateTime>(createdAt.value);}
if (updatedAt.present) {
map['updated_at'] = Variable<DateTime>(updatedAt.value);}
return map; 
}
@override
String toString() {return (StringBuffer('CategoriesCompanion(')..write('id: $id, ')..write('name: $name, ')..write('parentCategoryId: $parentCategoryId, ')..write('icon: $icon, ')..write('color: $color, ')..write('colorValue: $colorValue, ')..write('isSystem: $isSystem, ')..write('displayOrder: $displayOrder, ')..write('isActive: $isActive, ')..write('transactionCount: $transactionCount, ')..write('createdAt: $createdAt, ')..write('updatedAt: $updatedAt')..write(')')).toString();}
}
class $TransactionsTable extends Transactions with TableInfo<$TransactionsTable, Transaction>{
@override final GeneratedDatabase attachedDatabase;
final String? _alias;
$TransactionsTable(this.attachedDatabase, [this._alias]);
static const VerificationMeta _idMeta = const VerificationMeta('id');
@override
late final GeneratedColumn<int> id = GeneratedColumn<int>('id', aliasedName, false, hasAutoIncrement: true, type: DriftSqlType.int, requiredDuringInsert: false, defaultConstraints: GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
static const VerificationMeta _merchantNameMeta = const VerificationMeta('merchantName');
@override
late final GeneratedColumn<String> merchantName = GeneratedColumn<String>('merchant_name', aliasedName, false, type: DriftSqlType.string, requiredDuringInsert: true);
static const VerificationMeta _rawMerchantNameMeta = const VerificationMeta('rawMerchantName');
@override
late final GeneratedColumn<String> rawMerchantName = GeneratedColumn<String>('raw_merchant_name', aliasedName, true, type: DriftSqlType.string, requiredDuringInsert: false);
static const VerificationMeta _amountMeta = const VerificationMeta('amount');
@override
late final GeneratedColumn<double> amount = GeneratedColumn<double>('amount', aliasedName, false, type: DriftSqlType.double, requiredDuringInsert: true);
static const VerificationMeta _subtotalAmountMeta = const VerificationMeta('subtotalAmount');
@override
late final GeneratedColumn<double> subtotalAmount = GeneratedColumn<double>('subtotal_amount', aliasedName, true, type: DriftSqlType.double, requiredDuringInsert: false);
static const VerificationMeta _taxAmountMeta = const VerificationMeta('taxAmount');
@override
late final GeneratedColumn<double> taxAmount = GeneratedColumn<double>('tax_amount', aliasedName, true, type: DriftSqlType.double, requiredDuringInsert: false);
static const VerificationMeta _discountAmountMeta = const VerificationMeta('discountAmount');
@override
late final GeneratedColumn<double> discountAmount = GeneratedColumn<double>('discount_amount', aliasedName, true, type: DriftSqlType.double, requiredDuringInsert: false);
static const VerificationMeta _tipAmountMeta = const VerificationMeta('tipAmount');
@override
late final GeneratedColumn<double> tipAmount = GeneratedColumn<double>('tip_amount', aliasedName, true, type: DriftSqlType.double, requiredDuringInsert: false);
static const VerificationMeta _dateMeta = const VerificationMeta('date');
@override
late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>('date', aliasedName, false, type: DriftSqlType.dateTime, requiredDuringInsert: true);
static const VerificationMeta _categoryIdMeta = const VerificationMeta('categoryId');
@override
late final GeneratedColumn<int> categoryId = GeneratedColumn<int>('category_id', aliasedName, true, type: DriftSqlType.int, requiredDuringInsert: false, defaultConstraints: GeneratedColumn.constraintIsAlways('REFERENCES categories (id)'));
static const VerificationMeta _isSubscriptionMeta = const VerificationMeta('isSubscription');
@override
late final GeneratedColumn<bool> isSubscription = GeneratedColumn<bool>('is_subscription', aliasedName, false, type: DriftSqlType.bool, requiredDuringInsert: false, defaultConstraints: GeneratedColumn.constraintIsAlways('CHECK ("is_subscription" IN (0, 1))'), defaultValue: const Constant(false));
static const VerificationMeta _subscriptionIdMeta = const VerificationMeta('subscriptionId');
@override
late final GeneratedColumn<int> subscriptionId = GeneratedColumn<int>('subscription_id', aliasedName, true, type: DriftSqlType.int, requiredDuringInsert: false);
static const VerificationMeta _kindMeta = const VerificationMeta('kind');
@override
late final GeneratedColumn<int> kind = GeneratedColumn<int>('kind', aliasedName, false, type: DriftSqlType.int, requiredDuringInsert: false, defaultValue: const Constant(1));
static const VerificationMeta _originMeta = const VerificationMeta('origin');
@override
late final GeneratedColumn<int> origin = GeneratedColumn<int>('origin', aliasedName, false, type: DriftSqlType.int, requiredDuringInsert: false, defaultValue: const Constant(0));
static const VerificationMeta _isRecurringMeta = const VerificationMeta('isRecurring');
@override
late final GeneratedColumn<bool> isRecurring = GeneratedColumn<bool>('is_recurring', aliasedName, false, type: DriftSqlType.bool, requiredDuringInsert: false, defaultConstraints: GeneratedColumn.constraintIsAlways('CHECK ("is_recurring" IN (0, 1))'), defaultValue: const Constant(false));
static const VerificationMeta _extractionConfidenceMeta = const VerificationMeta('extractionConfidence');
@override
late final GeneratedColumn<int> extractionConfidence = GeneratedColumn<int>('extraction_confidence', aliasedName, false, type: DriftSqlType.int, requiredDuringInsert: false, defaultValue: const Constant(0));
static const VerificationMeta _hasLineItemsMeta = const VerificationMeta('hasLineItems');
@override
late final GeneratedColumn<bool> hasLineItems = GeneratedColumn<bool>('has_line_items', aliasedName, false, type: DriftSqlType.bool, requiredDuringInsert: false, defaultConstraints: GeneratedColumn.constraintIsAlways('CHECK ("has_line_items" IN (0, 1))'), defaultValue: const Constant(false));
static const VerificationMeta _originalEmailIdMeta = const VerificationMeta('originalEmailId');
@override
late final GeneratedColumn<String> originalEmailId = GeneratedColumn<String>('original_email_id', aliasedName, true, type: DriftSqlType.string, requiredDuringInsert: false);
static const VerificationMeta _currencyMeta = const VerificationMeta('currency');
@override
late final GeneratedColumn<String> currency = GeneratedColumn<String>('currency', aliasedName, false, type: DriftSqlType.string, requiredDuringInsert: false, defaultValue: const Constant('USD'));
static const VerificationMeta _notesMeta = const VerificationMeta('notes');
@override
late final GeneratedColumn<String> notes = GeneratedColumn<String>('notes', aliasedName, true, type: DriftSqlType.string, requiredDuringInsert: false);
static const VerificationMeta _userVerifiedMeta = const VerificationMeta('userVerified');
@override
late final GeneratedColumn<bool> userVerified = GeneratedColumn<bool>('user_verified', aliasedName, false, type: DriftSqlType.bool, requiredDuringInsert: false, defaultConstraints: GeneratedColumn.constraintIsAlways('CHECK ("user_verified" IN (0, 1))'), defaultValue: const Constant(false));
static const VerificationMeta _hasSplitsMeta = const VerificationMeta('hasSplits');
@override
late final GeneratedColumn<bool> hasSplits = GeneratedColumn<bool>('has_splits', aliasedName, false, type: DriftSqlType.bool, requiredDuringInsert: false, defaultConstraints: GeneratedColumn.constraintIsAlways('CHECK ("has_splits" IN (0, 1))'), defaultValue: const Constant(false));
static const VerificationMeta _isManuallyEditedMeta = const VerificationMeta('isManuallyEdited');
@override
late final GeneratedColumn<bool> isManuallyEdited = GeneratedColumn<bool>('is_manually_edited', aliasedName, false, type: DriftSqlType.bool, requiredDuringInsert: false, defaultConstraints: GeneratedColumn.constraintIsAlways('CHECK ("is_manually_edited" IN (0, 1))'), defaultValue: const Constant(false));
static const VerificationMeta _manualEditTimestampMeta = const VerificationMeta('manualEditTimestamp');
@override
late final GeneratedColumn<DateTime> manualEditTimestamp = GeneratedColumn<DateTime>('manual_edit_timestamp', aliasedName, true, type: DriftSqlType.dateTime, requiredDuringInsert: false);
static const VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
@override
late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>('created_at', aliasedName, false, type: DriftSqlType.dateTime, requiredDuringInsert: false, defaultValue: currentDateAndTime);
static const VerificationMeta _updatedAtMeta = const VerificationMeta('updatedAt');
@override
late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>('updated_at', aliasedName, true, type: DriftSqlType.dateTime, requiredDuringInsert: false);
@override
List<GeneratedColumn> get $columns => [id, merchantName, rawMerchantName, amount, subtotalAmount, taxAmount, discountAmount, tipAmount, date, categoryId, isSubscription, subscriptionId, kind, origin, isRecurring, extractionConfidence, hasLineItems, originalEmailId, currency, notes, userVerified, hasSplits, isManuallyEdited, manualEditTimestamp, createdAt, updatedAt];
@override
String get aliasedName => _alias ?? actualTableName;
@override
 String get actualTableName => $name;
static const String $name = 'transactions';
@override
VerificationContext validateIntegrity(Insertable<Transaction> instance, {bool isInserting = false}) {
final context = VerificationContext();
final data = instance.toColumns(true);
if (data.containsKey('id')) {
context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));}if (data.containsKey('merchant_name')) {
context.handle(_merchantNameMeta, merchantName.isAcceptableOrUnknown(data['merchant_name']!, _merchantNameMeta));} else if (isInserting) {
context.missing(_merchantNameMeta);
}
if (data.containsKey('raw_merchant_name')) {
context.handle(_rawMerchantNameMeta, rawMerchantName.isAcceptableOrUnknown(data['raw_merchant_name']!, _rawMerchantNameMeta));}if (data.containsKey('amount')) {
context.handle(_amountMeta, amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));} else if (isInserting) {
context.missing(_amountMeta);
}
if (data.containsKey('subtotal_amount')) {
context.handle(_subtotalAmountMeta, subtotalAmount.isAcceptableOrUnknown(data['subtotal_amount']!, _subtotalAmountMeta));}if (data.containsKey('tax_amount')) {
context.handle(_taxAmountMeta, taxAmount.isAcceptableOrUnknown(data['tax_amount']!, _taxAmountMeta));}if (data.containsKey('discount_amount')) {
context.handle(_discountAmountMeta, discountAmount.isAcceptableOrUnknown(data['discount_amount']!, _discountAmountMeta));}if (data.containsKey('tip_amount')) {
context.handle(_tipAmountMeta, tipAmount.isAcceptableOrUnknown(data['tip_amount']!, _tipAmountMeta));}if (data.containsKey('date')) {
context.handle(_dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));} else if (isInserting) {
context.missing(_dateMeta);
}
if (data.containsKey('category_id')) {
context.handle(_categoryIdMeta, categoryId.isAcceptableOrUnknown(data['category_id']!, _categoryIdMeta));}if (data.containsKey('is_subscription')) {
context.handle(_isSubscriptionMeta, isSubscription.isAcceptableOrUnknown(data['is_subscription']!, _isSubscriptionMeta));}if (data.containsKey('subscription_id')) {
context.handle(_subscriptionIdMeta, subscriptionId.isAcceptableOrUnknown(data['subscription_id']!, _subscriptionIdMeta));}if (data.containsKey('kind')) {
context.handle(_kindMeta, kind.isAcceptableOrUnknown(data['kind']!, _kindMeta));}if (data.containsKey('origin')) {
context.handle(_originMeta, origin.isAcceptableOrUnknown(data['origin']!, _originMeta));}if (data.containsKey('is_recurring')) {
context.handle(_isRecurringMeta, isRecurring.isAcceptableOrUnknown(data['is_recurring']!, _isRecurringMeta));}if (data.containsKey('extraction_confidence')) {
context.handle(_extractionConfidenceMeta, extractionConfidence.isAcceptableOrUnknown(data['extraction_confidence']!, _extractionConfidenceMeta));}if (data.containsKey('has_line_items')) {
context.handle(_hasLineItemsMeta, hasLineItems.isAcceptableOrUnknown(data['has_line_items']!, _hasLineItemsMeta));}if (data.containsKey('original_email_id')) {
context.handle(_originalEmailIdMeta, originalEmailId.isAcceptableOrUnknown(data['original_email_id']!, _originalEmailIdMeta));}if (data.containsKey('currency')) {
context.handle(_currencyMeta, currency.isAcceptableOrUnknown(data['currency']!, _currencyMeta));}if (data.containsKey('notes')) {
context.handle(_notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));}if (data.containsKey('user_verified')) {
context.handle(_userVerifiedMeta, userVerified.isAcceptableOrUnknown(data['user_verified']!, _userVerifiedMeta));}if (data.containsKey('has_splits')) {
context.handle(_hasSplitsMeta, hasSplits.isAcceptableOrUnknown(data['has_splits']!, _hasSplitsMeta));}if (data.containsKey('is_manually_edited')) {
context.handle(_isManuallyEditedMeta, isManuallyEdited.isAcceptableOrUnknown(data['is_manually_edited']!, _isManuallyEditedMeta));}if (data.containsKey('manual_edit_timestamp')) {
context.handle(_manualEditTimestampMeta, manualEditTimestamp.isAcceptableOrUnknown(data['manual_edit_timestamp']!, _manualEditTimestampMeta));}if (data.containsKey('created_at')) {
context.handle(_createdAtMeta, createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));}if (data.containsKey('updated_at')) {
context.handle(_updatedAtMeta, updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));}return context;
}
@override
Set<GeneratedColumn> get $primaryKey => {id};
@override Transaction map(Map<String, dynamic> data, {String? tablePrefix})  {
final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';return Transaction(id: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}id'])!, merchantName: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}merchant_name'])!, rawMerchantName: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}raw_merchant_name']), amount: attachedDatabase.typeMapping.read(DriftSqlType.double, data['${effectivePrefix}amount'])!, subtotalAmount: attachedDatabase.typeMapping.read(DriftSqlType.double, data['${effectivePrefix}subtotal_amount']), taxAmount: attachedDatabase.typeMapping.read(DriftSqlType.double, data['${effectivePrefix}tax_amount']), discountAmount: attachedDatabase.typeMapping.read(DriftSqlType.double, data['${effectivePrefix}discount_amount']), tipAmount: attachedDatabase.typeMapping.read(DriftSqlType.double, data['${effectivePrefix}tip_amount']), date: attachedDatabase.typeMapping.read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!, categoryId: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}category_id']), isSubscription: attachedDatabase.typeMapping.read(DriftSqlType.bool, data['${effectivePrefix}is_subscription'])!, subscriptionId: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}subscription_id']), kind: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}kind'])!, origin: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}origin'])!, isRecurring: attachedDatabase.typeMapping.read(DriftSqlType.bool, data['${effectivePrefix}is_recurring'])!, extractionConfidence: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}extraction_confidence'])!, hasLineItems: attachedDatabase.typeMapping.read(DriftSqlType.bool, data['${effectivePrefix}has_line_items'])!, originalEmailId: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}original_email_id']), currency: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}currency'])!, notes: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}notes']), userVerified: attachedDatabase.typeMapping.read(DriftSqlType.bool, data['${effectivePrefix}user_verified'])!, hasSplits: attachedDatabase.typeMapping.read(DriftSqlType.bool, data['${effectivePrefix}has_splits'])!, isManuallyEdited: attachedDatabase.typeMapping.read(DriftSqlType.bool, data['${effectivePrefix}is_manually_edited'])!, manualEditTimestamp: attachedDatabase.typeMapping.read(DriftSqlType.dateTime, data['${effectivePrefix}manual_edit_timestamp']), createdAt: attachedDatabase.typeMapping.read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!, updatedAt: attachedDatabase.typeMapping.read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at']), );
}
@override
$TransactionsTable createAlias(String alias) {
return $TransactionsTable(attachedDatabase, alias);}}class Transaction extends DataClass implements Insertable<Transaction> 
{
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
const Transaction({required this.id, required this.merchantName, this.rawMerchantName, required this.amount, this.subtotalAmount, this.taxAmount, this.discountAmount, this.tipAmount, required this.date, this.categoryId, required this.isSubscription, this.subscriptionId, required this.kind, required this.origin, required this.isRecurring, required this.extractionConfidence, required this.hasLineItems, this.originalEmailId, required this.currency, this.notes, required this.userVerified, required this.hasSplits, required this.isManuallyEdited, this.manualEditTimestamp, required this.createdAt, this.updatedAt});@override
Map<String, Expression> toColumns(bool nullToAbsent) {
final map = <String, Expression> {};map['id'] = Variable<int>(id);
map['merchant_name'] = Variable<String>(merchantName);
if (!nullToAbsent || rawMerchantName != null){map['raw_merchant_name'] = Variable<String>(rawMerchantName);
}map['amount'] = Variable<double>(amount);
if (!nullToAbsent || subtotalAmount != null){map['subtotal_amount'] = Variable<double>(subtotalAmount);
}if (!nullToAbsent || taxAmount != null){map['tax_amount'] = Variable<double>(taxAmount);
}if (!nullToAbsent || discountAmount != null){map['discount_amount'] = Variable<double>(discountAmount);
}if (!nullToAbsent || tipAmount != null){map['tip_amount'] = Variable<double>(tipAmount);
}map['date'] = Variable<DateTime>(date);
if (!nullToAbsent || categoryId != null){map['category_id'] = Variable<int>(categoryId);
}map['is_subscription'] = Variable<bool>(isSubscription);
if (!nullToAbsent || subscriptionId != null){map['subscription_id'] = Variable<int>(subscriptionId);
}map['kind'] = Variable<int>(kind);
map['origin'] = Variable<int>(origin);
map['is_recurring'] = Variable<bool>(isRecurring);
map['extraction_confidence'] = Variable<int>(extractionConfidence);
map['has_line_items'] = Variable<bool>(hasLineItems);
if (!nullToAbsent || originalEmailId != null){map['original_email_id'] = Variable<String>(originalEmailId);
}map['currency'] = Variable<String>(currency);
if (!nullToAbsent || notes != null){map['notes'] = Variable<String>(notes);
}map['user_verified'] = Variable<bool>(userVerified);
map['has_splits'] = Variable<bool>(hasSplits);
map['is_manually_edited'] = Variable<bool>(isManuallyEdited);
if (!nullToAbsent || manualEditTimestamp != null){map['manual_edit_timestamp'] = Variable<DateTime>(manualEditTimestamp);
}map['created_at'] = Variable<DateTime>(createdAt);
if (!nullToAbsent || updatedAt != null){map['updated_at'] = Variable<DateTime>(updatedAt);
}return map; 
}
TransactionsCompanion toCompanion(bool nullToAbsent) {
return TransactionsCompanion(id: Value(id),merchantName: Value(merchantName),rawMerchantName: rawMerchantName == null && nullToAbsent ? const Value.absent() : Value(rawMerchantName),amount: Value(amount),subtotalAmount: subtotalAmount == null && nullToAbsent ? const Value.absent() : Value(subtotalAmount),taxAmount: taxAmount == null && nullToAbsent ? const Value.absent() : Value(taxAmount),discountAmount: discountAmount == null && nullToAbsent ? const Value.absent() : Value(discountAmount),tipAmount: tipAmount == null && nullToAbsent ? const Value.absent() : Value(tipAmount),date: Value(date),categoryId: categoryId == null && nullToAbsent ? const Value.absent() : Value(categoryId),isSubscription: Value(isSubscription),subscriptionId: subscriptionId == null && nullToAbsent ? const Value.absent() : Value(subscriptionId),kind: Value(kind),origin: Value(origin),isRecurring: Value(isRecurring),extractionConfidence: Value(extractionConfidence),hasLineItems: Value(hasLineItems),originalEmailId: originalEmailId == null && nullToAbsent ? const Value.absent() : Value(originalEmailId),currency: Value(currency),notes: notes == null && nullToAbsent ? const Value.absent() : Value(notes),userVerified: Value(userVerified),hasSplits: Value(hasSplits),isManuallyEdited: Value(isManuallyEdited),manualEditTimestamp: manualEditTimestamp == null && nullToAbsent ? const Value.absent() : Value(manualEditTimestamp),createdAt: Value(createdAt),updatedAt: updatedAt == null && nullToAbsent ? const Value.absent() : Value(updatedAt),);
}
factory Transaction.fromJson(Map<String, dynamic> json, {ValueSerializer? serializer}) {
serializer ??= driftRuntimeOptions.defaultSerializer;
return Transaction(id: serializer.fromJson<int>(json['id']),merchantName: serializer.fromJson<String>(json['merchantName']),rawMerchantName: serializer.fromJson<String?>(json['rawMerchantName']),amount: serializer.fromJson<double>(json['amount']),subtotalAmount: serializer.fromJson<double?>(json['subtotalAmount']),taxAmount: serializer.fromJson<double?>(json['taxAmount']),discountAmount: serializer.fromJson<double?>(json['discountAmount']),tipAmount: serializer.fromJson<double?>(json['tipAmount']),date: serializer.fromJson<DateTime>(json['date']),categoryId: serializer.fromJson<int?>(json['categoryId']),isSubscription: serializer.fromJson<bool>(json['isSubscription']),subscriptionId: serializer.fromJson<int?>(json['subscriptionId']),kind: serializer.fromJson<int>(json['kind']),origin: serializer.fromJson<int>(json['origin']),isRecurring: serializer.fromJson<bool>(json['isRecurring']),extractionConfidence: serializer.fromJson<int>(json['extractionConfidence']),hasLineItems: serializer.fromJson<bool>(json['hasLineItems']),originalEmailId: serializer.fromJson<String?>(json['originalEmailId']),currency: serializer.fromJson<String>(json['currency']),notes: serializer.fromJson<String?>(json['notes']),userVerified: serializer.fromJson<bool>(json['userVerified']),hasSplits: serializer.fromJson<bool>(json['hasSplits']),isManuallyEdited: serializer.fromJson<bool>(json['isManuallyEdited']),manualEditTimestamp: serializer.fromJson<DateTime?>(json['manualEditTimestamp']),createdAt: serializer.fromJson<DateTime>(json['createdAt']),updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),);}
@override Map<String, dynamic> toJson({ValueSerializer? serializer}) {
serializer ??= driftRuntimeOptions.defaultSerializer;
return <String, dynamic>{
'id': serializer.toJson<int>(id),'merchantName': serializer.toJson<String>(merchantName),'rawMerchantName': serializer.toJson<String?>(rawMerchantName),'amount': serializer.toJson<double>(amount),'subtotalAmount': serializer.toJson<double?>(subtotalAmount),'taxAmount': serializer.toJson<double?>(taxAmount),'discountAmount': serializer.toJson<double?>(discountAmount),'tipAmount': serializer.toJson<double?>(tipAmount),'date': serializer.toJson<DateTime>(date),'categoryId': serializer.toJson<int?>(categoryId),'isSubscription': serializer.toJson<bool>(isSubscription),'subscriptionId': serializer.toJson<int?>(subscriptionId),'kind': serializer.toJson<int>(kind),'origin': serializer.toJson<int>(origin),'isRecurring': serializer.toJson<bool>(isRecurring),'extractionConfidence': serializer.toJson<int>(extractionConfidence),'hasLineItems': serializer.toJson<bool>(hasLineItems),'originalEmailId': serializer.toJson<String?>(originalEmailId),'currency': serializer.toJson<String>(currency),'notes': serializer.toJson<String?>(notes),'userVerified': serializer.toJson<bool>(userVerified),'hasSplits': serializer.toJson<bool>(hasSplits),'isManuallyEdited': serializer.toJson<bool>(isManuallyEdited),'manualEditTimestamp': serializer.toJson<DateTime?>(manualEditTimestamp),'createdAt': serializer.toJson<DateTime>(createdAt),'updatedAt': serializer.toJson<DateTime?>(updatedAt),};}Transaction copyWith({int? id,String? merchantName,Value<String?> rawMerchantName = const Value.absent(),double? amount,Value<double?> subtotalAmount = const Value.absent(),Value<double?> taxAmount = const Value.absent(),Value<double?> discountAmount = const Value.absent(),Value<double?> tipAmount = const Value.absent(),DateTime? date,Value<int?> categoryId = const Value.absent(),bool? isSubscription,Value<int?> subscriptionId = const Value.absent(),int? kind,int? origin,bool? isRecurring,int? extractionConfidence,bool? hasLineItems,Value<String?> originalEmailId = const Value.absent(),String? currency,Value<String?> notes = const Value.absent(),bool? userVerified,bool? hasSplits,bool? isManuallyEdited,Value<DateTime?> manualEditTimestamp = const Value.absent(),DateTime? createdAt,Value<DateTime?> updatedAt = const Value.absent()}) => Transaction(id: id ?? this.id,merchantName: merchantName ?? this.merchantName,rawMerchantName: rawMerchantName.present ? rawMerchantName.value : this.rawMerchantName,amount: amount ?? this.amount,subtotalAmount: subtotalAmount.present ? subtotalAmount.value : this.subtotalAmount,taxAmount: taxAmount.present ? taxAmount.value : this.taxAmount,discountAmount: discountAmount.present ? discountAmount.value : this.discountAmount,tipAmount: tipAmount.present ? tipAmount.value : this.tipAmount,date: date ?? this.date,categoryId: categoryId.present ? categoryId.value : this.categoryId,isSubscription: isSubscription ?? this.isSubscription,subscriptionId: subscriptionId.present ? subscriptionId.value : this.subscriptionId,kind: kind ?? this.kind,origin: origin ?? this.origin,isRecurring: isRecurring ?? this.isRecurring,extractionConfidence: extractionConfidence ?? this.extractionConfidence,hasLineItems: hasLineItems ?? this.hasLineItems,originalEmailId: originalEmailId.present ? originalEmailId.value : this.originalEmailId,currency: currency ?? this.currency,notes: notes.present ? notes.value : this.notes,userVerified: userVerified ?? this.userVerified,hasSplits: hasSplits ?? this.hasSplits,isManuallyEdited: isManuallyEdited ?? this.isManuallyEdited,manualEditTimestamp: manualEditTimestamp.present ? manualEditTimestamp.value : this.manualEditTimestamp,createdAt: createdAt ?? this.createdAt,updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,);Transaction copyWithCompanion(TransactionsCompanion data) {
return Transaction(
id: data.id.present ? data.id.value : this.id,merchantName: data.merchantName.present ? data.merchantName.value : this.merchantName,rawMerchantName: data.rawMerchantName.present ? data.rawMerchantName.value : this.rawMerchantName,amount: data.amount.present ? data.amount.value : this.amount,subtotalAmount: data.subtotalAmount.present ? data.subtotalAmount.value : this.subtotalAmount,taxAmount: data.taxAmount.present ? data.taxAmount.value : this.taxAmount,discountAmount: data.discountAmount.present ? data.discountAmount.value : this.discountAmount,tipAmount: data.tipAmount.present ? data.tipAmount.value : this.tipAmount,date: data.date.present ? data.date.value : this.date,categoryId: data.categoryId.present ? data.categoryId.value : this.categoryId,isSubscription: data.isSubscription.present ? data.isSubscription.value : this.isSubscription,subscriptionId: data.subscriptionId.present ? data.subscriptionId.value : this.subscriptionId,kind: data.kind.present ? data.kind.value : this.kind,origin: data.origin.present ? data.origin.value : this.origin,isRecurring: data.isRecurring.present ? data.isRecurring.value : this.isRecurring,extractionConfidence: data.extractionConfidence.present ? data.extractionConfidence.value : this.extractionConfidence,hasLineItems: data.hasLineItems.present ? data.hasLineItems.value : this.hasLineItems,originalEmailId: data.originalEmailId.present ? data.originalEmailId.value : this.originalEmailId,currency: data.currency.present ? data.currency.value : this.currency,notes: data.notes.present ? data.notes.value : this.notes,userVerified: data.userVerified.present ? data.userVerified.value : this.userVerified,hasSplits: data.hasSplits.present ? data.hasSplits.value : this.hasSplits,isManuallyEdited: data.isManuallyEdited.present ? data.isManuallyEdited.value : this.isManuallyEdited,manualEditTimestamp: data.manualEditTimestamp.present ? data.manualEditTimestamp.value : this.manualEditTimestamp,createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,);
}
@override
String toString() {return (StringBuffer('Transaction(')..write('id: $id, ')..write('merchantName: $merchantName, ')..write('rawMerchantName: $rawMerchantName, ')..write('amount: $amount, ')..write('subtotalAmount: $subtotalAmount, ')..write('taxAmount: $taxAmount, ')..write('discountAmount: $discountAmount, ')..write('tipAmount: $tipAmount, ')..write('date: $date, ')..write('categoryId: $categoryId, ')..write('isSubscription: $isSubscription, ')..write('subscriptionId: $subscriptionId, ')..write('kind: $kind, ')..write('origin: $origin, ')..write('isRecurring: $isRecurring, ')..write('extractionConfidence: $extractionConfidence, ')..write('hasLineItems: $hasLineItems, ')..write('originalEmailId: $originalEmailId, ')..write('currency: $currency, ')..write('notes: $notes, ')..write('userVerified: $userVerified, ')..write('hasSplits: $hasSplits, ')..write('isManuallyEdited: $isManuallyEdited, ')..write('manualEditTimestamp: $manualEditTimestamp, ')..write('createdAt: $createdAt, ')..write('updatedAt: $updatedAt')..write(')')).toString();}
@override
 int get hashCode => Object.hashAll([id, merchantName, rawMerchantName, amount, subtotalAmount, taxAmount, discountAmount, tipAmount, date, categoryId, isSubscription, subscriptionId, kind, origin, isRecurring, extractionConfidence, hasLineItems, originalEmailId, currency, notes, userVerified, hasSplits, isManuallyEdited, manualEditTimestamp, createdAt, updatedAt]);@override
bool operator ==(Object other) => identical(this, other) || (other is Transaction && other.id == this.id && other.merchantName == this.merchantName && other.rawMerchantName == this.rawMerchantName && other.amount == this.amount && other.subtotalAmount == this.subtotalAmount && other.taxAmount == this.taxAmount && other.discountAmount == this.discountAmount && other.tipAmount == this.tipAmount && other.date == this.date && other.categoryId == this.categoryId && other.isSubscription == this.isSubscription && other.subscriptionId == this.subscriptionId && other.kind == this.kind && other.origin == this.origin && other.isRecurring == this.isRecurring && other.extractionConfidence == this.extractionConfidence && other.hasLineItems == this.hasLineItems && other.originalEmailId == this.originalEmailId && other.currency == this.currency && other.notes == this.notes && other.userVerified == this.userVerified && other.hasSplits == this.hasSplits && other.isManuallyEdited == this.isManuallyEdited && other.manualEditTimestamp == this.manualEditTimestamp && other.createdAt == this.createdAt && other.updatedAt == this.updatedAt);
}class TransactionsCompanion extends UpdateCompanion<Transaction> {
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
const TransactionsCompanion({this.id = const Value.absent(),this.merchantName = const Value.absent(),this.rawMerchantName = const Value.absent(),this.amount = const Value.absent(),this.subtotalAmount = const Value.absent(),this.taxAmount = const Value.absent(),this.discountAmount = const Value.absent(),this.tipAmount = const Value.absent(),this.date = const Value.absent(),this.categoryId = const Value.absent(),this.isSubscription = const Value.absent(),this.subscriptionId = const Value.absent(),this.kind = const Value.absent(),this.origin = const Value.absent(),this.isRecurring = const Value.absent(),this.extractionConfidence = const Value.absent(),this.hasLineItems = const Value.absent(),this.originalEmailId = const Value.absent(),this.currency = const Value.absent(),this.notes = const Value.absent(),this.userVerified = const Value.absent(),this.hasSplits = const Value.absent(),this.isManuallyEdited = const Value.absent(),this.manualEditTimestamp = const Value.absent(),this.createdAt = const Value.absent(),this.updatedAt = const Value.absent(),});
TransactionsCompanion.insert({this.id = const Value.absent(),required String merchantName,this.rawMerchantName = const Value.absent(),required double amount,this.subtotalAmount = const Value.absent(),this.taxAmount = const Value.absent(),this.discountAmount = const Value.absent(),this.tipAmount = const Value.absent(),required DateTime date,this.categoryId = const Value.absent(),this.isSubscription = const Value.absent(),this.subscriptionId = const Value.absent(),this.kind = const Value.absent(),this.origin = const Value.absent(),this.isRecurring = const Value.absent(),this.extractionConfidence = const Value.absent(),this.hasLineItems = const Value.absent(),this.originalEmailId = const Value.absent(),this.currency = const Value.absent(),this.notes = const Value.absent(),this.userVerified = const Value.absent(),this.hasSplits = const Value.absent(),this.isManuallyEdited = const Value.absent(),this.manualEditTimestamp = const Value.absent(),this.createdAt = const Value.absent(),this.updatedAt = const Value.absent(),}): merchantName = Value(merchantName), amount = Value(amount), date = Value(date);
static Insertable<Transaction> custom({Expression<int>? id, 
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
return RawValuesInsertable({if (id != null)'id': id,if (merchantName != null)'merchant_name': merchantName,if (rawMerchantName != null)'raw_merchant_name': rawMerchantName,if (amount != null)'amount': amount,if (subtotalAmount != null)'subtotal_amount': subtotalAmount,if (taxAmount != null)'tax_amount': taxAmount,if (discountAmount != null)'discount_amount': discountAmount,if (tipAmount != null)'tip_amount': tipAmount,if (date != null)'date': date,if (categoryId != null)'category_id': categoryId,if (isSubscription != null)'is_subscription': isSubscription,if (subscriptionId != null)'subscription_id': subscriptionId,if (kind != null)'kind': kind,if (origin != null)'origin': origin,if (isRecurring != null)'is_recurring': isRecurring,if (extractionConfidence != null)'extraction_confidence': extractionConfidence,if (hasLineItems != null)'has_line_items': hasLineItems,if (originalEmailId != null)'original_email_id': originalEmailId,if (currency != null)'currency': currency,if (notes != null)'notes': notes,if (userVerified != null)'user_verified': userVerified,if (hasSplits != null)'has_splits': hasSplits,if (isManuallyEdited != null)'is_manually_edited': isManuallyEdited,if (manualEditTimestamp != null)'manual_edit_timestamp': manualEditTimestamp,if (createdAt != null)'created_at': createdAt,if (updatedAt != null)'updated_at': updatedAt,});
}TransactionsCompanion copyWith({Value<int>? id, Value<String>? merchantName, Value<String?>? rawMerchantName, Value<double>? amount, Value<double?>? subtotalAmount, Value<double?>? taxAmount, Value<double?>? discountAmount, Value<double?>? tipAmount, Value<DateTime>? date, Value<int?>? categoryId, Value<bool>? isSubscription, Value<int?>? subscriptionId, Value<int>? kind, Value<int>? origin, Value<bool>? isRecurring, Value<int>? extractionConfidence, Value<bool>? hasLineItems, Value<String?>? originalEmailId, Value<String>? currency, Value<String?>? notes, Value<bool>? userVerified, Value<bool>? hasSplits, Value<bool>? isManuallyEdited, Value<DateTime?>? manualEditTimestamp, Value<DateTime>? createdAt, Value<DateTime?>? updatedAt}) {
return TransactionsCompanion(id: id ?? this.id,merchantName: merchantName ?? this.merchantName,rawMerchantName: rawMerchantName ?? this.rawMerchantName,amount: amount ?? this.amount,subtotalAmount: subtotalAmount ?? this.subtotalAmount,taxAmount: taxAmount ?? this.taxAmount,discountAmount: discountAmount ?? this.discountAmount,tipAmount: tipAmount ?? this.tipAmount,date: date ?? this.date,categoryId: categoryId ?? this.categoryId,isSubscription: isSubscription ?? this.isSubscription,subscriptionId: subscriptionId ?? this.subscriptionId,kind: kind ?? this.kind,origin: origin ?? this.origin,isRecurring: isRecurring ?? this.isRecurring,extractionConfidence: extractionConfidence ?? this.extractionConfidence,hasLineItems: hasLineItems ?? this.hasLineItems,originalEmailId: originalEmailId ?? this.originalEmailId,currency: currency ?? this.currency,notes: notes ?? this.notes,userVerified: userVerified ?? this.userVerified,hasSplits: hasSplits ?? this.hasSplits,isManuallyEdited: isManuallyEdited ?? this.isManuallyEdited,manualEditTimestamp: manualEditTimestamp ?? this.manualEditTimestamp,createdAt: createdAt ?? this.createdAt,updatedAt: updatedAt ?? this.updatedAt,);
}
@override
Map<String, Expression> toColumns(bool nullToAbsent) {
final map = <String, Expression> {};if (id.present) {
map['id'] = Variable<int>(id.value);}
if (merchantName.present) {
map['merchant_name'] = Variable<String>(merchantName.value);}
if (rawMerchantName.present) {
map['raw_merchant_name'] = Variable<String>(rawMerchantName.value);}
if (amount.present) {
map['amount'] = Variable<double>(amount.value);}
if (subtotalAmount.present) {
map['subtotal_amount'] = Variable<double>(subtotalAmount.value);}
if (taxAmount.present) {
map['tax_amount'] = Variable<double>(taxAmount.value);}
if (discountAmount.present) {
map['discount_amount'] = Variable<double>(discountAmount.value);}
if (tipAmount.present) {
map['tip_amount'] = Variable<double>(tipAmount.value);}
if (date.present) {
map['date'] = Variable<DateTime>(date.value);}
if (categoryId.present) {
map['category_id'] = Variable<int>(categoryId.value);}
if (isSubscription.present) {
map['is_subscription'] = Variable<bool>(isSubscription.value);}
if (subscriptionId.present) {
map['subscription_id'] = Variable<int>(subscriptionId.value);}
if (kind.present) {
map['kind'] = Variable<int>(kind.value);}
if (origin.present) {
map['origin'] = Variable<int>(origin.value);}
if (isRecurring.present) {
map['is_recurring'] = Variable<bool>(isRecurring.value);}
if (extractionConfidence.present) {
map['extraction_confidence'] = Variable<int>(extractionConfidence.value);}
if (hasLineItems.present) {
map['has_line_items'] = Variable<bool>(hasLineItems.value);}
if (originalEmailId.present) {
map['original_email_id'] = Variable<String>(originalEmailId.value);}
if (currency.present) {
map['currency'] = Variable<String>(currency.value);}
if (notes.present) {
map['notes'] = Variable<String>(notes.value);}
if (userVerified.present) {
map['user_verified'] = Variable<bool>(userVerified.value);}
if (hasSplits.present) {
map['has_splits'] = Variable<bool>(hasSplits.value);}
if (isManuallyEdited.present) {
map['is_manually_edited'] = Variable<bool>(isManuallyEdited.value);}
if (manualEditTimestamp.present) {
map['manual_edit_timestamp'] = Variable<DateTime>(manualEditTimestamp.value);}
if (createdAt.present) {
map['created_at'] = Variable<DateTime>(createdAt.value);}
if (updatedAt.present) {
map['updated_at'] = Variable<DateTime>(updatedAt.value);}
return map; 
}
@override
String toString() {return (StringBuffer('TransactionsCompanion(')..write('id: $id, ')..write('merchantName: $merchantName, ')..write('rawMerchantName: $rawMerchantName, ')..write('amount: $amount, ')..write('subtotalAmount: $subtotalAmount, ')..write('taxAmount: $taxAmount, ')..write('discountAmount: $discountAmount, ')..write('tipAmount: $tipAmount, ')..write('date: $date, ')..write('categoryId: $categoryId, ')..write('isSubscription: $isSubscription, ')..write('subscriptionId: $subscriptionId, ')..write('kind: $kind, ')..write('origin: $origin, ')..write('isRecurring: $isRecurring, ')..write('extractionConfidence: $extractionConfidence, ')..write('hasLineItems: $hasLineItems, ')..write('originalEmailId: $originalEmailId, ')..write('currency: $currency, ')..write('notes: $notes, ')..write('userVerified: $userVerified, ')..write('hasSplits: $hasSplits, ')..write('isManuallyEdited: $isManuallyEdited, ')..write('manualEditTimestamp: $manualEditTimestamp, ')..write('createdAt: $createdAt, ')..write('updatedAt: $updatedAt')..write(')')).toString();}
}
class $SubscriptionsTable extends Subscriptions with TableInfo<$SubscriptionsTable, Subscription>{
@override final GeneratedDatabase attachedDatabase;
final String? _alias;
$SubscriptionsTable(this.attachedDatabase, [this._alias]);
static const VerificationMeta _idMeta = const VerificationMeta('id');
@override
late final GeneratedColumn<int> id = GeneratedColumn<int>('id', aliasedName, false, hasAutoIncrement: true, type: DriftSqlType.int, requiredDuringInsert: false, defaultConstraints: GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
static const VerificationMeta _serviceNameMeta = const VerificationMeta('serviceName');
@override
late final GeneratedColumn<String> serviceName = GeneratedColumn<String>('service_name', aliasedName, false, type: DriftSqlType.string, requiredDuringInsert: true);
static const VerificationMeta _amountMeta = const VerificationMeta('amount');
@override
late final GeneratedColumn<double> amount = GeneratedColumn<double>('amount', aliasedName, false, type: DriftSqlType.double, requiredDuringInsert: true);
static const VerificationMeta _nextRenewalDateMeta = const VerificationMeta('nextRenewalDate');
@override
late final GeneratedColumn<DateTime> nextRenewalDate = GeneratedColumn<DateTime>('next_renewal_date', aliasedName, false, type: DriftSqlType.dateTime, requiredDuringInsert: true);
static const VerificationMeta _frequencyMeta = const VerificationMeta('frequency');
@override
late final GeneratedColumn<int> frequency = GeneratedColumn<int>('frequency', aliasedName, false, type: DriftSqlType.int, requiredDuringInsert: true);
static const VerificationMeta _lifecycleStateMeta = const VerificationMeta('lifecycleState');
@override
late final GeneratedColumn<int> lifecycleState = GeneratedColumn<int>('lifecycle_state', aliasedName, false, type: DriftSqlType.int, requiredDuringInsert: true);
static const VerificationMeta _categoryIdMeta = const VerificationMeta('categoryId');
@override
late final GeneratedColumn<int> categoryId = GeneratedColumn<int>('category_id', aliasedName, true, type: DriftSqlType.int, requiredDuringInsert: false, defaultConstraints: GeneratedColumn.constraintIsAlways('REFERENCES categories (id)'));
static const VerificationMeta _firstSeenDateMeta = const VerificationMeta('firstSeenDate');
@override
late final GeneratedColumn<DateTime> firstSeenDate = GeneratedColumn<DateTime>('first_seen_date', aliasedName, false, type: DriftSqlType.dateTime, requiredDuringInsert: true);
static const VerificationMeta _lastChargedDateMeta = const VerificationMeta('lastChargedDate');
@override
late final GeneratedColumn<DateTime> lastChargedDate = GeneratedColumn<DateTime>('last_charged_date', aliasedName, true, type: DriftSqlType.dateTime, requiredDuringInsert: false);
static const VerificationMeta _priceHistoryJsonMeta = const VerificationMeta('priceHistoryJson');
@override
late final GeneratedColumn<String> priceHistoryJson = GeneratedColumn<String>('price_history_json', aliasedName, true, type: DriftSqlType.string, requiredDuringInsert: false);
static const VerificationMeta _cycleHistoryJsonMeta = const VerificationMeta('cycleHistoryJson');
@override
late final GeneratedColumn<String> cycleHistoryJson = GeneratedColumn<String>('cycle_history_json', aliasedName, true, type: DriftSqlType.string, requiredDuringInsert: false);
static const VerificationMeta _frequencyConsistencyMeta = const VerificationMeta('frequencyConsistency');
@override
late final GeneratedColumn<int> frequencyConsistency = GeneratedColumn<int>('frequency_consistency', aliasedName, false, type: DriftSqlType.int, requiredDuringInsert: false, defaultValue: const Constant(100));
static const VerificationMeta _detectionSourceMeta = const VerificationMeta('detectionSource');
@override
late final GeneratedColumn<int> detectionSource = GeneratedColumn<int>('detection_source', aliasedName, false, type: DriftSqlType.int, requiredDuringInsert: true);
static const VerificationMeta _anomaliesMeta = const VerificationMeta('anomalies');
@override
late final GeneratedColumn<String> anomalies = GeneratedColumn<String>('anomalies', aliasedName, true, type: DriftSqlType.string, requiredDuringInsert: false);
static const VerificationMeta _isTrialMeta = const VerificationMeta('isTrial');
@override
late final GeneratedColumn<bool> isTrial = GeneratedColumn<bool>('is_trial', aliasedName, false, type: DriftSqlType.bool, requiredDuringInsert: false, defaultConstraints: GeneratedColumn.constraintIsAlways('CHECK ("is_trial" IN (0, 1))'), defaultValue: const Constant(false));
static const VerificationMeta _trialEndDateMeta = const VerificationMeta('trialEndDate');
@override
late final GeneratedColumn<DateTime> trialEndDate = GeneratedColumn<DateTime>('trial_end_date', aliasedName, true, type: DriftSqlType.dateTime, requiredDuringInsert: false);
static const VerificationMeta _chargeCountMeta = const VerificationMeta('chargeCount');
@override
late final GeneratedColumn<int> chargeCount = GeneratedColumn<int>('charge_count', aliasedName, false, type: DriftSqlType.int, requiredDuringInsert: false, defaultValue: const Constant(0));
static const VerificationMeta _averageDaysBetweenChargesMeta = const VerificationMeta('averageDaysBetweenCharges');
@override
late final GeneratedColumn<double> averageDaysBetweenCharges = GeneratedColumn<double>('average_days_between_charges', aliasedName, true, type: DriftSqlType.double, requiredDuringInsert: false);
static const VerificationMeta _currencyMeta = const VerificationMeta('currency');
@override
late final GeneratedColumn<String> currency = GeneratedColumn<String>('currency', aliasedName, false, type: DriftSqlType.string, requiredDuringInsert: false, defaultValue: const Constant('USD'));
static const VerificationMeta _notesMeta = const VerificationMeta('notes');
@override
late final GeneratedColumn<String> notes = GeneratedColumn<String>('notes', aliasedName, true, type: DriftSqlType.string, requiredDuringInsert: false);
static const VerificationMeta _userConfirmedMeta = const VerificationMeta('userConfirmed');
@override
late final GeneratedColumn<bool> userConfirmed = GeneratedColumn<bool>('user_confirmed', aliasedName, false, type: DriftSqlType.bool, requiredDuringInsert: false, defaultConstraints: GeneratedColumn.constraintIsAlways('CHECK ("user_confirmed" IN (0, 1))'), defaultValue: const Constant(false));
static const VerificationMeta _isZombieMeta = const VerificationMeta('isZombie');
@override
late final GeneratedColumn<bool> isZombie = GeneratedColumn<bool>('is_zombie', aliasedName, false, type: DriftSqlType.bool, requiredDuringInsert: false, defaultConstraints: GeneratedColumn.constraintIsAlways('CHECK ("is_zombie" IN (0, 1))'), defaultValue: const Constant(false));
static const VerificationMeta _zombieReasonMeta = const VerificationMeta('zombieReason');
@override
late final GeneratedColumn<String> zombieReason = GeneratedColumn<String>('zombie_reason', aliasedName, true, type: DriftSqlType.string, requiredDuringInsert: false);
static const VerificationMeta _lastPriceHikePercentMeta = const VerificationMeta('lastPriceHikePercent');
@override
late final GeneratedColumn<double> lastPriceHikePercent = GeneratedColumn<double>('last_price_hike_percent', aliasedName, true, type: DriftSqlType.double, requiredDuringInsert: false);
static const VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
@override
late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>('created_at', aliasedName, false, type: DriftSqlType.dateTime, requiredDuringInsert: false, defaultValue: currentDateAndTime);
static const VerificationMeta _updatedAtMeta = const VerificationMeta('updatedAt');
@override
late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>('updated_at', aliasedName, true, type: DriftSqlType.dateTime, requiredDuringInsert: false);
@override
List<GeneratedColumn> get $columns => [id, serviceName, amount, nextRenewalDate, frequency, lifecycleState, categoryId, firstSeenDate, lastChargedDate, priceHistoryJson, cycleHistoryJson, frequencyConsistency, detectionSource, anomalies, isTrial, trialEndDate, chargeCount, averageDaysBetweenCharges, currency, notes, userConfirmed, isZombie, zombieReason, lastPriceHikePercent, createdAt, updatedAt];
@override
String get aliasedName => _alias ?? actualTableName;
@override
 String get actualTableName => $name;
static const String $name = 'subscriptions';
@override
VerificationContext validateIntegrity(Insertable<Subscription> instance, {bool isInserting = false}) {
final context = VerificationContext();
final data = instance.toColumns(true);
if (data.containsKey('id')) {
context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));}if (data.containsKey('service_name')) {
context.handle(_serviceNameMeta, serviceName.isAcceptableOrUnknown(data['service_name']!, _serviceNameMeta));} else if (isInserting) {
context.missing(_serviceNameMeta);
}
if (data.containsKey('amount')) {
context.handle(_amountMeta, amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));} else if (isInserting) {
context.missing(_amountMeta);
}
if (data.containsKey('next_renewal_date')) {
context.handle(_nextRenewalDateMeta, nextRenewalDate.isAcceptableOrUnknown(data['next_renewal_date']!, _nextRenewalDateMeta));} else if (isInserting) {
context.missing(_nextRenewalDateMeta);
}
if (data.containsKey('frequency')) {
context.handle(_frequencyMeta, frequency.isAcceptableOrUnknown(data['frequency']!, _frequencyMeta));} else if (isInserting) {
context.missing(_frequencyMeta);
}
if (data.containsKey('lifecycle_state')) {
context.handle(_lifecycleStateMeta, lifecycleState.isAcceptableOrUnknown(data['lifecycle_state']!, _lifecycleStateMeta));} else if (isInserting) {
context.missing(_lifecycleStateMeta);
}
if (data.containsKey('category_id')) {
context.handle(_categoryIdMeta, categoryId.isAcceptableOrUnknown(data['category_id']!, _categoryIdMeta));}if (data.containsKey('first_seen_date')) {
context.handle(_firstSeenDateMeta, firstSeenDate.isAcceptableOrUnknown(data['first_seen_date']!, _firstSeenDateMeta));} else if (isInserting) {
context.missing(_firstSeenDateMeta);
}
if (data.containsKey('last_charged_date')) {
context.handle(_lastChargedDateMeta, lastChargedDate.isAcceptableOrUnknown(data['last_charged_date']!, _lastChargedDateMeta));}if (data.containsKey('price_history_json')) {
context.handle(_priceHistoryJsonMeta, priceHistoryJson.isAcceptableOrUnknown(data['price_history_json']!, _priceHistoryJsonMeta));}if (data.containsKey('cycle_history_json')) {
context.handle(_cycleHistoryJsonMeta, cycleHistoryJson.isAcceptableOrUnknown(data['cycle_history_json']!, _cycleHistoryJsonMeta));}if (data.containsKey('frequency_consistency')) {
context.handle(_frequencyConsistencyMeta, frequencyConsistency.isAcceptableOrUnknown(data['frequency_consistency']!, _frequencyConsistencyMeta));}if (data.containsKey('detection_source')) {
context.handle(_detectionSourceMeta, detectionSource.isAcceptableOrUnknown(data['detection_source']!, _detectionSourceMeta));} else if (isInserting) {
context.missing(_detectionSourceMeta);
}
if (data.containsKey('anomalies')) {
context.handle(_anomaliesMeta, anomalies.isAcceptableOrUnknown(data['anomalies']!, _anomaliesMeta));}if (data.containsKey('is_trial')) {
context.handle(_isTrialMeta, isTrial.isAcceptableOrUnknown(data['is_trial']!, _isTrialMeta));}if (data.containsKey('trial_end_date')) {
context.handle(_trialEndDateMeta, trialEndDate.isAcceptableOrUnknown(data['trial_end_date']!, _trialEndDateMeta));}if (data.containsKey('charge_count')) {
context.handle(_chargeCountMeta, chargeCount.isAcceptableOrUnknown(data['charge_count']!, _chargeCountMeta));}if (data.containsKey('average_days_between_charges')) {
context.handle(_averageDaysBetweenChargesMeta, averageDaysBetweenCharges.isAcceptableOrUnknown(data['average_days_between_charges']!, _averageDaysBetweenChargesMeta));}if (data.containsKey('currency')) {
context.handle(_currencyMeta, currency.isAcceptableOrUnknown(data['currency']!, _currencyMeta));}if (data.containsKey('notes')) {
context.handle(_notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));}if (data.containsKey('user_confirmed')) {
context.handle(_userConfirmedMeta, userConfirmed.isAcceptableOrUnknown(data['user_confirmed']!, _userConfirmedMeta));}if (data.containsKey('is_zombie')) {
context.handle(_isZombieMeta, isZombie.isAcceptableOrUnknown(data['is_zombie']!, _isZombieMeta));}if (data.containsKey('zombie_reason')) {
context.handle(_zombieReasonMeta, zombieReason.isAcceptableOrUnknown(data['zombie_reason']!, _zombieReasonMeta));}if (data.containsKey('last_price_hike_percent')) {
context.handle(_lastPriceHikePercentMeta, lastPriceHikePercent.isAcceptableOrUnknown(data['last_price_hike_percent']!, _lastPriceHikePercentMeta));}if (data.containsKey('created_at')) {
context.handle(_createdAtMeta, createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));}if (data.containsKey('updated_at')) {
context.handle(_updatedAtMeta, updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));}return context;
}
@override
Set<GeneratedColumn> get $primaryKey => {id};
@override Subscription map(Map<String, dynamic> data, {String? tablePrefix})  {
final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';return Subscription(id: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}id'])!, serviceName: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}service_name'])!, amount: attachedDatabase.typeMapping.read(DriftSqlType.double, data['${effectivePrefix}amount'])!, nextRenewalDate: attachedDatabase.typeMapping.read(DriftSqlType.dateTime, data['${effectivePrefix}next_renewal_date'])!, frequency: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}frequency'])!, lifecycleState: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}lifecycle_state'])!, categoryId: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}category_id']), firstSeenDate: attachedDatabase.typeMapping.read(DriftSqlType.dateTime, data['${effectivePrefix}first_seen_date'])!, lastChargedDate: attachedDatabase.typeMapping.read(DriftSqlType.dateTime, data['${effectivePrefix}last_charged_date']), priceHistoryJson: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}price_history_json']), cycleHistoryJson: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}cycle_history_json']), frequencyConsistency: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}frequency_consistency'])!, detectionSource: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}detection_source'])!, anomalies: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}anomalies']), isTrial: attachedDatabase.typeMapping.read(DriftSqlType.bool, data['${effectivePrefix}is_trial'])!, trialEndDate: attachedDatabase.typeMapping.read(DriftSqlType.dateTime, data['${effectivePrefix}trial_end_date']), chargeCount: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}charge_count'])!, averageDaysBetweenCharges: attachedDatabase.typeMapping.read(DriftSqlType.double, data['${effectivePrefix}average_days_between_charges']), currency: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}currency'])!, notes: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}notes']), userConfirmed: attachedDatabase.typeMapping.read(DriftSqlType.bool, data['${effectivePrefix}user_confirmed'])!, isZombie: attachedDatabase.typeMapping.read(DriftSqlType.bool, data['${effectivePrefix}is_zombie'])!, zombieReason: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}zombie_reason']), lastPriceHikePercent: attachedDatabase.typeMapping.read(DriftSqlType.double, data['${effectivePrefix}last_price_hike_percent']), createdAt: attachedDatabase.typeMapping.read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!, updatedAt: attachedDatabase.typeMapping.read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at']), );
}
@override
$SubscriptionsTable createAlias(String alias) {
return $SubscriptionsTable(attachedDatabase, alias);}}class Subscription extends DataClass implements Insertable<Subscription> 
{
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
const Subscription({required this.id, required this.serviceName, required this.amount, required this.nextRenewalDate, required this.frequency, required this.lifecycleState, this.categoryId, required this.firstSeenDate, this.lastChargedDate, this.priceHistoryJson, this.cycleHistoryJson, required this.frequencyConsistency, required this.detectionSource, this.anomalies, required this.isTrial, this.trialEndDate, required this.chargeCount, this.averageDaysBetweenCharges, required this.currency, this.notes, required this.userConfirmed, required this.isZombie, this.zombieReason, this.lastPriceHikePercent, required this.createdAt, this.updatedAt});@override
Map<String, Expression> toColumns(bool nullToAbsent) {
final map = <String, Expression> {};map['id'] = Variable<int>(id);
map['service_name'] = Variable<String>(serviceName);
map['amount'] = Variable<double>(amount);
map['next_renewal_date'] = Variable<DateTime>(nextRenewalDate);
map['frequency'] = Variable<int>(frequency);
map['lifecycle_state'] = Variable<int>(lifecycleState);
if (!nullToAbsent || categoryId != null){map['category_id'] = Variable<int>(categoryId);
}map['first_seen_date'] = Variable<DateTime>(firstSeenDate);
if (!nullToAbsent || lastChargedDate != null){map['last_charged_date'] = Variable<DateTime>(lastChargedDate);
}if (!nullToAbsent || priceHistoryJson != null){map['price_history_json'] = Variable<String>(priceHistoryJson);
}if (!nullToAbsent || cycleHistoryJson != null){map['cycle_history_json'] = Variable<String>(cycleHistoryJson);
}map['frequency_consistency'] = Variable<int>(frequencyConsistency);
map['detection_source'] = Variable<int>(detectionSource);
if (!nullToAbsent || anomalies != null){map['anomalies'] = Variable<String>(anomalies);
}map['is_trial'] = Variable<bool>(isTrial);
if (!nullToAbsent || trialEndDate != null){map['trial_end_date'] = Variable<DateTime>(trialEndDate);
}map['charge_count'] = Variable<int>(chargeCount);
if (!nullToAbsent || averageDaysBetweenCharges != null){map['average_days_between_charges'] = Variable<double>(averageDaysBetweenCharges);
}map['currency'] = Variable<String>(currency);
if (!nullToAbsent || notes != null){map['notes'] = Variable<String>(notes);
}map['user_confirmed'] = Variable<bool>(userConfirmed);
map['is_zombie'] = Variable<bool>(isZombie);
if (!nullToAbsent || zombieReason != null){map['zombie_reason'] = Variable<String>(zombieReason);
}if (!nullToAbsent || lastPriceHikePercent != null){map['last_price_hike_percent'] = Variable<double>(lastPriceHikePercent);
}map['created_at'] = Variable<DateTime>(createdAt);
if (!nullToAbsent || updatedAt != null){map['updated_at'] = Variable<DateTime>(updatedAt);
}return map; 
}
SubscriptionsCompanion toCompanion(bool nullToAbsent) {
return SubscriptionsCompanion(id: Value(id),serviceName: Value(serviceName),amount: Value(amount),nextRenewalDate: Value(nextRenewalDate),frequency: Value(frequency),lifecycleState: Value(lifecycleState),categoryId: categoryId == null && nullToAbsent ? const Value.absent() : Value(categoryId),firstSeenDate: Value(firstSeenDate),lastChargedDate: lastChargedDate == null && nullToAbsent ? const Value.absent() : Value(lastChargedDate),priceHistoryJson: priceHistoryJson == null && nullToAbsent ? const Value.absent() : Value(priceHistoryJson),cycleHistoryJson: cycleHistoryJson == null && nullToAbsent ? const Value.absent() : Value(cycleHistoryJson),frequencyConsistency: Value(frequencyConsistency),detectionSource: Value(detectionSource),anomalies: anomalies == null && nullToAbsent ? const Value.absent() : Value(anomalies),isTrial: Value(isTrial),trialEndDate: trialEndDate == null && nullToAbsent ? const Value.absent() : Value(trialEndDate),chargeCount: Value(chargeCount),averageDaysBetweenCharges: averageDaysBetweenCharges == null && nullToAbsent ? const Value.absent() : Value(averageDaysBetweenCharges),currency: Value(currency),notes: notes == null && nullToAbsent ? const Value.absent() : Value(notes),userConfirmed: Value(userConfirmed),isZombie: Value(isZombie),zombieReason: zombieReason == null && nullToAbsent ? const Value.absent() : Value(zombieReason),lastPriceHikePercent: lastPriceHikePercent == null && nullToAbsent ? const Value.absent() : Value(lastPriceHikePercent),createdAt: Value(createdAt),updatedAt: updatedAt == null && nullToAbsent ? const Value.absent() : Value(updatedAt),);
}
factory Subscription.fromJson(Map<String, dynamic> json, {ValueSerializer? serializer}) {
serializer ??= driftRuntimeOptions.defaultSerializer;
return Subscription(id: serializer.fromJson<int>(json['id']),serviceName: serializer.fromJson<String>(json['serviceName']),amount: serializer.fromJson<double>(json['amount']),nextRenewalDate: serializer.fromJson<DateTime>(json['nextRenewalDate']),frequency: serializer.fromJson<int>(json['frequency']),lifecycleState: serializer.fromJson<int>(json['lifecycleState']),categoryId: serializer.fromJson<int?>(json['categoryId']),firstSeenDate: serializer.fromJson<DateTime>(json['firstSeenDate']),lastChargedDate: serializer.fromJson<DateTime?>(json['lastChargedDate']),priceHistoryJson: serializer.fromJson<String?>(json['priceHistoryJson']),cycleHistoryJson: serializer.fromJson<String?>(json['cycleHistoryJson']),frequencyConsistency: serializer.fromJson<int>(json['frequencyConsistency']),detectionSource: serializer.fromJson<int>(json['detectionSource']),anomalies: serializer.fromJson<String?>(json['anomalies']),isTrial: serializer.fromJson<bool>(json['isTrial']),trialEndDate: serializer.fromJson<DateTime?>(json['trialEndDate']),chargeCount: serializer.fromJson<int>(json['chargeCount']),averageDaysBetweenCharges: serializer.fromJson<double?>(json['averageDaysBetweenCharges']),currency: serializer.fromJson<String>(json['currency']),notes: serializer.fromJson<String?>(json['notes']),userConfirmed: serializer.fromJson<bool>(json['userConfirmed']),isZombie: serializer.fromJson<bool>(json['isZombie']),zombieReason: serializer.fromJson<String?>(json['zombieReason']),lastPriceHikePercent: serializer.fromJson<double?>(json['lastPriceHikePercent']),createdAt: serializer.fromJson<DateTime>(json['createdAt']),updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),);}
@override Map<String, dynamic> toJson({ValueSerializer? serializer}) {
serializer ??= driftRuntimeOptions.defaultSerializer;
return <String, dynamic>{
'id': serializer.toJson<int>(id),'serviceName': serializer.toJson<String>(serviceName),'amount': serializer.toJson<double>(amount),'nextRenewalDate': serializer.toJson<DateTime>(nextRenewalDate),'frequency': serializer.toJson<int>(frequency),'lifecycleState': serializer.toJson<int>(lifecycleState),'categoryId': serializer.toJson<int?>(categoryId),'firstSeenDate': serializer.toJson<DateTime>(firstSeenDate),'lastChargedDate': serializer.toJson<DateTime?>(lastChargedDate),'priceHistoryJson': serializer.toJson<String?>(priceHistoryJson),'cycleHistoryJson': serializer.toJson<String?>(cycleHistoryJson),'frequencyConsistency': serializer.toJson<int>(frequencyConsistency),'detectionSource': serializer.toJson<int>(detectionSource),'anomalies': serializer.toJson<String?>(anomalies),'isTrial': serializer.toJson<bool>(isTrial),'trialEndDate': serializer.toJson<DateTime?>(trialEndDate),'chargeCount': serializer.toJson<int>(chargeCount),'averageDaysBetweenCharges': serializer.toJson<double?>(averageDaysBetweenCharges),'currency': serializer.toJson<String>(currency),'notes': serializer.toJson<String?>(notes),'userConfirmed': serializer.toJson<bool>(userConfirmed),'isZombie': serializer.toJson<bool>(isZombie),'zombieReason': serializer.toJson<String?>(zombieReason),'lastPriceHikePercent': serializer.toJson<double?>(lastPriceHikePercent),'createdAt': serializer.toJson<DateTime>(createdAt),'updatedAt': serializer.toJson<DateTime?>(updatedAt),};}Subscription copyWith({int? id,String? serviceName,double? amount,DateTime? nextRenewalDate,int? frequency,int? lifecycleState,Value<int?> categoryId = const Value.absent(),DateTime? firstSeenDate,Value<DateTime?> lastChargedDate = const Value.absent(),Value<String?> priceHistoryJson = const Value.absent(),Value<String?> cycleHistoryJson = const Value.absent(),int? frequencyConsistency,int? detectionSource,Value<String?> anomalies = const Value.absent(),bool? isTrial,Value<DateTime?> trialEndDate = const Value.absent(),int? chargeCount,Value<double?> averageDaysBetweenCharges = const Value.absent(),String? currency,Value<String?> notes = const Value.absent(),bool? userConfirmed,bool? isZombie,Value<String?> zombieReason = const Value.absent(),Value<double?> lastPriceHikePercent = const Value.absent(),DateTime? createdAt,Value<DateTime?> updatedAt = const Value.absent()}) => Subscription(id: id ?? this.id,serviceName: serviceName ?? this.serviceName,amount: amount ?? this.amount,nextRenewalDate: nextRenewalDate ?? this.nextRenewalDate,frequency: frequency ?? this.frequency,lifecycleState: lifecycleState ?? this.lifecycleState,categoryId: categoryId.present ? categoryId.value : this.categoryId,firstSeenDate: firstSeenDate ?? this.firstSeenDate,lastChargedDate: lastChargedDate.present ? lastChargedDate.value : this.lastChargedDate,priceHistoryJson: priceHistoryJson.present ? priceHistoryJson.value : this.priceHistoryJson,cycleHistoryJson: cycleHistoryJson.present ? cycleHistoryJson.value : this.cycleHistoryJson,frequencyConsistency: frequencyConsistency ?? this.frequencyConsistency,detectionSource: detectionSource ?? this.detectionSource,anomalies: anomalies.present ? anomalies.value : this.anomalies,isTrial: isTrial ?? this.isTrial,trialEndDate: trialEndDate.present ? trialEndDate.value : this.trialEndDate,chargeCount: chargeCount ?? this.chargeCount,averageDaysBetweenCharges: averageDaysBetweenCharges.present ? averageDaysBetweenCharges.value : this.averageDaysBetweenCharges,currency: currency ?? this.currency,notes: notes.present ? notes.value : this.notes,userConfirmed: userConfirmed ?? this.userConfirmed,isZombie: isZombie ?? this.isZombie,zombieReason: zombieReason.present ? zombieReason.value : this.zombieReason,lastPriceHikePercent: lastPriceHikePercent.present ? lastPriceHikePercent.value : this.lastPriceHikePercent,createdAt: createdAt ?? this.createdAt,updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,);Subscription copyWithCompanion(SubscriptionsCompanion data) {
return Subscription(
id: data.id.present ? data.id.value : this.id,serviceName: data.serviceName.present ? data.serviceName.value : this.serviceName,amount: data.amount.present ? data.amount.value : this.amount,nextRenewalDate: data.nextRenewalDate.present ? data.nextRenewalDate.value : this.nextRenewalDate,frequency: data.frequency.present ? data.frequency.value : this.frequency,lifecycleState: data.lifecycleState.present ? data.lifecycleState.value : this.lifecycleState,categoryId: data.categoryId.present ? data.categoryId.value : this.categoryId,firstSeenDate: data.firstSeenDate.present ? data.firstSeenDate.value : this.firstSeenDate,lastChargedDate: data.lastChargedDate.present ? data.lastChargedDate.value : this.lastChargedDate,priceHistoryJson: data.priceHistoryJson.present ? data.priceHistoryJson.value : this.priceHistoryJson,cycleHistoryJson: data.cycleHistoryJson.present ? data.cycleHistoryJson.value : this.cycleHistoryJson,frequencyConsistency: data.frequencyConsistency.present ? data.frequencyConsistency.value : this.frequencyConsistency,detectionSource: data.detectionSource.present ? data.detectionSource.value : this.detectionSource,anomalies: data.anomalies.present ? data.anomalies.value : this.anomalies,isTrial: data.isTrial.present ? data.isTrial.value : this.isTrial,trialEndDate: data.trialEndDate.present ? data.trialEndDate.value : this.trialEndDate,chargeCount: data.chargeCount.present ? data.chargeCount.value : this.chargeCount,averageDaysBetweenCharges: data.averageDaysBetweenCharges.present ? data.averageDaysBetweenCharges.value : this.averageDaysBetweenCharges,currency: data.currency.present ? data.currency.value : this.currency,notes: data.notes.present ? data.notes.value : this.notes,userConfirmed: data.userConfirmed.present ? data.userConfirmed.value : this.userConfirmed,isZombie: data.isZombie.present ? data.isZombie.value : this.isZombie,zombieReason: data.zombieReason.present ? data.zombieReason.value : this.zombieReason,lastPriceHikePercent: data.lastPriceHikePercent.present ? data.lastPriceHikePercent.value : this.lastPriceHikePercent,createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,);
}
@override
String toString() {return (StringBuffer('Subscription(')..write('id: $id, ')..write('serviceName: $serviceName, ')..write('amount: $amount, ')..write('nextRenewalDate: $nextRenewalDate, ')..write('frequency: $frequency, ')..write('lifecycleState: $lifecycleState, ')..write('categoryId: $categoryId, ')..write('firstSeenDate: $firstSeenDate, ')..write('lastChargedDate: $lastChargedDate, ')..write('priceHistoryJson: $priceHistoryJson, ')..write('cycleHistoryJson: $cycleHistoryJson, ')..write('frequencyConsistency: $frequencyConsistency, ')..write('detectionSource: $detectionSource, ')..write('anomalies: $anomalies, ')..write('isTrial: $isTrial, ')..write('trialEndDate: $trialEndDate, ')..write('chargeCount: $chargeCount, ')..write('averageDaysBetweenCharges: $averageDaysBetweenCharges, ')..write('currency: $currency, ')..write('notes: $notes, ')..write('userConfirmed: $userConfirmed, ')..write('isZombie: $isZombie, ')..write('zombieReason: $zombieReason, ')..write('lastPriceHikePercent: $lastPriceHikePercent, ')..write('createdAt: $createdAt, ')..write('updatedAt: $updatedAt')..write(')')).toString();}
@override
 int get hashCode => Object.hashAll([id, serviceName, amount, nextRenewalDate, frequency, lifecycleState, categoryId, firstSeenDate, lastChargedDate, priceHistoryJson, cycleHistoryJson, frequencyConsistency, detectionSource, anomalies, isTrial, trialEndDate, chargeCount, averageDaysBetweenCharges, currency, notes, userConfirmed, isZombie, zombieReason, lastPriceHikePercent, createdAt, updatedAt]);@override
bool operator ==(Object other) => identical(this, other) || (other is Subscription && other.id == this.id && other.serviceName == this.serviceName && other.amount == this.amount && other.nextRenewalDate == this.nextRenewalDate && other.frequency == this.frequency && other.lifecycleState == this.lifecycleState && other.categoryId == this.categoryId && other.firstSeenDate == this.firstSeenDate && other.lastChargedDate == this.lastChargedDate && other.priceHistoryJson == this.priceHistoryJson && other.cycleHistoryJson == this.cycleHistoryJson && other.frequencyConsistency == this.frequencyConsistency && other.detectionSource == this.detectionSource && other.anomalies == this.anomalies && other.isTrial == this.isTrial && other.trialEndDate == this.trialEndDate && other.chargeCount == this.chargeCount && other.averageDaysBetweenCharges == this.averageDaysBetweenCharges && other.currency == this.currency && other.notes == this.notes && other.userConfirmed == this.userConfirmed && other.isZombie == this.isZombie && other.zombieReason == this.zombieReason && other.lastPriceHikePercent == this.lastPriceHikePercent && other.createdAt == this.createdAt && other.updatedAt == this.updatedAt);
}class SubscriptionsCompanion extends UpdateCompanion<Subscription> {
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
const SubscriptionsCompanion({this.id = const Value.absent(),this.serviceName = const Value.absent(),this.amount = const Value.absent(),this.nextRenewalDate = const Value.absent(),this.frequency = const Value.absent(),this.lifecycleState = const Value.absent(),this.categoryId = const Value.absent(),this.firstSeenDate = const Value.absent(),this.lastChargedDate = const Value.absent(),this.priceHistoryJson = const Value.absent(),this.cycleHistoryJson = const Value.absent(),this.frequencyConsistency = const Value.absent(),this.detectionSource = const Value.absent(),this.anomalies = const Value.absent(),this.isTrial = const Value.absent(),this.trialEndDate = const Value.absent(),this.chargeCount = const Value.absent(),this.averageDaysBetweenCharges = const Value.absent(),this.currency = const Value.absent(),this.notes = const Value.absent(),this.userConfirmed = const Value.absent(),this.isZombie = const Value.absent(),this.zombieReason = const Value.absent(),this.lastPriceHikePercent = const Value.absent(),this.createdAt = const Value.absent(),this.updatedAt = const Value.absent(),});
SubscriptionsCompanion.insert({this.id = const Value.absent(),required String serviceName,required double amount,required DateTime nextRenewalDate,required int frequency,required int lifecycleState,this.categoryId = const Value.absent(),required DateTime firstSeenDate,this.lastChargedDate = const Value.absent(),this.priceHistoryJson = const Value.absent(),this.cycleHistoryJson = const Value.absent(),this.frequencyConsistency = const Value.absent(),required int detectionSource,this.anomalies = const Value.absent(),this.isTrial = const Value.absent(),this.trialEndDate = const Value.absent(),this.chargeCount = const Value.absent(),this.averageDaysBetweenCharges = const Value.absent(),this.currency = const Value.absent(),this.notes = const Value.absent(),this.userConfirmed = const Value.absent(),this.isZombie = const Value.absent(),this.zombieReason = const Value.absent(),this.lastPriceHikePercent = const Value.absent(),this.createdAt = const Value.absent(),this.updatedAt = const Value.absent(),}): serviceName = Value(serviceName), amount = Value(amount), nextRenewalDate = Value(nextRenewalDate), frequency = Value(frequency), lifecycleState = Value(lifecycleState), firstSeenDate = Value(firstSeenDate), detectionSource = Value(detectionSource);
static Insertable<Subscription> custom({Expression<int>? id, 
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
return RawValuesInsertable({if (id != null)'id': id,if (serviceName != null)'service_name': serviceName,if (amount != null)'amount': amount,if (nextRenewalDate != null)'next_renewal_date': nextRenewalDate,if (frequency != null)'frequency': frequency,if (lifecycleState != null)'lifecycle_state': lifecycleState,if (categoryId != null)'category_id': categoryId,if (firstSeenDate != null)'first_seen_date': firstSeenDate,if (lastChargedDate != null)'last_charged_date': lastChargedDate,if (priceHistoryJson != null)'price_history_json': priceHistoryJson,if (cycleHistoryJson != null)'cycle_history_json': cycleHistoryJson,if (frequencyConsistency != null)'frequency_consistency': frequencyConsistency,if (detectionSource != null)'detection_source': detectionSource,if (anomalies != null)'anomalies': anomalies,if (isTrial != null)'is_trial': isTrial,if (trialEndDate != null)'trial_end_date': trialEndDate,if (chargeCount != null)'charge_count': chargeCount,if (averageDaysBetweenCharges != null)'average_days_between_charges': averageDaysBetweenCharges,if (currency != null)'currency': currency,if (notes != null)'notes': notes,if (userConfirmed != null)'user_confirmed': userConfirmed,if (isZombie != null)'is_zombie': isZombie,if (zombieReason != null)'zombie_reason': zombieReason,if (lastPriceHikePercent != null)'last_price_hike_percent': lastPriceHikePercent,if (createdAt != null)'created_at': createdAt,if (updatedAt != null)'updated_at': updatedAt,});
}SubscriptionsCompanion copyWith({Value<int>? id, Value<String>? serviceName, Value<double>? amount, Value<DateTime>? nextRenewalDate, Value<int>? frequency, Value<int>? lifecycleState, Value<int?>? categoryId, Value<DateTime>? firstSeenDate, Value<DateTime?>? lastChargedDate, Value<String?>? priceHistoryJson, Value<String?>? cycleHistoryJson, Value<int>? frequencyConsistency, Value<int>? detectionSource, Value<String?>? anomalies, Value<bool>? isTrial, Value<DateTime?>? trialEndDate, Value<int>? chargeCount, Value<double?>? averageDaysBetweenCharges, Value<String>? currency, Value<String?>? notes, Value<bool>? userConfirmed, Value<bool>? isZombie, Value<String?>? zombieReason, Value<double?>? lastPriceHikePercent, Value<DateTime>? createdAt, Value<DateTime?>? updatedAt}) {
return SubscriptionsCompanion(id: id ?? this.id,serviceName: serviceName ?? this.serviceName,amount: amount ?? this.amount,nextRenewalDate: nextRenewalDate ?? this.nextRenewalDate,frequency: frequency ?? this.frequency,lifecycleState: lifecycleState ?? this.lifecycleState,categoryId: categoryId ?? this.categoryId,firstSeenDate: firstSeenDate ?? this.firstSeenDate,lastChargedDate: lastChargedDate ?? this.lastChargedDate,priceHistoryJson: priceHistoryJson ?? this.priceHistoryJson,cycleHistoryJson: cycleHistoryJson ?? this.cycleHistoryJson,frequencyConsistency: frequencyConsistency ?? this.frequencyConsistency,detectionSource: detectionSource ?? this.detectionSource,anomalies: anomalies ?? this.anomalies,isTrial: isTrial ?? this.isTrial,trialEndDate: trialEndDate ?? this.trialEndDate,chargeCount: chargeCount ?? this.chargeCount,averageDaysBetweenCharges: averageDaysBetweenCharges ?? this.averageDaysBetweenCharges,currency: currency ?? this.currency,notes: notes ?? this.notes,userConfirmed: userConfirmed ?? this.userConfirmed,isZombie: isZombie ?? this.isZombie,zombieReason: zombieReason ?? this.zombieReason,lastPriceHikePercent: lastPriceHikePercent ?? this.lastPriceHikePercent,createdAt: createdAt ?? this.createdAt,updatedAt: updatedAt ?? this.updatedAt,);
}
@override
Map<String, Expression> toColumns(bool nullToAbsent) {
final map = <String, Expression> {};if (id.present) {
map['id'] = Variable<int>(id.value);}
if (serviceName.present) {
map['service_name'] = Variable<String>(serviceName.value);}
if (amount.present) {
map['amount'] = Variable<double>(amount.value);}
if (nextRenewalDate.present) {
map['next_renewal_date'] = Variable<DateTime>(nextRenewalDate.value);}
if (frequency.present) {
map['frequency'] = Variable<int>(frequency.value);}
if (lifecycleState.present) {
map['lifecycle_state'] = Variable<int>(lifecycleState.value);}
if (categoryId.present) {
map['category_id'] = Variable<int>(categoryId.value);}
if (firstSeenDate.present) {
map['first_seen_date'] = Variable<DateTime>(firstSeenDate.value);}
if (lastChargedDate.present) {
map['last_charged_date'] = Variable<DateTime>(lastChargedDate.value);}
if (priceHistoryJson.present) {
map['price_history_json'] = Variable<String>(priceHistoryJson.value);}
if (cycleHistoryJson.present) {
map['cycle_history_json'] = Variable<String>(cycleHistoryJson.value);}
if (frequencyConsistency.present) {
map['frequency_consistency'] = Variable<int>(frequencyConsistency.value);}
if (detectionSource.present) {
map['detection_source'] = Variable<int>(detectionSource.value);}
if (anomalies.present) {
map['anomalies'] = Variable<String>(anomalies.value);}
if (isTrial.present) {
map['is_trial'] = Variable<bool>(isTrial.value);}
if (trialEndDate.present) {
map['trial_end_date'] = Variable<DateTime>(trialEndDate.value);}
if (chargeCount.present) {
map['charge_count'] = Variable<int>(chargeCount.value);}
if (averageDaysBetweenCharges.present) {
map['average_days_between_charges'] = Variable<double>(averageDaysBetweenCharges.value);}
if (currency.present) {
map['currency'] = Variable<String>(currency.value);}
if (notes.present) {
map['notes'] = Variable<String>(notes.value);}
if (userConfirmed.present) {
map['user_confirmed'] = Variable<bool>(userConfirmed.value);}
if (isZombie.present) {
map['is_zombie'] = Variable<bool>(isZombie.value);}
if (zombieReason.present) {
map['zombie_reason'] = Variable<String>(zombieReason.value);}
if (lastPriceHikePercent.present) {
map['last_price_hike_percent'] = Variable<double>(lastPriceHikePercent.value);}
if (createdAt.present) {
map['created_at'] = Variable<DateTime>(createdAt.value);}
if (updatedAt.present) {
map['updated_at'] = Variable<DateTime>(updatedAt.value);}
return map; 
}
@override
String toString() {return (StringBuffer('SubscriptionsCompanion(')..write('id: $id, ')..write('serviceName: $serviceName, ')..write('amount: $amount, ')..write('nextRenewalDate: $nextRenewalDate, ')..write('frequency: $frequency, ')..write('lifecycleState: $lifecycleState, ')..write('categoryId: $categoryId, ')..write('firstSeenDate: $firstSeenDate, ')..write('lastChargedDate: $lastChargedDate, ')..write('priceHistoryJson: $priceHistoryJson, ')..write('cycleHistoryJson: $cycleHistoryJson, ')..write('frequencyConsistency: $frequencyConsistency, ')..write('detectionSource: $detectionSource, ')..write('anomalies: $anomalies, ')..write('isTrial: $isTrial, ')..write('trialEndDate: $trialEndDate, ')..write('chargeCount: $chargeCount, ')..write('averageDaysBetweenCharges: $averageDaysBetweenCharges, ')..write('currency: $currency, ')..write('notes: $notes, ')..write('userConfirmed: $userConfirmed, ')..write('isZombie: $isZombie, ')..write('zombieReason: $zombieReason, ')..write('lastPriceHikePercent: $lastPriceHikePercent, ')..write('createdAt: $createdAt, ')..write('updatedAt: $updatedAt')..write(')')).toString();}
}
class $MappingsTable extends Mappings with TableInfo<$MappingsTable, Mapping>{
@override final GeneratedDatabase attachedDatabase;
final String? _alias;
$MappingsTable(this.attachedDatabase, [this._alias]);
static const VerificationMeta _idMeta = const VerificationMeta('id');
@override
late final GeneratedColumn<int> id = GeneratedColumn<int>('id', aliasedName, false, hasAutoIncrement: true, type: DriftSqlType.int, requiredDuringInsert: false, defaultConstraints: GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
static const VerificationMeta _merchantNameMeta = const VerificationMeta('merchantName');
@override
late final GeneratedColumn<String> merchantName = GeneratedColumn<String>('merchant_name', aliasedName, false, additionalChecks: GeneratedColumn.checkTextLength(minTextLength: 1,maxTextLength: 200), type: DriftSqlType.string, requiredDuringInsert: true);
static const VerificationMeta _categoryIdMeta = const VerificationMeta('categoryId');
@override
late final GeneratedColumn<int> categoryId = GeneratedColumn<int>('category_id', aliasedName, false, type: DriftSqlType.int, requiredDuringInsert: true, defaultConstraints: GeneratedColumn.constraintIsAlways('REFERENCES categories (id)'));
static const VerificationMeta _isAutomaticMeta = const VerificationMeta('isAutomatic');
@override
late final GeneratedColumn<bool> isAutomatic = GeneratedColumn<bool>('is_automatic', aliasedName, false, type: DriftSqlType.bool, requiredDuringInsert: false, defaultConstraints: GeneratedColumn.constraintIsAlways('CHECK ("is_automatic" IN (0, 1))'), defaultValue: const Constant(true));
static const VerificationMeta _confidenceMeta = const VerificationMeta('confidence');
@override
late final GeneratedColumn<int> confidence = GeneratedColumn<int>('confidence', aliasedName, false, type: DriftSqlType.int, requiredDuringInsert: false, defaultValue: const Constant(100));
static const VerificationMeta _userConfirmedMeta = const VerificationMeta('userConfirmed');
@override
late final GeneratedColumn<bool> userConfirmed = GeneratedColumn<bool>('user_confirmed', aliasedName, false, type: DriftSqlType.bool, requiredDuringInsert: false, defaultConstraints: GeneratedColumn.constraintIsAlways('CHECK ("user_confirmed" IN (0, 1))'), defaultValue: const Constant(false));
static const VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
@override
late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>('created_at', aliasedName, false, type: DriftSqlType.dateTime, requiredDuringInsert: false, defaultValue: currentDateAndTime);
static const VerificationMeta _updatedAtMeta = const VerificationMeta('updatedAt');
@override
late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>('updated_at', aliasedName, true, type: DriftSqlType.dateTime, requiredDuringInsert: false);
@override
List<GeneratedColumn> get $columns => [id, merchantName, categoryId, isAutomatic, confidence, userConfirmed, createdAt, updatedAt];
@override
String get aliasedName => _alias ?? actualTableName;
@override
 String get actualTableName => $name;
static const String $name = 'mappings';
@override
VerificationContext validateIntegrity(Insertable<Mapping> instance, {bool isInserting = false}) {
final context = VerificationContext();
final data = instance.toColumns(true);
if (data.containsKey('id')) {
context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));}if (data.containsKey('merchant_name')) {
context.handle(_merchantNameMeta, merchantName.isAcceptableOrUnknown(data['merchant_name']!, _merchantNameMeta));} else if (isInserting) {
context.missing(_merchantNameMeta);
}
if (data.containsKey('category_id')) {
context.handle(_categoryIdMeta, categoryId.isAcceptableOrUnknown(data['category_id']!, _categoryIdMeta));} else if (isInserting) {
context.missing(_categoryIdMeta);
}
if (data.containsKey('is_automatic')) {
context.handle(_isAutomaticMeta, isAutomatic.isAcceptableOrUnknown(data['is_automatic']!, _isAutomaticMeta));}if (data.containsKey('confidence')) {
context.handle(_confidenceMeta, confidence.isAcceptableOrUnknown(data['confidence']!, _confidenceMeta));}if (data.containsKey('user_confirmed')) {
context.handle(_userConfirmedMeta, userConfirmed.isAcceptableOrUnknown(data['user_confirmed']!, _userConfirmedMeta));}if (data.containsKey('created_at')) {
context.handle(_createdAtMeta, createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));}if (data.containsKey('updated_at')) {
context.handle(_updatedAtMeta, updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));}return context;
}
@override
Set<GeneratedColumn> get $primaryKey => {id};
@override Mapping map(Map<String, dynamic> data, {String? tablePrefix})  {
final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';return Mapping(id: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}id'])!, merchantName: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}merchant_name'])!, categoryId: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}category_id'])!, isAutomatic: attachedDatabase.typeMapping.read(DriftSqlType.bool, data['${effectivePrefix}is_automatic'])!, confidence: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}confidence'])!, userConfirmed: attachedDatabase.typeMapping.read(DriftSqlType.bool, data['${effectivePrefix}user_confirmed'])!, createdAt: attachedDatabase.typeMapping.read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!, updatedAt: attachedDatabase.typeMapping.read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at']), );
}
@override
$MappingsTable createAlias(String alias) {
return $MappingsTable(attachedDatabase, alias);}}class Mapping extends DataClass implements Insertable<Mapping> 
{
final int id;
final String merchantName;
final int categoryId;
final bool isAutomatic;
final int confidence;
final bool userConfirmed;
final DateTime createdAt;
final DateTime? updatedAt;
const Mapping({required this.id, required this.merchantName, required this.categoryId, required this.isAutomatic, required this.confidence, required this.userConfirmed, required this.createdAt, this.updatedAt});@override
Map<String, Expression> toColumns(bool nullToAbsent) {
final map = <String, Expression> {};map['id'] = Variable<int>(id);
map['merchant_name'] = Variable<String>(merchantName);
map['category_id'] = Variable<int>(categoryId);
map['is_automatic'] = Variable<bool>(isAutomatic);
map['confidence'] = Variable<int>(confidence);
map['user_confirmed'] = Variable<bool>(userConfirmed);
map['created_at'] = Variable<DateTime>(createdAt);
if (!nullToAbsent || updatedAt != null){map['updated_at'] = Variable<DateTime>(updatedAt);
}return map; 
}
MappingsCompanion toCompanion(bool nullToAbsent) {
return MappingsCompanion(id: Value(id),merchantName: Value(merchantName),categoryId: Value(categoryId),isAutomatic: Value(isAutomatic),confidence: Value(confidence),userConfirmed: Value(userConfirmed),createdAt: Value(createdAt),updatedAt: updatedAt == null && nullToAbsent ? const Value.absent() : Value(updatedAt),);
}
factory Mapping.fromJson(Map<String, dynamic> json, {ValueSerializer? serializer}) {
serializer ??= driftRuntimeOptions.defaultSerializer;
return Mapping(id: serializer.fromJson<int>(json['id']),merchantName: serializer.fromJson<String>(json['merchantName']),categoryId: serializer.fromJson<int>(json['categoryId']),isAutomatic: serializer.fromJson<bool>(json['isAutomatic']),confidence: serializer.fromJson<int>(json['confidence']),userConfirmed: serializer.fromJson<bool>(json['userConfirmed']),createdAt: serializer.fromJson<DateTime>(json['createdAt']),updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),);}
@override Map<String, dynamic> toJson({ValueSerializer? serializer}) {
serializer ??= driftRuntimeOptions.defaultSerializer;
return <String, dynamic>{
'id': serializer.toJson<int>(id),'merchantName': serializer.toJson<String>(merchantName),'categoryId': serializer.toJson<int>(categoryId),'isAutomatic': serializer.toJson<bool>(isAutomatic),'confidence': serializer.toJson<int>(confidence),'userConfirmed': serializer.toJson<bool>(userConfirmed),'createdAt': serializer.toJson<DateTime>(createdAt),'updatedAt': serializer.toJson<DateTime?>(updatedAt),};}Mapping copyWith({int? id,String? merchantName,int? categoryId,bool? isAutomatic,int? confidence,bool? userConfirmed,DateTime? createdAt,Value<DateTime?> updatedAt = const Value.absent()}) => Mapping(id: id ?? this.id,merchantName: merchantName ?? this.merchantName,categoryId: categoryId ?? this.categoryId,isAutomatic: isAutomatic ?? this.isAutomatic,confidence: confidence ?? this.confidence,userConfirmed: userConfirmed ?? this.userConfirmed,createdAt: createdAt ?? this.createdAt,updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,);Mapping copyWithCompanion(MappingsCompanion data) {
return Mapping(
id: data.id.present ? data.id.value : this.id,merchantName: data.merchantName.present ? data.merchantName.value : this.merchantName,categoryId: data.categoryId.present ? data.categoryId.value : this.categoryId,isAutomatic: data.isAutomatic.present ? data.isAutomatic.value : this.isAutomatic,confidence: data.confidence.present ? data.confidence.value : this.confidence,userConfirmed: data.userConfirmed.present ? data.userConfirmed.value : this.userConfirmed,createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,);
}
@override
String toString() {return (StringBuffer('Mapping(')..write('id: $id, ')..write('merchantName: $merchantName, ')..write('categoryId: $categoryId, ')..write('isAutomatic: $isAutomatic, ')..write('confidence: $confidence, ')..write('userConfirmed: $userConfirmed, ')..write('createdAt: $createdAt, ')..write('updatedAt: $updatedAt')..write(')')).toString();}
@override
 int get hashCode => Object.hash(id, merchantName, categoryId, isAutomatic, confidence, userConfirmed, createdAt, updatedAt);@override
bool operator ==(Object other) => identical(this, other) || (other is Mapping && other.id == this.id && other.merchantName == this.merchantName && other.categoryId == this.categoryId && other.isAutomatic == this.isAutomatic && other.confidence == this.confidence && other.userConfirmed == this.userConfirmed && other.createdAt == this.createdAt && other.updatedAt == this.updatedAt);
}class MappingsCompanion extends UpdateCompanion<Mapping> {
final Value<int> id;
final Value<String> merchantName;
final Value<int> categoryId;
final Value<bool> isAutomatic;
final Value<int> confidence;
final Value<bool> userConfirmed;
final Value<DateTime> createdAt;
final Value<DateTime?> updatedAt;
const MappingsCompanion({this.id = const Value.absent(),this.merchantName = const Value.absent(),this.categoryId = const Value.absent(),this.isAutomatic = const Value.absent(),this.confidence = const Value.absent(),this.userConfirmed = const Value.absent(),this.createdAt = const Value.absent(),this.updatedAt = const Value.absent(),});
MappingsCompanion.insert({this.id = const Value.absent(),required String merchantName,required int categoryId,this.isAutomatic = const Value.absent(),this.confidence = const Value.absent(),this.userConfirmed = const Value.absent(),this.createdAt = const Value.absent(),this.updatedAt = const Value.absent(),}): merchantName = Value(merchantName), categoryId = Value(categoryId);
static Insertable<Mapping> custom({Expression<int>? id, 
Expression<String>? merchantName, 
Expression<int>? categoryId, 
Expression<bool>? isAutomatic, 
Expression<int>? confidence, 
Expression<bool>? userConfirmed, 
Expression<DateTime>? createdAt, 
Expression<DateTime>? updatedAt, 
}) {
return RawValuesInsertable({if (id != null)'id': id,if (merchantName != null)'merchant_name': merchantName,if (categoryId != null)'category_id': categoryId,if (isAutomatic != null)'is_automatic': isAutomatic,if (confidence != null)'confidence': confidence,if (userConfirmed != null)'user_confirmed': userConfirmed,if (createdAt != null)'created_at': createdAt,if (updatedAt != null)'updated_at': updatedAt,});
}MappingsCompanion copyWith({Value<int>? id, Value<String>? merchantName, Value<int>? categoryId, Value<bool>? isAutomatic, Value<int>? confidence, Value<bool>? userConfirmed, Value<DateTime>? createdAt, Value<DateTime?>? updatedAt}) {
return MappingsCompanion(id: id ?? this.id,merchantName: merchantName ?? this.merchantName,categoryId: categoryId ?? this.categoryId,isAutomatic: isAutomatic ?? this.isAutomatic,confidence: confidence ?? this.confidence,userConfirmed: userConfirmed ?? this.userConfirmed,createdAt: createdAt ?? this.createdAt,updatedAt: updatedAt ?? this.updatedAt,);
}
@override
Map<String, Expression> toColumns(bool nullToAbsent) {
final map = <String, Expression> {};if (id.present) {
map['id'] = Variable<int>(id.value);}
if (merchantName.present) {
map['merchant_name'] = Variable<String>(merchantName.value);}
if (categoryId.present) {
map['category_id'] = Variable<int>(categoryId.value);}
if (isAutomatic.present) {
map['is_automatic'] = Variable<bool>(isAutomatic.value);}
if (confidence.present) {
map['confidence'] = Variable<int>(confidence.value);}
if (userConfirmed.present) {
map['user_confirmed'] = Variable<bool>(userConfirmed.value);}
if (createdAt.present) {
map['created_at'] = Variable<DateTime>(createdAt.value);}
if (updatedAt.present) {
map['updated_at'] = Variable<DateTime>(updatedAt.value);}
return map; 
}
@override
String toString() {return (StringBuffer('MappingsCompanion(')..write('id: $id, ')..write('merchantName: $merchantName, ')..write('categoryId: $categoryId, ')..write('isAutomatic: $isAutomatic, ')..write('confidence: $confidence, ')..write('userConfirmed: $userConfirmed, ')..write('createdAt: $createdAt, ')..write('updatedAt: $updatedAt')..write(')')).toString();}
}
class $BudgetsTable extends Budgets with TableInfo<$BudgetsTable, Budget>{
@override final GeneratedDatabase attachedDatabase;
final String? _alias;
$BudgetsTable(this.attachedDatabase, [this._alias]);
static const VerificationMeta _idMeta = const VerificationMeta('id');
@override
late final GeneratedColumn<int> id = GeneratedColumn<int>('id', aliasedName, false, hasAutoIncrement: true, type: DriftSqlType.int, requiredDuringInsert: false, defaultConstraints: GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
static const VerificationMeta _categoryIdMeta = const VerificationMeta('categoryId');
@override
late final GeneratedColumn<int> categoryId = GeneratedColumn<int>('category_id', aliasedName, true, type: DriftSqlType.int, requiredDuringInsert: false, defaultConstraints: GeneratedColumn.constraintIsAlways('REFERENCES categories (id)'));
static const VerificationMeta _limitAmountMeta = const VerificationMeta('limitAmount');
@override
late final GeneratedColumn<double> limitAmount = GeneratedColumn<double>('limit_amount', aliasedName, false, type: DriftSqlType.double, requiredDuringInsert: true);
static const VerificationMeta _periodMeta = const VerificationMeta('period');
@override
late final GeneratedColumn<int> period = GeneratedColumn<int>('period', aliasedName, false, type: DriftSqlType.int, requiredDuringInsert: false, defaultValue: const Constant(1));
static const VerificationMeta _rolloverMeta = const VerificationMeta('rollover');
@override
late final GeneratedColumn<bool> rollover = GeneratedColumn<bool>('rollover', aliasedName, false, type: DriftSqlType.bool, requiredDuringInsert: false, defaultConstraints: GeneratedColumn.constraintIsAlways('CHECK ("rollover" IN (0, 1))'), defaultValue: const Constant(false));
static const VerificationMeta _carryOverAmountMeta = const VerificationMeta('carryOverAmount');
@override
late final GeneratedColumn<double> carryOverAmount = GeneratedColumn<double>('carry_over_amount', aliasedName, false, type: DriftSqlType.double, requiredDuringInsert: false, defaultValue: const Constant(0.0));
static const VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
@override
late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>('created_at', aliasedName, false, type: DriftSqlType.dateTime, requiredDuringInsert: false, defaultValue: currentDateAndTime);
static const VerificationMeta _updatedAtMeta = const VerificationMeta('updatedAt');
@override
late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>('updated_at', aliasedName, true, type: DriftSqlType.dateTime, requiredDuringInsert: false);
@override
List<GeneratedColumn> get $columns => [id, categoryId, limitAmount, period, rollover, carryOverAmount, createdAt, updatedAt];
@override
String get aliasedName => _alias ?? actualTableName;
@override
 String get actualTableName => $name;
static const String $name = 'budgets';
@override
VerificationContext validateIntegrity(Insertable<Budget> instance, {bool isInserting = false}) {
final context = VerificationContext();
final data = instance.toColumns(true);
if (data.containsKey('id')) {
context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));}if (data.containsKey('category_id')) {
context.handle(_categoryIdMeta, categoryId.isAcceptableOrUnknown(data['category_id']!, _categoryIdMeta));}if (data.containsKey('limit_amount')) {
context.handle(_limitAmountMeta, limitAmount.isAcceptableOrUnknown(data['limit_amount']!, _limitAmountMeta));} else if (isInserting) {
context.missing(_limitAmountMeta);
}
if (data.containsKey('period')) {
context.handle(_periodMeta, period.isAcceptableOrUnknown(data['period']!, _periodMeta));}if (data.containsKey('rollover')) {
context.handle(_rolloverMeta, rollover.isAcceptableOrUnknown(data['rollover']!, _rolloverMeta));}if (data.containsKey('carry_over_amount')) {
context.handle(_carryOverAmountMeta, carryOverAmount.isAcceptableOrUnknown(data['carry_over_amount']!, _carryOverAmountMeta));}if (data.containsKey('created_at')) {
context.handle(_createdAtMeta, createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));}if (data.containsKey('updated_at')) {
context.handle(_updatedAtMeta, updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));}return context;
}
@override
Set<GeneratedColumn> get $primaryKey => {id};
@override Budget map(Map<String, dynamic> data, {String? tablePrefix})  {
final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';return Budget(id: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}id'])!, categoryId: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}category_id']), limitAmount: attachedDatabase.typeMapping.read(DriftSqlType.double, data['${effectivePrefix}limit_amount'])!, period: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}period'])!, rollover: attachedDatabase.typeMapping.read(DriftSqlType.bool, data['${effectivePrefix}rollover'])!, carryOverAmount: attachedDatabase.typeMapping.read(DriftSqlType.double, data['${effectivePrefix}carry_over_amount'])!, createdAt: attachedDatabase.typeMapping.read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!, updatedAt: attachedDatabase.typeMapping.read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at']), );
}
@override
$BudgetsTable createAlias(String alias) {
return $BudgetsTable(attachedDatabase, alias);}}class Budget extends DataClass implements Insertable<Budget> 
{
final int id;
final int? categoryId;
final double limitAmount;
final int period;
final bool rollover;
final double carryOverAmount;
final DateTime createdAt;
final DateTime? updatedAt;
const Budget({required this.id, this.categoryId, required this.limitAmount, required this.period, required this.rollover, required this.carryOverAmount, required this.createdAt, this.updatedAt});@override
Map<String, Expression> toColumns(bool nullToAbsent) {
final map = <String, Expression> {};map['id'] = Variable<int>(id);
if (!nullToAbsent || categoryId != null){map['category_id'] = Variable<int>(categoryId);
}map['limit_amount'] = Variable<double>(limitAmount);
map['period'] = Variable<int>(period);
map['rollover'] = Variable<bool>(rollover);
map['carry_over_amount'] = Variable<double>(carryOverAmount);
map['created_at'] = Variable<DateTime>(createdAt);
if (!nullToAbsent || updatedAt != null){map['updated_at'] = Variable<DateTime>(updatedAt);
}return map; 
}
BudgetsCompanion toCompanion(bool nullToAbsent) {
return BudgetsCompanion(id: Value(id),categoryId: categoryId == null && nullToAbsent ? const Value.absent() : Value(categoryId),limitAmount: Value(limitAmount),period: Value(period),rollover: Value(rollover),carryOverAmount: Value(carryOverAmount),createdAt: Value(createdAt),updatedAt: updatedAt == null && nullToAbsent ? const Value.absent() : Value(updatedAt),);
}
factory Budget.fromJson(Map<String, dynamic> json, {ValueSerializer? serializer}) {
serializer ??= driftRuntimeOptions.defaultSerializer;
return Budget(id: serializer.fromJson<int>(json['id']),categoryId: serializer.fromJson<int?>(json['categoryId']),limitAmount: serializer.fromJson<double>(json['limitAmount']),period: serializer.fromJson<int>(json['period']),rollover: serializer.fromJson<bool>(json['rollover']),carryOverAmount: serializer.fromJson<double>(json['carryOverAmount']),createdAt: serializer.fromJson<DateTime>(json['createdAt']),updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),);}
@override Map<String, dynamic> toJson({ValueSerializer? serializer}) {
serializer ??= driftRuntimeOptions.defaultSerializer;
return <String, dynamic>{
'id': serializer.toJson<int>(id),'categoryId': serializer.toJson<int?>(categoryId),'limitAmount': serializer.toJson<double>(limitAmount),'period': serializer.toJson<int>(period),'rollover': serializer.toJson<bool>(rollover),'carryOverAmount': serializer.toJson<double>(carryOverAmount),'createdAt': serializer.toJson<DateTime>(createdAt),'updatedAt': serializer.toJson<DateTime?>(updatedAt),};}Budget copyWith({int? id,Value<int?> categoryId = const Value.absent(),double? limitAmount,int? period,bool? rollover,double? carryOverAmount,DateTime? createdAt,Value<DateTime?> updatedAt = const Value.absent()}) => Budget(id: id ?? this.id,categoryId: categoryId.present ? categoryId.value : this.categoryId,limitAmount: limitAmount ?? this.limitAmount,period: period ?? this.period,rollover: rollover ?? this.rollover,carryOverAmount: carryOverAmount ?? this.carryOverAmount,createdAt: createdAt ?? this.createdAt,updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,);Budget copyWithCompanion(BudgetsCompanion data) {
return Budget(
id: data.id.present ? data.id.value : this.id,categoryId: data.categoryId.present ? data.categoryId.value : this.categoryId,limitAmount: data.limitAmount.present ? data.limitAmount.value : this.limitAmount,period: data.period.present ? data.period.value : this.period,rollover: data.rollover.present ? data.rollover.value : this.rollover,carryOverAmount: data.carryOverAmount.present ? data.carryOverAmount.value : this.carryOverAmount,createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,);
}
@override
String toString() {return (StringBuffer('Budget(')..write('id: $id, ')..write('categoryId: $categoryId, ')..write('limitAmount: $limitAmount, ')..write('period: $period, ')..write('rollover: $rollover, ')..write('carryOverAmount: $carryOverAmount, ')..write('createdAt: $createdAt, ')..write('updatedAt: $updatedAt')..write(')')).toString();}
@override
 int get hashCode => Object.hash(id, categoryId, limitAmount, period, rollover, carryOverAmount, createdAt, updatedAt);@override
bool operator ==(Object other) => identical(this, other) || (other is Budget && other.id == this.id && other.categoryId == this.categoryId && other.limitAmount == this.limitAmount && other.period == this.period && other.rollover == this.rollover && other.carryOverAmount == this.carryOverAmount && other.createdAt == this.createdAt && other.updatedAt == this.updatedAt);
}class BudgetsCompanion extends UpdateCompanion<Budget> {
final Value<int> id;
final Value<int?> categoryId;
final Value<double> limitAmount;
final Value<int> period;
final Value<bool> rollover;
final Value<double> carryOverAmount;
final Value<DateTime> createdAt;
final Value<DateTime?> updatedAt;
const BudgetsCompanion({this.id = const Value.absent(),this.categoryId = const Value.absent(),this.limitAmount = const Value.absent(),this.period = const Value.absent(),this.rollover = const Value.absent(),this.carryOverAmount = const Value.absent(),this.createdAt = const Value.absent(),this.updatedAt = const Value.absent(),});
BudgetsCompanion.insert({this.id = const Value.absent(),this.categoryId = const Value.absent(),required double limitAmount,this.period = const Value.absent(),this.rollover = const Value.absent(),this.carryOverAmount = const Value.absent(),this.createdAt = const Value.absent(),this.updatedAt = const Value.absent(),}): limitAmount = Value(limitAmount);
static Insertable<Budget> custom({Expression<int>? id, 
Expression<int>? categoryId, 
Expression<double>? limitAmount, 
Expression<int>? period, 
Expression<bool>? rollover, 
Expression<double>? carryOverAmount, 
Expression<DateTime>? createdAt, 
Expression<DateTime>? updatedAt, 
}) {
return RawValuesInsertable({if (id != null)'id': id,if (categoryId != null)'category_id': categoryId,if (limitAmount != null)'limit_amount': limitAmount,if (period != null)'period': period,if (rollover != null)'rollover': rollover,if (carryOverAmount != null)'carry_over_amount': carryOverAmount,if (createdAt != null)'created_at': createdAt,if (updatedAt != null)'updated_at': updatedAt,});
}BudgetsCompanion copyWith({Value<int>? id, Value<int?>? categoryId, Value<double>? limitAmount, Value<int>? period, Value<bool>? rollover, Value<double>? carryOverAmount, Value<DateTime>? createdAt, Value<DateTime?>? updatedAt}) {
return BudgetsCompanion(id: id ?? this.id,categoryId: categoryId ?? this.categoryId,limitAmount: limitAmount ?? this.limitAmount,period: period ?? this.period,rollover: rollover ?? this.rollover,carryOverAmount: carryOverAmount ?? this.carryOverAmount,createdAt: createdAt ?? this.createdAt,updatedAt: updatedAt ?? this.updatedAt,);
}
@override
Map<String, Expression> toColumns(bool nullToAbsent) {
final map = <String, Expression> {};if (id.present) {
map['id'] = Variable<int>(id.value);}
if (categoryId.present) {
map['category_id'] = Variable<int>(categoryId.value);}
if (limitAmount.present) {
map['limit_amount'] = Variable<double>(limitAmount.value);}
if (period.present) {
map['period'] = Variable<int>(period.value);}
if (rollover.present) {
map['rollover'] = Variable<bool>(rollover.value);}
if (carryOverAmount.present) {
map['carry_over_amount'] = Variable<double>(carryOverAmount.value);}
if (createdAt.present) {
map['created_at'] = Variable<DateTime>(createdAt.value);}
if (updatedAt.present) {
map['updated_at'] = Variable<DateTime>(updatedAt.value);}
return map; 
}
@override
String toString() {return (StringBuffer('BudgetsCompanion(')..write('id: $id, ')..write('categoryId: $categoryId, ')..write('limitAmount: $limitAmount, ')..write('period: $period, ')..write('rollover: $rollover, ')..write('carryOverAmount: $carryOverAmount, ')..write('createdAt: $createdAt, ')..write('updatedAt: $updatedAt')..write(')')).toString();}
}
class $SplitsTable extends Splits with TableInfo<$SplitsTable, Split>{
@override final GeneratedDatabase attachedDatabase;
final String? _alias;
$SplitsTable(this.attachedDatabase, [this._alias]);
static const VerificationMeta _idMeta = const VerificationMeta('id');
@override
late final GeneratedColumn<int> id = GeneratedColumn<int>('id', aliasedName, false, hasAutoIncrement: true, type: DriftSqlType.int, requiredDuringInsert: false, defaultConstraints: GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
static const VerificationMeta _transactionIdMeta = const VerificationMeta('transactionId');
@override
late final GeneratedColumn<int> transactionId = GeneratedColumn<int>('transaction_id', aliasedName, false, type: DriftSqlType.int, requiredDuringInsert: true, defaultConstraints: GeneratedColumn.constraintIsAlways('REFERENCES transactions (id)'));
static const VerificationMeta _categoryIdMeta = const VerificationMeta('categoryId');
@override
late final GeneratedColumn<int> categoryId = GeneratedColumn<int>('category_id', aliasedName, false, type: DriftSqlType.int, requiredDuringInsert: true, defaultConstraints: GeneratedColumn.constraintIsAlways('REFERENCES categories (id)'));
static const VerificationMeta _amountMeta = const VerificationMeta('amount');
@override
late final GeneratedColumn<double> amount = GeneratedColumn<double>('amount', aliasedName, false, type: DriftSqlType.double, requiredDuringInsert: true);
static const VerificationMeta _notesMeta = const VerificationMeta('notes');
@override
late final GeneratedColumn<String> notes = GeneratedColumn<String>('notes', aliasedName, true, type: DriftSqlType.string, requiredDuringInsert: false);
static const VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
@override
late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>('created_at', aliasedName, false, type: DriftSqlType.dateTime, requiredDuringInsert: false, defaultValue: currentDateAndTime);
@override
List<GeneratedColumn> get $columns => [id, transactionId, categoryId, amount, notes, createdAt];
@override
String get aliasedName => _alias ?? actualTableName;
@override
 String get actualTableName => $name;
static const String $name = 'splits';
@override
VerificationContext validateIntegrity(Insertable<Split> instance, {bool isInserting = false}) {
final context = VerificationContext();
final data = instance.toColumns(true);
if (data.containsKey('id')) {
context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));}if (data.containsKey('transaction_id')) {
context.handle(_transactionIdMeta, transactionId.isAcceptableOrUnknown(data['transaction_id']!, _transactionIdMeta));} else if (isInserting) {
context.missing(_transactionIdMeta);
}
if (data.containsKey('category_id')) {
context.handle(_categoryIdMeta, categoryId.isAcceptableOrUnknown(data['category_id']!, _categoryIdMeta));} else if (isInserting) {
context.missing(_categoryIdMeta);
}
if (data.containsKey('amount')) {
context.handle(_amountMeta, amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));} else if (isInserting) {
context.missing(_amountMeta);
}
if (data.containsKey('notes')) {
context.handle(_notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));}if (data.containsKey('created_at')) {
context.handle(_createdAtMeta, createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));}return context;
}
@override
Set<GeneratedColumn> get $primaryKey => {id};
@override Split map(Map<String, dynamic> data, {String? tablePrefix})  {
final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';return Split(id: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}id'])!, transactionId: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}transaction_id'])!, categoryId: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}category_id'])!, amount: attachedDatabase.typeMapping.read(DriftSqlType.double, data['${effectivePrefix}amount'])!, notes: attachedDatabase.typeMapping.read(DriftSqlType.string, data['${effectivePrefix}notes']), createdAt: attachedDatabase.typeMapping.read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!, );
}
@override
$SplitsTable createAlias(String alias) {
return $SplitsTable(attachedDatabase, alias);}}class Split extends DataClass implements Insertable<Split> 
{
final int id;
final int transactionId;
final int categoryId;
final double amount;
final String? notes;
final DateTime createdAt;
const Split({required this.id, required this.transactionId, required this.categoryId, required this.amount, this.notes, required this.createdAt});@override
Map<String, Expression> toColumns(bool nullToAbsent) {
final map = <String, Expression> {};map['id'] = Variable<int>(id);
map['transaction_id'] = Variable<int>(transactionId);
map['category_id'] = Variable<int>(categoryId);
map['amount'] = Variable<double>(amount);
if (!nullToAbsent || notes != null){map['notes'] = Variable<String>(notes);
}map['created_at'] = Variable<DateTime>(createdAt);
return map; 
}
SplitsCompanion toCompanion(bool nullToAbsent) {
return SplitsCompanion(id: Value(id),transactionId: Value(transactionId),categoryId: Value(categoryId),amount: Value(amount),notes: notes == null && nullToAbsent ? const Value.absent() : Value(notes),createdAt: Value(createdAt),);
}
factory Split.fromJson(Map<String, dynamic> json, {ValueSerializer? serializer}) {
serializer ??= driftRuntimeOptions.defaultSerializer;
return Split(id: serializer.fromJson<int>(json['id']),transactionId: serializer.fromJson<int>(json['transactionId']),categoryId: serializer.fromJson<int>(json['categoryId']),amount: serializer.fromJson<double>(json['amount']),notes: serializer.fromJson<String?>(json['notes']),createdAt: serializer.fromJson<DateTime>(json['createdAt']),);}
@override Map<String, dynamic> toJson({ValueSerializer? serializer}) {
serializer ??= driftRuntimeOptions.defaultSerializer;
return <String, dynamic>{
'id': serializer.toJson<int>(id),'transactionId': serializer.toJson<int>(transactionId),'categoryId': serializer.toJson<int>(categoryId),'amount': serializer.toJson<double>(amount),'notes': serializer.toJson<String?>(notes),'createdAt': serializer.toJson<DateTime>(createdAt),};}Split copyWith({int? id,int? transactionId,int? categoryId,double? amount,Value<String?> notes = const Value.absent(),DateTime? createdAt}) => Split(id: id ?? this.id,transactionId: transactionId ?? this.transactionId,categoryId: categoryId ?? this.categoryId,amount: amount ?? this.amount,notes: notes.present ? notes.value : this.notes,createdAt: createdAt ?? this.createdAt,);Split copyWithCompanion(SplitsCompanion data) {
return Split(
id: data.id.present ? data.id.value : this.id,transactionId: data.transactionId.present ? data.transactionId.value : this.transactionId,categoryId: data.categoryId.present ? data.categoryId.value : this.categoryId,amount: data.amount.present ? data.amount.value : this.amount,notes: data.notes.present ? data.notes.value : this.notes,createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,);
}
@override
String toString() {return (StringBuffer('Split(')..write('id: $id, ')..write('transactionId: $transactionId, ')..write('categoryId: $categoryId, ')..write('amount: $amount, ')..write('notes: $notes, ')..write('createdAt: $createdAt')..write(')')).toString();}
@override
 int get hashCode => Object.hash(id, transactionId, categoryId, amount, notes, createdAt);@override
bool operator ==(Object other) => identical(this, other) || (other is Split && other.id == this.id && other.transactionId == this.transactionId && other.categoryId == this.categoryId && other.amount == this.amount && other.notes == this.notes && other.createdAt == this.createdAt);
}class SplitsCompanion extends UpdateCompanion<Split> {
final Value<int> id;
final Value<int> transactionId;
final Value<int> categoryId;
final Value<double> amount;
final Value<String?> notes;
final Value<DateTime> createdAt;
const SplitsCompanion({this.id = const Value.absent(),this.transactionId = const Value.absent(),this.categoryId = const Value.absent(),this.amount = const Value.absent(),this.notes = const Value.absent(),this.createdAt = const Value.absent(),});
SplitsCompanion.insert({this.id = const Value.absent(),required int transactionId,required int categoryId,required double amount,this.notes = const Value.absent(),this.createdAt = const Value.absent(),}): transactionId = Value(transactionId), categoryId = Value(categoryId), amount = Value(amount);
static Insertable<Split> custom({Expression<int>? id, 
Expression<int>? transactionId, 
Expression<int>? categoryId, 
Expression<double>? amount, 
Expression<String>? notes, 
Expression<DateTime>? createdAt, 
}) {
return RawValuesInsertable({if (id != null)'id': id,if (transactionId != null)'transaction_id': transactionId,if (categoryId != null)'category_id': categoryId,if (amount != null)'amount': amount,if (notes != null)'notes': notes,if (createdAt != null)'created_at': createdAt,});
}SplitsCompanion copyWith({Value<int>? id, Value<int>? transactionId, Value<int>? categoryId, Value<double>? amount, Value<String?>? notes, Value<DateTime>? createdAt}) {
return SplitsCompanion(id: id ?? this.id,transactionId: transactionId ?? this.transactionId,categoryId: categoryId ?? this.categoryId,amount: amount ?? this.amount,notes: notes ?? this.notes,createdAt: createdAt ?? this.createdAt,);
}
@override
Map<String, Expression> toColumns(bool nullToAbsent) {
final map = <String, Expression> {};if (id.present) {
map['id'] = Variable<int>(id.value);}
if (transactionId.present) {
map['transaction_id'] = Variable<int>(transactionId.value);}
if (categoryId.present) {
map['category_id'] = Variable<int>(categoryId.value);}
if (amount.present) {
map['amount'] = Variable<double>(amount.value);}
if (notes.present) {
map['notes'] = Variable<String>(notes.value);}
if (createdAt.present) {
map['created_at'] = Variable<DateTime>(createdAt.value);}
return map; 
}
@override
String toString() {return (StringBuffer('SplitsCompanion(')..write('id: $id, ')..write('transactionId: $transactionId, ')..write('categoryId: $categoryId, ')..write('amount: $amount, ')..write('notes: $notes, ')..write('createdAt: $createdAt')..write(')')).toString();}
}
abstract class _$AppDatabase extends GeneratedDatabase{
_$AppDatabase(QueryExecutor e): super(e);
$AppDatabaseManager get managers => $AppDatabaseManager(this);
late final $CategoriesTable categories = $CategoriesTable(this);
late final $TransactionsTable transactions = $TransactionsTable(this);
late final $SubscriptionsTable subscriptions = $SubscriptionsTable(this);
late final $MappingsTable mappings = $MappingsTable(this);
late final $BudgetsTable budgets = $BudgetsTable(this);
late final $SplitsTable splits = $SplitsTable(this);
@override
Iterable<TableInfo<Table, Object?>> get allTables => allSchemaEntities.whereType<TableInfo<Table, Object?>>();
@override
List<DatabaseSchemaEntity> get allSchemaEntities => [categories, transactions, subscriptions, mappings, budgets, splits];
}
typedef $$CategoriesTableCreateCompanionBuilder = CategoriesCompanion Function({Value<int> id,required String name,Value<int?> parentCategoryId,required String icon,required String color,Value<int?> colorValue,Value<bool> isSystem,Value<int> displayOrder,Value<bool> isActive,Value<int> transactionCount,Value<DateTime> createdAt,Value<DateTime?> updatedAt,});
typedef $$CategoriesTableUpdateCompanionBuilder = CategoriesCompanion Function({Value<int> id,Value<String> name,Value<int?> parentCategoryId,Value<String> icon,Value<String> color,Value<int?> colorValue,Value<bool> isSystem,Value<int> displayOrder,Value<bool> isActive,Value<int> transactionCount,Value<DateTime> createdAt,Value<DateTime?> updatedAt,});
      final class $$CategoriesTableReferences extends BaseReferences<
        _$AppDatabase,
        $CategoriesTable,
        Category> {
        $$CategoriesTableReferences(super.$_db, super.$_table, super.$_typedResult);
        
                  
                  static MultiTypedResultKey<
          $TransactionsTable,
          List<Transaction>
        > _transactionsRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(
          db.transactions, 
          aliasName: $_aliasNameGenerator(
            db.categories.id,
            db.transactions.categoryId)
        );

          $$TransactionsTableProcessedTableManager get transactionsRefs {
        final manager = $$TransactionsTableTableManager(
            $_db, $_db.transactions
            ).filter(
              (f) => f.categoryId.id(
              $_item.id
            )
          );

          final cache = $_typedResult.readTableOrNull(_transactionsRefsTable($_db));
          return ProcessedTableManager(manager.$state.copyWith(prefetchedData: cache));


        }
        
          
                  static MultiTypedResultKey<
          $SubscriptionsTable,
          List<Subscription>
        > _subscriptionsRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(
          db.subscriptions, 
          aliasName: $_aliasNameGenerator(
            db.categories.id,
            db.subscriptions.categoryId)
        );

          $$SubscriptionsTableProcessedTableManager get subscriptionsRefs {
        final manager = $$SubscriptionsTableTableManager(
            $_db, $_db.subscriptions
            ).filter(
              (f) => f.categoryId.id(
              $_item.id
            )
          );

          final cache = $_typedResult.readTableOrNull(_subscriptionsRefsTable($_db));
          return ProcessedTableManager(manager.$state.copyWith(prefetchedData: cache));


        }
        
          
                  static MultiTypedResultKey<
          $MappingsTable,
          List<Mapping>
        > _mappingsRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(
          db.mappings, 
          aliasName: $_aliasNameGenerator(
            db.categories.id,
            db.mappings.categoryId)
        );

          $$MappingsTableProcessedTableManager get mappingsRefs {
        final manager = $$MappingsTableTableManager(
            $_db, $_db.mappings
            ).filter(
              (f) => f.categoryId.id(
              $_item.id
            )
          );

          final cache = $_typedResult.readTableOrNull(_mappingsRefsTable($_db));
          return ProcessedTableManager(manager.$state.copyWith(prefetchedData: cache));


        }
        
          
                  static MultiTypedResultKey<
          $BudgetsTable,
          List<Budget>
        > _budgetsRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(
          db.budgets, 
          aliasName: $_aliasNameGenerator(
            db.categories.id,
            db.budgets.categoryId)
        );

          $$BudgetsTableProcessedTableManager get budgetsRefs {
        final manager = $$BudgetsTableTableManager(
            $_db, $_db.budgets
            ).filter(
              (f) => f.categoryId.id(
              $_item.id
            )
          );

          final cache = $_typedResult.readTableOrNull(_budgetsRefsTable($_db));
          return ProcessedTableManager(manager.$state.copyWith(prefetchedData: cache));


        }
        
          
                  static MultiTypedResultKey<
          $SplitsTable,
          List<Split>
        > _splitsRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(
          db.splits, 
          aliasName: $_aliasNameGenerator(
            db.categories.id,
            db.splits.categoryId)
        );

          $$SplitsTableProcessedTableManager get splitsRefs {
        final manager = $$SplitsTableTableManager(
            $_db, $_db.splits
            ).filter(
              (f) => f.categoryId.id(
              $_item.id
            )
          );

          final cache = $_typedResult.readTableOrNull(_splitsRefsTable($_db));
          return ProcessedTableManager(manager.$state.copyWith(prefetchedData: cache));


        }
        

      }class $$CategoriesTableFilterComposer extends Composer<
        _$AppDatabase,
        $CategoriesTable> {
        $$CategoriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
          ColumnFilters<int> get id => $composableBuilder(
      column: $table.id,
      builder: (column) => 
      ColumnFilters(column));
      
ColumnFilters<String> get name => $composableBuilder(
      column: $table.name,
      builder: (column) => 
      ColumnFilters(column));
      
ColumnFilters<int> get parentCategoryId => $composableBuilder(
      column: $table.parentCategoryId,
      builder: (column) => 
      ColumnFilters(column));
      
ColumnFilters<String> get icon => $composableBuilder(
      column: $table.icon,
      builder: (column) => 
      ColumnFilters(column));
      
ColumnFilters<String> get color => $composableBuilder(
      column: $table.color,
      builder: (column) => 
      ColumnFilters(column));
      
ColumnFilters<int> get colorValue => $composableBuilder(
      column: $table.colorValue,
      builder: (column) => 
      ColumnFilters(column));
      
ColumnFilters<bool> get isSystem => $composableBuilder(
      column: $table.isSystem,
      builder: (column) => 
      ColumnFilters(column));
      
ColumnFilters<int> get displayOrder => $composableBuilder(
      column: $table.displayOrder,
      builder: (column) => 
      ColumnFilters(column));
      
ColumnFilters<bool> get isActive => $composableBuilder(
      column: $table.isActive,
      builder: (column) => 
      ColumnFilters(column));
      
ColumnFilters<int> get transactionCount => $composableBuilder(
      column: $table.transactionCount,
      builder: (column) => 
      ColumnFilters(column));
      
ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt,
      builder: (column) => 
      ColumnFilters(column));
      
ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt,
      builder: (column) => 
      ColumnFilters(column));
      
        Expression<bool> transactionsRefs(
          Expression<bool> Function( $$TransactionsTableFilterComposer f) f
        ) {
                final $$TransactionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.transactions,
      getReferencedColumn: (t) => t.categoryId,
      builder: (joinBuilder,{$addJoinBuilderToRootComposer,$removeJoinBuilderFromRootComposer }) => 
      $$TransactionsTableFilterComposer(
              $db: $db,
              $table: $db.transactions,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
        ));
          return f(composer);
        }

        Expression<bool> subscriptionsRefs(
          Expression<bool> Function( $$SubscriptionsTableFilterComposer f) f
        ) {
                final $$SubscriptionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.subscriptions,
      getReferencedColumn: (t) => t.categoryId,
      builder: (joinBuilder,{$addJoinBuilderToRootComposer,$removeJoinBuilderFromRootComposer }) => 
      $$SubscriptionsTableFilterComposer(
              $db: $db,
              $table: $db.subscriptions,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
        ));
          return f(composer);
        }

        Expression<bool> mappingsRefs(
          Expression<bool> Function( $$MappingsTableFilterComposer f) f
        ) {
                final $$MappingsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.mappings,
      getReferencedColumn: (t) => t.categoryId,
      builder: (joinBuilder,{$addJoinBuilderToRootComposer,$removeJoinBuilderFromRootComposer }) => 
      $$MappingsTableFilterComposer(
              $db: $db,
              $table: $db.mappings,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
        ));
          return f(composer);
        }

        Expression<bool> budgetsRefs(
          Expression<bool> Function( $$BudgetsTableFilterComposer f) f
        ) {
                final $$BudgetsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.budgets,
      getReferencedColumn: (t) => t.categoryId,
      builder: (joinBuilder,{$addJoinBuilderToRootComposer,$removeJoinBuilderFromRootComposer }) => 
      $$BudgetsTableFilterComposer(
              $db: $db,
              $table: $db.budgets,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
        ));
          return f(composer);
        }

        Expression<bool> splitsRefs(
          Expression<bool> Function( $$SplitsTableFilterComposer f) f
        ) {
                final $$SplitsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.splits,
      getReferencedColumn: (t) => t.categoryId,
      builder: (joinBuilder,{$addJoinBuilderToRootComposer,$removeJoinBuilderFromRootComposer }) => 
      $$SplitsTableFilterComposer(
              $db: $db,
              $table: $db.splits,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
        ));
          return f(composer);
        }

        }
      class $$CategoriesTableOrderingComposer extends Composer<
        _$AppDatabase,
        $CategoriesTable> {
        $$CategoriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
          ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id,
      builder: (column) => 
      ColumnOrderings(column));
      
ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name,
      builder: (column) => 
      ColumnOrderings(column));
      
ColumnOrderings<int> get parentCategoryId => $composableBuilder(
      column: $table.parentCategoryId,
      builder: (column) => 
      ColumnOrderings(column));
      
ColumnOrderings<String> get icon => $composableBuilder(
      column: $table.icon,
      builder: (column) => 
      ColumnOrderings(column));
      
ColumnOrderings<String> get color => $composableBuilder(
      column: $table.color,
      builder: (column) => 
      ColumnOrderings(column));
      
ColumnOrderings<int> get colorValue => $composableBuilder(
      column: $table.colorValue,
      builder: (column) => 
      ColumnOrderings(column));
      
ColumnOrderings<bool> get isSystem => $composableBuilder(
      column: $table.isSystem,
      builder: (column) => 
      ColumnOrderings(column));
      
ColumnOrderings<int> get displayOrder => $composableBuilder(
      column: $table.displayOrder,
      builder: (column) => 
      ColumnOrderings(column));
      
ColumnOrderings<bool> get isActive => $composableBuilder(
      column: $table.isActive,
      builder: (column) => 
      ColumnOrderings(column));
      
ColumnOrderings<int> get transactionCount => $composableBuilder(
      column: $table.transactionCount,
      builder: (column) => 
      ColumnOrderings(column));
      
ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt,
      builder: (column) => 
      ColumnOrderings(column));
      
ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt,
      builder: (column) => 
      ColumnOrderings(column));
      
        }
      class $$CategoriesTableAnnotationComposer extends Composer<
        _$AppDatabase,
        $CategoriesTable> {
        $$CategoriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
          GeneratedColumn<int> get id => $composableBuilder(
      column: $table.id,
      builder: (column) => column);
      
GeneratedColumn<String> get name => $composableBuilder(
      column: $table.name,
      builder: (column) => column);
      
GeneratedColumn<int> get parentCategoryId => $composableBuilder(
      column: $table.parentCategoryId,
      builder: (column) => column);
      
GeneratedColumn<String> get icon => $composableBuilder(
      column: $table.icon,
      builder: (column) => column);
      
GeneratedColumn<String> get color => $composableBuilder(
      column: $table.color,
      builder: (column) => column);
      
GeneratedColumn<int> get colorValue => $composableBuilder(
      column: $table.colorValue,
      builder: (column) => column);
      
GeneratedColumn<bool> get isSystem => $composableBuilder(
      column: $table.isSystem,
      builder: (column) => column);
      
GeneratedColumn<int> get displayOrder => $composableBuilder(
      column: $table.displayOrder,
      builder: (column) => column);
      
GeneratedColumn<bool> get isActive => $composableBuilder(
      column: $table.isActive,
      builder: (column) => column);
      
GeneratedColumn<int> get transactionCount => $composableBuilder(
      column: $table.transactionCount,
      builder: (column) => column);
      
GeneratedColumn<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt,
      builder: (column) => column);
      
GeneratedColumn<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt,
      builder: (column) => column);
      
        Expression<T> transactionsRefs<T extends Object>(
          Expression<T> Function( $$TransactionsTableAnnotationComposer a) f
        ) {
                final $$TransactionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.transactions,
      getReferencedColumn: (t) => t.categoryId,
      builder: (joinBuilder,{$addJoinBuilderToRootComposer,$removeJoinBuilderFromRootComposer }) => 
      $$TransactionsTableAnnotationComposer(
              $db: $db,
              $table: $db.transactions,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
        ));
          return f(composer);
        }

        Expression<T> subscriptionsRefs<T extends Object>(
          Expression<T> Function( $$SubscriptionsTableAnnotationComposer a) f
        ) {
                final $$SubscriptionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.subscriptions,
      getReferencedColumn: (t) => t.categoryId,
      builder: (joinBuilder,{$addJoinBuilderToRootComposer,$removeJoinBuilderFromRootComposer }) => 
      $$SubscriptionsTableAnnotationComposer(
              $db: $db,
              $table: $db.subscriptions,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
        ));
          return f(composer);
        }

        Expression<T> mappingsRefs<T extends Object>(
          Expression<T> Function( $$MappingsTableAnnotationComposer a) f
        ) {
                final $$MappingsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.mappings,
      getReferencedColumn: (t) => t.categoryId,
      builder: (joinBuilder,{$addJoinBuilderToRootComposer,$removeJoinBuilderFromRootComposer }) => 
      $$MappingsTableAnnotationComposer(
              $db: $db,
              $table: $db.mappings,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
        ));
          return f(composer);
        }

        Expression<T> budgetsRefs<T extends Object>(
          Expression<T> Function( $$BudgetsTableAnnotationComposer a) f
        ) {
                final $$BudgetsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.budgets,
      getReferencedColumn: (t) => t.categoryId,
      builder: (joinBuilder,{$addJoinBuilderToRootComposer,$removeJoinBuilderFromRootComposer }) => 
      $$BudgetsTableAnnotationComposer(
              $db: $db,
              $table: $db.budgets,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
        ));
          return f(composer);
        }

        Expression<T> splitsRefs<T extends Object>(
          Expression<T> Function( $$SplitsTableAnnotationComposer a) f
        ) {
                final $$SplitsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.splits,
      getReferencedColumn: (t) => t.categoryId,
      builder: (joinBuilder,{$addJoinBuilderToRootComposer,$removeJoinBuilderFromRootComposer }) => 
      $$SplitsTableAnnotationComposer(
              $db: $db,
              $table: $db.splits,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
        ));
          return f(composer);
        }

        }
      class $$CategoriesTableTableManager extends RootTableManager    <_$AppDatabase,
    $CategoriesTable,
    Category,
    $$CategoriesTableFilterComposer,
    $$CategoriesTableOrderingComposer,
    $$CategoriesTableAnnotationComposer,
    $$CategoriesTableCreateCompanionBuilder,
    $$CategoriesTableUpdateCompanionBuilder,
    (Category,$$CategoriesTableReferences),
    Category,
    PrefetchHooks Function({bool transactionsRefs,bool subscriptionsRefs,bool mappingsRefs,bool budgetsRefs,bool splitsRefs})
    > {
    $$CategoriesTableTableManager(_$AppDatabase db, $CategoriesTable table) : super(
      TableManagerState(
        db: db,
        table: table,
        createFilteringComposer: () => $$CategoriesTableFilterComposer($db: db,$table:table),
        createOrderingComposer: () => $$CategoriesTableOrderingComposer($db: db,$table:table),
        createComputedFieldComposer: () => $$CategoriesTableAnnotationComposer($db: db,$table:table),
        updateCompanionCallback: ({Value<int> id = const Value.absent(),Value<String> name = const Value.absent(),Value<int?> parentCategoryId = const Value.absent(),Value<String> icon = const Value.absent(),Value<String> color = const Value.absent(),Value<int?> colorValue = const Value.absent(),Value<bool> isSystem = const Value.absent(),Value<int> displayOrder = const Value.absent(),Value<bool> isActive = const Value.absent(),Value<int> transactionCount = const Value.absent(),Value<DateTime> createdAt = const Value.absent(),Value<DateTime?> updatedAt = const Value.absent(),})=> CategoriesCompanion(id: id,name: name,parentCategoryId: parentCategoryId,icon: icon,color: color,colorValue: colorValue,isSystem: isSystem,displayOrder: displayOrder,isActive: isActive,transactionCount: transactionCount,createdAt: createdAt,updatedAt: updatedAt,),
        createCompanionCallback: ({Value<int> id = const Value.absent(),required String name,Value<int?> parentCategoryId = const Value.absent(),required String icon,required String color,Value<int?> colorValue = const Value.absent(),Value<bool> isSystem = const Value.absent(),Value<int> displayOrder = const Value.absent(),Value<bool> isActive = const Value.absent(),Value<int> transactionCount = const Value.absent(),Value<DateTime> createdAt = const Value.absent(),Value<DateTime?> updatedAt = const Value.absent(),})=> CategoriesCompanion.insert(id: id,name: name,parentCategoryId: parentCategoryId,icon: icon,color: color,colorValue: colorValue,isSystem: isSystem,displayOrder: displayOrder,isActive: isActive,transactionCount: transactionCount,createdAt: createdAt,updatedAt: updatedAt,),
        withReferenceMapper: (p0) => p0
              .map(
                  (e) =>
                     (e.readTable(table), $$CategoriesTableReferences(db, table, e))
                  )
              .toList(),
        prefetchHooksCallback:         ({transactionsRefs = false,subscriptionsRefs = false,mappingsRefs = false,budgetsRefs = false,splitsRefs = false}){
          return PrefetchHooks(
            db: db,
            explicitlyWatchedTables: [
             if (transactionsRefs) db.transactions,if (subscriptionsRefs) db.subscriptions,if (mappingsRefs) db.mappings,if (budgetsRefs) db.budgets,if (splitsRefs) db.splits
            ],
            addJoins: null,
            getPrefetchedDataCallback: (items) async {
            return [
                      if (transactionsRefs) await $_getPrefetchedData(
                  currentTable: table,
                  referencedTable:
                      $$CategoriesTableReferences._transactionsRefsTable(db),
                  managerFromTypedResult: (p0) =>
                      $$CategoriesTableReferences(db, table, p0).transactionsRefs,
                  referencedItemsForCurrentItem: (item, referencedItems) =>
                      referencedItems.where((e) => e.categoryId == item.id),
                  typedResults: items)
            ,          if (subscriptionsRefs) await $_getPrefetchedData(
                  currentTable: table,
                  referencedTable:
                      $$CategoriesTableReferences._subscriptionsRefsTable(db),
                  managerFromTypedResult: (p0) =>
                      $$CategoriesTableReferences(db, table, p0).subscriptionsRefs,
                  referencedItemsForCurrentItem: (item, referencedItems) =>
                      referencedItems.where((e) => e.categoryId == item.id),
                  typedResults: items)
            ,          if (mappingsRefs) await $_getPrefetchedData(
                  currentTable: table,
                  referencedTable:
                      $$CategoriesTableReferences._mappingsRefsTable(db),
                  managerFromTypedResult: (p0) =>
                      $$CategoriesTableReferences(db, table, p0).mappingsRefs,
                  referencedItemsForCurrentItem: (item, referencedItems) =>
                      referencedItems.where((e) => e.categoryId == item.id),
                  typedResults: items)
            ,          if (budgetsRefs) await $_getPrefetchedData(
                  currentTable: table,
                  referencedTable:
                      $$CategoriesTableReferences._budgetsRefsTable(db),
                  managerFromTypedResult: (p0) =>
                      $$CategoriesTableReferences(db, table, p0).budgetsRefs,
                  referencedItemsForCurrentItem: (item, referencedItems) =>
                      referencedItems.where((e) => e.categoryId == item.id),
                  typedResults: items)
            ,          if (splitsRefs) await $_getPrefetchedData(
                  currentTable: table,
                  referencedTable:
                      $$CategoriesTableReferences._splitsRefsTable(db),
                  managerFromTypedResult: (p0) =>
                      $$CategoriesTableReferences(db, table, p0).splitsRefs,
                  referencedItemsForCurrentItem: (item, referencedItems) =>
                      referencedItems.where((e) => e.categoryId == item.id),
                  typedResults: items)
            
                ];
              },
          );
        }
,
        ));
        }
    typedef $$CategoriesTableProcessedTableManager = ProcessedTableManager    <_$AppDatabase,
    $CategoriesTable,
    Category,
    $$CategoriesTableFilterComposer,
    $$CategoriesTableOrderingComposer,
    $$CategoriesTableAnnotationComposer,
    $$CategoriesTableCreateCompanionBuilder,
    $$CategoriesTableUpdateCompanionBuilder,
    (Category,$$CategoriesTableReferences),
    Category,
    PrefetchHooks Function({bool transactionsRefs,bool subscriptionsRefs,bool mappingsRefs,bool budgetsRefs,bool splitsRefs})
    >;typedef $$TransactionsTableCreateCompanionBuilder = TransactionsCompanion Function({Value<int> id,required String merchantName,Value<String?> rawMerchantName,required double amount,Value<double?> subtotalAmount,Value<double?> taxAmount,Value<double?> discountAmount,Value<double?> tipAmount,required DateTime date,Value<int?> categoryId,Value<bool> isSubscription,Value<int?> subscriptionId,Value<int> kind,Value<int> origin,Value<bool> isRecurring,Value<int> extractionConfidence,Value<bool> hasLineItems,Value<String?> originalEmailId,Value<String> currency,Value<String?> notes,Value<bool> userVerified,Value<bool> hasSplits,Value<bool> isManuallyEdited,Value<DateTime?> manualEditTimestamp,Value<DateTime> createdAt,Value<DateTime?> updatedAt,});
typedef $$TransactionsTableUpdateCompanionBuilder = TransactionsCompanion Function({Value<int> id,Value<String> merchantName,Value<String?> rawMerchantName,Value<double> amount,Value<double?> subtotalAmount,Value<double?> taxAmount,Value<double?> discountAmount,Value<double?> tipAmount,Value<DateTime> date,Value<int?> categoryId,Value<bool> isSubscription,Value<int?> subscriptionId,Value<int> kind,Value<int> origin,Value<bool> isRecurring,Value<int> extractionConfidence,Value<bool> hasLineItems,Value<String?> originalEmailId,Value<String> currency,Value<String?> notes,Value<bool> userVerified,Value<bool> hasSplits,Value<bool> isManuallyEdited,Value<DateTime?> manualEditTimestamp,Value<DateTime> createdAt,Value<DateTime?> updatedAt,});
      final class $$TransactionsTableReferences extends BaseReferences<
        _$AppDatabase,
        $TransactionsTable,
        Transaction> {
        $$TransactionsTableReferences(super.$_db, super.$_table, super.$_typedResult);
        
                          static $CategoriesTable _categoryIdTable(_$AppDatabase db) => 
            db.categories.createAlias($_aliasNameGenerator(
            db.transactions.categoryId,
            db.categories.id));
          

        $$CategoriesTableProcessedTableManager? get categoryId {
          if ($_item.categoryId == null) return null;
          final manager = $$CategoriesTableTableManager($_db, $_db.categories).filter((f) => f.id($_item.categoryId!));
          final item = $_typedResult.readTableOrNull(_categoryIdTable($_db));
          if (item == null) return manager;
          return ProcessedTableManager(manager.$state.copyWith(prefetchedData: [item]));
        }

          
                  static MultiTypedResultKey<
          $SplitsTable,
          List<Split>
        > _splitsRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(
          db.splits, 
          aliasName: $_aliasNameGenerator(
            db.transactions.id,
            db.splits.transactionId)
        );

          $$SplitsTableProcessedTableManager get splitsRefs {
        final manager = $$SplitsTableTableManager(
            $_db, $_db.splits
            ).filter(
              (f) => f.transactionId.id(
              $_item.id
            )
          );

          final cache = $_typedResult.readTableOrNull(_splitsRefsTable($_db));
          return ProcessedTableManager(manager.$state.copyWith(prefetchedData: cache));


        }
        

      }class $$TransactionsTableFilterComposer extends Composer<
        _$AppDatabase,
        $TransactionsTable> {
        $$TransactionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
          ColumnFilters<int> get id => $composableBuilder(
      column: $table.id,
      builder: (column) => 
      ColumnFilters(column));
      
ColumnFilters<String> get merchantName => $composableBuilder(
      column: $table.merchantName,
      builder: (column) => 
      ColumnFilters(column));
      
ColumnFilters<String> get rawMerchantName => $composableBuilder(
      column: $table.rawMerchantName,
      builder: (column) => 
      ColumnFilters(column));
      
ColumnFilters<double> get amount => $composableBuilder(
      column: $table.amount,
      builder: (column) => 
      ColumnFilters(column));
      
ColumnFilters<double> get subtotalAmount => $composableBuilder(
      column: $table.subtotalAmount,
      builder: (column) => 
      ColumnFilters(column));
      
ColumnFilters<double> get taxAmount => $composableBuilder(
      column: $table.taxAmount,
      builder: (column) => 
      ColumnFilters(column));
      
ColumnFilters<double> get discountAmount => $composableBuilder(
      column: $table.discountAmount,
      builder: (column) => 
      ColumnFilters(column));
      
ColumnFilters<double> get tipAmount => $composableBuilder(
      column: $table.tipAmount,
      builder: (column) => 
      ColumnFilters(column));
      
ColumnFilters<DateTime> get date => $composableBuilder(
      column: $table.date,
      builder: (column) => 
      ColumnFilters(column));
      
ColumnFilters<bool> get isSubscription => $composableBuilder(
      column: $table.isSubscription,
      builder: (column) => 
      ColumnFilters(column));
      
ColumnFilters<int> get subscriptionId => $composableBuilder(
      column: $table.subscriptionId,
      builder: (column) => 
      ColumnFilters(column));
      
ColumnFilters<int> get kind => $composableBuilder(
      column: $table.kind,
      builder: (column) => 
      ColumnFilters(column));
      
ColumnFilters<int> get origin => $composableBuilder(
      column: $table.origin,
      builder: (column) => 
      ColumnFilters(column));
      
ColumnFilters<bool> get isRecurring => $composableBuilder(
      column: $table.isRecurring,
      builder: (column) => 
      ColumnFilters(column));
      
ColumnFilters<int> get extractionConfidence => $composableBuilder(
      column: $table.extractionConfidence,
      builder: (column) => 
      ColumnFilters(column));
      
ColumnFilters<bool> get hasLineItems => $composableBuilder(
      column: $table.hasLineItems,
      builder: (column) => 
      ColumnFilters(column));
      
ColumnFilters<String> get originalEmailId => $composableBuilder(
      column: $table.originalEmailId,
      builder: (column) => 
      ColumnFilters(column));
      
ColumnFilters<String> get currency => $composableBuilder(
      column: $table.currency,
      builder: (column) => 
      ColumnFilters(column));
      
ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes,
      builder: (column) => 
      ColumnFilters(column));
      
ColumnFilters<bool> get userVerified => $composableBuilder(
      column: $table.userVerified,
      builder: (column) => 
      ColumnFilters(column));
      
ColumnFilters<bool> get hasSplits => $composableBuilder(
      column: $table.hasSplits,
      builder: (column) => 
      ColumnFilters(column));
      
ColumnFilters<bool> get isManuallyEdited => $composableBuilder(
      column: $table.isManuallyEdited,
      builder: (column) => 
      ColumnFilters(column));
      
ColumnFilters<DateTime> get manualEditTimestamp => $composableBuilder(
      column: $table.manualEditTimestamp,
      builder: (column) => 
      ColumnFilters(column));
      
ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt,
      builder: (column) => 
      ColumnFilters(column));
      
ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt,
      builder: (column) => 
      ColumnFilters(column));
      
        $$CategoriesTableFilterComposer get categoryId {
                final $$CategoriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoryId,
      referencedTable: $db.categories,
      getReferencedColumn: (t) => t.id,
      builder: (joinBuilder,{$addJoinBuilderToRootComposer,$removeJoinBuilderFromRootComposer }) => 
      $$CategoriesTableFilterComposer(
              $db: $db,
              $table: $db.categories,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
        ));
          return composer;
        }
        Expression<bool> splitsRefs(
          Expression<bool> Function( $$SplitsTableFilterComposer f) f
        ) {
                final $$SplitsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.splits,
      getReferencedColumn: (t) => t.transactionId,
      builder: (joinBuilder,{$addJoinBuilderToRootComposer,$removeJoinBuilderFromRootComposer }) => 
      $$SplitsTableFilterComposer(
              $db: $db,
              $table: $db.splits,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
        ));
          return f(composer);
        }

        }
      class $$TransactionsTableOrderingComposer extends Composer<
        _$AppDatabase,
        $TransactionsTable> {
        $$TransactionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
          ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id,
      builder: (column) => 
      ColumnOrderings(column));
      
ColumnOrderings<String> get merchantName => $composableBuilder(
      column: $table.merchantName,
      builder: (column) => 
      ColumnOrderings(column));
      
ColumnOrderings<String> get rawMerchantName => $composableBuilder(
      column: $table.rawMerchantName,
      builder: (column) => 
      ColumnOrderings(column));
      
ColumnOrderings<double> get amount => $composableBuilder(
      column: $table.amount,
      builder: (column) => 
      ColumnOrderings(column));
      
ColumnOrderings<double> get subtotalAmount => $composableBuilder(
      column: $table.subtotalAmount,
      builder: (column) => 
      ColumnOrderings(column));
      
ColumnOrderings<double> get taxAmount => $composableBuilder(
      column: $table.taxAmount,
      builder: (column) => 
      ColumnOrderings(column));
      
ColumnOrderings<double> get discountAmount => $composableBuilder(
      column: $table.discountAmount,
      builder: (column) => 
      ColumnOrderings(column));
      
ColumnOrderings<double> get tipAmount => $composableBuilder(
      column: $table.tipAmount,
      builder: (column) => 
      ColumnOrderings(column));
      
ColumnOrderings<DateTime> get date => $composableBuilder(
      column: $table.date,
      builder: (column) => 
      ColumnOrderings(column));
      
ColumnOrderings<bool> get isSubscription => $composableBuilder(
      column: $table.isSubscription,
      builder: (column) => 
      ColumnOrderings(column));
      
ColumnOrderings<int> get subscriptionId => $composableBuilder(
      column: $table.subscriptionId,
      builder: (column) => 
      ColumnOrderings(column));
      
ColumnOrderings<int> get kind => $composableBuilder(
      column: $table.kind,
      builder: (column) => 
      ColumnOrderings(column));
      
ColumnOrderings<int> get origin => $composableBuilder(
      column: $table.origin,
      builder: (column) => 
      ColumnOrderings(column));
      
ColumnOrderings<bool> get isRecurring => $composableBuilder(
      column: $table.isRecurring,
      builder: (column) => 
      ColumnOrderings(column));
      
ColumnOrderings<int> get extractionConfidence => $composableBuilder(
      column: $table.extractionConfidence,
      builder: (column) => 
      ColumnOrderings(column));
      
ColumnOrderings<bool> get hasLineItems => $composableBuilder(
      column: $table.hasLineItems,
      builder: (column) => 
      ColumnOrderings(column));
      
ColumnOrderings<String> get originalEmailId => $composableBuilder(
      column: $table.originalEmailId,
      builder: (column) => 
      ColumnOrderings(column));
      
ColumnOrderings<String> get currency => $composableBuilder(
      column: $table.currency,
      builder: (column) => 
      ColumnOrderings(column));
      
ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes,
      builder: (column) => 
      ColumnOrderings(column));
      
ColumnOrderings<bool> get userVerified => $composableBuilder(
      column: $table.userVerified,
      builder: (column) => 
      ColumnOrderings(column));
      
ColumnOrderings<bool> get hasSplits => $composableBuilder(
      column: $table.hasSplits,
      builder: (column) => 
      ColumnOrderings(column));
      
ColumnOrderings<bool> get isManuallyEdited => $composableBuilder(
      column: $table.isManuallyEdited,
      builder: (column) => 
      ColumnOrderings(column));
      
ColumnOrderings<DateTime> get manualEditTimestamp => $composableBuilder(
      column: $table.manualEditTimestamp,
      builder: (column) => 
      ColumnOrderings(column));
      
ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt,
      builder: (column) => 
      ColumnOrderings(column));
      
ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt,
      builder: (column) => 
      ColumnOrderings(column));
      
        $$CategoriesTableOrderingComposer get categoryId {
                final $$CategoriesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoryId,
      referencedTable: $db.categories,
      getReferencedColumn: (t) => t.id,
      builder: (joinBuilder,{$addJoinBuilderToRootComposer,$removeJoinBuilderFromRootComposer }) => 
      $$CategoriesTableOrderingComposer(
              $db: $db,
              $table: $db.categories,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
        ));
          return composer;
        }
        }
      class $$TransactionsTableAnnotationComposer extends Composer<
        _$AppDatabase,
        $TransactionsTable> {
        $$TransactionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
          GeneratedColumn<int> get id => $composableBuilder(
      column: $table.id,
      builder: (column) => column);
      
GeneratedColumn<String> get merchantName => $composableBuilder(
      column: $table.merchantName,
      builder: (column) => column);
      
GeneratedColumn<String> get rawMerchantName => $composableBuilder(
      column: $table.rawMerchantName,
      builder: (column) => column);
      
GeneratedColumn<double> get amount => $composableBuilder(
      column: $table.amount,
      builder: (column) => column);
      
GeneratedColumn<double> get subtotalAmount => $composableBuilder(
      column: $table.subtotalAmount,
      builder: (column) => column);
      
GeneratedColumn<double> get taxAmount => $composableBuilder(
      column: $table.taxAmount,
      builder: (column) => column);
      
GeneratedColumn<double> get discountAmount => $composableBuilder(
      column: $table.discountAmount,
      builder: (column) => column);
      
GeneratedColumn<double> get tipAmount => $composableBuilder(
      column: $table.tipAmount,
      builder: (column) => column);
      
GeneratedColumn<DateTime> get date => $composableBuilder(
      column: $table.date,
      builder: (column) => column);
      
GeneratedColumn<bool> get isSubscription => $composableBuilder(
      column: $table.isSubscription,
      builder: (column) => column);
      
GeneratedColumn<int> get subscriptionId => $composableBuilder(
      column: $table.subscriptionId,
      builder: (column) => column);
      
GeneratedColumn<int> get kind => $composableBuilder(
      column: $table.kind,
      builder: (column) => column);
      
GeneratedColumn<int> get origin => $composableBuilder(
      column: $table.origin,
      builder: (column) => column);
      
GeneratedColumn<bool> get isRecurring => $composableBuilder(
      column: $table.isRecurring,
      builder: (column) => column);
      
GeneratedColumn<int> get extractionConfidence => $composableBuilder(
      column: $table.extractionConfidence,
      builder: (column) => column);
      
GeneratedColumn<bool> get hasLineItems => $composableBuilder(
      column: $table.hasLineItems,
      builder: (column) => column);
      
GeneratedColumn<String> get originalEmailId => $composableBuilder(
      column: $table.originalEmailId,
      builder: (column) => column);
      
GeneratedColumn<String> get currency => $composableBuilder(
      column: $table.currency,
      builder: (column) => column);
      
GeneratedColumn<String> get notes => $composableBuilder(
      column: $table.notes,
      builder: (column) => column);
      
GeneratedColumn<bool> get userVerified => $composableBuilder(
      column: $table.userVerified,
      builder: (column) => column);
      
GeneratedColumn<bool> get hasSplits => $composableBuilder(
      column: $table.hasSplits,
      builder: (column) => column);
      
GeneratedColumn<bool> get isManuallyEdited => $composableBuilder(
      column: $table.isManuallyEdited,
      builder: (column) => column);
      
GeneratedColumn<DateTime> get manualEditTimestamp => $composableBuilder(
      column: $table.manualEditTimestamp,
      builder: (column) => column);
      
GeneratedColumn<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt,
      builder: (column) => column);
      
GeneratedColumn<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt,
      builder: (column) => column);
      
        $$CategoriesTableAnnotationComposer get categoryId {
                final $$CategoriesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoryId,
      referencedTable: $db.categories,
      getReferencedColumn: (t) => t.id,
      builder: (joinBuilder,{$addJoinBuilderToRootComposer,$removeJoinBuilderFromRootComposer }) => 
      $$CategoriesTableAnnotationComposer(
              $db: $db,
              $table: $db.categories,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
        ));
          return composer;
        }
        Expression<T> splitsRefs<T extends Object>(
          Expression<T> Function( $$SplitsTableAnnotationComposer a) f
        ) {
                final $$SplitsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.splits,
      getReferencedColumn: (t) => t.transactionId,
      builder: (joinBuilder,{$addJoinBuilderToRootComposer,$removeJoinBuilderFromRootComposer }) => 
      $$SplitsTableAnnotationComposer(
              $db: $db,
              $table: $db.splits,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
        ));
          return f(composer);
        }

        }
      class $$TransactionsTableTableManager extends RootTableManager    <_$AppDatabase,
    $TransactionsTable,
    Transaction,
    $$TransactionsTableFilterComposer,
    $$TransactionsTableOrderingComposer,
    $$TransactionsTableAnnotationComposer,
    $$TransactionsTableCreateCompanionBuilder,
    $$TransactionsTableUpdateCompanionBuilder,
    (Transaction,$$TransactionsTableReferences),
    Transaction,
    PrefetchHooks Function({bool categoryId,bool splitsRefs})
    > {
    $$TransactionsTableTableManager(_$AppDatabase db, $TransactionsTable table) : super(
      TableManagerState(
        db: db,
        table: table,
        createFilteringComposer: () => $$TransactionsTableFilterComposer($db: db,$table:table),
        createOrderingComposer: () => $$TransactionsTableOrderingComposer($db: db,$table:table),
        createComputedFieldComposer: () => $$TransactionsTableAnnotationComposer($db: db,$table:table),
        updateCompanionCallback: ({Value<int> id = const Value.absent(),Value<String> merchantName = const Value.absent(),Value<String?> rawMerchantName = const Value.absent(),Value<double> amount = const Value.absent(),Value<double?> subtotalAmount = const Value.absent(),Value<double?> taxAmount = const Value.absent(),Value<double?> discountAmount = const Value.absent(),Value<double?> tipAmount = const Value.absent(),Value<DateTime> date = const Value.absent(),Value<int?> categoryId = const Value.absent(),Value<bool> isSubscription = const Value.absent(),Value<int?> subscriptionId = const Value.absent(),Value<int> kind = const Value.absent(),Value<int> origin = const Value.absent(),Value<bool> isRecurring = const Value.absent(),Value<int> extractionConfidence = const Value.absent(),Value<bool> hasLineItems = const Value.absent(),Value<String?> originalEmailId = const Value.absent(),Value<String> currency = const Value.absent(),Value<String?> notes = const Value.absent(),Value<bool> userVerified = const Value.absent(),Value<bool> hasSplits = const Value.absent(),Value<bool> isManuallyEdited = const Value.absent(),Value<DateTime?> manualEditTimestamp = const Value.absent(),Value<DateTime> createdAt = const Value.absent(),Value<DateTime?> updatedAt = const Value.absent(),})=> TransactionsCompanion(id: id,merchantName: merchantName,rawMerchantName: rawMerchantName,amount: amount,subtotalAmount: subtotalAmount,taxAmount: taxAmount,discountAmount: discountAmount,tipAmount: tipAmount,date: date,categoryId: categoryId,isSubscription: isSubscription,subscriptionId: subscriptionId,kind: kind,origin: origin,isRecurring: isRecurring,extractionConfidence: extractionConfidence,hasLineItems: hasLineItems,originalEmailId: originalEmailId,currency: currency,notes: notes,userVerified: userVerified,hasSplits: hasSplits,isManuallyEdited: isManuallyEdited,manualEditTimestamp: manualEditTimestamp,createdAt: createdAt,updatedAt: updatedAt,),
        createCompanionCallback: ({Value<int> id = const Value.absent(),required String merchantName,Value<String?> rawMerchantName = const Value.absent(),required double amount,Value<double?> subtotalAmount = const Value.absent(),Value<double?> taxAmount = const Value.absent(),Value<double?> discountAmount = const Value.absent(),Value<double?> tipAmount = const Value.absent(),required DateTime date,Value<int?> categoryId = const Value.absent(),Value<bool> isSubscription = const Value.absent(),Value<int?> subscriptionId = const Value.absent(),Value<int> kind = const Value.absent(),Value<int> origin = const Value.absent(),Value<bool> isRecurring = const Value.absent(),Value<int> extractionConfidence = const Value.absent(),Value<bool> hasLineItems = const Value.absent(),Value<String?> originalEmailId = const Value.absent(),Value<String> currency = const Value.absent(),Value<String?> notes = const Value.absent(),Value<bool> userVerified = const Value.absent(),Value<bool> hasSplits = const Value.absent(),Value<bool> isManuallyEdited = const Value.absent(),Value<DateTime?> manualEditTimestamp = const Value.absent(),Value<DateTime> createdAt = const Value.absent(),Value<DateTime?> updatedAt = const Value.absent(),})=> TransactionsCompanion.insert(id: id,merchantName: merchantName,rawMerchantName: rawMerchantName,amount: amount,subtotalAmount: subtotalAmount,taxAmount: taxAmount,discountAmount: discountAmount,tipAmount: tipAmount,date: date,categoryId: categoryId,isSubscription: isSubscription,subscriptionId: subscriptionId,kind: kind,origin: origin,isRecurring: isRecurring,extractionConfidence: extractionConfidence,hasLineItems: hasLineItems,originalEmailId: originalEmailId,currency: currency,notes: notes,userVerified: userVerified,hasSplits: hasSplits,isManuallyEdited: isManuallyEdited,manualEditTimestamp: manualEditTimestamp,createdAt: createdAt,updatedAt: updatedAt,),
        withReferenceMapper: (p0) => p0
              .map(
                  (e) =>
                     (e.readTable(table), $$TransactionsTableReferences(db, table, e))
                  )
              .toList(),
        prefetchHooksCallback:         ({categoryId = false,splitsRefs = false}){
          return PrefetchHooks(
            db: db,
            explicitlyWatchedTables: [
             if (splitsRefs) db.splits
            ],
            addJoins: <T extends TableManagerState<dynamic,dynamic,dynamic,dynamic,dynamic,dynamic,dynamic,dynamic,dynamic,dynamic,dynamic>>(state) {

                                  if (categoryId){
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.categoryId,
                    referencedTable:
                        $$TransactionsTableReferences._categoryIdTable(db),
                    referencedColumn:
                        $$TransactionsTableReferences._categoryIdTable(db).id,
                  ) as T;
               }

                return state;
              }
,
            getPrefetchedDataCallback: (items) async {
            return [
                      if (splitsRefs) await $_getPrefetchedData(
                  currentTable: table,
                  referencedTable:
                      $$TransactionsTableReferences._splitsRefsTable(db),
                  managerFromTypedResult: (p0) =>
                      $$TransactionsTableReferences(db, table, p0).splitsRefs,
                  referencedItemsForCurrentItem: (item, referencedItems) =>
                      referencedItems.where((e) => e.transactionId == item.id),
                  typedResults: items)
            
                ];
              },
          );
        }
,
        ));
        }
    typedef $$TransactionsTableProcessedTableManager = ProcessedTableManager    <_$AppDatabase,
    $TransactionsTable,
    Transaction,
    $$TransactionsTableFilterComposer,
    $$TransactionsTableOrderingComposer,
    $$TransactionsTableAnnotationComposer,
    $$TransactionsTableCreateCompanionBuilder,
    $$TransactionsTableUpdateCompanionBuilder,
    (Transaction,$$TransactionsTableReferences),
    Transaction,
    PrefetchHooks Function({bool categoryId,bool splitsRefs})
    >;typedef $$SubscriptionsTableCreateCompanionBuilder = SubscriptionsCompanion Function({Value<int> id,required String serviceName,required double amount,required DateTime nextRenewalDate,required int frequency,required int lifecycleState,Value<int?> categoryId,required DateTime firstSeenDate,Value<DateTime?> lastChargedDate,Value<String?> priceHistoryJson,Value<String?> cycleHistoryJson,Value<int> frequencyConsistency,required int detectionSource,Value<String?> anomalies,Value<bool> isTrial,Value<DateTime?> trialEndDate,Value<int> chargeCount,Value<double?> averageDaysBetweenCharges,Value<String> currency,Value<String?> notes,Value<bool> userConfirmed,Value<bool> isZombie,Value<String?> zombieReason,Value<double?> lastPriceHikePercent,Value<DateTime> createdAt,Value<DateTime?> updatedAt,});
typedef $$SubscriptionsTableUpdateCompanionBuilder = SubscriptionsCompanion Function({Value<int> id,Value<String> serviceName,Value<double> amount,Value<DateTime> nextRenewalDate,Value<int> frequency,Value<int> lifecycleState,Value<int?> categoryId,Value<DateTime> firstSeenDate,Value<DateTime?> lastChargedDate,Value<String?> priceHistoryJson,Value<String?> cycleHistoryJson,Value<int> frequencyConsistency,Value<int> detectionSource,Value<String?> anomalies,Value<bool> isTrial,Value<DateTime?> trialEndDate,Value<int> chargeCount,Value<double?> averageDaysBetweenCharges,Value<String> currency,Value<String?> notes,Value<bool> userConfirmed,Value<bool> isZombie,Value<String?> zombieReason,Value<double?> lastPriceHikePercent,Value<DateTime> createdAt,Value<DateTime?> updatedAt,});
      final class $$SubscriptionsTableReferences extends BaseReferences<
        _$AppDatabase,
        $SubscriptionsTable,
        Subscription> {
        $$SubscriptionsTableReferences(super.$_db, super.$_table, super.$_typedResult);
        
                          static $CategoriesTable _categoryIdTable(_$AppDatabase db) => 
            db.categories.createAlias($_aliasNameGenerator(
            db.subscriptions.categoryId,
            db.categories.id));
          

        $$CategoriesTableProcessedTableManager? get categoryId {
          if ($_item.categoryId == null) return null;
          final manager = $$CategoriesTableTableManager($_db, $_db.categories).filter((f) => f.id($_item.categoryId!));
          final item = $_typedResult.readTableOrNull(_categoryIdTable($_db));
          if (item == null) return manager;
          return ProcessedTableManager(manager.$state.copyWith(prefetchedData: [item]));
        }


      }class $$SubscriptionsTableFilterComposer extends Composer<
        _$AppDatabase,
        $SubscriptionsTable> {
        $$SubscriptionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
          ColumnFilters<int> get id => $composableBuilder(
      column: $table.id,
      builder: (column) => 
      ColumnFilters(column));
      
ColumnFilters<String> get serviceName => $composableBuilder(
      column: $table.serviceName,
      builder: (column) => 
      ColumnFilters(column));
      
ColumnFilters<double> get amount => $composableBuilder(
      column: $table.amount,
      builder: (column) => 
      ColumnFilters(column));
      
ColumnFilters<DateTime> get nextRenewalDate => $composableBuilder(
      column: $table.nextRenewalDate,
      builder: (column) => 
      ColumnFilters(column));
      
ColumnFilters<int> get frequency => $composableBuilder(
      column: $table.frequency,
      builder: (column) => 
      ColumnFilters(column));
      
ColumnFilters<int> get lifecycleState => $composableBuilder(
      column: $table.lifecycleState,
      builder: (column) => 
      ColumnFilters(column));
      
ColumnFilters<DateTime> get firstSeenDate => $composableBuilder(
      column: $table.firstSeenDate,
      builder: (column) => 
      ColumnFilters(column));
      
ColumnFilters<DateTime> get lastChargedDate => $composableBuilder(
      column: $table.lastChargedDate,
      builder: (column) => 
      ColumnFilters(column));
      
ColumnFilters<String> get priceHistoryJson => $composableBuilder(
      column: $table.priceHistoryJson,
      builder: (column) => 
      ColumnFilters(column));
      
ColumnFilters<String> get cycleHistoryJson => $composableBuilder(
      column: $table.cycleHistoryJson,
      builder: (column) => 
      ColumnFilters(column));
      
ColumnFilters<int> get frequencyConsistency => $composableBuilder(
      column: $table.frequencyConsistency,
      builder: (column) => 
      ColumnFilters(column));
      
ColumnFilters<int> get detectionSource => $composableBuilder(
      column: $table.detectionSource,
      builder: (column) => 
      ColumnFilters(column));
      
ColumnFilters<String> get anomalies => $composableBuilder(
      column: $table.anomalies,
      builder: (column) => 
      ColumnFilters(column));
      
ColumnFilters<bool> get isTrial => $composableBuilder(
      column: $table.isTrial,
      builder: (column) => 
      ColumnFilters(column));
      
ColumnFilters<DateTime> get trialEndDate => $composableBuilder(
      column: $table.trialEndDate,
      builder: (column) => 
      ColumnFilters(column));
      
ColumnFilters<int> get chargeCount => $composableBuilder(
      column: $table.chargeCount,
      builder: (column) => 
      ColumnFilters(column));
      
ColumnFilters<double> get averageDaysBetweenCharges => $composableBuilder(
      column: $table.averageDaysBetweenCharges,
      builder: (column) => 
      ColumnFilters(column));
      
ColumnFilters<String> get currency => $composableBuilder(
      column: $table.currency,
      builder: (column) => 
      ColumnFilters(column));
      
ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes,
      builder: (column) => 
      ColumnFilters(column));
      
ColumnFilters<bool> get userConfirmed => $composableBuilder(
      column: $table.userConfirmed,
      builder: (column) => 
      ColumnFilters(column));
      
ColumnFilters<bool> get isZombie => $composableBuilder(
      column: $table.isZombie,
      builder: (column) => 
      ColumnFilters(column));
      
ColumnFilters<String> get zombieReason => $composableBuilder(
      column: $table.zombieReason,
      builder: (column) => 
      ColumnFilters(column));
      
ColumnFilters<double> get lastPriceHikePercent => $composableBuilder(
      column: $table.lastPriceHikePercent,
      builder: (column) => 
      ColumnFilters(column));
      
ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt,
      builder: (column) => 
      ColumnFilters(column));
      
ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt,
      builder: (column) => 
      ColumnFilters(column));
      
        $$CategoriesTableFilterComposer get categoryId {
                final $$CategoriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoryId,
      referencedTable: $db.categories,
      getReferencedColumn: (t) => t.id,
      builder: (joinBuilder,{$addJoinBuilderToRootComposer,$removeJoinBuilderFromRootComposer }) => 
      $$CategoriesTableFilterComposer(
              $db: $db,
              $table: $db.categories,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
        ));
          return composer;
        }
        }
      class $$SubscriptionsTableOrderingComposer extends Composer<
        _$AppDatabase,
        $SubscriptionsTable> {
        $$SubscriptionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
          ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id,
      builder: (column) => 
      ColumnOrderings(column));
      
ColumnOrderings<String> get serviceName => $composableBuilder(
      column: $table.serviceName,
      builder: (column) => 
      ColumnOrderings(column));
      
ColumnOrderings<double> get amount => $composableBuilder(
      column: $table.amount,
      builder: (column) => 
      ColumnOrderings(column));
      
ColumnOrderings<DateTime> get nextRenewalDate => $composableBuilder(
      column: $table.nextRenewalDate,
      builder: (column) => 
      ColumnOrderings(column));
      
ColumnOrderings<int> get frequency => $composableBuilder(
      column: $table.frequency,
      builder: (column) => 
      ColumnOrderings(column));
      
ColumnOrderings<int> get lifecycleState => $composableBuilder(
      column: $table.lifecycleState,
      builder: (column) => 
      ColumnOrderings(column));
      
ColumnOrderings<DateTime> get firstSeenDate => $composableBuilder(
      column: $table.firstSeenDate,
      builder: (column) => 
      ColumnOrderings(column));
      
ColumnOrderings<DateTime> get lastChargedDate => $composableBuilder(
      column: $table.lastChargedDate,
      builder: (column) => 
      ColumnOrderings(column));
      
ColumnOrderings<String> get priceHistoryJson => $composableBuilder(
      column: $table.priceHistoryJson,
      builder: (column) => 
      ColumnOrderings(column));
      
ColumnOrderings<String> get cycleHistoryJson => $composableBuilder(
      column: $table.cycleHistoryJson,
      builder: (column) => 
      ColumnOrderings(column));
      
ColumnOrderings<int> get frequencyConsistency => $composableBuilder(
      column: $table.frequencyConsistency,
      builder: (column) => 
      ColumnOrderings(column));
      
ColumnOrderings<int> get detectionSource => $composableBuilder(
      column: $table.detectionSource,
      builder: (column) => 
      ColumnOrderings(column));
      
ColumnOrderings<String> get anomalies => $composableBuilder(
      column: $table.anomalies,
      builder: (column) => 
      ColumnOrderings(column));
      
ColumnOrderings<bool> get isTrial => $composableBuilder(
      column: $table.isTrial,
      builder: (column) => 
      ColumnOrderings(column));
      
ColumnOrderings<DateTime> get trialEndDate => $composableBuilder(
      column: $table.trialEndDate,
      builder: (column) => 
      ColumnOrderings(column));
      
ColumnOrderings<int> get chargeCount => $composableBuilder(
      column: $table.chargeCount,
      builder: (column) => 
      ColumnOrderings(column));
      
ColumnOrderings<double> get averageDaysBetweenCharges => $composableBuilder(
      column: $table.averageDaysBetweenCharges,
      builder: (column) => 
      ColumnOrderings(column));
      
ColumnOrderings<String> get currency => $composableBuilder(
      column: $table.currency,
      builder: (column) => 
      ColumnOrderings(column));
      
ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes,
      builder: (column) => 
      ColumnOrderings(column));
      
ColumnOrderings<bool> get userConfirmed => $composableBuilder(
      column: $table.userConfirmed,
      builder: (column) => 
      ColumnOrderings(column));
      
ColumnOrderings<bool> get isZombie => $composableBuilder(
      column: $table.isZombie,
      builder: (column) => 
      ColumnOrderings(column));
      
ColumnOrderings<String> get zombieReason => $composableBuilder(
      column: $table.zombieReason,
      builder: (column) => 
      ColumnOrderings(column));
      
ColumnOrderings<double> get lastPriceHikePercent => $composableBuilder(
      column: $table.lastPriceHikePercent,
      builder: (column) => 
      ColumnOrderings(column));
      
ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt,
      builder: (column) => 
      ColumnOrderings(column));
      
ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt,
      builder: (column) => 
      ColumnOrderings(column));
      
        $$CategoriesTableOrderingComposer get categoryId {
                final $$CategoriesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoryId,
      referencedTable: $db.categories,
      getReferencedColumn: (t) => t.id,
      builder: (joinBuilder,{$addJoinBuilderToRootComposer,$removeJoinBuilderFromRootComposer }) => 
      $$CategoriesTableOrderingComposer(
              $db: $db,
              $table: $db.categories,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
        ));
          return composer;
        }
        }
      class $$SubscriptionsTableAnnotationComposer extends Composer<
        _$AppDatabase,
        $SubscriptionsTable> {
        $$SubscriptionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
          GeneratedColumn<int> get id => $composableBuilder(
      column: $table.id,
      builder: (column) => column);
      
GeneratedColumn<String> get serviceName => $composableBuilder(
      column: $table.serviceName,
      builder: (column) => column);
      
GeneratedColumn<double> get amount => $composableBuilder(
      column: $table.amount,
      builder: (column) => column);
      
GeneratedColumn<DateTime> get nextRenewalDate => $composableBuilder(
      column: $table.nextRenewalDate,
      builder: (column) => column);
      
GeneratedColumn<int> get frequency => $composableBuilder(
      column: $table.frequency,
      builder: (column) => column);
      
GeneratedColumn<int> get lifecycleState => $composableBuilder(
      column: $table.lifecycleState,
      builder: (column) => column);
      
GeneratedColumn<DateTime> get firstSeenDate => $composableBuilder(
      column: $table.firstSeenDate,
      builder: (column) => column);
      
GeneratedColumn<DateTime> get lastChargedDate => $composableBuilder(
      column: $table.lastChargedDate,
      builder: (column) => column);
      
GeneratedColumn<String> get priceHistoryJson => $composableBuilder(
      column: $table.priceHistoryJson,
      builder: (column) => column);
      
GeneratedColumn<String> get cycleHistoryJson => $composableBuilder(
      column: $table.cycleHistoryJson,
      builder: (column) => column);
      
GeneratedColumn<int> get frequencyConsistency => $composableBuilder(
      column: $table.frequencyConsistency,
      builder: (column) => column);
      
GeneratedColumn<int> get detectionSource => $composableBuilder(
      column: $table.detectionSource,
      builder: (column) => column);
      
GeneratedColumn<String> get anomalies => $composableBuilder(
      column: $table.anomalies,
      builder: (column) => column);
      
GeneratedColumn<bool> get isTrial => $composableBuilder(
      column: $table.isTrial,
      builder: (column) => column);
      
GeneratedColumn<DateTime> get trialEndDate => $composableBuilder(
      column: $table.trialEndDate,
      builder: (column) => column);
      
GeneratedColumn<int> get chargeCount => $composableBuilder(
      column: $table.chargeCount,
      builder: (column) => column);
      
GeneratedColumn<double> get averageDaysBetweenCharges => $composableBuilder(
      column: $table.averageDaysBetweenCharges,
      builder: (column) => column);
      
GeneratedColumn<String> get currency => $composableBuilder(
      column: $table.currency,
      builder: (column) => column);
      
GeneratedColumn<String> get notes => $composableBuilder(
      column: $table.notes,
      builder: (column) => column);
      
GeneratedColumn<bool> get userConfirmed => $composableBuilder(
      column: $table.userConfirmed,
      builder: (column) => column);
      
GeneratedColumn<bool> get isZombie => $composableBuilder(
      column: $table.isZombie,
      builder: (column) => column);
      
GeneratedColumn<String> get zombieReason => $composableBuilder(
      column: $table.zombieReason,
      builder: (column) => column);
      
GeneratedColumn<double> get lastPriceHikePercent => $composableBuilder(
      column: $table.lastPriceHikePercent,
      builder: (column) => column);
      
GeneratedColumn<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt,
      builder: (column) => column);
      
GeneratedColumn<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt,
      builder: (column) => column);
      
        $$CategoriesTableAnnotationComposer get categoryId {
                final $$CategoriesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoryId,
      referencedTable: $db.categories,
      getReferencedColumn: (t) => t.id,
      builder: (joinBuilder,{$addJoinBuilderToRootComposer,$removeJoinBuilderFromRootComposer }) => 
      $$CategoriesTableAnnotationComposer(
              $db: $db,
              $table: $db.categories,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
        ));
          return composer;
        }
        }
      class $$SubscriptionsTableTableManager extends RootTableManager    <_$AppDatabase,
    $SubscriptionsTable,
    Subscription,
    $$SubscriptionsTableFilterComposer,
    $$SubscriptionsTableOrderingComposer,
    $$SubscriptionsTableAnnotationComposer,
    $$SubscriptionsTableCreateCompanionBuilder,
    $$SubscriptionsTableUpdateCompanionBuilder,
    (Subscription,$$SubscriptionsTableReferences),
    Subscription,
    PrefetchHooks Function({bool categoryId})
    > {
    $$SubscriptionsTableTableManager(_$AppDatabase db, $SubscriptionsTable table) : super(
      TableManagerState(
        db: db,
        table: table,
        createFilteringComposer: () => $$SubscriptionsTableFilterComposer($db: db,$table:table),
        createOrderingComposer: () => $$SubscriptionsTableOrderingComposer($db: db,$table:table),
        createComputedFieldComposer: () => $$SubscriptionsTableAnnotationComposer($db: db,$table:table),
        updateCompanionCallback: ({Value<int> id = const Value.absent(),Value<String> serviceName = const Value.absent(),Value<double> amount = const Value.absent(),Value<DateTime> nextRenewalDate = const Value.absent(),Value<int> frequency = const Value.absent(),Value<int> lifecycleState = const Value.absent(),Value<int?> categoryId = const Value.absent(),Value<DateTime> firstSeenDate = const Value.absent(),Value<DateTime?> lastChargedDate = const Value.absent(),Value<String?> priceHistoryJson = const Value.absent(),Value<String?> cycleHistoryJson = const Value.absent(),Value<int> frequencyConsistency = const Value.absent(),Value<int> detectionSource = const Value.absent(),Value<String?> anomalies = const Value.absent(),Value<bool> isTrial = const Value.absent(),Value<DateTime?> trialEndDate = const Value.absent(),Value<int> chargeCount = const Value.absent(),Value<double?> averageDaysBetweenCharges = const Value.absent(),Value<String> currency = const Value.absent(),Value<String?> notes = const Value.absent(),Value<bool> userConfirmed = const Value.absent(),Value<bool> isZombie = const Value.absent(),Value<String?> zombieReason = const Value.absent(),Value<double?> lastPriceHikePercent = const Value.absent(),Value<DateTime> createdAt = const Value.absent(),Value<DateTime?> updatedAt = const Value.absent(),})=> SubscriptionsCompanion(id: id,serviceName: serviceName,amount: amount,nextRenewalDate: nextRenewalDate,frequency: frequency,lifecycleState: lifecycleState,categoryId: categoryId,firstSeenDate: firstSeenDate,lastChargedDate: lastChargedDate,priceHistoryJson: priceHistoryJson,cycleHistoryJson: cycleHistoryJson,frequencyConsistency: frequencyConsistency,detectionSource: detectionSource,anomalies: anomalies,isTrial: isTrial,trialEndDate: trialEndDate,chargeCount: chargeCount,averageDaysBetweenCharges: averageDaysBetweenCharges,currency: currency,notes: notes,userConfirmed: userConfirmed,isZombie: isZombie,zombieReason: zombieReason,lastPriceHikePercent: lastPriceHikePercent,createdAt: createdAt,updatedAt: updatedAt,),
        createCompanionCallback: ({Value<int> id = const Value.absent(),required String serviceName,required double amount,required DateTime nextRenewalDate,required int frequency,required int lifecycleState,Value<int?> categoryId = const Value.absent(),required DateTime firstSeenDate,Value<DateTime?> lastChargedDate = const Value.absent(),Value<String?> priceHistoryJson = const Value.absent(),Value<String?> cycleHistoryJson = const Value.absent(),Value<int> frequencyConsistency = const Value.absent(),required int detectionSource,Value<String?> anomalies = const Value.absent(),Value<bool> isTrial = const Value.absent(),Value<DateTime?> trialEndDate = const Value.absent(),Value<int> chargeCount = const Value.absent(),Value<double?> averageDaysBetweenCharges = const Value.absent(),Value<String> currency = const Value.absent(),Value<String?> notes = const Value.absent(),Value<bool> userConfirmed = const Value.absent(),Value<bool> isZombie = const Value.absent(),Value<String?> zombieReason = const Value.absent(),Value<double?> lastPriceHikePercent = const Value.absent(),Value<DateTime> createdAt = const Value.absent(),Value<DateTime?> updatedAt = const Value.absent(),})=> SubscriptionsCompanion.insert(id: id,serviceName: serviceName,amount: amount,nextRenewalDate: nextRenewalDate,frequency: frequency,lifecycleState: lifecycleState,categoryId: categoryId,firstSeenDate: firstSeenDate,lastChargedDate: lastChargedDate,priceHistoryJson: priceHistoryJson,cycleHistoryJson: cycleHistoryJson,frequencyConsistency: frequencyConsistency,detectionSource: detectionSource,anomalies: anomalies,isTrial: isTrial,trialEndDate: trialEndDate,chargeCount: chargeCount,averageDaysBetweenCharges: averageDaysBetweenCharges,currency: currency,notes: notes,userConfirmed: userConfirmed,isZombie: isZombie,zombieReason: zombieReason,lastPriceHikePercent: lastPriceHikePercent,createdAt: createdAt,updatedAt: updatedAt,),
        withReferenceMapper: (p0) => p0
              .map(
                  (e) =>
                     (e.readTable(table), $$SubscriptionsTableReferences(db, table, e))
                  )
              .toList(),
        prefetchHooksCallback:         ({categoryId = false}){
          return PrefetchHooks(
            db: db,
            explicitlyWatchedTables: [
             
            ],
            addJoins: <T extends TableManagerState<dynamic,dynamic,dynamic,dynamic,dynamic,dynamic,dynamic,dynamic,dynamic,dynamic,dynamic>>(state) {

                                  if (categoryId){
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.categoryId,
                    referencedTable:
                        $$SubscriptionsTableReferences._categoryIdTable(db),
                    referencedColumn:
                        $$SubscriptionsTableReferences._categoryIdTable(db).id,
                  ) as T;
               }

                return state;
              }
,
            getPrefetchedDataCallback: (items) async {
            return [
            
                ];
              },
          );
        }
,
        ));
        }
    typedef $$SubscriptionsTableProcessedTableManager = ProcessedTableManager    <_$AppDatabase,
    $SubscriptionsTable,
    Subscription,
    $$SubscriptionsTableFilterComposer,
    $$SubscriptionsTableOrderingComposer,
    $$SubscriptionsTableAnnotationComposer,
    $$SubscriptionsTableCreateCompanionBuilder,
    $$SubscriptionsTableUpdateCompanionBuilder,
    (Subscription,$$SubscriptionsTableReferences),
    Subscription,
    PrefetchHooks Function({bool categoryId})
    >;typedef $$MappingsTableCreateCompanionBuilder = MappingsCompanion Function({Value<int> id,required String merchantName,required int categoryId,Value<bool> isAutomatic,Value<int> confidence,Value<bool> userConfirmed,Value<DateTime> createdAt,Value<DateTime?> updatedAt,});
typedef $$MappingsTableUpdateCompanionBuilder = MappingsCompanion Function({Value<int> id,Value<String> merchantName,Value<int> categoryId,Value<bool> isAutomatic,Value<int> confidence,Value<bool> userConfirmed,Value<DateTime> createdAt,Value<DateTime?> updatedAt,});
      final class $$MappingsTableReferences extends BaseReferences<
        _$AppDatabase,
        $MappingsTable,
        Mapping> {
        $$MappingsTableReferences(super.$_db, super.$_table, super.$_typedResult);
        
                          static $CategoriesTable _categoryIdTable(_$AppDatabase db) => 
            db.categories.createAlias($_aliasNameGenerator(
            db.mappings.categoryId,
            db.categories.id));
          

        $$CategoriesTableProcessedTableManager? get categoryId {
          if ($_item.categoryId == null) return null;
          final manager = $$CategoriesTableTableManager($_db, $_db.categories).filter((f) => f.id($_item.categoryId!));
          final item = $_typedResult.readTableOrNull(_categoryIdTable($_db));
          if (item == null) return manager;
          return ProcessedTableManager(manager.$state.copyWith(prefetchedData: [item]));
        }


      }class $$MappingsTableFilterComposer extends Composer<
        _$AppDatabase,
        $MappingsTable> {
        $$MappingsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
          ColumnFilters<int> get id => $composableBuilder(
      column: $table.id,
      builder: (column) => 
      ColumnFilters(column));
      
ColumnFilters<String> get merchantName => $composableBuilder(
      column: $table.merchantName,
      builder: (column) => 
      ColumnFilters(column));
      
ColumnFilters<bool> get isAutomatic => $composableBuilder(
      column: $table.isAutomatic,
      builder: (column) => 
      ColumnFilters(column));
      
ColumnFilters<int> get confidence => $composableBuilder(
      column: $table.confidence,
      builder: (column) => 
      ColumnFilters(column));
      
ColumnFilters<bool> get userConfirmed => $composableBuilder(
      column: $table.userConfirmed,
      builder: (column) => 
      ColumnFilters(column));
      
ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt,
      builder: (column) => 
      ColumnFilters(column));
      
ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt,
      builder: (column) => 
      ColumnFilters(column));
      
        $$CategoriesTableFilterComposer get categoryId {
                final $$CategoriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoryId,
      referencedTable: $db.categories,
      getReferencedColumn: (t) => t.id,
      builder: (joinBuilder,{$addJoinBuilderToRootComposer,$removeJoinBuilderFromRootComposer }) => 
      $$CategoriesTableFilterComposer(
              $db: $db,
              $table: $db.categories,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
        ));
          return composer;
        }
        }
      class $$MappingsTableOrderingComposer extends Composer<
        _$AppDatabase,
        $MappingsTable> {
        $$MappingsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
          ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id,
      builder: (column) => 
      ColumnOrderings(column));
      
ColumnOrderings<String> get merchantName => $composableBuilder(
      column: $table.merchantName,
      builder: (column) => 
      ColumnOrderings(column));
      
ColumnOrderings<bool> get isAutomatic => $composableBuilder(
      column: $table.isAutomatic,
      builder: (column) => 
      ColumnOrderings(column));
      
ColumnOrderings<int> get confidence => $composableBuilder(
      column: $table.confidence,
      builder: (column) => 
      ColumnOrderings(column));
      
ColumnOrderings<bool> get userConfirmed => $composableBuilder(
      column: $table.userConfirmed,
      builder: (column) => 
      ColumnOrderings(column));
      
ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt,
      builder: (column) => 
      ColumnOrderings(column));
      
ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt,
      builder: (column) => 
      ColumnOrderings(column));
      
        $$CategoriesTableOrderingComposer get categoryId {
                final $$CategoriesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoryId,
      referencedTable: $db.categories,
      getReferencedColumn: (t) => t.id,
      builder: (joinBuilder,{$addJoinBuilderToRootComposer,$removeJoinBuilderFromRootComposer }) => 
      $$CategoriesTableOrderingComposer(
              $db: $db,
              $table: $db.categories,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
        ));
          return composer;
        }
        }
      class $$MappingsTableAnnotationComposer extends Composer<
        _$AppDatabase,
        $MappingsTable> {
        $$MappingsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
          GeneratedColumn<int> get id => $composableBuilder(
      column: $table.id,
      builder: (column) => column);
      
GeneratedColumn<String> get merchantName => $composableBuilder(
      column: $table.merchantName,
      builder: (column) => column);
      
GeneratedColumn<bool> get isAutomatic => $composableBuilder(
      column: $table.isAutomatic,
      builder: (column) => column);
      
GeneratedColumn<int> get confidence => $composableBuilder(
      column: $table.confidence,
      builder: (column) => column);
      
GeneratedColumn<bool> get userConfirmed => $composableBuilder(
      column: $table.userConfirmed,
      builder: (column) => column);
      
GeneratedColumn<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt,
      builder: (column) => column);
      
GeneratedColumn<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt,
      builder: (column) => column);
      
        $$CategoriesTableAnnotationComposer get categoryId {
                final $$CategoriesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoryId,
      referencedTable: $db.categories,
      getReferencedColumn: (t) => t.id,
      builder: (joinBuilder,{$addJoinBuilderToRootComposer,$removeJoinBuilderFromRootComposer }) => 
      $$CategoriesTableAnnotationComposer(
              $db: $db,
              $table: $db.categories,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
        ));
          return composer;
        }
        }
      class $$MappingsTableTableManager extends RootTableManager    <_$AppDatabase,
    $MappingsTable,
    Mapping,
    $$MappingsTableFilterComposer,
    $$MappingsTableOrderingComposer,
    $$MappingsTableAnnotationComposer,
    $$MappingsTableCreateCompanionBuilder,
    $$MappingsTableUpdateCompanionBuilder,
    (Mapping,$$MappingsTableReferences),
    Mapping,
    PrefetchHooks Function({bool categoryId})
    > {
    $$MappingsTableTableManager(_$AppDatabase db, $MappingsTable table) : super(
      TableManagerState(
        db: db,
        table: table,
        createFilteringComposer: () => $$MappingsTableFilterComposer($db: db,$table:table),
        createOrderingComposer: () => $$MappingsTableOrderingComposer($db: db,$table:table),
        createComputedFieldComposer: () => $$MappingsTableAnnotationComposer($db: db,$table:table),
        updateCompanionCallback: ({Value<int> id = const Value.absent(),Value<String> merchantName = const Value.absent(),Value<int> categoryId = const Value.absent(),Value<bool> isAutomatic = const Value.absent(),Value<int> confidence = const Value.absent(),Value<bool> userConfirmed = const Value.absent(),Value<DateTime> createdAt = const Value.absent(),Value<DateTime?> updatedAt = const Value.absent(),})=> MappingsCompanion(id: id,merchantName: merchantName,categoryId: categoryId,isAutomatic: isAutomatic,confidence: confidence,userConfirmed: userConfirmed,createdAt: createdAt,updatedAt: updatedAt,),
        createCompanionCallback: ({Value<int> id = const Value.absent(),required String merchantName,required int categoryId,Value<bool> isAutomatic = const Value.absent(),Value<int> confidence = const Value.absent(),Value<bool> userConfirmed = const Value.absent(),Value<DateTime> createdAt = const Value.absent(),Value<DateTime?> updatedAt = const Value.absent(),})=> MappingsCompanion.insert(id: id,merchantName: merchantName,categoryId: categoryId,isAutomatic: isAutomatic,confidence: confidence,userConfirmed: userConfirmed,createdAt: createdAt,updatedAt: updatedAt,),
        withReferenceMapper: (p0) => p0
              .map(
                  (e) =>
                     (e.readTable(table), $$MappingsTableReferences(db, table, e))
                  )
              .toList(),
        prefetchHooksCallback:         ({categoryId = false}){
          return PrefetchHooks(
            db: db,
            explicitlyWatchedTables: [
             
            ],
            addJoins: <T extends TableManagerState<dynamic,dynamic,dynamic,dynamic,dynamic,dynamic,dynamic,dynamic,dynamic,dynamic,dynamic>>(state) {

                                  if (categoryId){
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.categoryId,
                    referencedTable:
                        $$MappingsTableReferences._categoryIdTable(db),
                    referencedColumn:
                        $$MappingsTableReferences._categoryIdTable(db).id,
                  ) as T;
               }

                return state;
              }
,
            getPrefetchedDataCallback: (items) async {
            return [
            
                ];
              },
          );
        }
,
        ));
        }
    typedef $$MappingsTableProcessedTableManager = ProcessedTableManager    <_$AppDatabase,
    $MappingsTable,
    Mapping,
    $$MappingsTableFilterComposer,
    $$MappingsTableOrderingComposer,
    $$MappingsTableAnnotationComposer,
    $$MappingsTableCreateCompanionBuilder,
    $$MappingsTableUpdateCompanionBuilder,
    (Mapping,$$MappingsTableReferences),
    Mapping,
    PrefetchHooks Function({bool categoryId})
    >;typedef $$BudgetsTableCreateCompanionBuilder = BudgetsCompanion Function({Value<int> id,Value<int?> categoryId,required double limitAmount,Value<int> period,Value<bool> rollover,Value<double> carryOverAmount,Value<DateTime> createdAt,Value<DateTime?> updatedAt,});
typedef $$BudgetsTableUpdateCompanionBuilder = BudgetsCompanion Function({Value<int> id,Value<int?> categoryId,Value<double> limitAmount,Value<int> period,Value<bool> rollover,Value<double> carryOverAmount,Value<DateTime> createdAt,Value<DateTime?> updatedAt,});
      final class $$BudgetsTableReferences extends BaseReferences<
        _$AppDatabase,
        $BudgetsTable,
        Budget> {
        $$BudgetsTableReferences(super.$_db, super.$_table, super.$_typedResult);
        
                          static $CategoriesTable _categoryIdTable(_$AppDatabase db) => 
            db.categories.createAlias($_aliasNameGenerator(
            db.budgets.categoryId,
            db.categories.id));
          

        $$CategoriesTableProcessedTableManager? get categoryId {
          if ($_item.categoryId == null) return null;
          final manager = $$CategoriesTableTableManager($_db, $_db.categories).filter((f) => f.id($_item.categoryId!));
          final item = $_typedResult.readTableOrNull(_categoryIdTable($_db));
          if (item == null) return manager;
          return ProcessedTableManager(manager.$state.copyWith(prefetchedData: [item]));
        }


      }class $$BudgetsTableFilterComposer extends Composer<
        _$AppDatabase,
        $BudgetsTable> {
        $$BudgetsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
          ColumnFilters<int> get id => $composableBuilder(
      column: $table.id,
      builder: (column) => 
      ColumnFilters(column));
      
ColumnFilters<double> get limitAmount => $composableBuilder(
      column: $table.limitAmount,
      builder: (column) => 
      ColumnFilters(column));
      
ColumnFilters<int> get period => $composableBuilder(
      column: $table.period,
      builder: (column) => 
      ColumnFilters(column));
      
ColumnFilters<bool> get rollover => $composableBuilder(
      column: $table.rollover,
      builder: (column) => 
      ColumnFilters(column));
      
ColumnFilters<double> get carryOverAmount => $composableBuilder(
      column: $table.carryOverAmount,
      builder: (column) => 
      ColumnFilters(column));
      
ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt,
      builder: (column) => 
      ColumnFilters(column));
      
ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt,
      builder: (column) => 
      ColumnFilters(column));
      
        $$CategoriesTableFilterComposer get categoryId {
                final $$CategoriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoryId,
      referencedTable: $db.categories,
      getReferencedColumn: (t) => t.id,
      builder: (joinBuilder,{$addJoinBuilderToRootComposer,$removeJoinBuilderFromRootComposer }) => 
      $$CategoriesTableFilterComposer(
              $db: $db,
              $table: $db.categories,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
        ));
          return composer;
        }
        }
      class $$BudgetsTableOrderingComposer extends Composer<
        _$AppDatabase,
        $BudgetsTable> {
        $$BudgetsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
          ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id,
      builder: (column) => 
      ColumnOrderings(column));
      
ColumnOrderings<double> get limitAmount => $composableBuilder(
      column: $table.limitAmount,
      builder: (column) => 
      ColumnOrderings(column));
      
ColumnOrderings<int> get period => $composableBuilder(
      column: $table.period,
      builder: (column) => 
      ColumnOrderings(column));
      
ColumnOrderings<bool> get rollover => $composableBuilder(
      column: $table.rollover,
      builder: (column) => 
      ColumnOrderings(column));
      
ColumnOrderings<double> get carryOverAmount => $composableBuilder(
      column: $table.carryOverAmount,
      builder: (column) => 
      ColumnOrderings(column));
      
ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt,
      builder: (column) => 
      ColumnOrderings(column));
      
ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt,
      builder: (column) => 
      ColumnOrderings(column));
      
        $$CategoriesTableOrderingComposer get categoryId {
                final $$CategoriesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoryId,
      referencedTable: $db.categories,
      getReferencedColumn: (t) => t.id,
      builder: (joinBuilder,{$addJoinBuilderToRootComposer,$removeJoinBuilderFromRootComposer }) => 
      $$CategoriesTableOrderingComposer(
              $db: $db,
              $table: $db.categories,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
        ));
          return composer;
        }
        }
      class $$BudgetsTableAnnotationComposer extends Composer<
        _$AppDatabase,
        $BudgetsTable> {
        $$BudgetsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
          GeneratedColumn<int> get id => $composableBuilder(
      column: $table.id,
      builder: (column) => column);
      
GeneratedColumn<double> get limitAmount => $composableBuilder(
      column: $table.limitAmount,
      builder: (column) => column);
      
GeneratedColumn<int> get period => $composableBuilder(
      column: $table.period,
      builder: (column) => column);
      
GeneratedColumn<bool> get rollover => $composableBuilder(
      column: $table.rollover,
      builder: (column) => column);
      
GeneratedColumn<double> get carryOverAmount => $composableBuilder(
      column: $table.carryOverAmount,
      builder: (column) => column);
      
GeneratedColumn<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt,
      builder: (column) => column);
      
GeneratedColumn<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt,
      builder: (column) => column);
      
        $$CategoriesTableAnnotationComposer get categoryId {
                final $$CategoriesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoryId,
      referencedTable: $db.categories,
      getReferencedColumn: (t) => t.id,
      builder: (joinBuilder,{$addJoinBuilderToRootComposer,$removeJoinBuilderFromRootComposer }) => 
      $$CategoriesTableAnnotationComposer(
              $db: $db,
              $table: $db.categories,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
        ));
          return composer;
        }
        }
      class $$BudgetsTableTableManager extends RootTableManager    <_$AppDatabase,
    $BudgetsTable,
    Budget,
    $$BudgetsTableFilterComposer,
    $$BudgetsTableOrderingComposer,
    $$BudgetsTableAnnotationComposer,
    $$BudgetsTableCreateCompanionBuilder,
    $$BudgetsTableUpdateCompanionBuilder,
    (Budget,$$BudgetsTableReferences),
    Budget,
    PrefetchHooks Function({bool categoryId})
    > {
    $$BudgetsTableTableManager(_$AppDatabase db, $BudgetsTable table) : super(
      TableManagerState(
        db: db,
        table: table,
        createFilteringComposer: () => $$BudgetsTableFilterComposer($db: db,$table:table),
        createOrderingComposer: () => $$BudgetsTableOrderingComposer($db: db,$table:table),
        createComputedFieldComposer: () => $$BudgetsTableAnnotationComposer($db: db,$table:table),
        updateCompanionCallback: ({Value<int> id = const Value.absent(),Value<int?> categoryId = const Value.absent(),Value<double> limitAmount = const Value.absent(),Value<int> period = const Value.absent(),Value<bool> rollover = const Value.absent(),Value<double> carryOverAmount = const Value.absent(),Value<DateTime> createdAt = const Value.absent(),Value<DateTime?> updatedAt = const Value.absent(),})=> BudgetsCompanion(id: id,categoryId: categoryId,limitAmount: limitAmount,period: period,rollover: rollover,carryOverAmount: carryOverAmount,createdAt: createdAt,updatedAt: updatedAt,),
        createCompanionCallback: ({Value<int> id = const Value.absent(),Value<int?> categoryId = const Value.absent(),required double limitAmount,Value<int> period = const Value.absent(),Value<bool> rollover = const Value.absent(),Value<double> carryOverAmount = const Value.absent(),Value<DateTime> createdAt = const Value.absent(),Value<DateTime?> updatedAt = const Value.absent(),})=> BudgetsCompanion.insert(id: id,categoryId: categoryId,limitAmount: limitAmount,period: period,rollover: rollover,carryOverAmount: carryOverAmount,createdAt: createdAt,updatedAt: updatedAt,),
        withReferenceMapper: (p0) => p0
              .map(
                  (e) =>
                     (e.readTable(table), $$BudgetsTableReferences(db, table, e))
                  )
              .toList(),
        prefetchHooksCallback:         ({categoryId = false}){
          return PrefetchHooks(
            db: db,
            explicitlyWatchedTables: [
             
            ],
            addJoins: <T extends TableManagerState<dynamic,dynamic,dynamic,dynamic,dynamic,dynamic,dynamic,dynamic,dynamic,dynamic,dynamic>>(state) {

                                  if (categoryId){
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.categoryId,
                    referencedTable:
                        $$BudgetsTableReferences._categoryIdTable(db),
                    referencedColumn:
                        $$BudgetsTableReferences._categoryIdTable(db).id,
                  ) as T;
               }

                return state;
              }
,
            getPrefetchedDataCallback: (items) async {
            return [
            
                ];
              },
          );
        }
,
        ));
        }
    typedef $$BudgetsTableProcessedTableManager = ProcessedTableManager    <_$AppDatabase,
    $BudgetsTable,
    Budget,
    $$BudgetsTableFilterComposer,
    $$BudgetsTableOrderingComposer,
    $$BudgetsTableAnnotationComposer,
    $$BudgetsTableCreateCompanionBuilder,
    $$BudgetsTableUpdateCompanionBuilder,
    (Budget,$$BudgetsTableReferences),
    Budget,
    PrefetchHooks Function({bool categoryId})
    >;typedef $$SplitsTableCreateCompanionBuilder = SplitsCompanion Function({Value<int> id,required int transactionId,required int categoryId,required double amount,Value<String?> notes,Value<DateTime> createdAt,});
typedef $$SplitsTableUpdateCompanionBuilder = SplitsCompanion Function({Value<int> id,Value<int> transactionId,Value<int> categoryId,Value<double> amount,Value<String?> notes,Value<DateTime> createdAt,});
      final class $$SplitsTableReferences extends BaseReferences<
        _$AppDatabase,
        $SplitsTable,
        Split> {
        $$SplitsTableReferences(super.$_db, super.$_table, super.$_typedResult);
        
                          static $TransactionsTable _transactionIdTable(_$AppDatabase db) => 
            db.transactions.createAlias($_aliasNameGenerator(
            db.splits.transactionId,
            db.transactions.id));
          

        $$TransactionsTableProcessedTableManager? get transactionId {
          if ($_item.transactionId == null) return null;
          final manager = $$TransactionsTableTableManager($_db, $_db.transactions).filter((f) => f.id($_item.transactionId!));
          final item = $_typedResult.readTableOrNull(_transactionIdTable($_db));
          if (item == null) return manager;
          return ProcessedTableManager(manager.$state.copyWith(prefetchedData: [item]));
        }

                  static $CategoriesTable _categoryIdTable(_$AppDatabase db) => 
            db.categories.createAlias($_aliasNameGenerator(
            db.splits.categoryId,
            db.categories.id));
          

        $$CategoriesTableProcessedTableManager? get categoryId {
          if ($_item.categoryId == null) return null;
          final manager = $$CategoriesTableTableManager($_db, $_db.categories).filter((f) => f.id($_item.categoryId!));
          final item = $_typedResult.readTableOrNull(_categoryIdTable($_db));
          if (item == null) return manager;
          return ProcessedTableManager(manager.$state.copyWith(prefetchedData: [item]));
        }


      }class $$SplitsTableFilterComposer extends Composer<
        _$AppDatabase,
        $SplitsTable> {
        $$SplitsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
          ColumnFilters<int> get id => $composableBuilder(
      column: $table.id,
      builder: (column) => 
      ColumnFilters(column));
      
ColumnFilters<double> get amount => $composableBuilder(
      column: $table.amount,
      builder: (column) => 
      ColumnFilters(column));
      
ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes,
      builder: (column) => 
      ColumnFilters(column));
      
ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt,
      builder: (column) => 
      ColumnFilters(column));
      
        $$TransactionsTableFilterComposer get transactionId {
                final $$TransactionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.transactionId,
      referencedTable: $db.transactions,
      getReferencedColumn: (t) => t.id,
      builder: (joinBuilder,{$addJoinBuilderToRootComposer,$removeJoinBuilderFromRootComposer }) => 
      $$TransactionsTableFilterComposer(
              $db: $db,
              $table: $db.transactions,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
        ));
          return composer;
        }
        $$CategoriesTableFilterComposer get categoryId {
                final $$CategoriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoryId,
      referencedTable: $db.categories,
      getReferencedColumn: (t) => t.id,
      builder: (joinBuilder,{$addJoinBuilderToRootComposer,$removeJoinBuilderFromRootComposer }) => 
      $$CategoriesTableFilterComposer(
              $db: $db,
              $table: $db.categories,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
        ));
          return composer;
        }
        }
      class $$SplitsTableOrderingComposer extends Composer<
        _$AppDatabase,
        $SplitsTable> {
        $$SplitsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
          ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id,
      builder: (column) => 
      ColumnOrderings(column));
      
ColumnOrderings<double> get amount => $composableBuilder(
      column: $table.amount,
      builder: (column) => 
      ColumnOrderings(column));
      
ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes,
      builder: (column) => 
      ColumnOrderings(column));
      
ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt,
      builder: (column) => 
      ColumnOrderings(column));
      
        $$TransactionsTableOrderingComposer get transactionId {
                final $$TransactionsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.transactionId,
      referencedTable: $db.transactions,
      getReferencedColumn: (t) => t.id,
      builder: (joinBuilder,{$addJoinBuilderToRootComposer,$removeJoinBuilderFromRootComposer }) => 
      $$TransactionsTableOrderingComposer(
              $db: $db,
              $table: $db.transactions,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
        ));
          return composer;
        }
        $$CategoriesTableOrderingComposer get categoryId {
                final $$CategoriesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoryId,
      referencedTable: $db.categories,
      getReferencedColumn: (t) => t.id,
      builder: (joinBuilder,{$addJoinBuilderToRootComposer,$removeJoinBuilderFromRootComposer }) => 
      $$CategoriesTableOrderingComposer(
              $db: $db,
              $table: $db.categories,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
        ));
          return composer;
        }
        }
      class $$SplitsTableAnnotationComposer extends Composer<
        _$AppDatabase,
        $SplitsTable> {
        $$SplitsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
          GeneratedColumn<int> get id => $composableBuilder(
      column: $table.id,
      builder: (column) => column);
      
GeneratedColumn<double> get amount => $composableBuilder(
      column: $table.amount,
      builder: (column) => column);
      
GeneratedColumn<String> get notes => $composableBuilder(
      column: $table.notes,
      builder: (column) => column);
      
GeneratedColumn<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt,
      builder: (column) => column);
      
        $$TransactionsTableAnnotationComposer get transactionId {
                final $$TransactionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.transactionId,
      referencedTable: $db.transactions,
      getReferencedColumn: (t) => t.id,
      builder: (joinBuilder,{$addJoinBuilderToRootComposer,$removeJoinBuilderFromRootComposer }) => 
      $$TransactionsTableAnnotationComposer(
              $db: $db,
              $table: $db.transactions,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
        ));
          return composer;
        }
        $$CategoriesTableAnnotationComposer get categoryId {
                final $$CategoriesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoryId,
      referencedTable: $db.categories,
      getReferencedColumn: (t) => t.id,
      builder: (joinBuilder,{$addJoinBuilderToRootComposer,$removeJoinBuilderFromRootComposer }) => 
      $$CategoriesTableAnnotationComposer(
              $db: $db,
              $table: $db.categories,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
        ));
          return composer;
        }
        }
      class $$SplitsTableTableManager extends RootTableManager    <_$AppDatabase,
    $SplitsTable,
    Split,
    $$SplitsTableFilterComposer,
    $$SplitsTableOrderingComposer,
    $$SplitsTableAnnotationComposer,
    $$SplitsTableCreateCompanionBuilder,
    $$SplitsTableUpdateCompanionBuilder,
    (Split,$$SplitsTableReferences),
    Split,
    PrefetchHooks Function({bool transactionId,bool categoryId})
    > {
    $$SplitsTableTableManager(_$AppDatabase db, $SplitsTable table) : super(
      TableManagerState(
        db: db,
        table: table,
        createFilteringComposer: () => $$SplitsTableFilterComposer($db: db,$table:table),
        createOrderingComposer: () => $$SplitsTableOrderingComposer($db: db,$table:table),
        createComputedFieldComposer: () => $$SplitsTableAnnotationComposer($db: db,$table:table),
        updateCompanionCallback: ({Value<int> id = const Value.absent(),Value<int> transactionId = const Value.absent(),Value<int> categoryId = const Value.absent(),Value<double> amount = const Value.absent(),Value<String?> notes = const Value.absent(),Value<DateTime> createdAt = const Value.absent(),})=> SplitsCompanion(id: id,transactionId: transactionId,categoryId: categoryId,amount: amount,notes: notes,createdAt: createdAt,),
        createCompanionCallback: ({Value<int> id = const Value.absent(),required int transactionId,required int categoryId,required double amount,Value<String?> notes = const Value.absent(),Value<DateTime> createdAt = const Value.absent(),})=> SplitsCompanion.insert(id: id,transactionId: transactionId,categoryId: categoryId,amount: amount,notes: notes,createdAt: createdAt,),
        withReferenceMapper: (p0) => p0
              .map(
                  (e) =>
                     (e.readTable(table), $$SplitsTableReferences(db, table, e))
                  )
              .toList(),
        prefetchHooksCallback:         ({transactionId = false,categoryId = false}){
          return PrefetchHooks(
            db: db,
            explicitlyWatchedTables: [
             
            ],
            addJoins: <T extends TableManagerState<dynamic,dynamic,dynamic,dynamic,dynamic,dynamic,dynamic,dynamic,dynamic,dynamic,dynamic>>(state) {

                                  if (transactionId){
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.transactionId,
                    referencedTable:
                        $$SplitsTableReferences._transactionIdTable(db),
                    referencedColumn:
                        $$SplitsTableReferences._transactionIdTable(db).id,
                  ) as T;
               }
                  if (categoryId){
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.categoryId,
                    referencedTable:
                        $$SplitsTableReferences._categoryIdTable(db),
                    referencedColumn:
                        $$SplitsTableReferences._categoryIdTable(db).id,
                  ) as T;
               }

                return state;
              }
,
            getPrefetchedDataCallback: (items) async {
            return [
            
                ];
              },
          );
        }
,
        ));
        }
    typedef $$SplitsTableProcessedTableManager = ProcessedTableManager    <_$AppDatabase,
    $SplitsTable,
    Split,
    $$SplitsTableFilterComposer,
    $$SplitsTableOrderingComposer,
    $$SplitsTableAnnotationComposer,
    $$SplitsTableCreateCompanionBuilder,
    $$SplitsTableUpdateCompanionBuilder,
    (Split,$$SplitsTableReferences),
    Split,
    PrefetchHooks Function({bool transactionId,bool categoryId})
    >;class $AppDatabaseManager {
final _$AppDatabase _db;
$AppDatabaseManager(this._db);
$$CategoriesTableTableManager get categories => $$CategoriesTableTableManager(_db, _db.categories);
$$TransactionsTableTableManager get transactions => $$TransactionsTableTableManager(_db, _db.transactions);
$$SubscriptionsTableTableManager get subscriptions => $$SubscriptionsTableTableManager(_db, _db.subscriptions);
$$MappingsTableTableManager get mappings => $$MappingsTableTableManager(_db, _db.mappings);
$$BudgetsTableTableManager get budgets => $$BudgetsTableTableManager(_db, _db.budgets);
$$SplitsTableTableManager get splits => $$SplitsTableTableManager(_db, _db.splits);
}
