<?php

namespace App\Admin\Controllers;

use App\Models\User;
use App\Models\Utils;
use Carbon\Carbon;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use Illuminate\Support\Str;


class MembersController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Members';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {

        Utils::checkEventRegustration();

        $grid = new Grid(new User());
        $grid->disableExport();
        $grid->disableCreateButton();

        $grid->quickSearch('name')->placeholder('Search by name');

        $grid->disableBatchActions();
        $grid->disableActions();
        $grid->model()->orderBy('id', 'desc');

        $grid->column('avatar', __('Photo'))
            ->display(function ($avatar) {
                $img = url("storage/" . $avatar);
                $link = admin_url('members/' . $this->id);
                return '<a href=' . $link . ' title="View profile"><img class="img-fluid " style="border-radius: 10px;"  src="' . $img . '" ></a>';
            })
            ->width(80)
            ->sortable();
        $grid->column('name', __('Name'))
            ->display(function ($name) {
                $link = admin_url('members/' . $this->id);
                return '<a class="text-dark" href=' . $link . ' title="View profile">' . Str::limit($name, 20) . '</a>';
            })->sortable();
        /* $grid->column('sex', __('Gender'))->filter([
            'Male' => 'Male',
            'Female' => 'Female',
        ]); */
        $grid->column('campus_id', __('Campus'))
            ->display(function () {
                return $this->campus->name;
            })->sortable();
        $grid->column('year', __('Graduated'))
            ->display(function () {
                $programs  = $this->programs;
                if (empty($programs)) {
                    return '-';
                }
                if (!isset($programs[0])) {
                    return "-";
                }
                return $programs[0]->program_year;
            });

        $grid->column('cv', __('Cv'))->display(function ($file) {
            if ($file == null || strlen($file) < 2) {
                return "No CV";
            }
            $link = url("storage/" . $file);
            return '<a href="' . $link . '" target="_blank" ><i class="fa fa-download"></i> Download CV</a>';
        })->sortable();
        $grid->column('address', __('Current Address'))
            ->display(function ($name) {
                return Str::limit($name, 20);
            })->sortable();
        $grid->column('phone_number', __('Phone number'));
        $grid->column('country', __('Country'))->sortable();
        $grid->column('email', __('Email'))
            ->display(function ($mail) {
                return '<a href="mailto:' . $mail . '" title="' . $mail . '"  ><i class="fa fa-envelope"></i> Send email</a>';
            })->sortable();
        $grid->column('whatsapp', __('Whatsapp'))
            ->display(function ($num) {
                if ($num == null || strlen($num) < 2) {
                    return "No number";
                }
                return $num;
            })->sortable();
        $grid->column('created_at', __('Joined'))
            ->display(function ($num) {
                return Utils::my_date($num);
            })->sortable();
        $grid->column('updated_at', __('Last seen'))
            ->display(function ($num) {
                return Carbon::parse($num)->diffForHumans();
            })->sortable();

        $grid->column('actions', __('Action'))
            ->display(function () {
                $link = admin_url('members/' . $this->id);
                $links = '<a  href="' . $link .'" title="View profile"><i class="fa fa-eye"> View profile</a>';
                $links .= '<br><a  href="mailto:' . $this->email.'" title="Send email"><i class="fa fa-envelope"> Send email</a>';
                $links .= '<br><a  href="mailto:' . $this->email.'" title="Call"><i class="fa fa-phone"> Call '.$this->first_name.'</a>';

                return $links;
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


        $s = User::findOrFail($id);
        $back_link = admin_url('members');
        if (isset($_SERVER['HTTP_REFERER'])) {
            if ($_SERVER['HTTP_REFERER'] != null) {
                if (strlen($_SERVER['HTTP_REFERER']) > 10) {
                    $back_link  = $_SERVER['HTTP_REFERER'];
                }
            }
        }
        return view('admin.user-prifile', [
            'p' => $s,
            'back_link' => $back_link
        ]);

        $show = new Show(User::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('username', __('Username'));
        $show->field('password', __('Password'));
        $show->field('first_name', __('First name'));
        $show->field('last_name', __('Last name'));
        $show->field('reg_date', __('Reg date'));
        $show->field('last_seen', __('Last seen'));
        $show->field('email', __('Email'));
        $show->field('approved', __('Approved'));
        $show->field('profile_photo', __('Profile photo'));
        $show->field('user_type', __('User type'));
        $show->field('sex', __('Sex'));
        $show->field('reg_number', __('Reg number'));
        $show->field('country', __('Country'));
        $show->field('occupation', __('Occupation'));
        $show->field('profile_photo_large', __('Profile photo large'));
        $show->field('phone_number', __('Phone number'));
        $show->field('location_lat', __('Location lat'));
        $show->field('location_long', __('Location long'));
        $show->field('facebook', __('Facebook'));
        $show->field('twitter', __('Twitter'));
        $show->field('whatsapp', __('Whatsapp'));
        $show->field('linkedin', __('Linkedin'));
        $show->field('website', __('Website'));
        $show->field('other_link', __('Other link'));
        $show->field('cv', __('Cv'));
        $show->field('language', __('Language'));
        $show->field('about', __('About'));
        $show->field('address', __('Address'));
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));
        $show->field('remember_token', __('Remember token'));
        $show->field('avatar', __('Avatar'));
        $show->field('name', __('Name'));
        $show->field('campus_id', __('Campus id'));
        $show->field('complete_profile', __('Complete profile'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new User());

        $form->text('username', __('Username'));
        $form->textarea('password', __('Password'));
        $form->text('first_name', __('First name'));
        $form->text('last_name', __('Last name'));
        $form->text('reg_date', __('Reg date'));
        $form->text('last_seen', __('Last seen'));
        $form->email('email', __('Email'));
        $form->switch('approved', __('Approved'));
        $form->text('profile_photo', __('Profile photo'));
        $form->text('user_type', __('User type'));
        $form->text('sex', __('Sex'));
        $form->text('reg_number', __('Reg number'));
        $form->text('country', __('Country'));
        $form->text('occupation', __('Occupation'));
        $form->textarea('profile_photo_large', __('Profile photo large'));
        $form->text('phone_number', __('Phone number'));
        $form->text('location_lat', __('Location lat'));
        $form->text('location_long', __('Location long'));
        $form->text('facebook', __('Facebook'));
        $form->text('twitter', __('Twitter'));
        $form->text('whatsapp', __('Whatsapp'));
        $form->text('linkedin', __('Linkedin'));
        $form->text('website', __('Website'));
        $form->text('other_link', __('Other link'));
        $form->text('cv', __('Cv'));
        $form->text('language', __('Language'));
        $form->text('about', __('About'));
        $form->text('address', __('Address'));
        $form->text('remember_token', __('Remember token'));
        $form->textarea('avatar', __('Avatar'));
        $form->text('name', __('Name'));
        $form->number('campus_id', __('Campus id'))->default(1);
        $form->switch('complete_profile', __('Complete profile'));

        return $form;
    }
}
