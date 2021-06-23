@extends('layouts.home-app')

@section('content')

   
    

    @if(session('error') == 'reg_not_allowed')
        <welcome-page :is-reg="false"></welcome-page>
    @else
    <welcome-page :is-reg="true"></welcome-page>
    @endif

    <footer-page></footer-page>

    <!-- I will stand by you -->
    <!-- Timothy 4:3 -->


    <!-- I will help you through when you've done all you can do and you can't cope. -->
    <!-- Isiah 41:13 -->


    <!-- I will dry you eyes -->
    <!-- Revelation 21:4 -->


    <!-- I will fight your fights -->
    <!-- Exodus 14:14 -->


    <!-- I will hold you tight and I won't let go -->
    <!-- Deuteronomy 31:6 -->

    <!-- Everyone in your life will hurt you sooner or later -->
    <!-- But it's for you to decide, which is more important -->
    <!-- the PAIN, or the PERSON :'(-->


@endsection


