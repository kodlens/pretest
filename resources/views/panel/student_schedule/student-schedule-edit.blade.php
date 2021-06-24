@extends('layouts.panel-app')

@section('content')

 <student-schedule-edit data-academics='@json($acads)'
    edit='@json($data)'></student-schedule-edit>

@endsection
