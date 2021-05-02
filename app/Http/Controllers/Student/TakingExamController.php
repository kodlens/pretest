<?php

namespace App\Http\Controllers\Student;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Database\Query\Builder;

use App\Models\Question;

class TakingExamController extends Controller
{
    //

    public function __construct()
    {
        $this->middleware('auth:student');

        $this->middleware('allow_exam');
    }


    public function index(){
        return view('student.taking-exam');
    }


    public function examineeQuestion()
    {
        # code...
        return Question::with(['options' => function($query){
                $query->select('question_id', 'option_id', 'letter', 'content', 'is_img', 'img_path');
        }])
            ->select('question_id','question', 'is_question_img', 'question_img')
            ->get();
    }

    public function store(Request $req){

    }



}
