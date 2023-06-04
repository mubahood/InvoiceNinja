<?php

namespace App\Models;

use Encore\Admin\Form\Field\Id;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class Invoice extends Model
{
    use HasFactory;

    public function items()
    {
        return $this->hasMany(InvoiceItem::class);
    }

    public static function boot()
    {
        parent::boot();
        self::created(function ($m) {
            $m->do_process();
        });
        self::updated(function ($m) {
            $m->do_process();
        });
    }


    public function do_process()
    {

        $tot = 0;
        foreach ($this->items as $key => $item) {


            $item->total = $item->quantity * $item->price;
            $item->save();
            $tot += $item->total;
        }
        $this->total = $tot;
        $this->balance = $tot - $this->paid;
        DB::update('update invoices set total = ? where id = ?', [$tot,$this->id]);
        //$this->processed = 'Yes';
        //$this->save();
    }
}
