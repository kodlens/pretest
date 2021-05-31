@extends('layouts.student-app')

@section('content')
        <taking-exam section-id="{{ $id }}"></taking-exam>
@endsection

{{--@section('extrascript')--}}
{{--    <script type="text/javascript">--}}
{{--        window.onbeforeunload = function(){--}}
{{--            return 'you are about to reload the page.';--}}
{{--        }--}}
{{--    </script>--}}
{{--@endsection--}}


