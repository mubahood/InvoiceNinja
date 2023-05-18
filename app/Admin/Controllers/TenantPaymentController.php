<?php

namespace App\Admin\Controllers;

use App\Models\Renting;
use App\Models\TenantPayment;
use App\Models\Utils;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class TenantPaymentController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Tenant Payments (Receipts)';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new TenantPayment());

        $grid->quickSearch('details')->placeholder('Search by details...');
        $grid->model()->orderBy('id', 'desc');
        $grid->disableBatchActions();
        $grid->column('id', __('ID'))->sortable();
        $grid->column('created_at', __('Date'))->display(function ($x) {
            return Utils::my_date_time($x);
        })->sortable();

        $grid->column('renting_id', __('Renting'))->sortable();
        $grid->column('tenant_id', __('Tenant'))->display(function () {
            return $this->tenant->name;
        })->sortable();
        $grid->column('amount', __('Amount (UGX)'))
            ->display(function ($b) {
                return  number_format($b);
            })->sortable();
        $grid->column('balance', __('Balance (UGX)'))->display(function ($b) {
            return  number_format($b);
        })->sortable();
        $grid->column('details', __('Details'));
        $grid->column('payment_method', __('Payment method'))->hide();
        $grid->column('payment_destination', __('Payment destination'))->hide();
        $grid->column('transaction_number', __('Transaction number'))->hide();
        $grid->column('account_number', __('Account number'))->hide();

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
        $show = new Show(TenantPayment::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));
        $show->field('renting_id', __('Renting id'));
        $show->field('tenant_id', __('Tenant id'));
        $show->field('amount', __('Amount'));
        $show->field('balance', __('Balance'));
        $show->field('details', __('Details'));
        $show->field('payment_method', __('Payment method'));
        $show->field('payment_destination', __('Payment destination'));
        $show->field('transaction_number', __('Transaction number'));
        $show->field('account_number', __('Account number'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new TenantPayment());

        $invoices = [];
        foreach (Renting::where([])->orderBy('id', 'desc')->get() as $key => $v) {
            if ($v->balance > 0) {
                continue;
            }
            $invoices[$v->id] = "#" . $v->id . " - ROOM: " . $v->room->name . ", Tenant: " . $v->tenant->name . " , Balance: UGX " . number_format($v->balance);
        }
        $form->select('renting_id', __('Renting - Invoice'))
            ->options($invoices)
            ->rules('required')
            ->required();

        /* 
        $form->number('tenant_id', __('Tenant id')); 
        $form->number('balance', __('Balance'))->rules('required')->required();         
                $form->textarea('details', __('Details')); 
        */
        $form->decimal('amount', __('Amount Paid'))->rules('required')->required();


        $form->radio('payment_method', __('Payment method'))
            ->options([
                'Cash' => 'Cash',
                'Bank' => 'Bank',
                'Mobile Money' => 'Mobile Money',
            ])
            ->when(['Mobile Money'], function ($form) {
                $form->text('account_number', __('Phone number'));
                $form->text('transaction_number', __('Transaction ID'));
            })
            ->when(['Bank'], function ($form) {
                $form->text('account_number', __('Bank Account number'));
                $form->text('transaction_number', __('Transaction ID'));
            })
            ->when(['Cash'], function ($form) {
                $form->text('payment_destination', __('Cash received by'));
            })
            ->rules('required')->required();



        return $form;
    }
}
