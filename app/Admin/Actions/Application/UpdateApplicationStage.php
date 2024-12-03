<?php

namespace App\Admin\Actions\Application;

use Encore\Admin\Actions\RowAction;
use Illuminate\Database\Eloquent\Model;

class UpdateApplicationStage extends RowAction
{
    public $name = 'Update Application Stage';

    public function handle(Model $model)
    {
        return $this->response()->redirect(admin_url("/applications/{$model->id}/edit"));
    }
}
