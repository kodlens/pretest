<?php

namespace App\Http\Controllers\Student;

use App\Http\Controllers\Controller;
use App\Models\AcadYear;
use App\Models\Section;
use Illuminate\Http\Request;

use Auth;
use Illuminate\Support\Facades\DB;

class ResultExamController extends Controller
{
    //
    public function __construct()
    {
        $this->middleware('verified');
        $this->middleware('student');
        //$this->middleware('allow_exam');
    }

    public function index(){
        return view('student.result-exam');
    }

    public function resultExam(){
        $student_id = auth()->user();
        $ay = AcadYear::where('active', 1)->first();

        return DB::select('call proc_student_result(?, ?)',array($student_id, $ay->code));
    }





}
