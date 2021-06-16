@extends('layouts.panel-app')

@section('content')

 <test-schedule-edit data-academics='@json($acads)'
    edit='@json($data)'></test-schedule-edit>

@endsection
