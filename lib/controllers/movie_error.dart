abstract class MovieError implements Exception{
  late String message;

  @override
  String toString(){
    return message;
  }
}

class MovieApiError extends MovieError{
  MovieApiError(String message){
    this.message = message;
  }
}