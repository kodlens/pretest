@extends('layouts.home-app')

@section('content')
    <registration data-programs='@json($programs)'
        prop-learning-modes='@json($learningmodes)'></registration>
@endsection


