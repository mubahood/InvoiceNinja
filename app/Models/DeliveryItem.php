<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DeliveryItem extends Model
{
    protected $fillable = ['product_id', 'quantity'];
    use HasFactory;  

    public function pro()
    {
        return $this->belongsTo(Product::class, 'product_id');
    }
}
