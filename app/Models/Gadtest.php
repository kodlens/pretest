<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Gadtest extends Model
{
    use HasFactory;

    protected $connection = 'registrar_gadtc';

    protected $table = 'tblgadtest';

    protected $primaryKey = 'id';

    protected $fillable =[
        'StudLName', 'StudFName', 'StudMName', 'StudSex',
        'StudBType', 'StudClass', 'StudBDate', 'StudCNum',
        'StudCourse', 'StudYear', 'email', 'term', 'StudLSBrgyCode',
        'StudPStr', 'password', 'rating', 'learning_mode'
    ];

    //StudLSBrgy -> address. ID
    //ratings
    //password -> code
    //password is the code
}
