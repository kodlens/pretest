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

    protected $fillable=['order_no', 'section_id', 'question', 'question_img_path', 'score'];


    public function options(){
        return $this->hasMany(Option::class, 'question_id', 'question_id');
    }

    public function section(){
        return $this->hasOne(Section::class, 'section_id', 'section_id');
    }


}
