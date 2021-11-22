import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../constants/constants.dart';
import 'package:intl/intl.dart';
import 'package:movies_app/models/movie_model.dart';
import '../controllers/images_controller.dart';
import '../controllers/movie_controller.dart';
import '../models/movie_model.dart';
import '../widgets/error_widget.dart';
import '../widgets/movie_info_widget.dart';
import 'package:share_plus/share_plus.dart';

class MoviePage extends StatefulWidget {
  final int movieID;

  const MoviePage({Key? key, required this.movieID}) : super(key: key);

  @override
  _SelectedMoviePageState createState() => _SelectedMoviePageState();
}

class _SelectedMoviePageState extends State<MoviePage> {
  var top = 0.0;
  bool _favorite = false;
  late ScrollController _scrollController;
  final _controller = MovieController();

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      setState(() {});
    });
    super.initState();
    _initialize();
  }

  void _initialize() async {
    setState(() {
      _controller.loading = true;
    });
    await _controller.fetchMoviebyID(widget.movieID);
    setState(() {
      _controller.loading = false;
    });
  }

  void _updateFavorite() {
    setState(() {
      if (_favorite) {
        _favorite = false;
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Removed from Favorites')));
      } else {
        _favorite = true;
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Added to Favorites')));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return _buildPage();
  }

  _buildPage() {
    if (_controller.loading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (_controller.movieError != null) {
      return ErrorMessageWidget(
          message: _controller.movieError!.message, recall: _initialize);
    }

    return Scaffold(
      backgroundColor: Constants.backgroundColor,
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          CustomScrollView(
            controller: _scrollController,
            slivers: <Widget>[
              SliverAppBar(
                actions: [
                  IconButton(
                      onPressed: () => _updateFavorite(),
                      icon: _favorite
                          ? const Icon(
                        Icons.star,
                        color: Colors.amber,
                      )
                          : const Icon(
                        Icons.star_border,
                        color: Colors.white,
                      )),
                  IconButton(
                      onPressed: () {
                        Share.share(
                            "Check it out this awesome movie!! \nhttps://imdb.com/title/${_controller.movie.imdbId}");
                      },
                      icon: const Icon(
                        Icons.share,
                        color: Colors.white,
                      )),
                  const SizedBox(width: 5,),
                ],
                pinned: true,
                backgroundColor: Constants.primaryColor,
                expandedHeight: 500,
                flexibleSpace: FlexibleSpaceBar(
                  title: _titleAnimation(),
                  background: _buildStackImages(),
                ),
                leading: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back)),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    _movieDetails()
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _movieDetails() {
    return Column(
      children: [
        Padding(
          padding:
          const EdgeInsets.only(left: 15, bottom: 10, right: 15),
          child: _buildTitleDetails(),
        ),
        Container(
          height: 20,
        ),
        MovieInfoWidget("Overview: ", _controller.movie.overview),
        MovieInfoWidget("Release Date: ",
            DateFormat.yMMMd().format(_controller.movie.releaseDate)),
        MovieInfoWidget(
            "Genres: ", _controller.movie.genres.toSet().toList().join(', ')),
        MovieInfoWidget(
            "Languages: ",
            _getLanguages(_controller.movie.spokenLanguages)
                .toSet()
                .toList()
                .join(', ')),
        _buildTagline(),
        Container(
          height: 100,
        ),
      ],
    );
  }

  Widget _buildStackImages() {
    return Stack(
      children: [
        Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: MoviePoster(
                url: _controller.movie.posterUrl,
                id: _controller.movie.id.toString()
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Constants.backgroundColor,
                Constants.backgroundColor.withOpacity(0.6),
                Constants.backgroundColor.withOpacity(0.3),
                Colors.transparent
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTitleDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 25,),
        Text(
          _controller.movie.title + " (${_controller.movie.releaseDate.year})",
          style: Constants.selectedMovieTitleStyle,
        ),
        const SizedBox(height: 8,),
        Row(
          children: [
            const Icon(Icons.star, color: Colors.amber, size: 18),
            Text(
              _controller.movie.voteAverage.toString() +
                  " (${_controller.movie.voteCount}",
              style: Constants.genreFontStyle,
            ),
            const Icon(Icons.person, color: Colors.white, size: 15),
            const Text(")", style: Constants.genreFontStyle),
            const SizedBox(width: 5,),
            Text(
              "${_controller.movie.runtime ~/ 60}h"
                  "${_controller.movie.runtime - _controller.movie.runtime ~/ 60 * 60}min",
              style: Constants.genreFontStyle,
            )
          ],
        )
      ],
    );
  }

  Widget _buildTagline() {
    return Visibility(
      visible: _controller.movie.tagline.isNotEmpty,
      replacement: Container(),
      child: MovieInfoWidget("Tagline: ", "\"${_controller.movie.tagline}\""),
    );
  }

  Widget _titleAnimation() {
    return LayoutBuilder(
      builder: (context, constrains) {
        top = constrains.biggest.height;
        return AnimatedOpacity(
          opacity: top >= 75 ? 0.0 : 1.0,
          duration: const Duration(milliseconds: 300),
          child: SizedBox(
            width: 200,
            child: Text(
              _controller.movie.title,
              style: const TextStyle(
                  overflow: TextOverflow.ellipsis,
                  color: Colors.white,
                  fontSize: 20),
            ),
          ),
        );
      },
    );
  }

  List<String> _getLanguages(List<SpokenLanguage> languages) {
    List<String> list = <String>[];
    for (var i = 0; i < languages.length; i++) {
      list.add(
        languages[i].name + " (${languages[i].iso6391})",
      );
    }
    return list;
  }
}
