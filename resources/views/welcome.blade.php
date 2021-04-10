<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- CSRF Token -->
        <meta name="csrf-token" content="{{ csrf_token() }}">
        <title>{{ config('app.name', 'Laravel') }}</title
        <script src="{{ asset('js/app.js') }}" defer></script>
        <link href="{{ asset('css/app.css') }}" rel="stylesheet">


        <style>
            body {
                font-family: 'Nunito', sans-serif;
            }
        </style>
    </head>
    <body>
        <div class="welcome-navbar">
            @auth
                <div>
                    <a href="{{ url('/home') }}" class="text-sm text-gray-700 underline">Home</a>
                </div>

            @else

                <div>
                    <a href="/student/login" class="">Log in</a>
                </div>

                <div>
                    <a href="/panel/login" class="ml-4">Panel</a>
                </div>

            @endauth
        </div>

    </body>
</html>
