<?php

namespace App\Admin\Controllers;

use App\Models\InvoiceItem;
use App\Models\Utils;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class InvoiceItemController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Sales';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new InvoiceItem());

        $grid->model()->orderBy('id', 'desc');
        $grid->disableBatchActions();
        $grid->column('id', __('No.'))->sortable();
        $grid->column('created_at', __('Date'))->display(function ($x) {
            return Utils::my_date($x);
        })->sortable();
        $grid->column('invoice_id', __('Invoice'))
            ->display(function () {
                $link = url('invoice?id=' . $this->invoice_id);
                return '<b><a target="_blank" href="' . $link . '">INVOICE #' . $this->invoice_id . '</a></b>';
            });

        $grid->column('product_id', __('Product id'))->hide();
        $grid->column('name', __('Product'));
        $grid->column('price', __('Price'));
        $grid->column('quantity', __('Quantity'))->sortable();
        $grid->column('total', __('Total'))->sortable();

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
        $show = new Show(InvoiceItem::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));
        $show->field('invoice_id', __('Invoice id'));
        $show->field('product_id', __('Product id'));
        $show->field('name', __('Name'));
        $show->field('price', __('Price'));
        $show->field('quantity', __('Quantity'));
        $show->field('total', __('Total'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new InvoiceItem());

        $form->number('invoice_id', __('Invoice id'));
        $form->number('product_id', __('Product id'));
        $form->textarea('name', __('Name'));
        $form->number('price', __('Price'));
        $form->number('quantity', __('Quantity'));
        $form->number('total', __('Total'));

        return $form;
    }
}
