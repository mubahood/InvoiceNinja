<?php

namespace App\Admin\Controllers;

use App\Models\Invoice;
use App\Models\Product;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class InvoiceController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Invoices';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Invoice());

        $grid->column('id', __('Id'));
        $grid->column('created_at', __('Created at'));
        $grid->column('updated_at', __('Updated at'));
        $grid->column('customer_name', __('Customer name'));
        $grid->column('invoice_date', __('Invoice date'));
        $grid->column('invoice_no', __('Invoice no'));
        $grid->column('total', __('Total'));
        $grid->column('paid', __('Paid'));
        $grid->column('balance', __('Balance'));


        $grid->column('print', __('CV'))->display(function () {
            $link = url('invoice?id=' . $this->id);
            return '<b><a target="_blank" href="' . $link . '">PRINT INVOICE</a></b>';
        });


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
        $show = new Show(Invoice::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));
        $show->field('customer_name', __('Customer name'));
        $show->field('invoice_date', __('Invoice date'));
        $show->field('invoice_no', __('Invoice no'));
        $show->field('total', __('Total'));
        $show->field('paid', __('Paid'));
        $show->field('balance', __('Balance'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new Invoice());

        $form->text('customer_name', __('Customer Name'))->required();
        $form->text('customer_address', __('Customer Address'))->required();
        $form->text('customer_contact', __('Customer Contact'))->required();
        $form->datetime('invoice_date', __('Date'))->required();
        $form->decimal('paid', __('Amount Paid'))->required();


        $form->morphMany('items', 'Click on new to add a invoice item', function (Form\NestedForm $form) {
            $form->select('product_id', __('Product'))
                ->options(Product::where([])->orderBy('name', 'desc')->get()->pluck('name', 'id'))
                ->rules('required');
            $form->decimal('quantity', __('Quantity'))->rules('required');
        });



        return $form;
    }
}
