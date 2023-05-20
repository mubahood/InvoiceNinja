<?php

namespace App\Admin\Actions\Post;

use Encore\Admin\Actions\RowAction;
use Illuminate\Database\Eloquent\Model;

class ActionToBondedStore extends RowAction
{
    public $name = 'To Bonded';

    public function handle(Model $model)
    {
        return $this->response()->redirect(admin_url("/bonded-store/{$model->id}/edit"));
    }
}
