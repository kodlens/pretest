<?php

namespace App\Http\Controllers\Administrator;

use App\Http\Controllers\Controller;
use App\Http\Requests\StoreQuestionRequest;

use App\Models\AcadYear;
use App\Models\Level;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;

use Illuminate\Http\File;
use Illuminate\Support\Facades\Storage;

use App\Models\Question;
use App\Models\Section;
use App\Models\Option;


class QuestionController extends Controller
{
    //
    public function __construct(){
        $this->middleware('auth');
        $this->middleware('admin');
    }

    public function index(){
        $levels = Level::select('level_id', 'level')->get();
        $sections = Section::all();
        return view('panel.question.panel-question')
            ->with('levels', $levels)
            ->with('sections', $sections);
    }

    public function index_data(Request $req){
        //return Question::all();
        $sortkey = explode(".",$req->sort_by);

        return Question::with(['options', 'section', 'level'])
            ->whereHas('section', function ($query) use ($req){ //(Builder $query)
                $query->where('section', 'like', $req->section .'%');
            })
            ->where('question', 'like', $req->question . '%')
            ->where('question_id', 'like', $req->question_id . '%')
            ->orderBy($sortkey[0], $sortkey[1])
            ->paginate($req->perpage);
    }

    public function create(){
        return view('panel.question.panel-question-create');
    }

//    public function ajax_section(){
//        return Section::all();
//    }

    public function store(Request $req){

        $ay = AcadYear::where('active', 1)->first();
        $validate = $req->validate([
            'section' => ['required'],
            'level' => ['required'],
            'score' => ['required', 'numeric', 'min: 1']
        ]);

        try{

            $file = $req->file('question_img'); //check if null or has an image
            $options = json_decode($req->options);  //decode to json stringify JSON from javascript

            if($file){
                //if question is file
                $pathQuestion = $file->store('public/q'); //get path of the file
                $newPath = explode('/', $pathQuestion);
                $pathQuestion = $newPath[2];

                $question = Question::create([
                    'acad_year_id' => $ay->acad_year_id,
                    'section_id' => $req->section,
                    'level_id' => $req->level,
                    'is_question_img' => 1,
                    'question_img' => $pathQuestion,
                    'question' => trim($req->question),
                    'score' => $req->score
                ]);
                //$file->move($destinationPath , $fileName);   //move the file to the folder
            }else{
                //if question is plain text
                $question = Question::create([
                    'acad_year_id' => $ay->acad_year_id,
                    'section_id' => $req->section,
                    'level_id' => $req->level,
                    'question' => trim($req->question),
                    'score' => $req->score
                ]);
            }

            $q_id = $question->question_id; //get last insert id from question table
            $arr=[]; //init array

            $counter = 0;
            $optionImg = $req->optionImg;
            

            foreach($options as $row){
                if($row->is_img > 0){
                    //upload
                    $fileOption = $optionImg[$counter];
                    $pathOption = $fileOption->storeAs('public/q', md5($counter.time()). '.'.$fileOption->extension());
                    $newPath = explode('/', $pathOption);
                    $pathOption = $newPath[2];
                    array_push($arr, [
                        'question_id' => $q_id,
                        'letter' => $row->optionLetter,
                        'content' => trim($row->content),
                        'is_img' => $row->is_img,
                        'img_path' => trim($pathOption),
                        'is_answer' => $row->is_answer,
                    ]);

                }else{
                    //plain text
                    array_push($arr, [
                        'question_id' => $q_id,
                        'letter' => $row->optionLetter,
                        'content' => trim($row->content),
                        'is_img' => $row->is_img,
                        'img_path' => '',
                        'is_answer' => $row->is_answer,
                    ]);
                }
                $counter++;
            }
            Option::insert($arr);

           return ['status' => 'saved'];
        }catch(\Exception $e){
            return ['status' => 'error', 'msg' => $e->getMessage()];
        }
    }

    public function show($id){
        return Question::with(['options'])->where('question_id', $id)
            ->first();
    }

    public function update(Request $req, $id){
        
        $validate = $req->validate([
            //'order_no' => ['required', 'numeric', Rule::unique('questions')->ignore($id, 'question_id')],
            'section' => ['required', 'numeric'],
            'level' => ['required', 'numeric'],
            'score' => ['required', 'numeric', 'min: 1']
        ]);


        try{

            $questionFile = $req->file('question'); //check if question is empty of null
            //$options = json_decode($req->options);  //decode to json stringify JSON from javascript
            $ay = AcadYear::where('active', 1)->first();
            if($questionFile == null || $questionFile == ''){ //if text
                $question = Question::find($id);
                $question->acad_year_id = $ay->acad_year_id;
                $question->section_id = $req->section;
                $question->level_id = $req->level;
                $question->question = trim($req->question);
                $question->score = $req->score;
                $question->save();
            }

            foreach($req->options as $row){
                if($row['is_img'] > 0){
                    Option::where('option_id', $row['option_id'])
                        //update image here...
                        ->update([
                            'is_answer' => $row['is_answer'],
                        ]);
                }else{
                    //update text option here ...
                    if($row['option_id']){
                        Option::where('option_id', $row['option_id'])
                        ->update([
                            'question_id' => $id,
                            'letter' => $row['letter'],
                            'content' => trim($row['content']),
                            'is_img' => $row['is_img'],
                            'img_path' => null,
                            'is_answer' => $row['is_answer'],
                        ]);
                    }else{
                        Option::create([
                            'question_id' => $id,
                            'letter' => $row['optionLetter'],
                            'content' => trim($row['content']),
                            'is_img' => $row['is_img'],
                            'img_path' => null,
                            'is_answer' => $row['is_answer'],
                        ]);
                    }
                }

            }

            return ['status' => 'updated'];
        }catch(\Exception $e){
            return ['status' => 'error', 'msg' => $e->getMessage()];
        }

    }



    public function destroy($id){
        $fileQuestion = Question::find($id);


        if($fileQuestion != '' || $fileQuestion != null){
            if(Storage::exists('public/q/'. $fileQuestion->question_img)){
                Storage::delete('public/q/'. $fileQuestion->question_img);
            }
        }


       $fileOptions = Option::where('question_id', $id)->get();

       foreach ($fileOptions as $path){
           if($path->img_path != '' || $path->img_path != null){
                if(Storage::exists('public/q/' .$path->img_path)){
                    Storage::delete('public/q/' .$path->img_path);
                }
           }
       }

       Question::destroy($id);

        return [['status' => 'deleted']];
    }


}
