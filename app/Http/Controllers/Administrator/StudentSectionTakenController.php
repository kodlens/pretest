<?php

namespace App\Http\Controllers\Administrator;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

use App\Models\TakingTest;
use App\Models\AcadYear;
use App\Models\AnswerSheet;



class StudentSectionTakenController extends Controller
{
    //

    public function __construct(){
        $this->middleware('auth');
        $this->middleware('admin');
    }

    public function index(){
        return view('panel.student_section_taken.student-section-taken');
    }

    public function index_data(Request $req){
        $sort = explode('.', $req->sort_by);
        $data = DB::table('taking_test as a')
            ->join('acad_years as b', 'a.acad_year_id', 'b.acad_year_id')
            ->join('users as c', 'a.user_id', 'c.user_id')
            ->join('sections as d', 'a.section_id', 'd.section_id')
            ->join('student_schedules as e', 'a.student_schedule_id', 'e.student_schedule_id')
            ->join('test_schedules as f', 'e.test_schedule_id', 'f.test_schedule_id')
            ->select('a.taking_test_id', 'a.acad_year_id', 'b.code', 'b.description',
                DB::raw('date(a.created_at) as created_date'), DB::raw('date_format(a.created_at,"%h:%i") as created_time'),
                'c.user_id', 'c.lname', 'c.fname', 'c.mname', 'c.first_program_choice',
                'd.section_id', 'd.section',
                'a.student_schedule_id', 'e.student_schedule_id',
                'f.description as schedule_description', 'f.from', 'f.to', 'f.max_user')
            ->where('lname', 'like', $req->lname . '%')
            ->where('fname', 'like', $req->fname . '%')
            ->paginate($req->perpage);
        return $data;
    }

    public function deleteTaken(Request $req){
        
        //return $req;
        TakingTest::where('taking_test_id', $req->taking_test_id)
            ->delete();

        AnswerSheet::where('code', $req->code)
            ->where('user_id', $req->user_id)
            ->where('section_id', $req->section_id)
            ->delete();
        return ['status' => 'deleted'];
    }



}
