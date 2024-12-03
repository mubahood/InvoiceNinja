<?php

namespace App\Admin\Actions\Application;

use Encore\Admin\Actions\RowAction;
use Illuminate\Database\Eloquent\Model;

class AcionAllocatePanel extends RowAction
{
    public $name = 'Allocate Panel';

    public function handle(Model $model)
    {
        return $this->response()->redirect(admin_url("/applications-defense/{$model->id}/edit"));
    }
}
