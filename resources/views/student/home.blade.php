@extends('layouts.student-app')

@section('content')
    @if(session('error') == 'not_scheduled')
        <home-page is-not-scheduled="1"></home-page>
    @else
        <home-page is-not-scheduled="0"></home-page>
    @endif


{{--    @isset($error)--}}
{{--        {{ $error }}--}}
{{--    @endisset--}}

@endsection
