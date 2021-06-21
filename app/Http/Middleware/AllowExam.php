<?php

namespace App\Http\Middleware;

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

        if(Auth::check()){
            $is_allow = DB::table('test_schedules as a')
                ->join('student_schedules as b', 'a.test_schedule_id', 'b.test_schedule_id')
                ->where('a.from', '<=',$nDateTime)
                ->where('a.to', '>=', $nDateTime)
                ->where('b.user_id', $userid)
                ->exists();

            if($is_allow){
                return $next($request);
            }else{
                return redirect('/home')
                ->with('error', 'not_scheduled');
            }
        }else{
            return redirect('/');
        }


    }
}
