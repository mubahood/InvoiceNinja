<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class StockCategory extends Model
{
    use HasFactory;
    use SoftDeletes;
 

    public function stock_sub_categories()
    {
        return $this->hasMany(StockSubCategory::class);
    }
}
