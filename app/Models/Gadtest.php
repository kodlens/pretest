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
        'StudCourse', 'StudYear', 'StudRel', 'email', 'StudLTerm', 'StudLSchool',
        'StudLTown', 'StudLYear', 'StudBbrgy', 'StudPStr', 'StudPZip', 'StudPFName',
        'StudPFAge', 'StudPFOcc', 'StudPMName', 'StudPMAge', 'StudPMOcc', 'StudGName',
        'StudGCNum', 'StudGTown', 'StudGRelation', 'StudRname1', 'StudRname2',
    ];

    //StudLSBrgy -> address. ID
    //ratings
    //password -> code
    //password is the code
}
