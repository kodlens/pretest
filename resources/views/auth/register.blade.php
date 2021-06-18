@extends('layouts.home-app')

@section('content')
    <registration data-programs='@json($programs)'></registration>
@endsection


