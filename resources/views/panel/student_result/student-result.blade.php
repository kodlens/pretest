@extends('layouts.panel-app')

@section('content')

    <student-result prop-programs='@json($programs)'></student-result>

@endsection
