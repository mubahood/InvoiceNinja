<?php

namespace App\Admin\Controllers;

use App\Models\Renting;
use App\Models\Room;
use App\Models\Tenant;
use App\Models\Utils;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class RentingController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Renting - Invoinces';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Renting());

        $grid->model()->orderBy('id', 'desc');
        $grid->disableBatchActions();
        $grid->column('id', __('ID'))->sortable();
        $grid->column('created_at', __('Date'))->display(function ($x) {
            return Utils::my_date_time($x);
        })->sortable();

        $grid->column('house_id', __('House'))
            ->display(function ($x) {
                return $this->house->name;
            })->sortable();
        $grid->column('room_id', __('Room'))
            ->display(function ($x) {
                return $this->room->name;
            })->sortable();
        $grid->column('tenant_id', __('Tenant'))
            ->display(function ($x) {
                return $this->tenant->name;
            })->sortable();
        $grid->column('start_date', __('Start date'))->sortable();
        $grid->column('end_date', __('End date'))
            ->display(function ($x) {
                return Utils::my_date($x);
            })->sortable();
        $grid->column('number_of_months', __('Months'))->sortable();
        $grid->column('payable_amount', __('Payable amount (UGX)'))
            ->display(function ($x) {
                return number_format($x);
            })
            ->totalRow(function ($x) {
                return  number_format($x);
            })->sortable();
        $grid->column('balance', __('Balance (UGX)'))
            ->display(function ($x) {
                return number_format($x);
            })->totalRow(function ($x) {
                return  number_format($x);
            })->sortable();
        $grid->column('is_in_house', __('In House'));
        $grid->column('is_overstay', __('Overstay'));
        $grid->column('remarks', __('Remarks'))->editable();

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
        $show = new Show(Renting::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));
        $show->field('house_id', __('House id'));
        $show->field('tenant_id', __('Tenant id'));
        $show->field('start_date', __('Start date'));
        $show->field('end_date', __('End date'));
        $show->field('number_of_months', __('Number of months'));
        $show->field('discount', __('Discount'));
        $show->field('payable_amount', __('Payable amount'));
        $show->field('balance', __('Balance'));
        $show->field('is_in_house', __('Is in house'));
        $show->field('is_overstay', __('Is overstay'));
        $show->field('remarks', __('Remarks'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new Renting());

        /*         $r = Renting::find(1);
        $r->process_bill();
        die("done");    */

        $form->select('room_id', __('Room'))->options(Room::get_ready_rooms())
            ->rules('required')
            ->required();
        $form->select('tenant_id', __('Tenant'))->options(Tenant::get_items())
            ->rules('required')
            ->required();

        $form->date('start_date', __('Start date'))->rules('required')
            ->required();
        if (!$form->isCreating()) {
            $form->date('end_date', __('End date'))->rules('required')
                ->required();
        } else {
            $form->decimal('number_of_months', __('Number of months'))
                ->rules('required')
                ->required();
        }

        $form->hidden('discount','discount')->default(0);
        $form->text('remarks', __('Remarks'));

        return $form;
    }
}
