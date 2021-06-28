@extends('layouts.panel-app')

@section('content')

 <user-page-edit edit='@json($data)'
    data-programs='@json($programs)'
    prop-learning-modes='@json($learningmodes)'></user-page-edit>

@endsection
