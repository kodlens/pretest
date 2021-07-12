<?php

namespace App\Http\Controllers\Administrator;

use App\Http\Controllers\Controller;
use App\Models\LearningModality;
use App\Models\Program;
use Illuminate\Http\Request;
use DB;

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
        return User::where('lname', 'like', $req->lname . '%')
            ->where('fname', 'like', $req->fname . '%')
            ->where('user_id', $req->user_id == '' ? 'like' : '=', $req->user_id == '' ? '%' : $req->user_id)
            ->orderBy($sort[0], $sort[1])
            ->paginate($req->perpage);
    }

    public function allStudents(Request $req){
        $sort = explode('.', $req->sort_by);
        return User::where('lname', 'like', $req->lname . '%')
            ->where('role', 'STUDENT')
            ->orderBy($sort[0], $sort[1])
            ->paginate($req->perpage);
    }

    public function verifyEmailStudents($id){
       User::where('user_id', $id)
        ->update([
            'email_verified_at' => DB::raw('now()')
        ]);

        return ['status' => 'verified'];
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
        $programs = Program::where('programStat', 1)->get();
        $learningmodes = LearningModality::all();

        $data = User::find($id);
        return view('panel.user.user-edit')
            ->with('data', $data)
            ->with('programs', $programs ? $programs : '')
            ->with('learningmodes', $learningmodes);
    }

    public function update(Request $req, $id){

        if($req->password != ''){
            $validate = $req->validate([
                'username' => ['required', 'string', 'max:50', 'unique:users,username,' .$id.',user_id'],
                'lname' => ['required', 'string', 'max:255'],
                'fname' => ['required', 'string', 'max:255'],
                'email' => ['required', 'string', 'email', 'max:255', 'unique:users,email,'. $id. ',user_id'],
                'password' => ['required', 'string', 'min:4', 'confirmed'],
            ]);
        }else{
            $validate = $req->validate([
                'username' => ['required', 'string', 'max:50', 'unique:users,username,' .$id.',user_id'],
                'lname' => ['required', 'string', 'max:255'],
                'fname' => ['required', 'string', 'max:255'],
                'email' => ['required', 'string', 'email', 'max:255', 'unique:users,email,'. $id. ',user_id'],
            ]);
        }

        $data = User::find($id);
        $data->username = $req->username;
        $data->lname = strtoupper($req->lname);
        $data->fname = strtoupper($req->fname);
        $data->mname = strtoupper($req->mname);
        $data->sex = strtoupper($req->sex);
        $data->status = strtoupper($req->status);
        $data->bdate = $req->bdate;
        $data->birthplace = strtoupper($req->birthplace);
        $data->contact_no = strtoupper($req->contact_no);
        $data->email = $req->email;
        $data->first_program_choice = $req->first_program_choice;
        $data->second_program_choice = $req->second_program_choice;
        $data->learning_mode = $req->learning_mode;
        $data->last_school_attended = strtoupper($req->last_school_attended);
//        $data->province = strtoupper($req->province);
//        $data->city = strtoupper($req->city);
//        $data->barangay = strtoupper($req->barangay);
//        $data->street = strtoupper($req->street);
        $data->role = strtoupper($req->role);
        if($req->password != ''){
            $data->password = Hash::make($req->password);
        }
        $data->save();

        return ['status' => 'updated'];
    }

    public function destroy($id){
        User::destroy($id);
    }
}
