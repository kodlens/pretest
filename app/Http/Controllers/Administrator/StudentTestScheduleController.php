<?php

namespace App\Http\Controllers\Administrator;

use App\Http\Controllers\Controller;
use App\Models\AcadYear;
use Illuminate\Http\Request;

use Illuminate\Support\Facades\DB;

use App\Models\StudentSchedule;


class StudentTestScheduleController extends Controller
{
    //

    public function __construct(){
        $this->middleware('auth');
    }


    public function index(){
        return view('panel.student_schedule.student-schedule');
    }


    public function index_data(Request $req){
        $sort = explode('.', $req->sort_by);
        $data = DB::table('student_schedules as a')
            ->join('test_schedules as b', 'a.test_schedule_id', 'b.test_schedule_id')
            ->join('users as c',  'a.user_id', 'c.user_id')
            ->select('a.*', 'b.acad_year_id', 'b.description', 'b.from', 'b.to', 'b.max_user', 'b.active', 'b.nt_user',
                'c.lname', 'c.fname', 'c.mname', 'c.sex', 'c.status')
            ->where('c.lname', 'like', $req->lname . '%')
            ->orderBy($sort[0], $sort[1])
            ->paginate($req->perpage);
        return $data;
    }

    public function edit($id){
        $acads = AcadYear::all();
        $data = DB::table('student_schedules as a')
            ->join('test_schedules as b', 'a.student_schedule_id', 'b.student_schedule_id');

        //tiwasonon edit

        return view('panel.test_schedule.test-schedule-create')
            ->with('acads', $acads);
    }


    public function destroy($id){
        StudentSchedule::destroy($id);
    }


}
