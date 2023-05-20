<?php

namespace App\Admin\Controllers;

use App\Models\House;
use App\Models\Landload;
use App\Models\Location;
use App\Models\Utils;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class HouseController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Houses';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new House());


        $grid->quickSearch('name')->placeholder('Search by name....');
        $grid->model()->orderBy('id', 'desc');
        $grid->disableBatchActions();
        $grid->column('id', __('No.'))->sortable();

        $grid->column('image', __('Photo'))
            ->lightbox(['width' => 60, 'height' => 60])
            ->sortable();

        $grid->column('name', __('House Name'))->sortable();
        $grid->column('landload_id', __('Landlord'))->display(function ($x) {
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
        $grid->column('rooms', __('Rooms'))
            ->display(function ($x) {
                $x = count($this->rooms);
                return '<a style="font-size: 16px; text-align: center;" href="' . admin_url('rooms?house_id=' . $x) . '" ><b>' . $x . '</b></a>';
            });
        $grid->column('address', __('Address'))->hide();

        $grid->column('attachment', __('Attachment'))->hide();
        $grid->column('details', __('Details'))->hide();
        $grid->column('created_at', __('Registered'))->display(function ($x) {
            return Utils::my_date_time($x);
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
        $show = new Show(House::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));
        $show->field('landload_id', __('Landload id'));
        $show->field('region_id', __('Region id'));
        $show->field('area_id', __('Area id'));
        $show->field('name', __('Name'));
        $show->field('address', __('Address'));
        $show->field('image', __('Image'));
        $show->field('attachment', __('Attachment'));
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
        $form = new Form(new House());

        $form->select('landload_id', __('Landlord'))
            ->options(Landload::where([])->orderBy('name', 'asc')->get()->pluck('name', 'id'))
            ->rules('required');

        $form->select('area_id', __('Select Area'))
            ->options(Location::get_sub_counties_array())
            ->rules('required');

        $form->text('name', __('House/Building Name'))->rules('required');
        $form->text('address', __('Full Address'))->rules('required');
        $form->image('image', __('Image'));
        $form->file('attachment', __('Attachment'));
        $form->quill('details', __('Details'));

        $form->hidden('region_id', __('Region id'))->default(1);
        return $form;
    }
}
