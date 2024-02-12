<?php

namespace App\Admin\Controllers;

use App\Admin\Actions\Post\BatchCopy;
use App\Models\House;
use App\Models\Landload;
use App\Models\Location;
use App\Models\Room;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Facades\Admin;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class RoomController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Rooms';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Room());

        $grid->filter(function ($filter) {
            // Remove the default id filter
            $filter->disableIdFilter();



            $filter->equal('house_id', 'Filter by Estate')
                ->select(
                    House::where([])->orderBy('name', 'Asc')->get()->pluck('name_text', 'id')
                );
            $filter->equal('landload_id', 'Filter by Landlord')
                ->select(
                    Landload::where([])->orderBy('name', 'asc')->get()->pluck('name', 'id')
                );

            $filter->equal('status', 'Availability')
                ->select([
                    'Vacant' => 'Vacant',
                    'Occupied' => 'Occupied',
                ]);
            $filter->equal('state', 'Room State')
                ->select([
                    'Pending' => 'Pending',
                    'Construction' => 'Construction',
                    'Repair' => 'Under Repair',
                    'Ready' => 'Ready',
                ]);

            $filter->group('number_of_rooms', function ($group) {
                $group->gt('greater than');
                $group->lt('less than');
                $group->equal('equal to');
            });

            $filter->equal('region_id', 'Filter by Region')
                ->select(
                    Location::get_districts_array()
                );
            $filter->equal('area_id', 'Filter by Area')
                ->select(
                    Location::get_sub_counties_array()
                );
            $filter->group('price', function ($group) {
                $group->gt('greater than');
                $group->lt('less than');
                $group->equal('equal to');
            });
        });


        $grid->batchActions(function ($batch) {
            $batch->disabledelete();
            $batch->add(new BatchCopy());
        });

        $grid->quickSearch('name')->placeholder('Search by name....');
        $grid->model()->orderBy('id', 'desc');
        $grid->column('id', __('No.'))->sortable();

        $grid->column('image', __('Photo'))
            ->lightbox(['width' => 60, 'height' => 60])
            ->sortable();

        $grid->column('name', __('Room Number'))
            ->editable()
            ->sortable();
        $grid->column('house_id', __('Estate'))
            ->display(function ($x) {
                return $this->house->name;
            })
            ->sortable();
        $grid->column('landload_id', __('Landload'))->display(function ($x) {
            $loc = Landload::find($x);
            if ($loc != null) {
                return $loc->name;
            }
            return $x;
        })
            ->sortable();
        $grid->column('region_id', __('Region'))->display(function ($x) {
            $loc = Location::find($x);
            if ($loc != null) {
                return $loc->name_text;
            }
            return $x;
        })->hide();
        $grid->column('area_id', __('Area'))->display(function ($x) {
            $loc = Location::find($x);
            if ($loc != null) {
                return $loc->name_text;
            }
            return $x;
        })->sortable();
        $grid->column('number_of_rooms', __('No. of rooms'))
            ->sortable();
        $grid->column('address', __('Address'))->hide();

        $grid->column('state', __('Room State'))->dot([
            'Pending' => 'danger',
            'Construction' => 'danger',
            'Repair' => 'danger',
            'Ready' => 'success',
        ])->sortable();

        $grid->column('status', __('Availability'))->label([
            'Vacant' => 'success',
            'Occupied' => 'danger',
        ])->sortable();

        $grid->column('room_size', __('Room size'))->hide();
        $grid->column('bed_rooms', __('Bed rooms'))->hide();
        $grid->column('sitting_rooms', __('Sitting rooms'))->hide();
        $grid->column('dining_rooms', __('Dining rooms'))->hide();
        $grid->column('indoor_toilets', __('Indoor toilets'))->hide();
        $grid->column('price', __('Price (UGX)'))
            ->display(function ($x) {
                return '<b>' . number_format($x) . '</b>';
            })
            ->sortable();

        $grid->column('furnishings', __('Furnishings'))->label()->hide();
        $grid->column('utilities', __('Utilities'))->label()->hide();
        $grid->column('internet_access', __('Internet access'))->label()->hide();
        $grid->column('security', __('Security'))->label()->hide();
        $grid->column('amenities', __('Amenities'))->label()->hide();
        $grid->column('commission_type', __('Commission'))
            ->display(function ($x) {
                if ($x == 1) {
                    return '<span class=" ">UGX ' . $this->flate_rate_amount . ' - Flat</span>';
                } else {
                    return '<span class=" ">' . $this->percentage_rate . '%</span>';
                }
            })
            ->sortable();
        $grid->column('rentings', __('Invoices (UGX)'))
            ->display(function ($x) {
                $x = $this->rentings->sum('payable_amount');
                $x = number_format($x);
                return '<a target="_blank" title="View These Invoices" class="d-block text-left  text-primary" style="font-size: 16px; text-align: center;" href="' . admin_url('rentings?room_id=' . $this->id) . '" ><b>' . $x . '</b></a>';
            });
        $grid->column('remarks', __('Remarks'))->sortable()->hide()->editable();

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
        $show = new Show(Room::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));
        $show->field('landload_id', __('Landload id'));
        $show->field('region_id', __('Region id'));
        $show->field('area_id', __('Area id'));
        $show->field('name', __('Name'));
        $show->field('status', __('Status'));
        $show->field('is_active', __('Is active'));
        $show->field('number_of_rooms', __('Number of rooms'));
        $show->field('room_size', __('Room size'));
        $show->field('bed_rooms', __('Bed rooms'));
        $show->field('sitting_rooms', __('Sitting rooms'));
        $show->field('dining_rooms', __('Dining rooms'));
        $show->field('indoor_toilets', __('Indoor toilets'));
        $show->field('price', __('Price'));
        $show->field('image', __('Image'));
        $show->field('images', __('Images'));
        $show->field('furnishings', __('Furnishings'));
        $show->field('utilities', __('Utilities'));
        $show->field('internet_access', __('Internet access'));
        $show->field('security', __('Security'));
        $show->field('amenities', __('Amenities'));
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
        $form = new Form(new Room());

        $form->divider('Room Information');

        $form->select('house_id', __('Select house'))
            ->options(House::get_houses())
            ->rules('required');
        $form->text('name', __('Room Number'))->rules('required');
        $form->decimal('bed_rooms', __('Number of Bed rooms'))->rules('required');
        $form->decimal('sitting_rooms', __('Number of Sitting rooms'))->rules('required');
        $form->decimal('dining_rooms', __('Number of Dining rooms'))->rules('required');
        $form->decimal('indoor_toilets', __('Number of Indoor toilets'))->rules('required');

        $form->text('room_size', __('Room size(s)'))->rules('required');


        $form->checkboxCard('furnishings', __('Furnishings'))->options([
            'Furnished' => 'Furnished',
            'Bed' => 'Bed',
            'Wardrobe' => 'Wardrobe',
            'Desk' => 'Desk',
            'Chair' => 'Chair',
            'Dresser' => 'Dresser'
        ]);

        $form->checkboxCard('utilities', __('Utilities'))->options([
            'Electricity' => 'Electricity',
            'Water' => 'Water',
            'Heating' => 'Heating',
            'Cooling systems' => 'Cooling systems',
        ]);

        $form->checkboxCard('internet_access', __('Internet access'))->options([
            'Free WiFI' => 'Free WiFI',
            'Cabel internet' => 'Cabel internet',
        ]);


        $form->checkboxCard('security', __('Security'))->options([
            'Fence' => 'Fence',
            'CCTV Cemaras' => 'CCTV Cemaras',
            'Security officer' => 'Security officer',
        ]);

        $form->checkboxCard('amenities', __('Amenities'))->options([
            'Parking' => 'Parking',
            'Laundry facility' => 'Laundry facility',
            'Gym' => 'Gym',
            'Swimming pool' => 'Swimming pool',
            'Garden' => 'Garden',
        ]);

        $form->image('image', __('Room Main Photo'));
        $form->multipleImage('images', __('Other Images'));


        $form->decimal('number_of_rooms', __('Total number of rooms'))->rules('required');

        $form->divider('Room Pricing');

        $form->decimal('price', __('Room Total Price'))
            ->rules('required');
        $form->radio('commission_type', 'Commission type')
            ->options([
                '1' => 'Flat Rate',
                '2' => 'Percentage',
            ])->required()

            ->when('1', function (Form $form) {
                $form->text('flate_rate_amount', 'Amount');
            })

            ->when('2', function (Form $form) {
                $form->text('percentage_rate', 'Percentage Rate');
            });

        $form->divider('Room State');
        $form->radio('state', __('Room State'))->options([
            'Pending' => 'Pending',
            'Construction' => 'Construction',
            'Repair' => 'Under Repair',
            'Ready' => 'Ready',
        ])->rules('required');

        $form->radio('status', __('Room Availabity'))->options([
            'Occupied' => 'Occupied',
            'Vacant' => 'Vacant',
        ])->rules('required');
        $form->radio('is_active', __('Room Is Active'))->options([
            'Yes' => 'Yes',
            'No' => 'No',
        ])
            ->default('Yes')
            ->rules('required');

        return $form;
    }
}
