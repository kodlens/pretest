<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class AllowRegistration
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

        $reg = DB::table('registration')->first();
        if($reg->is_open > 0){
            return $next($request);
        }else{
            return redirect('/')
                ->with('error', 'reg_not_allowed');
        }
        
    }
}
