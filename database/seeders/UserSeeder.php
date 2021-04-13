<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

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
        DB::table('users')->insert([
            'username' => 'admin',
            'lname' => 'ADMIN',
            'fname' => 'ADMIN',
            'mname' => 'ADMIN',
            'sex' => 'FEMALE',
            'email' => 'admin@system.org',
            'password' => Hash::make('a'),
            'role' => 'ADMINISTRATOR',
        ]);

        

    }
}
