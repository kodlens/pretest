<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class LearningModality extends Model
{
    use HasFactory;

    protected $table = 'learning_modalities';
    protected $primaryKey = 'learning_mode_id';

    protected $fillable = ['learning_mode', 'learning_desc'];


}
