<?php

namespace App\Http\Controllers\Administrator;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Models\Question;

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

    public function store(Request $req){
        return $req;
    }


}
