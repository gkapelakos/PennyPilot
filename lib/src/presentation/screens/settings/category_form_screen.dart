import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pennypilot/src/data/models/category_model.dart';
import 'package:pennypilot/src/helpers/icon_helper.dart';
import 'package:pennypilot/src/presentation/providers/data_providers.dart';
import 'package:pennypilot/src/presentation/widgets/icon_picker.dart';

class CategoryFormScreen extends ConsumerStatefulWidget {
  final CategoryModel? category;

  const CategoryFormScreen({super.key, this.category});

  @override
  ConsumerState<CategoryFormScreen> createState() => _CategoryFormScreenState();
}

class _CategoryFormScreenState extends ConsumerState<CategoryFormScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _name;
  late Color _color;
  late String _icon;

  @override
  void initState() {
    super.initState();
    _name = widget.category?.name ?? '';
    _color = widget.category != null
        ? Color(
            int.parse(widget.category!.color.replaceFirst('#', ''), radix: 16) +
                0xFF000000)
        : const Color(0xFF2196F3);
    _icon = widget.category?.icon ?? 'home';
  }

  void _submit() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final isar = ref.read(isarProvider);
      final hexColor =
          '#${(_color.r * 255).toInt().toRadixString(16).padLeft(2, '0')}${(_color.g * 255).toInt().toRadixString(16).padLeft(2, '0')}${(_color.b * 255).toInt().toRadixString(16).padLeft(2, '0')}'
              .toUpperCase();

      await isar.writeTxn(() async {
        if (widget.category == null) {
          final newCategory = CategoryModel()
            ..name = _name
            ..color = hexColor
            ..icon = _icon
            ..isSystem = false
            ..order = 0
            ..isActive = true
            ..transactionCount = 0
            ..createdAt = DateTime.now();
          await isar.categoryModels.put(newCategory);
        } else {
          final categoryToUpdate =
              await isar.categoryModels.get(widget.category!.id);
          if (categoryToUpdate != null) {
            categoryToUpdate.name = _name;
            categoryToUpdate.color = hexColor;
            categoryToUpdate.icon = _icon;
            categoryToUpdate.updatedAt = DateTime.now();
            await isar.categoryModels.put(categoryToUpdate);
          }
        }
      });

      if (!mounted) return;
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category == null ? 'New Category' : 'Edit Category'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: _submit,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                initialValue: _name,
                decoration: const InputDecoration(
                  labelText: 'Category Name',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
                onSaved: (value) => _name = value!,
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  const Text('Icon'),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Pick an icon'),
                          content: SingleChildScrollView(
                            child: IconPicker(
                              onIconSelected: (iconName) {
                                setState(() => _icon = iconName);
                                Navigator.of(context).pop();
                              },
                            ),
                          ),
                        ),
                      );
                    },
                    child: Icon(IconHelper.getIconData(_icon)),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  const Text('Category Color'),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Pick a color'),
                          content: SingleChildScrollView(
                            child: ColorPicker(
                              pickerColor: _color,
                              onColorChanged: (color) =>
                                  setState(() => _color = color),
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child: const Text('Done'),
                            ),
                          ],
                        ),
                      );
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: _color,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
