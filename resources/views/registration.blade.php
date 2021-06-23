@extends('layouts.home-app')

@section('content')
<registration data-programs='@json($programs)' 
    data-learning-modes='@json($learningmodes)'></registration>
@endsection


