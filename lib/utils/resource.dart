sealed class Resource<T>{
  final String? message;
  final T? data;

  const Resource({this.data, this.message});
}

class Success<T> extends Resource<T>{
  const Success({super.data});
}

class Loading<T> extends Resource<T>{
  const Loading({super.data});
}

class Error<T> extends Resource<T>{
  const Error({super.data, super.message});
}
