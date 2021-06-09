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
        $users = [
            [
                'username' => 'admin',
                'lname' => 'AMPARADO',
                'fname' => 'ETIENNE',
                'mname' => 'N',
                'sex' => 'MALE',
                'email' => 'admin@pretest.org',
                'password' => Hash::make('a112233'),
                'role' => 'ADMINISTRATOR',
            ],
            [
                'username' => 'guidance',
                'lname' => 'SUMALINOG',
                'fname' => 'BERNICE',
                'mname' => 'N',
                'sex' => 'FEMALE',
                'email' => 'guidance@pretest.org',
                'password' => Hash::make('gu1dance$$'),
                'role' => 'ADMINISTRATOR',
            ],
            [
                'username' => 'student',
                'lname' => 'SUMALINOG',
                'fname' => 'BERNICE',
                'mname' => 'N',
                'sex' => 'FEMALE',
                'email' => 'student@pretest.org',
                'password' => Hash::make('a'),
                'role' => 'STUDENT',
            ],
        ];

        User::insertOrIgnore($users);
    }
}
