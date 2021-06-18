<?php

namespace App\Http\Controllers\Student;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

use App\Models\TestSchedule;
use App\Models\StudentSchedule;
use Auth;

class StudentScheduleController extends Controller
{
    //

    //private $studentschedule_id = 0;

    public function __construct(){
        $this->middleware('verified');
        $this->middleware('student');
    }



    public function setSchedule(Request $req){
        
        $isFull = false;
        $testSchedules = TestSchedule::where('active', 1)
            ->where('from', '>', date("Y-m-d"))->get();
        //get all schedules where active = 1

        $userid = Auth::user()->user_id;
        
        foreach($testSchedules as $row){
            //loop to schedules
            $countSched = StudentSchedule::where('test_schedule_id', $row->test_schedule_id)->count();
            
            //count how many in schedules are in student schedules
            if($countSched < $row->max_user){ //2 <= 200
                //insert scheudle
                //$exist = StudentSchedule::where('user_id', $userid)->exists();
                $exist = DB::table('student_schedules as a')
                    ->join('test_schedules as b', 'a.test_schedule_id', 'b.test_schedule_id')
                    ->where('a.user_id', $userid)
                    ->where('b.from', '>', date("Y-m-d"))
                    ->exists();
                if($exist){
                    return ['status' => 'scheduled'];
                }

                $schedule = StudentSchedule::create([
                    'test_schedule_id' => $row->test_schedule_id,
                    'user_id' => $userid,
                ]);

                $isFull = false;
                break;
            }else{
                $isFull = true;
            }
        }

        if($isFull){
            return ['status' => 'full'];
        }

        $schedule = DB::table('student_schedules as a')
            ->join('test_schedules as b', 'a.test_schedule_id', 'b.test_schedule_id')
            ->where('student_schedule_id', $schedule->student_schedule_id)
            ->first();


        return [
            'status' => 'schedule', 
            'schedfrom' => $schedule->from, 
            'schedto' => $schedule->to
        ];

    }

    public function getSchedule(){
        $userid = Auth::user()->user_id;
        $testSchedules = TestSchedule::where('from', '>', date("Y-m-d"))
            ->where('active', 1)->get();

        foreach($testSchedules as $row){

            $schedule = DB::table('student_schedules as a')
                ->join('test_schedules as b', 'a.test_schedule_id', 'b.test_schedule_id')
                ->where('a.test_schedule_id', $row->test_schedule_id)
                ->where('b.from', '>', date("Y-m-d"))
                ->get();

          

            if($schedule){
                break;
            }
        }
        
        //$this->studentschedule_id = $schedule->student_schedule_id;

        return $schedule;
    }

}
