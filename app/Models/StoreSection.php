<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class StoreSection extends Model
{
    use HasFactory;
    protected $fillable = [
        'store_id',
        'name',
        'details'
    ];

    public static function get_items()
    {
        $items = [];
        foreach (StoreSection::where(
            []
        )->orderBy('name', 'asc')->get() as $key => $h) {
            $items[$h->id] = "#" . $h->id . " - " . $h->name_text;
        }
        return $items;
    }



    public function shelves()
    {
        return $this->hasMany(Shelve::class);
    }
    public function getNameTextAttribute()
    {
        $name = $this->name;
        if ($this->store != null) {
            $name = $this->store->name . ", " . $name;
        }
        return $name;
    }

    public function store()
    {
        return $this->belongsTo(Store::class);
    }

    protected $appends = ['name_text'];
}
