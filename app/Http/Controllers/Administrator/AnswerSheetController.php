<?php

namespace App\Http\Controllers\Administrator;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Models\AnswerSheet;
use App\Models\Answer;
use App\Models\Student;

class AnswerSheetController extends Controller
{
    //

    public function __construct(){
        $this->middleware('auth:admin');
    }


    public function index(){
        return view('panel.answer.answer-sheet');
    }

    public function index_data(Request $req){
        //return Question::all();
        $sortkey = explode(".",$req->sort_by);

        return AnswerSheet::with(['answers'])
            // ->whereHas('student', function ($query) use ($req){ //(Builder $query)
            //     $query->where('student', 'like', $req->idno .'%');
            // })
            ->orderBy($sortkey[0], $sortkey[1])
            ->paginate($req->perpage);
    }


}
