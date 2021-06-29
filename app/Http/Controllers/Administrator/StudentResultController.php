<?php

namespace App\Http\Controllers\Administrator;

use App\Http\Controllers\Controller;
use App\Models\AnswerSheet;
use App\Models\Program;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class StudentResultController extends Controller
{
    //
    public function __construct(){
        $this->middleware('auth');
        $this->middleware('admin');
    }


    public function index(){
        $programs = Program::where('programStat', 1)->get();
        return view('panel.student_result.student-result')
            ->with('programs', $programs);
    }

    public function index_data(Request $req){
        //return Question::all();
        $sortkey = explode(".",$req->sort_by);

        return DB::table('answer_sheets as a')
            ->join('users as b', 'a.user_id', 'b.user_id')
            ->join('sections as c', 'a.section_id', 'c.section_id')
            ->join('answers as d', 'a.answer_sheet_id', 'd.answer_sheet_id')
            ->join('options as e', 'd.option_id', 'e.option_id')
            ->join('questions as f', 'e.question_id', 'f.question_id')
            ->where('a.user_id', $req->user_id == '' ? 'like' : '=', $req->user_id == '' ? '%' : $req->user_id)
            ->where('b.lname', 'like', $req->lname .'%')
            ->where('b.first_program_choice', 'like', $req->first_program_choice .'%')
            ->where('e.is_answer', 1)
            ->select('a.answer_sheet_id', 'a.code', 'a.user_id', 'b.lname', 'b.fname', 'b.mname',
                'b.sex', 'b.first_program_choice', 'b.second_program_choice',
                'a.section_id', 'c.section', 'f.question_id', 'f.question','e.option_id',
                'e.content', 'e.is_answer', DB::raw('sum(f.score) as score'), 'a.created_at')
            ->groupBy('a.section_id', 'a.user_id', 'a.code')
            ->orderBy($sortkey[0], $sortkey[1])
            ->paginate($req->perpage);
    }

    public function destroy($id){
        AnswerSheet::destroy($id);
        return ['status'=>'deleted'];
    }
}
