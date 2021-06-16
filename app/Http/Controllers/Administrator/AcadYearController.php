<?php

namespace App\Http\Controllers\Administrator;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Models\AcadYear;

class AcadYearController extends Controller
{
    //
    public function __construct(){
        $this->middleware('auth');
        $this->middleware('admin');
    }

    public function index(){
        return view('panel.acadyear.acadyear');
    }

    public function index_data(Request $req){
        $sort = explode('.', $req->sort_by);
        return AcadYear::where('code', 'like', $req->code . '%')
            ->orderBy($sort[0], $sort[1])
            ->paginate($req->perpage);
    }



    public function show($id){
        return AcadYear::find($id);
    }

    public function store(Request $req){
        $validate = $req->validate([
            'code' => ['string', 'max:100', 'required', 'unique:acad_years'],
            'description' => ['string', 'max:100', 'required'],
        ]);

        AcadYear::create([
            'code' => $req->code,
            'description' => strtoupper($req->description),
            'active' => $req->active ? 1 : 0

        ]);

        return ['status' => 'saved'];
    }

    public function update(Request $req, $id){
        $validate = $req->validate([
            'code' => ['string', 'max:100', 'required', 'unique:acad_years,code,'.$id.',acad_year_id'],
            'description' => ['string', 'max:100', 'required'],
            
        ]);

        AcadYear::where('acad_year_id', $id)
            ->update([
                'code' => $req->code,
                'description' => strtoupper($req->description),
                'active' => $req->active ? 1 : 0
            ]);

        return ['status' => 'updated'];
    }


    public function destroy($id){
        AcadYear::destroy($id);
    }


}
