<?php

namespace App\Admin\Controllers;

use App\Models\Store;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class StoreController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Store';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Store());

        $grid->quickSearch('name')->placeholder('Search by name....');
        $grid->model()->orderBy('name', 'asc');
        $grid->disableBatchActions();
        $grid->column('id', __('ID'))->sortable();
        $grid->column('name', __('Name'));
        $grid->column('store_type', __('Store type'));
        $grid->column('details', __('Details'));

        return $grid;
    }

    /**
     * Make a show builder.
     *
     * @param mixed $id
     * @return Show
     */
    protected function detail($id)
    {
        $show = new Show(Store::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));
        $show->field('store_type', __('Store type'));
        $show->field('name', __('Name'));
        $show->field('details', __('Details'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new Store());

        $form->text('name', __('Name'))->rules('required');
        $form->select('store_type', __('Store type'))
            ->options([
                'Quarantine In' => 'Quarantine In',
                'Bonded' => 'Bonded Store',
                'Quarantine Out' => 'Quarantine Out',
            ])->rules('required');
        $form->text('details', __('Details'));


        $form->morphMany('sections', 'Click on new to add a section', function (Form\NestedForm $form) {
            $form->text('name', __('Section Name'))->rules('required');
            $form->text('details', __('Details'));
        });


        return $form;
    }
}
