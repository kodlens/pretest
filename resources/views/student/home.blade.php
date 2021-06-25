@extends('layouts.student-app')

@section('content')

        <home-page is-not-scheduled="@if(session('error') == 'not_scheduled')1 @endif"
                   already-visited-section="@if(session('error') == 'already_visited_section')visited @endif"></home-page>



{{--    @isset($error)--}}
{{--        {{ $error }}--}}
{{--    @endisset--}}

@endsection
