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

        $userid = Auth::user()->user_id;
        $ay = AcadYear::where('active', 1)->first();

        $data = DB::table('answers as a')
            ->join('options as b', 'a.option_id', 'b.option_id')
            ->join('answer_sheets as c', 'a.answer_sheet_id', 'c.answer_sheet_id')
            ->join('questions as d', 'b.question_id', 'd.question_id')
            ->where('c.user_id', $userid)
            ->where('code', $ay->code)
            ->where('b.is_answer', 1)
            ->sum('d.score');

        return $data;

        //return DB::select('call proc_student_result(?, ?)',array($student_id, $ay->code));
    }





}
