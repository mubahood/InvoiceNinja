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

    public function update_balance()
    {
        $this->balance = $this->payments->sum('amount') - $this->rentings->sum('payable_amount');
        $this->save();
    }

    public function payments()
    {
        return $this->hasMany(TenantPayment::class, 'tenant_id');
    }
    public function rentings()
    {
        return $this->hasMany(Renting::class, 'tenant_id');
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
