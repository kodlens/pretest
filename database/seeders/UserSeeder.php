<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

use App\Models\User;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //
        User::create([
            'username' => 'admin',
            'lname' => 'AMPARADO',
            'fname' => 'ETIENNE',
            'mname' => 'N',
            'sex' => 'MALE',
            'email' => 'admin@pretest.org',
            'password' => Hash::make('a'),
            'role' => 'ADMINISTRATOR',
        ]);
    }
}
