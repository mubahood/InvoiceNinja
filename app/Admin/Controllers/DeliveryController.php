<?php

namespace App\Admin\Controllers;

use App\Models\Delivery;
use App\Models\Product;
use App\Models\Utils;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class DeliveryController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Delivery notes';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Delivery());

        $grid->model()->orderBy('id', 'desc');
        $grid->disableBatchActions();
        $grid->column('id', __('No.'))->sortable();
        $grid->column('created_at', __('Date'))->display(function ($x) {
            return Utils::my_date_time($x);
        })->sortable();
        $grid->column('customer_name', __('Customer'))->sortable();
        /*         $grid->column('invoice_date', __('Invoice date')); */
        /*         $grid->column('invoice_no', __('Invoice no')); */
/*         $grid->column('total', __('Amount'))->display(function ($x) {
            return '<b class="p-0 m-0 text-right">' . 'UGX ' . number_format($x) . '</b>';
        })->sortable(); */
/*         $grid->column('paid', __('Paid'))->display(function ($x) {
            return '<b class="p-0 m-0 text-right">' . 'UGX ' . number_format($x) . '</b>';
        })->sortable(); */
    /*     $grid->column('balance', __('Balance'))->display(function ($x) {
            return '<b class="p-0 m-0 text-right text-red">' . 'UGX ' . number_format($x) . '</b>';
        })->sortable();
 */

        $grid->column('print', __('PRINT delivery'))->display(function () {
            $link = url('delivery?id=' . $this->id);
            return '<b><a target="_blank" href="' . $link . '">PRINT DELIVERY NOTE</a></b>';
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
        $show = new Show(Delivery::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));
        $show->field('customer_name', __('Customer name'));
        $show->field('customer_contact', __('Customer contact'));
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
        $form = new Form(new Delivery());
 
        $form->text('customer_name', __('Customer Name'))->required();
        $form->text('customer_address', __('Customer Address'))->required();
        $form->text('customer_contact', __('Customer Contact'))->required();
        $form->datetime('invoice_date', __('Date'))->required();
        /*  $form->decimal('paid', __('Amount Paid'))->required(); */
        $form->morphMany('items', 'Click on new to add a Delivery item', function (Form\NestedForm $form) {
            $form->select('product_id', __('Product'))
                ->options(Product::where([])->orderBy('name', 'desc')->get()->pluck('name', 'id'))
                ->rules('required');
             $form->decimal('quantity', __('Quantity'))->rules('required'); 
        });
 
        return $form;
    }
}
