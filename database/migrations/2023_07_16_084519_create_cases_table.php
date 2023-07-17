<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCasesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('cases', function (Blueprint $table) {
            $table->id();
            $table->timestamps();
            $table->integer('reported_by')->nullable();
            $table->integer('district_id')->nullable();
            $table->integer('sub_county_id')->nullable();
            $table->text('village')->nullable();
            $table->text('offences')->nullable();
            $table->text('category')->nullable();
            $table->text('title')->nullable();
            $table->string('case_type')->nullable();
            $table->text('complainant_type')->nullable();
            $table->text('suspect_type')->nullable();

            $table->text('suspect_name')->nullable();
            $table->text('suspect_nin')->nullable();
            $table->text('suspect_sex')->nullable();
            $table->text('suspect_photo')->nullable();
            $table->text('suspect_phone_number')->nullable();
            $table->text('suspect_occupation')->nullable();
            $table->text('suspect_address')->nullable();
            $table->text('other_suspects_suspects')->nullable();


            $table->text('suspect_company_name')->nullable();
            $table->text('suspect_company_reg_number')->nullable();
            $table->text('suspect_company_phone_number')->nullable();
            $table->text('suspect_company_address')->nullable();
            $table->text('suspect_company_details')->nullable();
            $table->text('other_company_suspects')->nullable();

            $table->text('complainant_name')->nullable();
            $table->text('complainant_nin')->nullable();
            $table->text('complainant_sex')->nullable();
            $table->text('complainant_photo')->nullable();
            $table->text('complainant_phone_number')->nullable();
            $table->text('complainant_occupation')->nullable();
            $table->text('complainant_address')->nullable();

            $table->text('complainant_company_name')->nullable();
            $table->text('complainant_company_reg_number')->nullable();
            $table->text('complainant_company_phone_number')->nullable();
            $table->text('complainant_company_address')->nullable();
            $table->text('complainant_company_details')->nullable();

            $table->text('status')->nullable();
            $table->text('status_remarks')->nullable();
            $table->text('state')->nullable();
            $table->text('case_number')->nullable();
            $table->date('case_date')->nullable();
            $table->text('case_description')->nullable();
            $table->text('officer_in_charge')->nullable();
            $table->text('is_suspects_arrested')->nullable();
            $table->text('arrest_date_time')->nullable();
            $table->text('police_station')->nullable();
            $table->text('arrest_crb_number')->nullable();
            $table->text('prosecutor')->nullable();
            $table->string('is_convicted')->nullable();
            $table->string('court_outcome')->nullable();
            $table->string('magistrate_name')->nullable();
            $table->string('court_name')->nullable();
            $table->string('court_file_number')->nullable();
            $table->string('is_jailed')->nullable();
            $table->string('jail_period')->nullable();
            $table->string('is_fined')->nullable();
            $table->string('fined_amount')->nullable();
            $table->string('court_date')->nullable();
            $table->string('jail_date')->nullable();
            $table->string('court_action')->nullable();
            $table->string('has_suspect_appeared_in_court')->nullable();
            $table->string('has_suspect_been_arrested')->nullable();
            $table->string('court_police_action')->nullable();
            $table->string('prison')->nullable();
            $table->string('cautioned')->nullable();
            $table->string('cautioned_remarks')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('cases');
    }
}
