<?php

use App\Models\Course;
use App\Models\CourseChapter;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCourseTopicsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('course_topics', function (Blueprint $table) {
            $table->id();
            $table->timestamps();
            $table->foreignIdFor(CourseChapter::class);
            $table->text('name')->nullable(); 
            $table->text('type')->nullable(); 
            $table->text('video')->nullable(); 
            $table->text('youtube')->nullable(); 
            $table->text('files')->nullable(); 
            $table->text('description')->nullable(); 
            $table->text('minutes')->nullable(); 

        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('course_topics');
    }
}
