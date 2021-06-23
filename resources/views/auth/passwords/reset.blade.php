@extends('layouts.app')

@section('content')
    <password-reset 
        data-email="{{ $email ?? old('email') }}"
        data-token="{{ $token }}"></password-reset>
@endsection
