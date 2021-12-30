import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../controllers/list_controller.dart';
import '../views/list_row.dart';
import '../widgets/error_widget.dart';

import '../constants/constants.dart';

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  final _controller = ListController();

  @override
  void initState(){
    super.initState();
    _initializeMovieList();
  }

  void _initializeMovieList() async{
    setState(() {
      _controller.loading = true;
    });
    await _controller.fetchAllMovies();
    setState(() {
      _controller.loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Constants.primaryColor,
        title: const Center(child: Text("Top 20 Movies", style: TextStyle(color: Colors.white),)),
      ),
      body:_buildRows(),
    );
  }
  _buildRows(){
    if(_controller.loading) return const Scaffold(body: Center(child: CircularProgressIndicator(),),);
    if(_controller.movieError != null) {
      return ErrorMessageWidget(message: _controller.movieError!.message, recall: _initializeMovieList);
    }
    return  ListView.builder(
        physics: const AlwaysScrollableScrollPhysics (),
        cacheExtent: (1920 / (MediaQuery.of(context).size.height)) * 180 * 20,
        itemCount: _controller.moviesList!.length,
        itemBuilder: (context, index) {
          return MovieRow(movieList: _controller.moviesList!, index: index);
        }
    );
  }
}