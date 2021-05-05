<!doctype html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>{{ config('app.name', 'Laravel') }}</title>

    <!-- Scripts -->
    <script src="{{ asset('js/app.js') }}" defer></script>

    <!-- Fonts -->
{{-- <link rel="dns-prefetch" href="//fonts.gstatic.com"> --}}
{{-- <link href="https://fonts.googleapis.com/css?family=Nunito" rel="stylesheet"> --}}

<!-- Styles -->
    <link href="{{ asset('css/app.css') }}" rel="stylesheet">

</head>
<body>
<div id="app">

{{--    @guest--}}
{{--        @if (Route::has('login'))--}}
{{--            <student-navbar is-auth="0"></student-navbar>--}}
{{--        @endif--}}
{{--    @else--}}
{{--        <student-navbar is-auth="1" firstname="{{ auth()->user()->StudFName }}"></student-navbar>--}}
{{--    @endguest--}}

    @yield('content')

</div>
@yield('extrascript')
</body>
</html>



