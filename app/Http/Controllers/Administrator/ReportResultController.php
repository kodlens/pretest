<?php

namespace App\Http\Controllers\Administrator;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use Illuminate\Support\Facades\DB;

class ReportResultController extends Controller
{
    //
    public function __construct(){
        $this->middleware('auth:admin');
    }

    public function index(){
        return view('panel.report.report-result');
    }

    public function index_data(Request $req){
        $sortkey = explode(".",$req->sort_by);

        if($req->searchkey == null){
            $searchkey = '';
        }else{
            $searchkey = $req->searchkey;
        }

        return DB::select('call proc_studentlist_result(?)', array($searchkey));
            //->paginate($req->perpage);
       
    }


   
    
}
