<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;


class AddressController extends Controller
{
    //

    public function provinces(){
        return DB::connection('registrar_gadtc')
            ->table('tblbrgy')
            ->select('Prov_Name')
            ->distinct()
            ->get();
    }

    public function cities(Request $req){
        return DB::connection('registrar_gadtc')
            ->table('tblbrgy')
            ->select('City_Name')
            ->where('Prov_Name', $req->province)
            ->distinct()
            ->get();
    }

    public function barangays(Request $req){
        return DB::connection('registrar_gadtc')
            ->table('tblbrgy')
            ->select('Brgy_ID','Bgry_Name')
            ->where('Prov_Name', $req->province)
            ->where('City_Name', $req->city)
            ->get();
    }


}
