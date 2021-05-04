<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AcadYear extends Model
{
    use HasFactory;

    protected $table = 'acad_years';
    protected $primaryKey = 'acad_year_id';

    protected $fillable = ['code', 'description', 'active'];


}
