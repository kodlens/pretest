<?php

namespace App\Http\Controllers\Student;

use App\Http\Controllers\Controller;

use App\Models\AcadYear;
use App\Models\TakingTest;
use App\Rules\SubmitResultRule;
use Illuminate\Http\Request;
use Illuminate\Database\Query\Builder;

use App\Models\Question;
use App\Models\AnswerSheet;
use App\Models\Answer;
use Carbon\Carbon;
use Illuminate\Support\Facades\DB;


class TakingExamController extends Controller
{
    //

    public function __construct()
    {
        $this->middleware('verified');
        $this->middleware('allow_exam');
    }


    public function index(Request $req){

        $section_id = $req->section_id;
        $student_schedule_id = $req->schedule_id;
        //return $section_id . ' - ' . $schedule_id;

        $user_id = auth()->user()->user_id;
        $ay = AcadYear::where('active', 1)->first();

        $isExist = AnswerSheet::where('user_id', $user_id)
            ->where('code', $ay->code)
            ->where('section_id', $section_id)
                ->exists();

        if($isExist){
            return redirect('/home')
                ->with('error', 'exist');
        }

        //record the user open this section and questions
        //to avoid taking SS and avoid leakage of questionaire
        $takingTest = TakingTest::create([
            'acad_year_id' => $ay->acad_year_id,
            'user_id' => $user_id,
            'section_id' => $section_id,
            'student_schedule_id' => $student_schedule_id,
        ]);

        // //tiwasonon

        return view('student.taking-exam')
            ->with('id', $section_id)
            ->with('student_schedule_id', $student_schedule_id);
    }


    public function examineeQuestion($section_id)
    {

        # code...
        //$section_id = $req->section;
        $ay = AcadYear::where('active', 1)->first();
        $easy_question = Question::with(['options'])
            ->join('levels', 'questions.level_id', 'levels.level_id')
            ->where('acad_year_id', $ay->acad_year_id)
            ->where('level', 'EASY')
            ->where('section_id', $section_id)
            ->inRandomOrder()->take(6)->get();


        $average_question = Question::with(['options'])
            ->join('levels', 'questions.level_id', 'levels.level_id')
            ->where('acad_year_id', $ay->acad_year_id)
            ->where('level', 'AVERAGE')
            ->where('section_id', $section_id)
            ->inRandomOrder()->take(6)->get();

        $diff_question = Question::with(['options'])
            ->join('levels', 'questions.level_id', 'levels.level_id')
            ->where('acad_year_id', $ay->acad_year_id)
            ->where('level', 'DIFFICULT')
            ->where('section_id', $section_id)
            ->inRandomOrder()->take(6)->get();

        $data = array_merge($easy_question->toArray(),
            $average_question->toArray(),
            $diff_question->toArray());

        return $data;
    }

    public function examineeResult(){
        $user_id = auth()->user()->user_id;

    }

    public function store(Request $req){

        $user_id = auth()->user()->user_id;
        $ay = AcadYear::where('active', 1)->first();
        $section_id = $req->section_id;


        $n = AnswerSheet::where('user_id', $user_id)
            ->where('code', $ay->code)
            ->where('section_id', $req->section_id)
            ->exists();

        if($n){
            return ['status' => 'exist'];
        }

        try{
            DB::transaction(function() use ($req, $user_id, $section_id) {
                $dateTaken = Carbon::now()->toDateString();

                $ay = AcadYear::where('active', 1)->first();

                $ansSheet = AnswerSheet::create([
                    'code' => $ay->code,
                    'user_id' => $user_id,
                    'section_id' => $section_id,
                    'is_taken' => 1,
                    'date_taken' => $dateTaken,
                ]);

                $arr=[];
                foreach($req->answers as $row){
                    if($row != null){
                        array_push($arr,[
                            'answer_sheet_id' => $ansSheet->answer_sheet_id,
                            'option_id' => $row
                        ]);
                    }
                }

                Answer::insert($arr);

                //forward final result to gadtc_registrar db
            });
            return ['status' => 'saved'];
        }catch(\Exception $e){
            return ['status' => 'error', 'msg' => $e->getMessage()];
        }

    }



}
