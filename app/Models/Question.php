<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Question extends Model
{
    use HasFactory;

    protected $connection = 'mysql';

    protected $table = 'questions';
    protected $primaryKey = 'question_id';

    protected $fillable=['order_no',
        'acad_year_id',
        'section_id', 'level_id', 'question', 'is_question_img', 'question_img', 'score'];




    public function options(){
        return $this->hasMany(Option::class, 'question_id', 'question_id');
    }

    public function section(){
        return $this->hasOne(Section::class, 'section_id', 'section_id');
    }

    public function level(){
        return $this->hasOne(Level::class, 'level_id', 'level_id');
    }


}
