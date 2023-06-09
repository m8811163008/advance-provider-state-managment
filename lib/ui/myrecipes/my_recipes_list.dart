import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:provider/provider.dart';
import '../../data/models/recipe.dart';
import '../../data/memory_repository.dart';

class MyRecipesList extends StatefulWidget {
  const MyRecipesList({Key? key}) : super(key: key);

  @override
  State createState() => _MyRecipesListState();
}

class _MyRecipesListState extends State<MyRecipesList> {
  List<Recipe> recipes = [];


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: _buildRecipeList(context),
    );
  }

  Widget _buildRecipeList(BuildContext context) {
    // TODO: Add Consumer
    return ListView.builder(
      itemCount: recipes.length,
      itemBuilder: (BuildContext context, int index) {
        // TODO: Add recipe definition
        return SizedBox(
          height: 100,
          child: Slidable(
            startActionPane: ActionPane(
              motion: const DrawerMotion(),
              extentRatio: 0.25,
              children: [
                SlidableAction(
                  label: 'Delete',
                  backgroundColor: Colors.transparent,
                  foregroundColor: Colors.black,
                  icon: Icons.delete,
                  // TODO: Update first onPressed
                  onPressed: (context) {},
                ),
              ],
            ),
            endActionPane: ActionPane(
              motion: const DrawerMotion(),
              extentRatio: 0.25,
              children: [
                SlidableAction(
                  label: 'Delete',
                  backgroundColor: Colors.transparent,
                  foregroundColor: Colors.black,
                  icon: Icons.delete,
                  // TODO: Update second onPressed
                  onPressed: (context) {},
                ),
              ],
            ),
            child: Card(
              elevation: 1.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              color: Colors.white,
              child: Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    // TODO: Replace with image from recipe
                    leading: Image.asset(
                      'assets/images/pizza_w700.png',
                      height: 200,
                      width: 200,
                    ),
                    // TODO: Replace title hardcoding
                    title: const Text('Chicken Vesuvio'),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
    // TODO: Add final brace and parenthesis
  }

  void deleteRecipe(MemoryRepository repository, Recipe recipe) async {
    // 1
    repository.deleteRecipe(recipe);
    // 2
    setState(() {});
  }
}
