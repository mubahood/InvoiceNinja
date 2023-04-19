<?php

use App\Models\CourseCategory;
use Encore\Admin\Auth\Database\Administrator;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCoursesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {

        Schema::create('courses', function (Blueprint $table) {
            $table->id();
            $table->timestamps();
            $table->foreignIdFor(Administrator::class);
            $table->foreignIdFor(CourseCategory::class);
            $table->text('name')->nullable();
            $table->text('price')->nullable();
            $table->text('total_hours')->nullable();
            $table->text('level')->nullable();
            $table->text('thumbnail')->nullable();
            $table->text('introduction_video')->nullable();
            $table->text('has_certificate')->nullable();
            $table->text('details')->nullable();
            $table->text('skills')->nullable();
            $table->text('prerequisits')->nullable();
            $table->text('tags')->nullable();
            $table->text('language')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('courses');
    }
}
