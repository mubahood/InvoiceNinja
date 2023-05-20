<?php

namespace App\Admin\Actions\Post;

use Encore\Admin\Actions\RowAction;
use Illuminate\Database\Eloquent\Model;

class ActionToQuarantineInStore extends RowAction
{
    public $name = 'To Quar\'n In';

    public function handle(Model $model)
    {
        return $this->response()->redirect(admin_url("/quarantine-in-store/{$model->id}/edit"));
    }
}
