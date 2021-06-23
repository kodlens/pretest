<?php

namespace App\Models;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;

class User extends Authenticatable implements MustVerifyEmail
{
    use HasFactory, Notifiable;


    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */


   // protected $connection = 'mysql';
    //protected $guard = 'admin';

    protected $table = 'users';
    protected $primaryKey = 'user_id'; //the fuck.. nahurot akong adlaw nimo ..

    protected $fillable = [
        'username', 'lname', 'fname', 'mname', 'sex',
        'status',
        'bdate',
        'birthplace', 'contact_no',
        'email',
        'first_program_choice', 'second_program_choice',
        'learning_mode',
        'last-school_attended',
        'province', 'city', 'barangay', 'barangay_id', 'street',
        'password', 'role'
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];
}
