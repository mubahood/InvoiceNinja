<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class InvoiceItem extends Model
{
    use HasFactory;

    protected $fillable = ['product_id', 'quantity', 'product','price'];

    public function pro()
    {
        return $this->belongsTo(Supplier::class, 'product_id');
    }


    public static function boot()
    {
        parent::boot();
        self::created(function ($m) {
            $x = Invoice::find($m->invoice_id);
            if ($x != null) {
                $x->do_process();
            }
        });
        self::updated(function ($m) {
            $x = Invoice::find($m->invoice_id);
            if ($x != null) {
                $x->do_process();
            }
        });
    }
}
