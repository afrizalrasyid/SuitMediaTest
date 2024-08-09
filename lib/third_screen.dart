import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suitmediatest/viewmodel/user_view_model.dart' as user_store;

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({super.key});

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  late user_store.UserViewModel userProvider;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        userProvider.fetchUsers();
      },
    );
  }

  Future<void> _refreshData() async {
    await userProvider.fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    userProvider = Provider.of<user_store.UserViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Third Screen',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: ListView.separated(
          itemCount: userProvider.users.length,
          separatorBuilder: (context, index) => const Divider(
            height: 1,
            color: Colors.grey,
          ),
          itemBuilder: (context, index) {
            return ListTile(
              leading: Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(userProvider.users[index].avatar),
                  ),
                ),
              ),
              title: Row(
                children: [
                  Text(userProvider.users[index].firstName),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(userProvider.users[index].lastName),
                ],
              ),
              subtitle: Text(userProvider.users[index].email),
              onTap: () {
                Navigator.pop(context,
                    "${userProvider.users[index].firstName} ${userProvider.users[index].lastName}");
              },
            );
          },
        ),
      ),
    );
  }
}
