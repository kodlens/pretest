<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class OptionSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //
        $options = [
            //question 1
            [
                'question_id' => 1,
                'letter' => 'A',
                'content' => 'This is option A',
                'is_img' => 0,
                'is_answer' => 0,
            ],
            [
                'question_id' => 1,
                'letter' => 'B',
                'content' => 'This is option B',
                'is_img' => 0,
                'is_answer' => 0,
            ],
            [
                'question_id' => 1,
                'letter' => 'C',
                'content' => 'This is option C',
                'is_img' => 0,
                'is_answer' => 0,
            ],
            [
                'question_id' => 1,
                'letter' => 'D',
                'content' => 'This is option D',
                'is_img' => 0,
                'is_answer' => 0,
            ],



            //question 2
            [
                'question_id' => 2,
                'letter' => 'A',
                'content' => 'This is option A',
                'is_img' => 0,
                'is_answer' => 0,
            ],
            [
                'question_id' => 2,
                'letter' => 'B',
                'content' => 'This is option B',
                'is_img' => 0,
                'is_answer' => 0,
            ],
            [
                'question_id' => 2,
                'letter' => 'C',
                'content' => 'This is option C',
                'is_img' => 0,
                'is_answer' => 0,
            ],
            [
                'question_id' => 2,
                'letter' => 'D',
                'content' => 'This is option D',
                'is_img' => 0,
                'is_answer' => 0,
            ],


            //question 3
            [
                'question_id' => 3,
                'letter' => 'A',
                'content' => 'This is option A',
                'is_img' => 0,
                'is_answer' => 0,
            ],
            [
                'question_id' => 3,
                'letter' => 'B',
                'content' => 'This is option B',
                'is_img' => 0,
                'is_answer' => 0,
            ],
            [
                'question_id' => 3,
                'letter' => 'C',
                'content' => 'This is option C',
                'is_img' => 0,
                'is_answer' => 0,
            ],
            [
                'question_id' => 3,
                'letter' => 'D',
                'content' => 'This is option D',
                'is_img' => 0,
                'is_answer' => 0,
            ],



            //question 4
            [
                'question_id' => 4,
                'letter' => 'A',
                'content' => 'This is option A',
                'is_img' => 0,
                'is_answer' => 0,
            ],
            [
                'question_id' => 4,
                'letter' => 'B',
                'content' => 'This is option B',
                'is_img' => 0,
                'is_answer' => 0,
            ],
            [
                'question_id' => 4,
                'letter' => 'C',
                'content' => 'This is option C',
                'is_img' => 0,
                'is_answer' => 0,
            ],
            [
                'question_id' => 4,
                'letter' => 'D',
                'content' => 'This is option D',
                'is_img' => 0,
                'is_answer' => 0,
            ],


        ];


        \App\Models\Option::insertOrIgnore($options);

    }
}
