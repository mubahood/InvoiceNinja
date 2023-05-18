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

        $grid->batchActions(function ($batch) {
            $batch->disabledelete();
            $batch->add(new BatchCopy()); 
        });

        $grid->quickSearch('name')->placeholder('Search by name....');
        $grid->model()->orderBy('id', 'desc');
        $grid->disableBatchActions();
        $grid->column('id', __('No.'))->sortable();

        $grid->column('image', __('Photo'))
            ->lightbox(['width' => 60, 'height' => 60])
            ->sortable();



        $grid->column('name', __('House Name'))->sortable();
        $grid->column('landload_id', __('Landload'))->display(function ($x) {
            $loc = Landload::find($x);
            if ($loc != null) {
                return $loc->name;
            }
            return $x;
        })->sortable();
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
        $grid->column('address', __('Address'));
        
        $grid->column('status', __('Status'));
        $grid->column('is_active', __('Is active'));
        $grid->column('number_of_rooms', __('Number of rooms'));
        $grid->column('room_size', __('Room size'));
        $grid->column('bed_rooms', __('Bed rooms'));
        $grid->column('sitting_rooms', __('Sitting rooms'));
        $grid->column('dining_rooms', __('Dining rooms'));
        $grid->column('indoor_toilets', __('Indoor toilets'));
        $grid->column('price', __('Price'));
        $grid->column('landload_price', __('Landload price'));
        $grid->column('image', __('Image'));
        $grid->column('images', __('Images'));
        $grid->column('furnishings', __('Furnishings'));
        $grid->column('utilities', __('Utilities'));
        $grid->column('internet_access', __('Internet access'));
        $grid->column('security', __('Security'));
        $grid->column('amenities', __('Amenities'));
        $grid->column('remarks', __('Remarks'));

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
        $show->field('landload_price', __('Landload price'));
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
        $form->decimal('landload_price', __('Landload price'))
            ->help('Without commission')
            ->rules('required');
        $form->decimal('price', __('Price'))
            ->help('With commission')
            ->rules('required');


        $form->divider('Room State');
        $form->radio('is_active', __('State'))->options([
            'Pending' => 'Pending',
            'Construction' => 'Construction',
            'Repair' => 'Under Repair',
            'Ready' => 'Ready',
        ])->rules('required');

        $form->radio('status', __('State'))->options([
            'Occupied' => 'Occupied',
            'Vacant' => 'Vacant',
        ])->rules('required');
 
        return $form;
    }
}
