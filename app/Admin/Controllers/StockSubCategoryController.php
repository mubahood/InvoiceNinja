<?php

namespace App\Admin\Controllers;

use App\Models\StockCategory;
use App\Models\StockSubCategory;
use App\Models\Utils;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class StockSubCategoryController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Stock Sub-Categories';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new StockSubCategory());
        $grid->quickSearch('name')->placeholder('Search by name....');
        $grid->model()->orderBy('name', 'asc');
        $grid->disableBatchActions();
        $grid->column('id', __('ID'))->sortable();
        $grid->column('created_at', __('Date'))->display(function ($x) {
            return Utils::my_date_time($x);
        })->hide();

        $grid->column('stock_category_id', __('Stock category id'));
        $grid->column('name', __('Name'));
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
        $show = new Show(StockSubCategory::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));
        $show->field('stock_category_id', __('Stock category id'));
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
        $form = new Form(new StockSubCategory());

        $form->select('stock_category_id', __('Select category'))
            ->options(StockCategory::where([])->orderBy('name', 'asc')->get()->pluck('name', 'id'))
            ->rules('required');
        $form->text('name', __('Subcategory Name'))->required();
        $form->textarea('details', __('Details'));

        return $form;
    }
}
