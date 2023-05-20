<?php

namespace App\Admin\Actions\Post;

use Encore\Admin\Actions\RowAction;
use Illuminate\Database\Eloquent\Model;

class ActionToQuarantineOutStore extends RowAction
{
    public $name = 'To Quar\'n Out';

    public function handle(Model $model)
    {
        return $this->response()->redirect(admin_url("/quarantine-out-store/{$model->id}/edit"));
    }
}
