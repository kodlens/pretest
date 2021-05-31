<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;

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

        if(Auth::check()){
            $is_allow = TestSchedule::where('test_from', '<=',$nDateTime)
                ->where('test_to', '>=', $nDateTime)->exists();

            if($is_allow){
                return $next($request);
            }else{
                return redirect('/section')
                ->with('error', 'PRETEST EXAM IS CLOSED.');
            }
        }else{
            return redirect('/');
        }


    }
}
