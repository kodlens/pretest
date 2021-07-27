@extends('layouts.panel-app')

@section('content')

    <students-result prop-programs='@json($programs)'></students-result>

@endsection
