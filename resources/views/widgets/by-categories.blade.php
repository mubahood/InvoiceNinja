<?php
use App\Models\Utils;
?>
<div class="card  mb-0 mb-md-0  border-0">
    <!--begin::Header-->
    <div class="d-flex justify-content-between px-3 pt-2 px-md-4 border-bottom">
        <h4 style="line-height: 1; margrin: 0; " class="fs-22 fw-800">
            Stock Categories
        </h4>
    </div>
    <div class="card-body py-0 py-md-4">
        <canvas id="graph_animals" style="width: 100%;"></canvas>
    </div>
</div>


<script>
    $(function() {
        var config = {
            type: 'pie',
            data: {
                datasets: [{
                    data: [370, 57, 101, ],
                    backgroundColor: [
                        '#C71C5D',
                        '#8EFCDF',
                        '#868686',
                        '#F6DE5C',
                        '#D0B1FD',
                        '#7D57F8',
                        '#34F1B7',
                        '#431B02',
                        '#23A2E9',
                        '#F43DE3',
                    ],
                    label: 'Dataset 1'
                }],
                labels: [
                    'Category 1',
                    'Category 2',
                    'Category 3',
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

        var ctx = document.getElementById('graph_animals').getContext('2d');
        new Chart(ctx, config);
    });
</script>
