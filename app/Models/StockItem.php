<?php

namespace App\Models;

use Exception;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class StockItem extends Model
{
    use HasFactory;

    public static function boot()
    {
        parent::boot();
        self::creating(function ($m) {
            $m->status = 'Available';
            return StockItem::my_update($m);
        });
        self::updating(function ($m) {
            return StockItem::my_update($m);
        });
    }

    public function cat()
    {
        return $this->belongsTo(StockCategory::class, 'stock_category_id');
    }
    public function store()
    {
        return $this->belongsTo(Store::class, 'store_id');
    }
    public function store_section()
    {
        return $this->belongsTo(StoreSection::class, 'store_section_id');
    }

    public function shelve()
    {
        return $this->belongsTo(Shelve::class, 'shelve_id');
    }
    public function sub_cat()
    {
        return $this->belongsTo(StockSubCategory::class, 'stock_sub_category_id');
    }
    public static function my_update($m)
    {

        $sub_cat = StockSubCategory::find($m->stock_sub_category_id);
        if ($sub_cat == null) {
            throw new Exception("Sub category not found.", 1);
        }

        $m->stock_category_id = $sub_cat->stock_category_id;
        return $m;
    }
}
