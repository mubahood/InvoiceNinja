<?php

use App\Admin\Controllers\StoreSectionController;
use App\Models\Store;
use App\Models\StoreSection;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateShelvesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('shelves', function (Blueprint $table) {
            $table->id();
            $table->timestamps();
            $table->foreignIdFor(Store::class)
                ->onUpdate('cascade')
                ->onDelete('set null');
            $table->foreignIdFor(StoreSection::class)
                ->onUpdate('cascade')
                ->onDelete('set null');
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
        Schema::dropIfExists('shelves');
    }
}
