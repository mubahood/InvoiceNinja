<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddRepresentativeInfoToApplications extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('applications', function (Blueprint $table) {
            $table->text('representative_name')->nullable();
            $table->text('representative_telephone')->nullable();
            $table->text('representative_mobile')->nullable();
            $table->text('representative_address')->nullable();
            $table->string('ready_to_submit')->default('No')->nullable();
            $table->string('ready_to_submit_confirm')->default('No')->nullable();
            $table->text('proof_of_payment')->nullable();
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
