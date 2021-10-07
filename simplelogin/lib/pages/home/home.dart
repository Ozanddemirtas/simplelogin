import 'package:testproject/utils/page_exporter.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late HomeViewModel viewModel;
  @override
  void initState() {
    super.initState();
    viewModel = HomeViewModel();
    viewModel.getList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                sharedPrefs.logout();
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    ),
                    (route) => false);
              },
              icon: Icon(Icons.logout))
        ],
        title: Text("User List"),
        centerTitle: true,
        backgroundColor: KC.primaryColor,
      ),
      body: Observer(
        builder: (_) => Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: viewModel.userList.length,
                itemBuilder: (_, i) {
                  UserModel user = viewModel.userList[i];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UserPage(
                              user: user,
                              viewModel: viewModel,
                            ),
                          ));
                    },
                    child: Card(
                      elevation: 11,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: ListTile(
                          leading: CircleAvatar(
                            child: Image.network(user.profilePhoto!),
                          ),
                          title: Text(user.fullName!),
                          trailing: viewModel.currentUser.friendIds!
                                  .contains(user.id!)
                              ? IconButton(
                                  onPressed: () async {
                                    await viewModel.removeFriend(user.id!);
                                    setState(() {});
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content:
                                            Text("Arkadas Basariyla Silindi"),
                                        backgroundColor: Colors.green,
                                      ),
                                    );
                                  },
                                  icon: Icon(
                                    Icons.person_remove,
                                    color: Colors.redAccent,
                                  ),
                                )
                              : IconButton(
                                  onPressed: () async {
                                    await viewModel.addFriend(user.id!);
                                    setState(() {});
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content:
                                            Text("Arkadas Basariyla  Eklendi"),
                                        backgroundColor: Colors.green,
                                      ),
                                    );
                                  },
                                  icon: Icon(
                                    Icons.person_add,
                                    color: Colors.blueGrey,
                                  ),
                                ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
