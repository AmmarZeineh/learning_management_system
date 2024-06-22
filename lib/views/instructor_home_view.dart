import 'package:flutter/material.dart';

class InstructorHomeView extends StatelessWidget {
  const InstructorHomeView({super.key});

  static String id = 'InstructorHomeView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 32, right: 20),
            child: Row(
              children: [
                const Text(
                  'Hello, Ammar',
                  style: TextStyle(color: Colors.white, fontSize: 28),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.shopping_cart,
                    color: Colors.white,
                    size: 28,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.notifications,
                    color: Colors.white,
                    size: 28,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: TextField(
              decoration: InputDecoration(
                fillColor: Colors.white,
                prefixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                ),
                hintText: 'Search',
                hintStyle: const TextStyle(),
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: Colors.white),
                ),
                filled: true,
                border: const OutlineInputBorder(
                  borderSide: BorderSide(),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.only(top: 16),
                child: SingleChildScrollView(
                    child: Column(
                  children: [ListViewBuilderWithTitle()],
                )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ListViewBuilderWithTitle extends StatelessWidget {
  const ListViewBuilderWithTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'My Courses',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Text(
                'View All',
                style: TextStyle(fontSize: 18, color: Color(0xff2467b0)),
              )
            ],
          ),
        ),
        SizedBox(
          height: 16,
        ),
        SizedBox(
          height: 140,
          child: ItemsListViewBuilder(),
        )
      ],
    );
  }
}

class ItemsListViewBuilder extends StatelessWidget {
  const ItemsListViewBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return const ListViewBuilderItem();
      },
      padding: EdgeInsets.zero,
    );
  }
}

class ListViewBuilderItem extends StatelessWidget {
  const ListViewBuilderItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Container(
        width: 130,
        decoration: BoxDecoration(
            border: Border.all(),
            color: Colors.deepPurple,
            borderRadius: BorderRadius.circular(16)),
        child: Column(
          children: [
            Image.asset(
              
              'assets/images/undraw_learning_sketching_nd4f.png',
              fit: BoxFit.fill,
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
//