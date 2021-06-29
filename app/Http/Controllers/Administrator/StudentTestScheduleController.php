<?php

namespace App\Http\Controllers\Administrator;

use App\Http\Controllers\Controller;
use App\Models\AcadYear;
use App\Models\TestSchedule;
use Illuminate\Http\Request;

use Illuminate\Support\Facades\DB;

use App\Models\StudentSchedule;


class StudentTestScheduleController extends Controller
{
    //

    public function __construct(){
        $this->middleware('auth');
        $this->middleware('admin');
    }


    public function index(){
        return view('panel.student_schedule.student-schedule');
    }


    public function index_data(Request $req){
        $acad = AcadYear::where('active', 1)->first();
        $sort = explode('.', $req->sort_by);
        $data = DB::table('student_schedules as a')
            ->join('test_schedules as b', 'a.test_schedule_id', 'b.test_schedule_id')
            ->join('users as c',  'a.user_id', 'c.user_id')
            ->select('a.*', 'b.acad_year_id', 'b.description', 'b.from', 'b.to', 'b.max_user', 'b.active', 'b.nt_user',
                'c.lname', 'c.fname', 'c.mname', 'c.sex', 'c.status')
            ->where('b.acad_year_id', $acad->acad_year_id)
            ->where('c.lname', 'like', $req->lname . '%')
            ->orderBy($sort[0], $sort[1])
            ->paginate($req->perpage);
        return $data;
    }

    public function getSchedules(Request $req){
        $sort = explode('.', $req->sort_by);
        return TestSchedule::where('description', 'like', '%'.$req->description . '%')
            ->orderBy($sort[0], $sort[1])
            ->paginate($req->perpage);
    }



    public function create(){
        return view('panel.student_schedule.student-schedule-create');
    }

    public function store(Request $req){
        $validate = $req->validate([
            'test_schedule_id' => ['required'],
            'user_id' => ['required']
        ]);

        StudentSchedule::create([
            'test_schedule_id' => $req->test_schedule_id,
            'user_id' => $req->user_id,
        ]);

        return ['status' => 'saved'];
    }

    public function edit($id){
        //$data = StudentSchedule::where('student_schedule_id', $id)->get();
        $data = DB::table('student_schedules as a')
            ->join('test_schedules as b', 'a.test_schedule_id', 'b.test_schedule_id')
            ->join('users as c', 'a.user_id', 'c.user_id')
            ->select('a.student_schedule_id', 'a.test_schedule_id', 'b.description',
                'a.user_id', 'c.lname', 'c.fname', 'c.mname', 'c.sex')
            ->where('a.student_schedule_id', $id)
            ->get();

        return view('panel.student_schedule.student-schedule-edit')
            ->with('data', $data);
    }

    public function update(Request $req, $id){
        $validate = $req->validate([
            'test_schedule_id' => ['required'],
            'user_id' => ['required']
        ]);


        $data = StudentSchedule::find($id);
        $data->test_schedule_id = $req->test_schedule_id;
        $data->user_id = $req->user_id;
        $data->save();

        return ['status' => 'updated'];
    }


    public function destroy($id){
        StudentSchedule::destroy($id);
    }


}
