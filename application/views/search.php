<?php 
    $this->load->view('main/header');
    $this->load->view('main/navbar');
 ?>

<div id="page-wrapper">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Hasil Pencarian</h1>
            <hr>
        </div>
        <!-- /.col-lg-12 -->
    </div>
    <!-- /.row -->
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <!-- /.panel-heading -->
                <?php if (count($mahasiswa) > 0) : ?>
                <div class="panel-body">
                        <h4>Data Mahasiswa</h4><hr>
                    <table width="100%" class="table table-striped table-bordered table-hover" id="myTable">
                        <thead>
                            <tr>
                                <th>No.</th>
                                <th>NIM</th>
                                <th>Nama</th>
                                <th>Jurusan</th>
                                <th>Alamat</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php $i=1; foreach ($mahasiswa as $mhs) : ?>
                            <tr>
                                <td><?php echo $i; ?></td>
                                <td><?php echo $mhs->nim; ?></td>
                                <td><?php echo $mhs->nama; ?></td>
                                <td><?php echo $mhs->kode_jurusan; ?></td>
                                <td><?php echo $mhs->alamat; ?></td>
                            </tr>
                            <?php $i++; endforeach; ?>
                        </tbody>
                    </table>
                    </div>
                    <?php elseif (count($ruang) > 0) : ?>
                      <div class="panel-body">
                        <h4>Data Ruang</h4><hr>
                    <table width="100%" class="table table-striped table-bordered table-hover" id="myTable">
                        <thead>
                            <tr>
                                <th>No.</th>
                                <th>Kode</th>
                                <th>Nama</th>
                                <th>Kuota</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php $i=1; foreach ($ruang as $mhs) : ?>
                            <tr>
                                <td><?php echo $i; ?></td>
                                <td><?php echo $mhs->kode; ?></td>
                                <td><?php echo $mhs->nama; ?></td>
                                <td><?php echo $mhs->kuota; ?></td>
                            </tr>
                            <?php $i++; endforeach; ?>
                        </tbody>
                    </table>
                    </div>  
                <?php else : ?>
                    <div class="panel-body">
                    <p>Hasil Pencarian Tidak Ada</p>
                    </div>
                <?php endif; ?>
                    <!-- /.table-responsive -->
                <!-- /.panel-body -->
            </div>
            <!-- /.panel -->
        </div>
        <!-- /.col-lg-6 -->
    </div>
    <!-- /.row -->
</div>
<!-- /#page-wrapper -->

    <!-- /#wrapper -->

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

