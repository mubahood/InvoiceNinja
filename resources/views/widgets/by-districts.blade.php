<?php
use App\Models\Utils;
?>
<div class="card  mb-4 mb-md-5 border-0">
    <!--begin::Header-->
    <div class="d-flex justify-content-between px-3 pt-2 px-md-4 border-bottom">
        <h4 style="line-height: 1; margrin: 0; " class="fs-22 fw-800">
            My Customers Location
        </h4>
    </div>
    <div class="card-body py-3 py-md-4">
        <canvas id="by-districts" style="width: 100%;"></canvas>
    </div>
</div>


<script>
    $(function() {
        var config = {
            type: 'doughnut',
            data: {
                datasets: [{
                    data: [370, 57, 101],
                    backgroundColor: [
                        '#8EFCDF',
                        '#D0B1FD',
                        '#F43DE3',
                        '#7D57F8',
                        '#34F1B7',
                        '#431B02',
                        '#C71C5D',
                        '#23A2E9',
                        '#868686',
                        '#F6DE5C',
                    ],
                    label: 'Dataset 1'
                }],
                labels: [
                    'Categoy 1',
                    'Categoy 2',
                    'Categoy 3', 
                ],
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                legend: {
                    position: 'left',
                    display: true,
                },
                title: {
                    display: false,
                    text: 'Persons with Disabilities by Categories'
                },
                animation: {
                    animateScale: true,
                    animateRotate: true
                }
            }
        };

        var ctx = document.getElementById('by-districts').getContext('2d');
        new Chart(ctx, config);
    });
</script>
