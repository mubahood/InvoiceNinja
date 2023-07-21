<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateApplicationsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('applications', function (Blueprint $table) {
            $table->id();
            $table->timestamps();
            $table->text('registry')->nullable();
            $table->text('application_number')->nullable();
            $table->year('year')->nullable();
            $table->text('applicant')->nullable();
            $table->text('respondent')->nullable();

            $table->text('applicant_name')->nullable();
            $table->text('nature_of_business')->nullable();
            $table->text('postal_address')->nullable();
            $table->text('physical_address')->nullable();
            $table->text('plot_number')->nullable();
            $table->text('street')->nullable();
            $table->text('village')->nullable();
            $table->text('trading_center')->nullable();
            $table->text('telephone_number')->nullable();
            $table->text('fax_number')->nullable();
            $table->text('email')->nullable();
            $table->text('tin')->nullable();
            $table->text('income_tax_file_number')->nullable();
            $table->text('vat_number');
            

            $table->text('tax_decision_office')->nullable();
            $table->text('tax_type')->nullable();
            $table->text('assessment_number')->nullable();
            $table->text('bill_of_entry')->nullable();
            $table->text('bank_payment')->nullable();
            $table->text('amount_of_tax')->nullable();
            $table->text('taxation_decision_date')->nullable();
            
            $table->text('statement_of_facts')->nullable();
            $table->text('decision_issue')->nullable();
            $table->text('list_of_books')->nullable();
            $table->text('witness_names')->nullable();
            $table->text('dated_at')->nullable();
            $table->text('sign')->nullable();


            $table->date('date_of_filling')->nullable();
            $table->text('sign1')->nullable();
            $table->text('date2')->nullable();
            $table->text('sign2')->nullable();



        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('applications');
    }
}
