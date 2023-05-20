<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class StockSubCategory extends Model
{
    use HasFactory;
    use SoftDeletes;
    
    protected $fillable = ['stock_category_id', 'name', 'details'];
}
