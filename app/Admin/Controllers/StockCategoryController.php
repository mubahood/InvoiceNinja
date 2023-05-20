<?php

namespace App\Admin\Controllers;

use App\Models\StockCategory;
use App\Models\Utils;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class StockCategoryController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Stock Categories';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new StockCategory());

        $grid->quickSearch('name')->placeholder('Search by name....');
        $grid->model()->orderBy('name', 'asc');
        $grid->disableBatchActions();
        $grid->column('id', __('ID'))->sortable();
        $grid->column('created_at', __('Date'))->display(function ($x) {
            return Utils::my_date_time($x);
        })->hide();

        $grid->column('name', __('Name'))->sortable();

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
        $show = new Show(StockCategory::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));
        $show->field('deleted_at', __('Deleted at'));
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
        $form = new Form(new StockCategory());

        $form->text('name', __('Name'))->rules('required')->required();
        $form->text('details', __('Details'));

        $form->morphMany('stock_sub_categories', 'Click on new to add a Subcategory', function (Form\NestedForm $form) {
            $form->text('name', __('Subcategory Name'))->rules('required');
            $form->text('details', __('Details'));
        });

        return $form;
    }
}
