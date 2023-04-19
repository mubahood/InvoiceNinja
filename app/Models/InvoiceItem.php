<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class InvoiceItem extends Model
{
    use HasFactory;

    protected $fillable = ['product_id', 'quantity'];

    public function pro()
    {
        return $this->belongsTo(Product::class, 'product_id');
    }
}
