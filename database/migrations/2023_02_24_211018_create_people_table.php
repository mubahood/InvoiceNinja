<?php

use App\Models\Association;
use App\Models\Group;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePeopleTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('people', function (Blueprint $table) {
            $table->id();
            $table->timestamps();

            $table->foreignIdFor(Association::class);
            $table->foreignIdFor(Group::class);
            $table->text('name')->nullable();
            $table->text('address')->nullable();
            $table->text('parish')->nullable();
            $table->text('village')->nullable();
            $table->text('phone_number')->nullable();
            $table->text('email')->nullable();
            $table->text('district_id')->nullable();
            $table->integer('subcounty_id')->nullable();
            $table->integer('disability_id')->nullable();
            $table->text('phone_number_2')->nullable();
            $table->text('dob')->nullable();
            $table->text('sex')->nullable();
            $table->text('education_level')->nullable();
            $table->text('employment_status')->nullable();
            $table->text('has_caregiver')->nullable();
            $table->text('caregiver_name')->nullable();
            $table->text('caregiver_sex')->nullable();
            $table->text('caregiver_phone_number')->nullable();
            $table->text('caregiver_age')->nullable();
            $table->text('caregiver_relationship')->nullable();
            $table->text('photo')->nullable();
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('people');
    }
}
