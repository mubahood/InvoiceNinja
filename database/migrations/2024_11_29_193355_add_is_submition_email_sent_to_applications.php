<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddIsSubmitionEmailSentToApplications extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('applications', function (Blueprint $table) {
            $table->string('is_submition_email_sent')->default('No')->nullable();
            $table->string('is_ura_defence_email_sent')->default('No')->nullable();
            $table->string('is_ura_defence_submitted_email_sent')->default('No')->nullable();
            $table->string('should_ura_submit_defence')->default('No')->nullable();
            $table->text('ura_defence_body')->nullable();
            $table->text('ura_defence_attachment')->nullable();
            $table->string('has_ura_submitted_defence')->default('No')->nullable();
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
