<?php

namespace App\Admin\Controllers;

use App\Admin\Actions\Post\ActionIssueOut;
use App\Admin\Actions\Post\ActionToQuarantineInStore;
use App\Admin\Actions\Post\BatchCopy;
use App\Models\Shelve;
use App\Models\StockItem;
use App\Models\StockSubCategory;
use App\Models\Store;
use App\Models\StoreSection;
use App\Models\Utils;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class QuarantineOutStoreController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Quarantine Out Store';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new StockItem());

        $grid->batchActions(function ($batch) {
            $batch->disabledelete();
            $batch->add(new BatchCopy());
        });


        $grid->model()
            ->where([
                'stage' => 'Quarantine Out'
            ])
            ->orderBy('id', 'desc');
        $grid->disableBatchActions();

        $grid->quickSearch('name')->placeholder('Search...');

        $grid->column('photo', __('Photo'))
        ->lightbox(['width' => 60, 'height' => 60])
        ->sortable();

        
        $grid->column('name', __('Part number'))->sortable();
        $grid->column('serial_no', __('Serial no'));


        $grid->column('stock_category_id', __('Category'))
            ->display(function ($x) {
                if ($this->cat != null) {
                    return $this->cat->name;
                }
                return $x;
            })->hide();

        $grid->column('stock_sub_category_id', __('Category'))
            ->display(function ($x) {
                if ($this->sub_cat != null) {
                    return $this->sub_cat->name_text;
                }
                return $x;
            })->sortable();
        $grid->column('store_id', __('Store'))
            ->display(function ($x) {
                if ($this->store != null) {
                    return $this->store->name;
                }
                return $x;
            })->sortable();
        $grid->column('store_section_id', __('Store section'))
            ->display(function ($x) {
                if ($this->store_section != null) {
                    return $this->store_section->name;
                }
                return $x;
            })->sortable();
        $grid->column('shelve_id', __('Shelve'))
            ->display(function ($x) {
                if ($this->shelve != null) {
                    return $this->shelve->name;
                }
                return '-';
            })->sortable();
 
        $grid->column('stage', __('Stage'))
            ->dot([
                'Quarantine In' => 'warning',
                'Bonded' => 'success',
                'Quarantine Out' => 'danger',
            ])
            ->sortable();

        $grid->column('description', __('Description'))->hide();

        $grid->column('expiry_date', __('Expiry date'));
        $grid->column('card_no', __('Green Card'))->hide();
        $grid->column('inspected_by', __('Inspected by'))->hide();
        $grid->column('aircraft_hours', __('Air Craft Hours'))->hide();

        /* 

 
        $grid->column('', __('Aircraft hours'));
        $grid->column('hours_run', __('Hours run'));
        $grid->column('remarks', __('Remarks'));
        $grid->column('instalation_aircraft_no', __('Instalation aircraft no'));
        $grid->column('instalation_position', __('Instalation position'));
        $grid->column('instalation_aircraft_engine_hours', __('Instalation aircraft engine hours'));
        $grid->column('instalation_s_n', __('Instalation s n'));
        $grid->column('instalation_job_no', __('Instalation job no'));
        $grid->column('instalation_auth_lc_no', __('Instalation auth lc no'));
        $grid->column('instalation_date', __('Instalation date'));
        $grid->column('monitor_position', __('Monitor position'));
        $grid->column('monitor_position_cycle', __('Monitor position cycle'));
        $grid->column('monitor_position_date', __('Monitor position date'));
         $grid->column('monitor_position_changed_by', __('Monitor position changed by'));
        $grid->column('removed_from_aircraft', __('Removed from aircraft'));
        $grid->column('removal_description', __('Removal description'));
        $grid->column('removal_station', __('Removal station'));
        $grid->column('removal_job_no', __('Removal job no'));
        $grid->column('removal_by', __('Removal by'));
        $grid->column('red_rescription', __('Red rescription')); */

        $grid->column('created_at', __('Added'))->display(function ($x) {
            return Utils::my_date_time($x);
        })
            ->hide()
            ->sortable();


        $grid->actions(function ($act) {
            $act->disableDelete();
            $act->add(new ActionToQuarantineInStore());
            $act->add(new ActionIssueOut());
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
        $show = new Show(StockItem::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('created_at', __('Created at'));
        $show->field('stock_category_id', __('Stock category id'));
        $show->field('stock_sub_category_id', __('Stock sub category id'));
        $show->field('store_id', __('Store id'));
        $show->field('store_section_id', __('Store section id'));
        $show->field('shelve_id', __('Shelve id'));
        $show->field('status', __('Status'));
        $show->field('state', __('State'));
        $show->field('stage', __('Stage'));
        $show->field('name', __('Name'));
        $show->field('description', __('Description'));
        $show->field('inspected_by', __('Inspected by'));
        $show->field('expiry_date', __('Expiry date'));
        $show->field('serial_no', __('Serial no'));
        $show->field('card_no', __('Card no'));
        $show->field('instalation_by', __('Instalation by'));
        $show->field('aircraft_hours', __('Aircraft hours'));
        $show->field('hours_run', __('Hours run'));
        $show->field('remarks', __('Remarks'));
        $show->field('instalation_aircraft_no', __('Instalation aircraft no'));
        $show->field('instalation_position', __('Instalation position'));
        $show->field('instalation_aircraft_engine_hours', __('Instalation aircraft engine hours'));
        $show->field('instalation_s_n', __('Instalation s n'));
        $show->field('instalation_job_no', __('Instalation job no'));
        $show->field('instalation_auth_lc_no', __('Instalation auth lc no'));
        $show->field('instalation_date', __('Instalation date'));
        $show->field('monitor_position', __('Monitor position'));
        $show->field('monitor_position_cycle', __('Monitor position cycle'));
        $show->field('monitor_position_date', __('Monitor position date'));
         $show->field('monitor_position_changed_by', __('Monitor position changed by'));
        $show->field('removed_from_aircraft', __('Removed from aircraft'));
        $show->field('removal_description', __('Removal description'));
        $show->field('removal_station', __('Removal station'));
        $show->field('removal_job_no', __('Removal job no'));
        $show->field('removal_by', __('Removal by'));
        $show->field('red_rescription', __('Red rescription'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new StockItem());

        $form->disableCreatingCheck();

        $form->display('name', __('Part number'))->rules('required');
        $form->radioCard('stage', __('Stage'))
            ->options([
                'Quarantine Out' => 'Quarantine Out',
            ])
            ->when('in', ['Quarantine Out'], function ($form) {
                 $form->text('remarks', __('Remarks'))->rules('required');
                $form->decimal('hours_run', __('Hours run'))->rules('required');


                $form->select('store_id', __('Select store'))
                    ->options(Store::where([
                        'store_type' => 'Quarantine Out'
                    ])->get()->pluck('name', 'id'))
                    ->load('store_section_id', url('api/ajax?model=StoreSection&search_by_1=name'))
                    ->rules('required');

                $form->select('store_section_id', __('Select Store section'))
                    ->load('shelve_id', url('api/ajax?model=Shelve&search_by_1=name'))
                    ->options(function ($x) {
                        return StoreSection::where(['id' => $x])->get()->pluck('name', 'id');
                    })
                    ->rules('required');

                $form->select('shelve_id', __('Select Shelve'))
                    ->options(function ($x) {
                        return Shelve::where(['id' => $x])->get()->pluck('name', 'id');
                    })
                    ->rules('required');
                return $form;
            })

            ->required();







        return $form;
    }
}
