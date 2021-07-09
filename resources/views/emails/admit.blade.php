@component('mail::message')
# Hi {{ $student['lname'] }} {{ $student['fname'] }},

Congratulation,

Good day, you received this email because we believed you took the admission test from Gov. Alfonso D. Tan College.
Here are the break down of your score:
<ul>
    <li>ABSTRACT - {{ $student['abstraction'] }}</li>
    <li>LOGICAL REASONING - {{ $student['logical'] }}</li>
    <li>ENGLISH PROFICIENCY - {{ $student['english'] }}</li>
    <li>NUMERICAL - {{ $student['numerical'] }}</li>
    <li>GENERAL - {{ $student['general'] }}</li>
</ul>

You are also qualified for these programs:
<ul>
    @foreach($programs as $prog)
        <li>{{ $prog['CCode'] }}</li>
    @endforeach
</ul>

Here is your admission code: <strong>{{ $admission_code }}</strong>.


@component('mail::button', ['url' => 'http://admission.gadtc.edu.ph/login'])
Click here to proceed for admission
@endcomponent
or you may visit http://admission.gadtc.edu.ph

<br><br>
Thanks,<br>
{{-- {{ config('app.name') }} --}}
GADTC
@endcomponent
