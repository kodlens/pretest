<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class AdmitStudent extends Mailable
{
    use Queueable, SerializesModels;

    /**
     * Create a new message instance.
     *
     * @return void
     */
    private $student;
    private $admission_code;
    private $programs;

    public function __construct($student, $admission_code, $programs)
    {
        //
        $this->student = $student;
        $this->admission_code = $admission_code;
        $this->programs = $programs;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        return $this->markdown('emails.admit')
            ->subject('ADMISSION')
            ->with('student',$this->student)
            ->with('admission_code',$this->admission_code)
            ->with('programs',$this->programs);
    }

}
