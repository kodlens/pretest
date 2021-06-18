<?php

namespace App\Http\Controllers\Student;

use App\Http\Controllers\Controller;
use App\Models\AcadYear;
use App\Models\Level;
use App\Models\Question;
use Illuminate\Http\Request;

class SectionQuestionController extends Controller
{
    //

    public function __construct(){
        $this->middleware('verified');
        $this->middleware('student');
    }


    public function index(Request $req){
        return view('student.taking-exam')
            ->with('id', $req->section);
    }

    public function examineeQuestion($section_id){
        $ay = AcadYear::where('active', 1)->first();
        $easy_question = Question::with(['options'])
            ->join('levels', 'questions.level_id', 'levels.level_id')
            ->where('acad_year_id', $ay->acad_year_id)
            ->where('level', 'EASY')
            ->where('section_id', $section_id)
            ->inRandomOrder()->take(6)->get();

        $average_question = Question::with(['options'])
            ->join('levels', 'questions.level_id', 'levels.level_id')
            ->where('acad_year_id', $ay->acad_year_id)
            ->where('level', 'AVERAGE')
            ->where('section_id', $section_id)
            ->inRandomOrder()->take(6)->get();

        $diff_question = Question::with(['options'])
            ->join('levels', 'questions.level_id', 'levels.level_id')
            ->where('acad_year_id', $ay->acad_year_id)
            ->where('level', 'DIFFICULT')
            ->where('section_id', $section_id)
            ->inRandomOrder()->take(6)->get();

        $data = array_merge($easy_question->toArray(),
            $average_question->toArray(),
            $diff_question->toArray());

        return $data;
    }


}
