<?php

namespace App\Admin\Controllers;

use App\Models\Invoice;
use App\Models\Product;
use App\Models\Supplier;
use App\Models\Utils;
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
    protected $title = 'Orders';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Invoice());
        $grid->model()->orderBy('id', 'desc');
        $grid->disableBatchActions();
        $grid->column('id', __('No.'))->sortable();
        $grid->column('created_at', __('Date'))->display(function ($x) {
            return Utils::my_date_time($x);
        })->sortable();
        $grid->column('customer_name', __('Customer'))->sortable();
        /*         $grid->column('invoice_date', __('Invoice date')); */
        /*         $grid->column('invoice_no', __('Invoice no')); */
        $grid->column('total', __('Total'))->display(function ($x) {
            return '<b class="p-0 m-0 text-right">' . 'UGX ' . number_format($x) . '</b>';
        })->sortable();
        $grid->column('paid', __('Paid'))->display(function ($x) {
            return '<b class="p-0 m-0 text-right">' . 'UGX ' . number_format($x) . '</b>';
        })->sortable();
        $grid->column('balance', __('Balance'))->display(function ($x) {
            return '<b class="p-0 m-0 text-right text-red">' . 'UGX ' . number_format($x) . '</b>';
        })->sortable();


        $grid->column('print', __('PRINT INVOICE'))->display(function () {
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

        $form->text('customer_name', __('Order description'))->rules('required');
        $form->date('invoice_date', __('Order Date'))->rules('required');
        $form->date('customer_contact', __('Expeted Delivery Date'))->rules('required');
        if ($form->isEditing()) {
            $form->display('total', __('Total Amount (In USD)'))->rules('required');
        }
        $form->radioCard('processed', __('Is Paid'))
            ->options([
                'Paid' => 'Paid',
                'Not Paid' => 'Not Paid'
            ]);
        $form->radio('customer_address', __('Order status'))
            ->options([
                'Pending' => 'Pending',
                'Processing' => 'Processing',
                'Shipping' => 'Shipping',
                'Delivered' => 'Delivered',
                'Completed' => 'Completed',
                'Canceled' => 'Canceled',
            ])
            ->rules('required');


        $form->morphMany('items', 'Click on new to add items to this order', function (Form\NestedForm $form) {
            $form->text('product', __('Item/Product'))->rules('required');
            $form->decimal('price', __('Unit price (in USD)'))->rules('required');
            $form->decimal('quantity', __('Quantity'))->rules('required');
            $form->select('product_id', __('Supplier'))
                ->options(Supplier::where([])->orderBy('name', 'desc')->get()->pluck('name', 'id'))
                ->rules('required');
        });



        return $form;
    }
}
