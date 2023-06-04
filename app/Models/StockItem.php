<?php

namespace App\Models;

use Carbon\Carbon;
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

    public function isExpiring()
    {
        if ($this->monitor_expiry != 'Yes') {
            return false;
        }
        $d1 = Carbon::now();
        $d2 = Carbon::parse($this->expiry_warning_date);

        if ($d2->isBefore($d1)) {
            return true;
        }
        return false;
    }


    public function isExpired()
    {
        if ($this->monitor_expiry != 'Yes') {
            return false;
        }
        $d1 = Carbon::now();
        $d2 = Carbon::parse($this->expiry_date);

        if ($d2->isBefore($d1)) {
            return true;
        }
        return false;
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
        if ($m->monitor_position == 'Yes') {
            $date = Carbon::parse($m->monitor_position_date);
            if ($date != null) {
                $m->next_monitor_position_date = $date->addDays((int)($m->monitor_position_cycle));
            }
        }


        if ($m->monitor_expiry == 'Yes') {
            $date = Carbon::parse($m->expiry_date);
            if ($date != null) {
                $m->expiry_warning_date = $date->subDays((int)($m->expiry_warning_days));
            }
        }

        $m->stock_category_id = $sub_cat->stock_category_id;
        return $m;
    }
}
