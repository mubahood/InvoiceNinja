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
    protected $appends = ['name_text'];

    public function getNameTextAttribute(){
        if($this->cat == null){
            return $this->name;
        }
        return $this->name.", ".$this->cat->name;
    }

    public function cat(){
        return $this->belongsTo(StockCategory::class,'stock_category_id');
    }
    public static function getItems()
    {
        $items = [];
        foreach (StockSubCategory::where([])->orderBy('name','asc')->get() as $key => $val) {
            $items[$val->id] = $val->name_text;
        }
        return $items;
    }
}
