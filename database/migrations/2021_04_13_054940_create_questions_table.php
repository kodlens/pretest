<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateQuestionsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('questions', function (Blueprint $table) {
            $table->id('question_id');

            $table->unsignedBigInteger('acad_year_id');
            $table->foreign('acad_year_id')->references('acad_year_id')->on('acad_years');


            $table->unsignedBigInteger('section_id');
            $table->foreign('section_id')->references('section_id')->on('sections');
            //create relationship

            $table->unsignedBigInteger('level_id');
            $table->foreign('level_id')->references('level_id')->on('levels');

            $table->text('question');
            $table->boolean('is_question_img')->default(0);
            $table->string('question_img')->nullable();
            $table->integer('set_time')->default(10);
            $table->integer('score');
            $table->timestamps();
        });


    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('questions');
    }
}
