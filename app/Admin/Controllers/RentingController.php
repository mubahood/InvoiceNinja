<?php

namespace App\Admin\Controllers;

use App\Models\Landload;
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

        $grid->filter(function ($filter) {
            // Remove the default id filter
            $filter->disableIdFilter();
            $filter->equal('landload_id', 'Filter by landlord')
                ->select(
                    Landload::where([])->orderBy('name', 'Asc')->get()->pluck('name', 'id')
                );
            $filter->equal('tenant_id', 'Filter By Tenant')
                ->select(
                    Tenant::get_items()
                );

            $filter->equal('room_id', 'Filter by room')
                ->select(
                    Room::get_all_rooms()
                );
            $filter->between('created_at', 'Filter by Date Created')->date();
            $filter->between('start_date', 'Filter by Start Date')->date();
            $filter->between('end_date', 'Filter by End Date')->date();
            $filter->group('balance', function ($group) {
                $group->gt('greater than');
                $group->lt('less than');
                $group->equal('equal to');
            });
        });


        $grid->model()->orderBy('id', 'desc');
        $grid->disableBatchActions();
        $grid->column('id', __('ID'))->sortable();
        $grid->column('created_at', __('Created'))->display(function ($x) {
            return Utils::my_date_4($x);
        })->sortable();

        $grid->column('house_id', __('House'))
            ->display(function ($x) {
                return $this->house->name;
            })
            ->hide()
            ->sortable();
        $grid->column('room_id', __('Room'))
            ->display(function ($x) {
                return $this->name_text;
            })->sortable();
        $grid->column('tenant_id', __('Tenant'))
            ->display(function ($x) {
                return $this->tenant->name;
            })->sortable();
        $grid->column('start_date', __('Start date'))->sortable();
        $grid->column('end_date', __('End date'))
            ->display(function ($x) {
                return Utils::my_date_4($x);
            })->sortable();
        $grid->column('is_overstay', __('Overstay'))
            ->filter(['Yes' => 'Overstayed', 'No' => 'Within time'])
            ->dot([
                'Yes' => 'danger',
                'No' => 'success'
            ])
            ->sortable();
        $grid->column('number_of_months', __('Months'))
            ->hide()
            ->sortable();
        $grid->column('payable_amount', __('Payable amount (UGX)'))
            ->display(function ($x) {
                return number_format($x);
            })
            ->totalRow(function ($x) {
                return  number_format($x);
            })->sortable();

        $grid->column('receipts', __('Receipts (UGX)'))
            ->display(function ($x) {
                $x = $this->payments->sum('amount');
                $x = number_format($x);
                return '<a target="_blank" title="View These Receipts" class="d-block text-left  text-primary" style="font-size: 16px; text-align: center;" href="' . admin_url('tenant-payments?renting_id=' . $this->id) . '" ><b>' . $x . '</b></a>';
            });


        $grid->column('balance', __('Balance (UGX)'))
            ->display(function ($x) {
                return number_format($x);
            })->totalRow(function ($x) {
                return  number_format($x);
            })->sortable();
        $grid->column('landlord_amount', __('Landlord'))
            ->display(function ($x) {
                return number_format($x);
            })->totalRow(function ($x) {
                return  number_format($x);
            })->sortable();
        $grid->column('commision_amount', __('Commision'))
            ->display(function ($x) {
                return number_format($x);
            })->totalRow(function ($x) {
                return  number_format($x);
            })->sortable();

        $grid->column('commision_type', __('Commision Calculation'))
            ->display(function ($x) {
                if ($x == 'Percentage') {
                    return $this->commision_type_value . "%";
                } else {
                    return   "UGX " . number_format($this->commision_type_value);
                }
            })->sortable();

        $grid->column('landload_id', __('Landlord'))->display(function ($x) {
            $loc = Landload::find($x);
            if ($loc != null) {
                return $loc->name;
            }
            return $x;
        })->sortable();

        $grid->column('invoice_status', __('STATUS'))
            ->filter(['Active' => 'Active', 'Not Active' => 'Not Active'])
            ->label([
                'Not Active' => 'danger',
                'Active' => 'success'
            ])->sortable();
        $grid->column('is_in_house', __('In House'))->hide();
        $grid->column('remarks', __('Remarks'))->editable();
        /* 

fully_paid		
commision_type	
commision_type_value		
update_billing	
	
	
invoice_as_been_billed
*/
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

        /*     $r = Renting::find(199);
        $r->remarks .= " - " . $r->id;
        $r->invoice_status .= "Active";
        $r->save();
        die("done");  */

        if ($form->isCreating()) {
            $form->select('room_id', __('Room'))->options(Room::get_ready_rooms())
                ->rules('required')
                ->required();
            $form->select('tenant_id', __('Tenant'))->options(Tenant::get_items())
                ->rules('required')
                ->required();
        } else {

            $form->select('room_id', __('Room'))->options(function ($x) {
                $r = Room::where('id', $x)->first();
                return [
                    $r->id => $r->name
                ];
            })->readOnly();
            $form->select('tenant_id', __('Tenant'))->options(Tenant::get_items())
                ->options(function ($x) {
                    $r = Tenant::where('id', $x)->first();
                    return [
                        $r->id => $r->name
                    ];
                })->readOnly();
        }
        $form->date('start_date', __('Start date'))->rules('required')
            ->required();
        $form->decimal('number_of_months', __('Number of months'))
            ->rules('required')
            ->required();
        $form->hidden('discount', 'discount')->default(0);
        $form->text('remarks', __('Remarks'));
        if (!$form->isCreating()) {
            $form->divider();
            $form->radio('update_billing', __('Update billing'))
                ->options(['Yes' => 'Yes', 'No' => 'No'])
                ->rules('required')
                ->default('No');
        }
        $form->radio('invoice_status', __('Invoice_status'))
            ->options([
                'Active' => 'Active',
                'Not Active' => 'Not Active',
            ])
            ->rules('required')
            ->default('Active');

        /*
         
        
        */

        return $form;
    }
}
