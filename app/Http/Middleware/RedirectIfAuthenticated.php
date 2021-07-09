<?php

namespace App\Http\Middleware;

use App\Providers\RouteServiceProvider;
use Closure;
use Illuminate\Http\Request;
use Auth;

class RedirectIfAuthenticated
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @param  string|null  ...$guards
     * @return mixed
     */
    public function handle(Request $request, Closure $next, ...$guards)
    {
        $guards = empty($guards) ? [null] : $guards;

        foreach ($guards as $guard) {
            if (Auth::guard($guard)->check()) {
                // if($guard == 'admin'){
                //     return redirect('/panel/home');
                // }
                // if($guard == 'student'){
                //     return redirect('/student/home');
                // }
                //return redirect(RouteServiceProvider::HOME);
                $role = Auth::user()->role;
                if(strtolower($role) === 'administrator' || strtolower($role) === 'staff'){
                    return redirect('/panel/home');
                }

                if(strtolower($role) === 'student'){
                    return redirect('/home');
                }
            }

//            if (Auth::guard('student')->check()) {
//                return redirect('/home');
//            }
//
//            if (Auth::guard('admin')->check()) {
//                return redirect('/panel-home');
//            }
        }

        return $next($request);
    }
}
