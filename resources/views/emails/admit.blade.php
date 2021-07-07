@component('mail::message')
# Introduction

Good day. Your Verification code is {{ $studentCode }}.

@component('mail::button', ['url' => ''])
Button Text
@endcomponent

Thanks,<br>
{{-- {{ config('app.name') }} --}}
GADTC GUIDANCE
@endcomponent
