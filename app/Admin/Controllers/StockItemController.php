<?php

namespace App\Admin\Controllers;

use App\Admin\Actions\Post\ActionToBondedStore;
use App\Admin\Actions\Post\ActionToQuarantineInStore;
use App\Admin\Actions\Post\ActionToQuarantineOutStore;
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

class StockItemController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Stock Items';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new StockItem());
        $grid->disableCreateButton();
        $grid->batchActions(function ($batch) {
            $batch->disabledelete();
            $batch->add(new BatchCopy());
            $batch->add(new ActionToQuarantineInStore());
            $batch->add(new ActionToBondedStore());
            $batch->add(new ActionToQuarantineOutStore());
        });
        $grid->actions(function ($actions) {
            $actions->disabledelete();
        });
        $grid->column('photo', __('Photo'))
            ->lightbox(['width' => 60, 'height' => 60])
            ->sortable();

        $grid->model()->orderBy('id', 'desc');
        $grid->disableBatchActions();

        $grid->quickSearch('name')->placeholder('Search...');
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
        $grid->column('shelve_id', __('Shelf'))
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
                'Issued Out' => 'danger',
            ])
            ->sortable();

        $grid->column('description', __('Description'))->hide();

        $grid->column('expiry_warning_date', __('Expiring'))->display(function ($x) {
            if ($this->isExpired()) {
                return '<span class="badge bg-danger">Expired</span>';
            } else if ($this->isExpiring()) {
                return '<span class="badge bg-warning text-dark">Expiring</span>';
            }
            return '<span class="badge bg-success">Valid</span>';
        })->sortable();
        $grid->column('expiry_date', __('Expiry date'))->display(function ($x) {
            return Utils::my_date($x);
        })->sortable();
        $grid->column('expiry_warning_days', __('Expiry warning days'))->hide();
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
            return Utils::my_date($x);
        })->sortable();
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
        $form->divider('ITEM INFORMATION');

        $form->image('photo', 'Item photo');
        $form->select('stock_sub_category_id', __('Item type/Category'))
            ->options(StockSubCategory::getItems())
            ->rules('required');
        $form->text('name', __('Part number'))->rules('required');
        $form->text('serial_no', __('Serial no'));
        $form->text('description', __('Description'))->rules('required');
        $form->decimal('price', __('Price in USD'))->rules('required');
        $form->decimal('price_2', __('Price in UGX'));

        $form->radioCard('monitor_expiry', __('Monitor expiry'))
            ->options([
                'Yes' => 'Yes',
                'No' => 'No',
            ])
            ->when('in', ['Yes'], function ($form) {

                $form->date('expiry_date', __('Expiry date'))
                    ->rules('required');
                $form->decimal('expiry_warning_days', __('Days before Expiry Warning'))->rules('required');
            })
            ->rules('required');
        /* 
ALTER TABLE `stock_items` ADD `` VARCHAR(100) NULL DEFAULT 'No' AFTER `photo`, ADD `expiry_warning_date` VARCHAR(355) NULL DEFAULT NULL AFTER `monitor_expiry`;
            
            */


        $form->radioCard('monitor_position', __('Monitor position chancging'))
            ->options([
                'Yes' => 'Yes',
                'No' => 'No',
            ])
            ->when('in', ['Yes'], function ($form) {
                $form->decimal('monitor_position_cycle', __('Position chancging cycle (In days)'))->rules('required');
                $form->date('monitor_position_date', __('Last change date'))->rules('required');
            })
            ->rules('required');


        $form->divider('STORAGE');


        $form->radioCard('is_inspected', __('Has this item been inspected'))
            ->options([
                'Inspected' => 'Yes',
                'Not Inspected' => 'No',
            ])
            ->when('in', ['Not Inspected'], function ($form) {
                $form->radioCard('stage', __('Stage'))
                    ->options([
                        'Quarantine In' => 'Quarantine in',
                        'Quarantine Out' => 'Quarantine Out',
                    ])
                    ->when('Quarantine In', function ($form) {
                        $form->select('store_id', __('Select store'))
                            ->options(Store::where([
                                'store_type' => 'Quarantine In'
                            ])->get()->pluck('name', 'id'))
                            ->load('store_section_id', url('api/ajax?model=StoreSection&search_by_1=name'))
                            ->rules('required');

                        $form->select('store_section_id', __('Select Store section'))
                            ->options(function ($x) {
                                return StoreSection::where(['id' => $x])->get()->pluck('name', 'id');
                            })
                            ->load('shelve_id', url('api/ajax?model=Shelve&search_by_1=name'));

                        $form->select('shelve_id', __('Select Shelf'))
                            ->options(function ($x) {
                                return Shelve::where(['id' => $x])->get()->pluck('name', 'id');
                            });
                        return $form;
                    })

                    ->when('Quarantine Out', function ($form) {

                        $form->select('store_id', __('Select store'))
                            ->options(Store::where([
                                'store_type' => 'Quarantine Out'
                            ])->get()->pluck('name', 'id'))
                            ->load('store_section_id', url('api/ajax?model=StoreSection&search_by_1=name'))
                            ->rules('required');

                        $form->select('store_section_id', __('Select Store section'))
                            ->options(function ($x) {
                                return StoreSection::where(['id' => $x])->get()->pluck('name', 'id');
                            })
                            ->load('shelve_id', url('api/ajax?model=Shelve&search_by_1=name'));

                        $form->select('shelve_id', __('Select Shelf'))
                            ->options(function ($x) {
                                return Shelve::where(['id' => $x])->get()->pluck('name', 'id');
                            });
                        return $form;
                    });
            })
            ->when('in', ['Inspected'], function ($form) {



                $form->text('inspected_by', __('Inspected by'));
                $form->text('inspection_remarks', __('Inspection remarks'));
                $form->radioCard('inspection_results', __('Inspection results'))
                    ->options([
                        'Success' => 'Success',
                        'Failed' => 'Failed',
                    ])
                    ->when('in', ['Failed'], function ($form) {
                        $form->radioCard('stage', __('Stage'))
                            ->options([
                                'Quarantine In' => 'Quarantine in',
                                'Quarantine Out' => 'Quarantine out',
                            ])
                            ->when('in', ['Quarantine In'], function ($form) {
                                $form->select('store_id', __('Select store'))
                                    ->options(Store::where([
                                        'store_type' => 'Quarantine In'
                                    ])->get()->pluck('name', 'id'))
                                    ->load('store_section_id', url('api/ajax?model=StoreSection&search_by_1=name'));

                                $form->select('store_section_id', __('Select Store section'))
                                    ->options(function ($x) {
                                        return StoreSection::where(['id' => $x])->get()->pluck('name', 'id');
                                    })
                                    ->load('shelve_id', url('api/ajax?model=Shelve&search_by_1=name'));

                                $form->select('shelve_id', __('Select Shelf'))
                                    ->options(function ($x) {
                                        $s =  Shelve::find($x);
                                        if ($s == null) {
                                            return [];
                                        }
                                        return [
                                            $x => $s->name
                                        ];
                                    });
                                return $form;
                            })

                            ->when('in', ['Quarantine Out'], function ($form) {

                                $form->select('store_id', __('Select store'))
                                    ->options(Store::where([
                                        'store_type' => 'Quarantine Out'
                                    ])->get()->pluck('name', 'id'))
                                    ->load('store_section_id', url('api/ajax?model=StoreSection&search_by_1=name'))
                                    ->rules('required');

                                $form->select('store_section_id', __('Select Store section'))
                                    ->options(function ($x) {
                                        return StoreSection::where(['id' => $x])->get()->pluck('name', 'id');
                                    })
                                    ->load('shelve_id', url('api/ajax?model=Shelve&search_by_1=name'))
                                    ->rules('required');

                                $form->select('shelve_id', __('Select Shelf'))
                                    ->options(function ($x) {
                                        return Shelve::where(['id' => $x])->get()->pluck('name', 'id');
                                    });
                                return $form;
                            })
                            ->rules('required');
                    })
                    ->when('in', ['Success'], function ($form) {
                        $form->radioCard('stage', __('Stage'))
                            ->options([
                                'Bonded' => 'Bonded',
                            ])
                            ->when('Bonded', function ($form) {
                                $form->select('store_id', __('Select store'))
                                    ->options(Store::where([
                                        'store_type' => 'Bonded'
                                    ])->get()->pluck('name', 'id'))
                                    ->load('store_section_id', url('api/ajax?model=StoreSection&search_by_1=name'))
                                    ->rules('required');

                                $form->select('store_section_id', __('Select Store section'))
                                    ->options(function ($x) {
                                        return StoreSection::where(['id' => $x])->get()->pluck('name', 'id');
                                    })
                                    ->load('shelve_id', url('api/ajax?model=Shelve&search_by_1=name'))
                                    ->rules('required');

                                $form->select('shelve_id', __('Select Shelf'))
                                    ->options(function ($x) {
                                        return Store::where(['id' => $x])->get()->pluck('name', 'id');
                                    });
                            })
                            ->when('in', ['Quarantine In', 'Quarantine Out'], function ($form) {

                                return $form;
                            });
                    })->rules('required');
            })
            ->rules('required');
























        /*         $form->text('instalation_by', __('Instalation by'));
        $form->decimal('aircraft_hours', __('Aircraft hours'));
        $form->decimal('hours_run', __('Hours run'));
        $form->text('remarks', __('Remarks'));
        $form->text('instalation_aircraft_no', __('Instalation aircraft no'));
        $form->date('instalation_position', __('Instalation position'));
        $form->date('instalation_aircraft_engine_hours', __('Instalation aircraft engine hours'));
        $form->date('instalation_s_n', __('Instalation s n'));
        $form->date('instalation_job_no', __('Instalation job no'));
        $form->date('instalation_auth_lc_no', __('Instalation auth lc no'));
        $form->date('instalation_date', __('Instalation date'));



        $form->text('monitor_position_changed_by', __('Monitor position changed by'));
        $form->text('removed_from_aircraft', __('Removed from aircraft'));
        $form->text('removal_description', __('Removal description'));
        $form->text('removal_station', __('Removal station'));
        $form->text('removal_job_no', __('Removal job no'));
        $form->text('removal_by', __('Removal by'));
        $form->text('red_rescription', __('Red rescription')); */

        return $form;
    }
}
