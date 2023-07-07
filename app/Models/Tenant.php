<?php

namespace App\Models;

use Exception;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Tenant extends Model
{
    use HasFactory;

    public static function boot()
    {
        parent::boot();
        self::deleting(function ($m) {
            if ($m->id == 1) {
                throw new Exception("You cannot delete this item.", 1);
            }
        });
    }

    public static function get_items()
    {
        $items = [];
        foreach (Tenant::where([])->orderBy('name', 'asc')->get() as $key => $h) {
            $items[$h->id] = "#" . $h->id . " - " . $h->name;
        }
        return $items;
    }
}
