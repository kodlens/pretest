<?php

namespace App\Http\Controllers\Administrator;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;


use App\Models\User;
use App\Models\AnswerSheet;
use App\Models\AcadYear;


class DashboardResultController extends Controller
{
    //

    public function dashboardReport(){
        $ay = AcadYear::where('active', 1)->first();

        $countAccepted = User::where('remark', 'ACCEPT')->count();
        $countRejected = User::where('remark', 'REJECT')->count();
        $countReturnee = User::where('status', 'RETURNEE')->count();
        $countTransferee = User::where('status', 'TRANSFEREE')->count();
        $countNewStudent = User::where('status', 'NEW')->count();

        


        $countTakers = DB::table('answer_sheets')
            ->from( function ($query) use ($ay){
                $query->select('*')->from('answer_sheets')
                ->where('code', $ay->code)
                ->groupBy('user_id')->get();
            })
            ->count();
        
            
        return [
            'accepted' => $countAccepted, 
            'new_students' => $countNewStudent, 
            'rejected' => $countRejected,
            'no_takers' => $countTakers,
            'no_returnees' => $countReturnee,
            'no_transferees' => $countTransferee
        ];
    }
}
