<?php

namespace App\Http\Controllers\Administrator;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Models\User;
use Illuminate\Support\Facades\Hash;

class UserController extends Controller
{
    //

    public function __construct(){
        $this->middleware('auth');
        $this->middleware('admin');
    }

    public function index(){
        return view('panel.user.user');
    }

    public function index_data(Request $req){
        $sort = explode('.', $req->sort_by);
        return User::orderBy($sort[0], $sort[1])
            ->paginate($req->perpage);
    }

    public function create(){
        return view('panel.user.user-create');
    }

    public function store(Request $req){

        $validate = $req->validate([
            'username' => ['required', 'string', 'max:255', 'unique:users'],
            'lname' => ['required', 'string', 'max:255'],
            'fname' => ['required', 'string', 'max:255'],
            'email' => ['required', 'string', 'email', 'max:255', 'unique:users'],
            'password' => ['required', 'string', 'min:4', 'confirmed'],
        ]);

        User::create([
            'username' => $req->username,
            'password' => Hash::make($req->password),
            'lname' => strtoupper($req->lname),
            'fname' => strtoupper($req->fname),
            'mname' => strtoupper($req->mname),
            'sex' => strtoupper($req->sex),
            'bdate' => $req->bdate,
            'birthplace' => strtoupper($req->birthplace),
            'contact_no' => $req->contact_no,
            'email' => $req->email,
            'last_school_attended' => strtoupper($req->last_school_attended),
            'province' => strtoupper($req->province),
            'city' => strtoupper($req->city),
            'barangay' => strtoupper($req->barangay),
            'street' => strtoupper($req->street),
            'role' => strtoupper($req->role),
        ]);

        return ['status' => 'saved'];
    }

    public function edit($id){
        $data = User::find($id);
        return view('panel.user.user-edit')
            ->with('data', $data);
    }

    public function destroy($id){
        User::destroy($id);
    }
}
