<?php

namespace App\Http\Controllers\Administrator;

use App\Http\Controllers\Controller;
use App\Models\AcadYear;
use Illuminate\Http\Request;

use Illuminate\Support\Facades\DB;

use App\Models\Program;

class ReportResultController extends Controller
{
    //
    public function __construct(){
        $this->middleware('auth');
        $this->middleware('admin');
    }

    public function index(){
        $programs = Program::where('programStat', 1)->get();
        return view('panel.report.report-result')
            ->with('programs', $programs);
    }

    public function index_data(Request $req){
        $sortkey = explode(".",$req->sort_by);
        $acad = AcadYear::where('active', 1)->first();
         $data = DB::table('users as a')
            ->select('a.user_id', 'a.lname', 'a.fname', 'a.mname', 'a.sex', 'a.first_program_choice', 'a.second_program_choice',
            'a.status', 'a.bdate', 'a.email', 'a.contact_no', 'a.learning_mode', 'a.barangay_id', 'a.street', 'a.is_submitted',
            DB::raw('coalesce((select sum(dd.score) from answer_sheets as aa
                join answers as bb on aa.answer_sheet_id = bb.answer_sheet_id
                join options as cc on bb.option_id = cc.option_id
                join questions as dd on cc.question_id = dd.question_id
                where aa.user_id = a.user_id and aa.section_id = 1 and cc.is_answer = 1 and aa.code = (select code from acad_years where active = 1)),0) as abstraction'),
            DB::raw('coalesce((select sum(dd.score) from answer_sheets as aa
                join answers as bb on aa.answer_sheet_id = bb.answer_sheet_id
                join options as cc on bb.option_id = cc.option_id
                join questions as dd on cc.question_id = dd.question_id
                where aa.user_id = a.user_id and aa.section_id = 2 and cc.is_answer = 1 and aa.code = (select code from acad_years where active = 1)),0) as logical'),
            DB::raw('coalesce((select sum(dd.score) from answer_sheets as aa
                join answers as bb on aa.answer_sheet_id = bb.answer_sheet_id
                join options as cc on bb.option_id = cc.option_id
                join questions as dd on cc.question_id = dd.question_id
                where aa.user_id = a.user_id and aa.section_id = 3 and cc.is_answer = 1 and aa.code = (select code from acad_years where active = 1)), 0) as english'),
            DB::raw('coalesce((select sum(dd.score) from answer_sheets as aa
                join answers as bb on aa.answer_sheet_id = bb.answer_sheet_id
                join options as cc on bb.option_id = cc.option_id
                join questions as dd on cc.question_id = dd.question_id
                where aa.user_id = a.user_id and aa.section_id = 4 and cc.is_answer = 1 and aa.code = (select code from acad_years where active = 1)), 0) as numerical'),
            DB::raw('coalesce((select sum(dd.score) from answer_sheets as aa
                join answers as bb on aa.answer_sheet_id = bb.answer_sheet_id
                join options as cc on bb.option_id = cc.option_id
                join questions as dd on cc.question_id = dd.question_id
                where aa.user_id = a.user_id and aa.section_id = 5 and cc.is_answer = 1 and aa.code = (select code from acad_years where active = 1)), 0) as general'),
            DB::raw('(select abstraction) + (select logical) + (select english) + (select numerical) + (select general) as total'),
            'c.from', 'c.to',
            )
            ->join('student_schedules as b', 'a.user_id', 'b.user_id')
            ->join('test_schedules as c', 'b.test_schedule_id', 'c.test_schedule_id')
            ->where('c.acad_year_id', $acad->acad_year_id)
            ->where('a.lname', 'like', $req->lname . '%')
            ->where('a.fname', 'like', $req->fname . '%')
            ->where('a.first_program_choice', 'like', $req->first_program . '%')
            ->orderBy('total', 'desc')
            ->paginate($req->perpage);

        return $data;
       // return DB::select('call proc_studentlist_result(?)', array($searchkey));
            //->paginate($req->perpage);

    }

    public function reportExcel(Request $req){
        $acad = AcadYear::where('active', 1)->first();
        $data = DB::table('users as a')
            ->select('a.user_id', 'a.lname', 'a.fname', 'a.mname', 'a.sex', 'a.first_program_choice', 'a.second_program_choice', 'a.email',
                'a.province', 'a.city', 'a.barangay', 'a.created_at',
                DB::raw('coalesce((select sum(dd.score) from answer_sheets as aa
                join answers as bb on aa.answer_sheet_id = bb.answer_sheet_id
                join options as cc on bb.option_id = cc.option_id
                join questions as dd on cc.question_id = dd.question_id
                where aa.user_id = a.user_id and aa.section_id = 1 and cc.is_answer = 1 and aa.code = (select code from acad_years where active = 1)),0) as abstraction'),
                DB::raw('coalesce((select sum(dd.score) from answer_sheets as aa
                join answers as bb on aa.answer_sheet_id = bb.answer_sheet_id
                join options as cc on bb.option_id = cc.option_id
                join questions as dd on cc.question_id = dd.question_id
                where aa.user_id = a.user_id and aa.section_id = 2 and cc.is_answer = 1 and aa.code = (select code from acad_years where active = 1)),0) as logical'),
                DB::raw('coalesce((select sum(dd.score) from answer_sheets as aa
                join answers as bb on aa.answer_sheet_id = bb.answer_sheet_id
                join options as cc on bb.option_id = cc.option_id
                join questions as dd on cc.question_id = dd.question_id
                where aa.user_id = a.user_id and aa.section_id = 3 and cc.is_answer = 1 and aa.code = (select code from acad_years where active = 1)), 0) as english'),
                DB::raw('coalesce((select sum(dd.score) from answer_sheets as aa
                join answers as bb on aa.answer_sheet_id = bb.answer_sheet_id
                join options as cc on bb.option_id = cc.option_id
                join questions as dd on cc.question_id = dd.question_id
                where aa.user_id = a.user_id and aa.section_id = 4 and cc.is_answer = 1 and aa.code = (select code from acad_years where active = 1)), 0) as numerical'),
                DB::raw('coalesce((select sum(dd.score) from answer_sheets as aa
                join answers as bb on aa.answer_sheet_id = bb.answer_sheet_id
                join options as cc on bb.option_id = cc.option_id
                join questions as dd on cc.question_id = dd.question_id
                where aa.user_id = a.user_id and aa.section_id = 5 and cc.is_answer = 1 and aa.code = (select code from acad_years where active = 1)), 0) as general'),
                DB::raw('(select abstraction) + (select logical) + (select english) + (select numerical) + (select general) as total')
            )
            ->join('student_schedules as b', 'a.user_id', 'b.user_id')
            ->join('test_schedules as c', 'b.test_schedule_id', 'c.test_schedule_id')
            ->where('c.acad_year_id', $acad->acad_year_id)
            ->where('a.first_program_choice', 'like', $req->first_program . '%')
            ->get();
        return $data;
    }

}
