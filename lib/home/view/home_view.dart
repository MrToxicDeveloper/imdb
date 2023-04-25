import 'package:flutter/material.dart';
import 'package:imdb/home/provider/home_provider.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeProvider? proTrue;
  HomeProvider? proFalse;

  TextEditingController txtMovie = TextEditingController(text: "Game of Thrones");

  @override
  void initState() {
    super.initState();
    Provider.of<HomeProvider>(context, listen: false).apiCalling(txtMovie.text);
  }

  @override
  Widget build(BuildContext context) {
    proFalse = Provider.of<HomeProvider>(context, listen: false);
    proTrue = Provider.of<HomeProvider>(context, listen: true);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "IMDB",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 344,
                      child: TextField(
                        controller: txtMovie,
                        decoration: InputDecoration(
                          hintText: "search movies",
                          prefixIcon: IconButton(
                            icon: Icon(Icons.search_rounded),
                            onPressed: () {
                              proFalse!.apiCalling(txtMovie.text);
                            },
                          ),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  height: 350,
                  width: 250,
                  // color: Colors.blue,
                  child: Image.network(
                    "${proTrue!.imdb!.d![0].i!.imageUrl}",
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 15,),
                ListTile(
                  // style: ListTileStyle.list,
                  leading: Text("${proTrue!.imdb!.d![0].rank}"),
                  title: Text("${proTrue!.imdb!.d![0].l}"),
                  subtitle: Text("${proTrue!.imdb!.d![0].q}"),
                  trailing: Text("${proTrue!.imdb!.d![0].y}"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
