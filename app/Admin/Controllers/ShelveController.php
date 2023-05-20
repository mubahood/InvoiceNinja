<?php

namespace App\Admin\Controllers;

use App\Admin\Actions\Post\BatchCopy;
use App\Models\Shelve;
use App\Models\StoreSection;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class ShelveController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Shelves';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Shelve());


        $grid->batchActions(function ($batch) {
            $batch->disabledelete();
            $batch->add(new BatchCopy());
        });

        $grid->quickSearch('name')->placeholder('Search by name....');
        $grid->model()->orderBy('name', 'asc');
        $grid->column('id', __('ID'))->sortable();
        $grid->column('name', __('Name'))->sortable()->editable();

        $grid->column('store_section_id', __('Store section id'));
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
        $show = new Show(Shelve::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));
        $show->field('store_id', __('Store id'));
        $show->field('store_section_id', __('Store section id'));
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
        $form = new Form(new Shelve());

        //$form->number('store_id', __('Store id'));


        $form->select('store_section_id', __('Select Store Section'))
            ->options(StoreSection::get_items())
            ->rules('required')
            ->required();

        $form->text('name', __('Name'))->rules('required')->required();
        $form->text('details', __('Details'));

        return $form;
    }
}
