<?php

namespace App\Admin\Actions\Post;

use Encore\Admin\Actions\RowAction;
use Illuminate\Database\Eloquent\Model;

class ActionIssueOut extends RowAction
{
    public $name = 'Issued Out';

    public function handle(Model $model)
    {
        return $this->response()->redirect(admin_url("/issued-out/{$model->id}/edit"));
    }
}
