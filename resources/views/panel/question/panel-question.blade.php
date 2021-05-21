@extends('layouts.panel-app')

@section('content')

    <panel-question data-levels='@json($levels)' data-sections='@json($sections)'></panel-question>
{{--    <panel-question data-levels="test"></panel-question>--}}
@endsection
