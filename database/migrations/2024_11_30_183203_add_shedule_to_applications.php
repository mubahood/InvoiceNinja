<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddSheduleToApplications extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('applications', function (Blueprint $table) {
            $table->text('schedule_date')->nullable();
            $table->string('is_schedule_email_sent')->nullable()->default('No');
            $table->text('ura_witnesses')->nullable();
            $table->text('applicant_witnesses')->nullable();
            $table->string('has_ura_submitted_witnesses')->nullable()->default('No');
            $table->string('has_applicant_submitted_witnesses')->nullable()->default('No');
            $table->string('ura_confirm_witnesses_submission')->nullable();
            $table->string('applicant_confirm_witnesses_submission')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('applications', function (Blueprint $table) {
            //
        });
    }
}
