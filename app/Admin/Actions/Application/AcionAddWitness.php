<?php

namespace App\Admin\Actions\Application;

use Encore\Admin\Actions\RowAction;
use Illuminate\Database\Eloquent\Model;

class AcionAddWitness extends RowAction
{
    public $name = 'Submit Witnesses';

    public function handle(Model $model)
    {
        return $this->response()->redirect(admin_url("/applications-scheduled/{$model->id}/edit"));
    }
}
