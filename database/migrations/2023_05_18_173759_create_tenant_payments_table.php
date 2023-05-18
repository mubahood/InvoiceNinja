<?php

use App\Models\Renting;
use App\Models\Tenant;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTenantPaymentsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tenant_payments', function (Blueprint $table) {
            $table->id();
            $table->timestamps();

            $table->foreignIdFor(Renting::class)->nullable();
            $table->foreignIdFor(Tenant::class);
            $table->integer('amount');
            $table->integer('balance');
            $table->text('details')->nullable();
            $table->text('payment_method')->nullable();
            $table->text('payment_destination')->nullable();
            $table->text('transaction_number')->nullable();
            $table->text('account_number')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('tenant_payments');
    }
}
