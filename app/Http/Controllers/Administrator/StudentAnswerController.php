<?php

namespace App\Http\Controllers\Administrator;

use App\Http\Controllers\Controller;
use App\Models\Program;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;


use App\Models\AnswerSheet;


class StudentAnswerController extends Controller
{
    //

    public function __construct(){
        $this->middleware('auth');
        $this->middleware('admin');
    }


    public function index(){
        $programs = Program::where('programStat', 1)->get();
        return view('panel.student_answer.student-answer')
            ->with('programs', $programs);
    }

    public function index_data(Request $req){
        //return Question::all();
        $sortkey = explode(".",$req->sort_by);

        return DB::table('answer_sheets as a')
            ->join('users as b', 'a.user_id', 'b.user_id')
            ->join('sections as c', 'a.section_id', 'c.section_id')
            ->where('a.user_id', $req->user_id == '' ? 'like' : '=', $req->user_id == '' ? '%' : $req->user_id)
            ->where('b.lname', 'like', $req->lname .'%')
            ->where('b.fname', 'like', $req->fname .'%')
            ->where('b.first_program_choice', 'like', $req->first_program_choice .'%')
            ->select('a.answer_sheet_id', 'a.code', 'a.user_id', 'b.lname', 'b.fname', 'b.mname',
                'b.sex', 'b.first_program_choice', 'b.second_program_choice',
                'a.section_id', 'c.section', 'a.created_at')
            ->orderBy($sortkey[0], $sortkey[1])
            ->paginate($req->perpage);
    }

    public function destroy($id){
        AnswerSheet::destroy($id);
        return ['status'=>'deleted'];
    }


}
