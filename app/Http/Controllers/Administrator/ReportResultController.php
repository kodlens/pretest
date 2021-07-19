<?php

namespace App\Http\Controllers\Administrator;

use App\Http\Controllers\Controller;
use App\Models\AcadYear;
use Illuminate\Http\Request;

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Mail;

use App\Models\Program;
use App\Models\Gadtest;
use App\Models\User;

use App\Mail\AdmitStudent;


use Illuminate\Support\Facades\Hash;

class ReportResultController extends Controller
{
    //
    public function __construct(){
        $this->middleware('auth');
       //$this->middleware('admin');
        $this->middleware('staff');
    }

    public function index(){
        $programs = Program::where('programStat', 1)->get();
        return view('panel.admission.report-result')
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


    public function admitStudent(Request $req){
        $n = time() . $req->user_id;
        $studentCode = substr(md5($n), -6);

        $ay = AcadYear::where('active', 1)->first();
        //return $req->fields;

        //make obj(programs) in one string
        $programs = '';
        foreach ($req->programs as $row){
            $programs = $programs .  $row['CCode'] . ',';
        }

        $programs = substr_replace($programs, '', -1);
        $status = strtoupper($req->fields['status']);
        //return $req->fields;

        try {
            
            //update if email exist.. if not create new record
             Gadtest::updateOrCreate(
                 [
                     'email' => $req->fields['email']
                 ],
                 [
                    'StudLName' => strtoupper($req->fields['lname']),
                    'StudFName' => strtoupper($req->fields['fname']),
                    'StudMName' => strtoupper($req->fields['mname']),
                    'StudSex' => strtoupper($req->fields['sex']),
                    'StudClass' => $status,
                    'StudBDate' => $req->fields['bdate'],
                    'StudCNum' => $req->fields['contact_no'],
                    'StudCourse' => strtoupper($programs),
                    //'StudYear' => $status == 'NEW' ? '1' : '0',
                    'StudYear' => '1',
                    'email' => $req->fields['email'],
                    'term' => $ay->code,
                    'StudLSBrgyCode' => $req->fields['barangay_id'],
                    'StudPStr' => $req->fields['street'],
                    'password' => Hash::make($studentCode),
                    'rating' => $req->fields['total'],
                    'learning_mode' => $req->fields['learning_mode'
                ],
            ]);

             Mail::to($req->fields['email'])->send(new AdmitStudent($req->fields, $studentCode, $req->programs));

            User::where('user_id', $req->fields['user_id'])
                ->update(['is_submitted' => 1]);

           


            return ['status' => 'mailed'];
        } catch (Exception $e) {
            return ['status' => 'failed'];
        }
    }



}
