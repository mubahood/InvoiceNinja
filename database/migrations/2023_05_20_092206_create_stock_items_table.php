<?php

use App\Models\Shelve;
use App\Models\StockCategory;
use App\Models\StockSubCategory;
use App\Models\Store;
use App\Models\StoreSection;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateStockItemsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::dropIfExists('stock_items');
        Schema::create('stock_items', function (Blueprint $table) {
            $table->id();
            $table->timestamps();
            $table->foreignIdFor(StockCategory::class);
            $table->foreignIdFor(StockSubCategory::class);
            $table->foreignIdFor(Store::class);
            $table->foreignIdFor(StoreSection::class);
            $table->foreignIdFor(Shelve::class);
            $table->string('status')->nullable();
            $table->string('state')->nullable();
            $table->string('stage')->nullable();
            $table->text('name')->nullable();
            $table->text('description')->nullable();
            $table->text('inspected_by')->nullable();
            $table->text('expiry_date')->nullable();

            $table->text('serial_no')->nullable();
            $table->text('card_no')->nullable();

            $table->text('instalation_by')->nullable();
            $table->text('aircraft_hours')->nullable();
            $table->text('hours_run')->nullable();
            $table->text('remarks')->nullable();

            $table->text('instalation_aircraft_no')->nullable();
            $table->text('instalation_position')->nullable();
            $table->text('instalation_aircraft_engine_hours')->nullable();
            $table->text('instalation_s_n')->nullable();
            $table->text('instalation_job_no')->nullable();
            $table->text('instalation_auth_lc_no')->nullable();
            $table->text('instalation_date')->nullable();
            $table->text('monitor_position')->nullable();
            $table->text('monitor_position_cycle')->nullable();
            $table->text('monitor_position_date')->nullable();
            $table->text('monitor_position_changed_by')->nullable();
            $table->text('removed_from_aircraft')->nullable();
            $table->text('removal_description')->nullable();
            $table->text('removal_station')->nullable();
            $table->text('removal_job_no')->nullable();
            $table->text('removal_by')->nullable();
            $table->text('red_rescription')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('stock_items');
    }
}
