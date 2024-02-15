import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../details_screen.dart';
import '../../../home/presentation/provider/home_provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late TextEditingController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool isLoading = false;
  bool isValidUrl(String url) {
    if (url == null || url.isEmpty) {
      return false;
    }
    return Uri.tryParse(url)?.isAbsolute ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _controller,
          onSubmitted: (String value) async {
            setState(() {
              isLoading = true;
            });

            Future.delayed(Duration.zero, () async {
              await context.read<HomeProvider>().loadSearchMovie(value);
              setState(() {
                isLoading = false;
              });
            });
          },
        ),
        actions: [
          GestureDetector(
              onTap: () {
                setState(() {
                  isLoading = true;
                });

                Future.delayed(Duration.zero, () async {
                  await context
                      .read<HomeProvider>()
                      .loadSearchMovie(_controller.text);
                  setState(() {
                    isLoading = false;
                  });
                });
              },
              child: Icon(Icons.search))
        ],
      ),
      body: (isLoading)
          ? Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Center(child: const CircularProgressIndicator()),
            )
          : SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Consumer<HomeProvider>(
                  builder: (context, value, child) => Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: <Widget>[
                      for (int i = 0; i < value.searchMovie.length; i++)
                        isValidUrl(value.searchMovie[i].poster)
                            ? GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetailScreen(
                                          title: value.searchMovie[i].title),
                                    ));
                              },
                              child:  ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  child: Image.network(
                                    value.searchMovie[i].poster,
                                    width: MediaQuery.of(context).size.width / 2 -
                                        15,
                                  ),
                                ),
                            )
                            : Container(), 
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
