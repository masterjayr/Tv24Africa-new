import 'package:tv24africa/models/news_category_model.dart';

List<CategoryModel> getCategories() {
  List<CategoryModel> category = new List<CategoryModel>();
  CategoryModel categoryModel = new CategoryModel();

  //1
  categoryModel.categoryName = "Business";
  categoryModel.imagePath = "assets/images/1.jpg";
  category.add(categoryModel);

  categoryModel = new CategoryModel();

  //2
  categoryModel.categoryName = "Politics";
  categoryModel.imagePath = "assets/images/3.jpg";
  category.add(categoryModel);

  categoryModel = new CategoryModel();

  //3
  categoryModel.categoryName = "News Africa";
  categoryModel.imagePath = "assets/images/6.png";
  category.add(categoryModel);

  categoryModel = new CategoryModel();
  //4

  categoryModel.categoryName = "Entertainment";
  categoryModel.imagePath = "assets/images/2.jpg";
  category.add(categoryModel);

  categoryModel = new CategoryModel();

  //5
  categoryModel.categoryName = "Sport";
  categoryModel.imagePath = "assets/images/4.jpg";
  category.add(categoryModel);

  categoryModel = new CategoryModel();

  //6
  categoryModel.categoryName = "Submit a Tip";
  categoryModel.imagePath = "assets/images/tip.jpg";
  category.add(categoryModel);

  categoryModel = new CategoryModel();

  return category;
}
