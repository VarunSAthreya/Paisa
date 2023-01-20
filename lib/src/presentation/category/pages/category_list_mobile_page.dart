import 'package:flutter/material.dart';
import '../../widgets/paisa_bottom_sheet.dart';

import '../../../data/category/model/category.dart';
import '../bloc/category_bloc.dart';
import '../widgets/category_item_mobile_widget.dart';

class CategoryListMobileWidget extends StatelessWidget {
  const CategoryListMobileWidget({
    Key? key,
    required this.addCategoryBloc,
    required this.categories,
  }) : super(key: key);

  final CategoryBloc addCategoryBloc;
  final List<Category> categories;

  @override
  Widget build(BuildContext context) => ListView.builder(
        padding: const EdgeInsets.only(
          bottom: 124,
          left: 8,
          right: 8,
          top: 8,
        ),
        itemCount: categories.length,
        shrinkWrap: true,
        itemBuilder: (_, index) => CategoryItemMobileWidget(
          category: categories[index],
          onPressed: () => paisaAlertDialog(
            context,
            title: const Text('Permanently confirmation'),
            child: RichText(
              text: TextSpan(
                text:
                    'Deleting the category deletes all expenses which tied to this category ',
                children: [
                  TextSpan(
                      text: categories[index].name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      )),
                ],
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            confirmationButton: ElevatedButton(
              onPressed: () {
                addCategoryBloc.add(CategoryDeleteEvent(categories[index]));
                Navigator.pop(context);
              },
              child: const Text('Delete'),
            ),
          ),
        ),
      );
}