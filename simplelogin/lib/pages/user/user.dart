import 'package:testproject/utils/page_exporter.dart';

// ignore: must_be_immutable
class UserPage extends StatefulWidget {
  UserModel user;
  HomeViewModel viewModel;

  UserPage({required this.viewModel, required this.user});

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  void initState() {
    super.initState();
    widget.viewModel = HomeViewModel();
    widget.viewModel.getList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KC.primaryColor,
      appBar: AppBar(
        title: Text("User Profile"),
        backgroundColor: KC.primaryColor,
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: ClipPath(
                clipper: BgClipper(),
                child: Container(
                  color: Colors.white,
                  height: MediaQuery.of(context).size.height / 1.1,
                )),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SafeArea(
              child: Container(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 17),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              if (widget.user.fullName != null)
                                Text(
                                  'Fullname : ${widget.user.fullName!} ',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17),
                                ),
                              if (widget.user.email != null)
                                Text(
                                  'Email : ${widget.user.email}',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 11.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(40)),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Card(
                                  color: KC.primaryColor,
                                  elevation: 15,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Icon(Icons.arrow_back,
                                        color: KC.text, size: 32),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            child: CircleAvatar(
                              maxRadius: 45,
                              backgroundColor: Colors.white,
                              backgroundImage:
                                  NetworkImage(widget.user.profilePhoto!),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
