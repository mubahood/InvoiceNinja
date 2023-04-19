<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCandidatesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('candidates', function (Blueprint $table) {
            $table->id();
            $table->timestamps();
            $table->text('name')->nullable(); 
            $table->string('first_name')->nullable();
            $table->string('middle_name')->nullable();
            $table->text('sex')->nullable();
            $table->string('last_name')->nullable();
            $table->text('dob')->nullable();
            $table->text('phone_number')->nullable();
            $table->text('email')->nullable();
            $table->text('district_id')->nullable();
            $table->integer('subcounty_id')->nullable();
            $table->text('village')->nullable();
            $table->text('address')->nullable();
            $table->text('phone_number_2')->nullable();
            $table->integer('weight')->nullable();
            $table->integer('height')->nullable();
            $table->string('religion')->nullable();
            $table->string('agent')->nullable();
            $table->string('nin')->nullable();
            $table->string('has_passport')->nullable();
            $table->string('passport_number')->nullable();
            $table->string('passport_issue_date')->nullable();
            $table->string('passport_expiry')->nullable();
            $table->text('photo')->nullable();
            $table->text('education_level')->nullable();
            $table->text('skills')->nullable();
            $table->text('parent_farther_name')->nullable();
            $table->text('parent_farther_contact')->nullable();
            $table->text('parent_farther_address')->nullable();
            $table->text('parent_mother_name')->nullable();
            $table->text('parent_mother_contact')->nullable();
            $table->text('parent_mother_address')->nullable();
            $table->text('next_of_kin_releationship')->nullable();
            $table->text('next_of_kin_name')->nullable();
            $table->text('next_of_kin_contact')->nullable();
            $table->text('next_of_kin_address')->nullable();
            $table->text('passport_copy')->nullable();
            $table->text('full_photo')->nullable();
            $table->text('stage')->nullable();
            $table->text('destination_country')->nullable();
            $table->string('job_type')->nullable();
            $table->string('registration_fee')->nullable();
            $table->string('has_paid')->nullable();
            $table->string('account')->nullable();
            $table->string('medical_hospital')->nullable();
            $table->string('medical_date')->nullable();
            $table->string('medical_status')->nullable();
            $table->string('musaned_status')->nullable();
            $table->string('failed_reason')->nullable();
            $table->string('interpal_appointment_date')->nullable();
            $table->string('interpal_done')->nullable();
            $table->string('interpal_status')->nullable();
            $table->string('cv_sharing')->nullable();
            $table->string('cv_shared_with_partners')->nullable();
            $table->string('emis_upload')->nullable();
            $table->string('on_training')->nullable();
            $table->string('training_start_date')->nullable();
            $table->string('training_end_date')->nullable();
            $table->string('ministry_aproval')->nullable();
            $table->string('enjaz_applied')->nullable();
            $table->string('enjaz_status')->nullable();
            $table->string('embasy_submited')->nullable();
            $table->string('embasy_date_submited')->nullable();
            $table->string('embasy_status')->nullable();
            $table->string('depature_status')->nullable();
            $table->string('depature_date')->nullable();
            $table->string('depature_comment')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('candidates');
    }
}
