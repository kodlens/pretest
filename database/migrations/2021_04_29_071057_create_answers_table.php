<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateAnswersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('answers', function (Blueprint $table) {
            $table->id('answer_id');

            $table->unsignedBigInteger('answer_sheet_id');
            $table->foreign('answer_sheet_id')->references('answer_sheet_id')->on('answer_sheets')
                ->onUpdate('cascade')
                ->onDelete('cascade');;

            $table->unsignedBigInteger('option_id');
            $table->foreign('option_id')->references('option_id')->on('options');
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
        Schema::dropIfExists('answers');
    }
}
