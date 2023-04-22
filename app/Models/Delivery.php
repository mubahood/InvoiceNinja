<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Delivery extends Model
{
    use HasFactory; 



    public function items()
    {
        return $this->hasMany(DeliveryItem::class); 
    } 
     
}
