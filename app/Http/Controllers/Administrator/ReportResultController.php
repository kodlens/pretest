<?php

namespace App\Http\Controllers\Administrator;

use App\Http\Controllers\Controller;
use App\Models\AcadYear;
use Illuminate\Http\Request;

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Mail;

use Illuminate\Validation\Rule;

use App\Models\Program;
use App\Models\Gadtest;
use App\Models\User;

use App\Mail\AcceptanceEmail;
use App\Mail\RejectEmail;



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
            ->select('a.user_id', 'a.lname', 'a.fname', 'a.mname', 'a.sex', 'a.status', 'a.first_program_choice', 'a.second_program_choice',
            'a.status', 'a.bdate', 'a.email', 'a.contact_no', 'a.learning_mode', 'a.city', 'a.barangay_id', 'a.street', 'a.is_submitted', 'a.remark',
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
            // ->where('a.is_submitted', 0)
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
            ->select('a.user_id', 'a.lname', 'a.fname', 'a.mname', 'a.sex', 'a.contact_no', 'a.status', 'a.first_program_choice', 'a.second_program_choice', 'a.email',
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


    public function sendAcceptEmail(Request $req){
        $isAccept = $req->is_accept; //if reject email or not
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
            //add check if lname, fname and mname exist in tblgadtest
            // $studentExist = Gadtest::where('StudLName', $req->fields['lname'])
            //                 ->where('StudFName', $req->fields['fname'])
            //                 ->where('StudMName', $req->fields['mname'])
            //                 ->exists();

            // //                 return $studentExist;

            // if($studentExist){
            //     return response()->json([
            //         'remark' => 'duplicate'
            //     ], 422);
            // }


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
                    //'StudCNum' => $req->fields['contact_no'],
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

            $when = now()->addSeconds(10);
            Mail::to($req->fields['email'])
                ->later($when, new AcceptanceEmail($req->fields, $studentCode, $req->programs));
      

            User::where('user_id', $req->fields['user_id'])
                ->update(['is_submitted' => 1, 
                            'remark' => 'ACCEPT',
                            'admission_code' => $studentCode,
                            'accepted_program' => $req->programs
                        ]);


                return response()->json([
                    'remark' => 'success'
                ], 200);
        } catch (Exception $e) {
            return response()->json([
                'remark' => 'error'
            ], 500);
        }
    }



    public function sendRejectEmail(Request $req){
        try{
            //Rejection Email
            $when = now()->addSeconds(10);
            Mail::to($req->fields['email'])
                ->later($when, new RejectEmail($req->fields));

            User::where('user_id', $req->fields['user_id'])
                ->update(['is_submitted' => 1, 
                            'remark' => 'REJECT',
                            'admission_code' => null,
                            'accepted_program' => null
                        ]);

            return response()->json([
                'remark' => 'success'
            ], 200);
        } catch (Exception $e) {
            return response()->json([
                'remark' => 'error'
            ], 500);
        }
    }



}
