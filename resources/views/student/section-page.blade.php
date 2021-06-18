@extends('layouts.student-app')

@section('content')

    <section-page sections='@json($sections)' schedid="{{ $sched_id }}"></section-page>

@endsection
