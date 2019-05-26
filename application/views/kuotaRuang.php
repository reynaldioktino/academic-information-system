<?php 
    $this->load->view('main/header');
    $this->load->view('main/navbar');
 ?>

<div id="page-wrapper">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Cari Kuota Ruang</h1>
        </div>
        <!-- /.col-lg-12 -->
    </div>
    <!-- /.row -->
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <form action="<?php echo base_url('C_menu/cariKuota'); ?>" method="POST">
                    <input placeholder="Min" name="min" class="form-control" type="number" required>
                    <input placeholder="Max" name="max" class="form-control" type="number" required>
                    <input type="submit" name="input" class="btn btn-success btn-sm">
                </form>
            </div>
            <!-- /.panel -->
        </div>
        <!-- /.col-lg-6 -->
        <?php if (count($ruang) > 0) : ?>
            <table width="100%" class="table table-striped table-bordered table-hover">
                <thead>
                    <tr>
                        <td>Kode</td>
                        <td>Nama</td>
                        <td>Kuota</td>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach ($ruang as $key) : ?>
                        <tr>
                            <td><?php echo $key->kode; ?></td>
                            <td><?php echo $key->nama; ?></td>
                            <td><?php echo $key->kuota; ?></td>
                        </tr>
                    <?php endforeach; ?>
                </tbody>
            </table>
        <?php endif; ?>
    </div>
    <!-- /.row -->
</div>
<!-- /#page-wrapper -->

    <!-- /#wrapper -->

<!-- MODAL ADD -->



<!--MODAL HAPUS-->
<div class="modal fade" id="ModalDelete" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header btn-danger">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">X</span></button>
                <h4 class="modal-title" id="myModalLabel">Delete Confirmation</h4>
            </div>
            <form class="form-horizontal">
                <div class="modal-body">

                    <input type="hidden" name="kode" id="textkode" value="">
                    <div class="alert alert-warning"><p>Apakah Anda yakin ingin menghapus data ini?</p></div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Tutup</button>
                    <button class="btn btn-danger" id="btn_hapus">Delete</button>
                </div>
            </form>
        </div>
    </div>
</div>
<!--END MODAL HAPUS-->

<?php 
    $this->load->view('main/footer');
 ?>

</body>

</html>

