@extends('layouts.student-app')

@section('content')
    @if(session('isTaken'))
        <home-page is-taken="1"></home-page>
    @else
        <home-page is-taken="0"></home-page>
    @endif


{{--    @isset($error)--}}
{{--        {{ $error }}--}}
{{--    @endisset--}}

@endsection
