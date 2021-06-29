<?php

namespace App\Http\Controllers\Student;

use App\Http\Controllers\Controller;
use App\Models\Section;
use Illuminate\Http\Request;

class SectionPageController extends Controller
{
    //
    public function __construct(){
        $this->middleware('auth');
    }

    public function index(Request $req){
        //student_scehdule_id
        $sched_id = $req->student_schedule_id;

        $sections = Section::select('section_id', 'section', 'img_filename', 'set_time')
            ->get();

        return view('student.section-page')
            ->with('sections', $sections)
            ->with('sched_id', $sched_id);
    }



}
