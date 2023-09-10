<?php

namespace App\Admin\Controllers;

use App\Models\Landload;
use App\Models\LandloadPayment;
use App\Models\Renting;
use App\Models\Utils;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class LandloadPaymentController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Landlord Payments';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new LandloadPayment());

        $grid->filter(function ($filter) {
            // Remove the default id filter
            $filter->disableIdFilter();
            $filter->equal('landload_id', 'Filter by landlord')
                ->select(
                    Landload::where([])->orderBy('name', 'Asc')->get()->pluck('name', 'id')
                );
            $filter->between('created_at', 'Filter by Date Created')->date();
            $filter->group('balance', function ($group) {
                $group->gt('greater than');
                $group->lt('less than');
                $group->equal('equal to');
            });
        });



        $grid->model()->orderBy('id', 'desc');
        $grid->disableBatchActions();
        $grid->column('id', __('ID'))->sortable();
        $grid->column('created_at', __('Date'))->display(function ($x) {
            return Utils::my_date_time($x);
        })->sortable();
        $grid->column('renting_id', __('Renting'))->hide();
        $grid->column('landload_id', __('Landload'));
        $grid->column('amount', __('Amount (UGX)'))->display(function ($x) {
            return number_format($x);
        })->totalRow(function ($x) {
            return  number_format($x); 
        })->sortable();
        $grid->column('amount_payable_to_landload', __('Amount Payable To Landload'));
        $grid->column('amount_payable_to_company', __('Amount Payable To Company'));

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
        $show = new Show(LandloadPayment::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));
        $show->field('renting_id', __('Renting id'));
        $show->field('landload_id', __('Landload id'));
        $show->field('amount', __('Amount'));
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
        $form = new Form(new LandloadPayment());

        /*       $invoices = [];
        foreach (Renting::where([])->orderBy('id', 'desc')->get() as $key => $v) {
            if ($v->balance > 0) {
                continue;
            }
            $invoices[$v->id] = "#" . $v->id . " - ROOM: " . $v->room->name . ", Tenant: " . $v->tenant->name . " , Balance: UGX " . number_format($v->balance);
        }
        $form->select('renting_id', __('Renting - Invoice'))
            ->options($invoices)
            ->rules('required')
            ->required(); */

        $landlords = [];
        foreach (Landload::where([])->orderBy('name', 'asc')->get() as $key => $val) {
            if ($val->balance < 1) {
                //continue;
            }
            $landlords[$val->id] = $val->name . ", Balance: UGX " . number_format($val->balance);
        }

        $form->select('landload_id', __('Landlord'))
            ->options($landlords)
            ->rules('required');

        $form->decimal('amount', __('Amount'))->rules('required');
        $form->textarea('details', __('Details'))->rules('required');

        return $form;
    }
}
