import 'package:azkar/core/constants/images.dart';
import 'package:azkar/data/model/category_model.dart';
import 'package:azkar/pages/screen/screens.dart';

final List<CategoryModel> categoryModel = [
  CategoryModel(text: 'الأذكار', image: AppImages.azkar, widget: AzkarScreen()),
  const CategoryModel(
      text: 'المصحف', image: AppImages.moshaf, widget: MoshafScreen()),
  const CategoryModel(
      text: 'أوقات الصلاة', image: AppImages.salah, widget: SalahScreen()),
  const CategoryModel(
      text: 'السبحة', image: AppImages.sebha, widget: SebhaScreen()),
  const CategoryModel(
      text: 'الدعوة الى الله', image: AppImages.daawa, widget: DawaScreen()),
  const CategoryModel(
      text: 'الأربعين النووية',
      image: AppImages.arbein,
      widget: HadithScreen()),
];
