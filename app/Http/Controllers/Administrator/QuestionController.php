<?php

namespace App\Http\Controllers\Administrator;

use App\Http\Controllers\Controller;
use App\Http\Requests\StoreQuestionRequest;
use Illuminate\Http\Request;

use App\Models\Question;
use App\Models\Section;


class QuestionController extends Controller
{
    //

    public function __construct(){
        $this->middleware('auth:admin');
    }

    public function index(){
        return view('panel.question.panel-question');
    }

    public function index_data(){
        return Question::all();

        $sortkey = explode(".",$req->sort_by);

        return Question::where('question', $req->aycode)
            ->orderBy($sortkey[0], $sortkey[1])
            ->paginate($req->perpage);
    }

    public function create(){
        return view('panel.question.panel-question-create');
    }

    public function ajax_section(){
        return Section::all();
    }

    public function store(StoreQuestionRequest $req){

        Question::create([
            'section_id' => $req->section,
            'question' => $req->question,
            'points' => $req->points
        ]);

        return $req->options;
    }


}
