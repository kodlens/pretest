@component('mail::message')
Guidance and Admission Office<br>
Gov. Alfonso D. Tan College<br>
Maloro, Tangub City, Misamis Occidental<br>

<br>
Dear Mr./Ms. {{ $student['lname'] }} {{ $student['fname'] }},<br><br>

# CONGRATULATIONS
<br>
Thank you for your active participation in the GADTC Admission 2021-2022. 
We would like to inform you that after carefully examining your scores, 
your application has complied all necessary requirements of your chosen program. 
<br><br>

We are pleased to offer you admission as a Freshman to the following program(s): 
<ul>
    @foreach($programs as $prog)
        <li>{{ $prog['CCode'] }}</li>
    @endforeach
</ul>


To be part of the dynamic community of GADTC,  enroll via our student portal and use 
the admission code <strong>{{ $admission_code }}</strong> starting August 2, 2020 until August 13, 2020. 
Please click the BUTTON below to accept this offer.



@component('mail::button', ['url' => 'http://admission.gadtc.edu.ph/login'])
CLICK HERE TO ACCEPT
@endcomponent


Please Note: 
<br>
Enrollment period for Freshmen is on August 2-13, 2021 only. 
Failure to reply within those dates will mean forfeiture of your slot.	 

Starting A.Y. 2021 - 2022. Governor Alfonso D. Tan College will adopt the 
Flexible Learning (FL) (i.e modular and digital learning) for incoming freshmen.  

We look forward to welcoming you to GADTC this coming school year. 


<br><br>
Thanks,<br>
GADTC Guidance and Admission Office
@endcomponent
