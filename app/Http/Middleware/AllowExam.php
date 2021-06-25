<?php

namespace App\Http\Middleware;

use App\Models\AcadYear;
use App\Models\TakingTest;
use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

use App\Models\TestSchedule;

use Carbon\Carbon;
use Auth;


class AllowExam
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle(Request $request, Closure $next)
    {
        $nDateTime = Carbon::now()->toDateTimeString();
        $userid = Auth::user()->user_id;
        $acadyear = AcadYear::where('active', 1)->first();

        if(Auth::check()){

            $is_allow = DB::table('test_schedules as a')
                ->join('student_schedules as b', 'a.test_schedule_id', 'b.test_schedule_id')
                ->where('a.from', '<=',$nDateTime)
                ->where('a.to', '>=', $nDateTime)
                ->where('b.user_id', $userid)
                ->exists();

            $isVisitedSection = TakingTest::where('acad_year_id', $acadyear->acad_year_id)
                ->where('user_id', $userid)
                ->where('section_id', $request->section_id)
                ->where('student_schedule_id', $request->schedule_id)
                ->exists();


            if(!$is_allow){
                return redirect('/home')
                    ->with('error', 'not_scheduled');
            }

            if($isVisitedSection){
                return redirect('/home')
                    ->with('error', 'already_visited_section');
            }

            return $next($request)
                ->header('Cache-Control','nocache, no-store, max-age=0, must-revalidate')
                ->header('Pragma','no-cache');
        }else{
            return redirect('/');
        }


    }
}
