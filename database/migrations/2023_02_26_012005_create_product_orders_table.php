<?php

use Encore\Admin\Auth\Database\Administrator;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProductOrdersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('product_orders', function (Blueprint $table) {
            $table->id();
            $table->timestamps();
            $table->foreignIdFor(Administrator::class, 'seller_id');
            $table->foreignIdFor(Administrator::class, 'buyer_id');
            $table->foreignIdFor(Administrator::class, 'product_id');
            $table->text('buyer_message')->nullable();
            $table->text('buyer_contact')->nullable();
            $table->text('buyer_contact_2')->nullable();
            $table->text('seller_message')->nullable();
            $table->text('stage')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('product_orders');
    }
}
