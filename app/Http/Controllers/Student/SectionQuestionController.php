<?php

namespace App\Http\Controllers\Student;

use App\Http\Controllers\Controller;
use App\Models\AcadYear;
use App\Models\Question;
use Illuminate\Http\Request;

class SectionQuestionController extends Controller
{
    //

    public function __construct(){
        $this->middleware('auth');
        $this->middleware('student');
    }


    public function index(Request $req){
        $ay = AcadYear::where('active', 1)->first();
        $questions = Question::with(['options'])
            ->where('acad_year_id', $ay->acad_year_id)
            ->where('section_id', $req->section)
            ->get();
        return $questions;
    }


}
