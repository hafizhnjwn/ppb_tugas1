import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ppb_tugas1/models/recipes_module.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<RecipeList> recipes = [];
  bool isSearchBarVisible = false; // Controls search bar visibility

  @override
  void initState() {
    super.initState();
    _getRecipes(); // Initialize the list once
  }

  void _getRecipes() {
    recipes = RecipeList.getRecipes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          if (isSearchBarVisible) searchBar(), // Conditionally show search bar
          list(),
          addButton(),
        ],
      ),
    );
  }

  Padding addButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          color: Colors.green[200]?.withOpacity(0.8),
          shape: BoxShape.circle,
        ),
        child: GestureDetector(
          onTap: () {
            TextEditingController nameController = TextEditingController();
            TextEditingController textController = TextEditingController();
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  backgroundColor: Colors.green[200],
                  title: Text(
                    'Add Recipe',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  content: SingleChildScrollView(
                    child: Column(
                      children: [
                        TextField(
                          controller: nameController,
                          decoration: InputDecoration(
                            hintText: "Enter recipe name",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        TextField(
                          controller: textController,
                          maxLines: null,
                          decoration: InputDecoration(
                            hintText: "Enter recipe details",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(); // Close the dialog
                      },
                      child: Text(
                        'Cancel',
                        style: TextStyle(color: Colors.red[300]),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          recipes.add(
                            RecipeList(
                              name: nameController.text,
                              text: textController.text,
                              iconPath: 'assets/icons/default.svg',
                              boxColor: Colors.green[200]!,
                              viewIsSelected: false,
                            ),
                          );
                        });
                        Navigator.of(context).pop(); // Close the dialog
                      },
                      child: Text(
                        'Add',
                        style: TextStyle(color: Colors.blue[300]),
                      ),
                    ),
                  ],
                );
              },
            );
          },
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                'assets/icons/add.svg',
                width: 30,
                height: 30,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Column list() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 20),
          child: Text(
            'Recipes List',
            style: TextStyle(
              color: Colors.black,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 20),
        Container(
          height: 350,
          child: ListView.separated(
            itemCount: recipes.length,
            scrollDirection: Axis.vertical,
            padding: EdgeInsets.only(bottom: 10, left: 10, right: 10),
            separatorBuilder: (context, index) => SizedBox(height: 25),
            itemBuilder: (context, index) {
              return Container(
                height: 100,
                padding: EdgeInsets.only(left: 20, right: 20),
                decoration: BoxDecoration(
                  color: recipes[index].boxColor.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(
                          recipes[index].iconPath,
                          width: 20,
                          height: 20,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            left: 20,
                            top: 10,
                            bottom: 5,
                          ),
                          child: Text(
                            recipes[index].name,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            viewButton(context, index),
                            deleteButton(index),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  GestureDetector deleteButton(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          recipes.removeAt(index); // Remove the recipe
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Container(
          height: 40,
          width: 80,
          decoration: BoxDecoration(
            color: Colors.red[200],
            borderRadius: BorderRadius.circular(50),
          ),
          child: Center(
            child: Text(
              'Delete',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Padding viewButton(BuildContext context, int index) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: GestureDetector(
        onTap: () {
          TextEditingController nameController = TextEditingController(
            text: recipes[index].name,
          );
          TextEditingController textController = TextEditingController(
            text: recipes[index].text,
          );
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                backgroundColor: Colors.green[200],
                title: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    hintText: "Edit recipe name",
                  ),
                ),
                content: SingleChildScrollView(
                  child: Column(
                    children: [
                      TextField(
                        controller: textController,
                        maxLines: null,
                        decoration: InputDecoration(
                          hintText: "Edit recipe details",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Close the dialog
                    },
                    child: Text(
                      'Close',
                      style: TextStyle(color: Colors.red[300]),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        recipes[index].name =
                            nameController.text; // Update name
                        recipes[index].text =
                            textController.text; // Update text
                      });
                      Navigator.of(context).pop(); // Close the dialog
                    },
                    child: Text(
                      'Edit',
                      style: TextStyle(color: Colors.blue[300]),
                    ),
                  ),
                ],
              );
            },
          );
        },
        child: Container(
          height: 40,
          width: 80,
          decoration: BoxDecoration(
            color: Colors.blue[200],
            borderRadius: BorderRadius.circular(50),
          ),
          child: Center(
            child: Text(
              'View',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container searchBar() {
    return Container(
      margin: EdgeInsets.only(top: 40, left: 20, right: 20),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 0.0,
            blurRadius: 40,
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.green[200]?.withOpacity(0.8),
          contentPadding: EdgeInsets.all(15),
          hintText: "Search for recipes",
          hintStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.grey[600],
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(9.0),
            child: SvgPicture.asset(
              'assets/icons/Search.svg',
              width: 10,
              height: 10,
            ),
          ),
          suffixIcon: Container(
            width: 100,
            child: IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  VerticalDivider(
                    color: Colors.black,
                    indent: 5,
                    endIndent: 5,
                    thickness: 2,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: SvgPicture.asset(
                      'assets/icons/Filter.svg',
                      width: 30,
                      height: 30,
                    ),
                  ),
                ],
              ),
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      backgroundColor: Colors.green[300],
      title: Text(
        'Home Made',
        style: TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      elevation: 2.0,
      actions: [
        GestureDetector(
          onTap: () {
            setState(() {
              isSearchBarVisible =
                  !isSearchBarVisible; // Toggle search bar visibility
            });
          },
          child: Container(
            margin: EdgeInsets.all(10),
            alignment: Alignment.center,
            width: 37,
            decoration: BoxDecoration(
              color: Colors.green[200],
              borderRadius: BorderRadius.circular(20),
            ),
            child: SvgPicture.asset(
              'assets/icons/Search.svg',
              width: 20,
              height: 20,
            ),
          ),
        ),
      ],
    );
  }
}
