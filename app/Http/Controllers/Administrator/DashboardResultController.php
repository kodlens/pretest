<?php

namespace App\Http\Controllers\Administrator;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

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
        $countTakers = AnswerSheet::where('code', $ay->code)->count();
        

        return [
            'accepted' => $countAccepted, 
            'rejected' => $countRejected,
            'no_takers' => $countTakers
        ];
    }
}
