<?php

use App\Models\StockCategory;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateStockSubCategoriesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('stock_sub_categories', function (Blueprint $table) {
            $table->id();
            $table->timestamps();
            $table->foreignIdFor(StockCategory::class)
                ->onUpdate('cascade')
                ->onDelete('set 1');
            $table->text('name')->nullable();
            $table->text('details')->nullable(); 
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('stock_sub_categories');
    }
}
