<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="EainShinMaWebsite.AdminDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css"/>


    
    <style>
        .card h5 i {
            margin-right: 3px;
            /*font-size: 1.2rem;*/
            font-size:20px;
            vertical-align: middle;
        }
    </style>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-4">
    <div class="row text-center mb-4">
        <div class="col-md-12">
            <div class="card shadow-sm p-3 bg-info text-white mb-3">
                <h5><i class="bi bi-heart-fill"></i> Vitamins Group</h5>
            </div>
            
            <div style="width: 50%; max-width: 600px; margin: 30px auto;">
            <canvas id="vitaminChart"></canvas>
        </div>
    </div>
</div>
        </div>

<script type="text/javascript">
    window.onload = function () {
        var labels = [<%= vitaminLabels %>];
        var counts = [<%= vitaminCounts %>];

        new Chart(document.getElementById("vitaminChart"), {
            type: 'pie', // You can also use 'bar'
            data: {
                labels: labels,
                datasets: [{
                    label: 'Number of Vitamins',
                    data: counts,
                    backgroundColor: [
                        'rgba(255,99,132,0.7)',
                    'rgba(54,162,235,0.7)',
                    'rgba(255,206,86,0.7)',
                    'rgba(75,192,192,0.7)',
                    'rgba(153,102,255,0.7)',
                    'rgba(255,159,64,0.7)',
                    'rgba(199,199,199,0.7)',
                    'rgba(83,102,255,0.7)',
                    'rgba(255,99,71,0.7)',
                    'rgba(60,179,113,0.7)',
                    'rgba(255,215,0,0.7)',
                    'rgba(106,90,205,0.7)',
                    'rgba(255,140,0,0.7)'

                    ]
                }]
            },
            options: {
                responsive: true,
                plugins: {
                    legend: { position: 'right' }
                }
            }
        });
    };
</script>

</asp:Content>
