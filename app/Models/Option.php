<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Option extends Model
{
    use HasFactory;

    protected $connection = 'mysql';

    protected $table = 'options';
    protected $primaryKey = 'option_id';

    protected $fillable = ['question_id', 'letter', 'content', 'is_img', 'img_path', 'is_answer'];

    


}
